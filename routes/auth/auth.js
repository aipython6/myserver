const express = require('express')
const router = express.Router()
const path = require('path')
const fs = require('fs')
const svgCaptcha = require('svg-captcha')
const { v4: uuidv4 } = require('uuid')
const comparePassword = require('../../utils/passBcrypt')
const statusCode = require('../../utils/statusCode')
const token = require('../../utils/signAndverifyToken')
const authService = require('../../system/service/authService')
const roleService = require('../../system/service/roleService')
const { handleDate } = require('../../utils/handleDate')
const update_date = handleDate(new Date())

const config = require('../../utils/urlConfig')
const upload = require('../../utils/postFile')
const uploadObj = upload.postAvatar()

// 获取验证码
router.get('/code', async(req, res, next) => {
	const authservice = new authService()
	// 验证码的基本配置
	const captcha = svgCaptcha.create({
		size: 4,
		ignoreChars: '0Oo1liI',
		noise: 2,
		background: '#f0f0f4',
		width: 110,
		height: 38,
		fontSize: 38
	})
	res.type('svg')
	const uuid = uuidv4()
	const insert_item = { uuid: uuid, code: captcha.text, create_time: update_date }
	if (await authservice.getCode(insert_item)) {
		res.json({ code: statusCode.success, img: captcha.data, uuid: uuid, msg: 'success' })
	} else {
		console.error('获取验证码出错')
	}
})

// 用户登录
router.post('/login', async(req, res, next) => {
	const { username, password, uuid, code, rememberMe, tokenCookieExpires } = req.body
	const authservice = new authService()
	// 根据username查询用户是否存在
	const userRes = await authservice.findUserByUsername(username)
	// 获取uuid
	const uuidRes = await authservice.findUUID(uuid, code)
	if (!uuidRes) {
		res.json({ code: statusCode.verifyCodeError, msg: '验证码错误' })
	} else {
		// 该用户存在
		if (userRes.length === 1) {
			if (await comparePassword.passDecode(userRes[0].password, password)) {
					res.json({ code: statusCode.success, token: token.sign(username, rememberMe, tokenCookieExpires), msg: '登录成功' })
			} else {
					res.json({ code: statusCode.passError, msg: '密码错误,请重新输入' })
			}
		} else {
			res.json({ code: statusCode.userNotExist, msg: '登陆失败,该用户不存在' })
		}
	}
})

// 获取用户信息
router.get('/info', async(req, res, next) => {
	// const { username } = req.query
	const { username } = req.headers
	const authservice = new authService()
	const userInfo = await authservice.findUserinfoByUsername(username)
	// 用户角色,可能有多个
	const roles = userInfo.map(e => e.type)
	// 用户基本信息
	const basic_info = {
		user_id: userInfo[0].user_id,
		username: userInfo[0].username,
		dept_name: userInfo[0].dept_name,
		avatar_path: userInfo[0].avatar_path,
		nickName: userInfo[0].nickName,
		gender: userInfo[0].gender,
		phone: userInfo[0].phone,
		is_admin: userInfo[0].is_admin,
		enabled: userInfo[0].enabled,
		create_by: userInfo[0].create_by,
		create_time: userInfo[0].time
	}
	res.json({ code: statusCode.success, user: basic_info, roles: roles, msg: '获取用户信息成功' })
})

// 用户头像上传
router.post('/avatarUpload', uploadObj.array('img'), async(req, res) => {
	const username = req.headers.username
	const uploadUrl = config.avatarUpload
	const downloadUrl = config.avatarDownload
	const authservice = new authService()
	const files = req.files
	const temp = files.map(e => {
		const uuid = uuidv4()
		const basename = path.basename(e.path)
		const suffix = path.extname(e.path)
		const newname = uuid + suffix
		fs.rename(uploadUrl + basename, uploadUrl + newname, err => {})
		return { file: downloadUrl + newname, filename: path.basename(basename, suffix) }
	})
	const result = await authservice.avatarUpload({ avatar_path: temp[0].file, username: username, update_date: update_date })
	if (result.affectedRows > 0) {
		res.json({ code: statusCode.success, files: temp, msg: '头像上传成功' })
	} else {
		res.json({ code: statusCode.avatarUploadError, files: temp, msg: '头像上传失败' })
	}
})


// 退出
router.delete('/logout', async(req, res, next) => {
	res.json({ code: statusCode.success, msg: '已退出' })
})


// 获取user_id对应的角色和所有的permission
router.get('/getPermission', async(req, res, next) => {
	const { type } = req.query
	const user_id = req.headers.userid
	const roleservice = new roleService()
	// roles:角色id， types:角色名称
	const { roles, types } = await roleservice.findRoleByUserId(user_id)
	const authservice = new authService()
	const temp = await authservice.findPermissionByRolesid(roles, type)
	const roles_ = new Set(types) // 去除重复的role
	const permissions = [...new Set(temp.map(e => e.permission))] // 去除重复的CURD操作名称
	let result = { list: [], add: [], edit: [], del: [] }
	// list
	const list = permissions.filter(e => e === type + ':list')
	if (list.length > 0) {
		result.list = [...roles_, ...list]
	}
	// add
	const add = permissions.filter(e => e === type + ':add')
	if (add.length > 0) {
		result.add = [...roles_, ...add]
	}
	// edit
	const edit = permissions.filter(e => e === type + ':edit')
	if (edit.length > 0) {
		result.edit = [...roles_, ...edit]
	}
	// del
	const del = permissions.filter(e => e === type + ':del')
	if (del.length > 0) {
		result.del = [...roles_, ...del]
	}
	res.json({ code: statusCode.success, permissions: result })
})

// 根据user_id查询[dept_id,...],用于给不同部门的用户指定数据显示的权限
router.get('/getDeptids', async(req, res, next) => {
	// dataPermission:表示数据范围(all:全部,非all:指定部门下的数据)
	const { dataPermission } = req.query
	const user_id = req.headers.userid
	const roleservice = new roleService()
	const { types } = await roleservice.findRoleByUserId(user_id)
	if (types.includes('admin') || dataPermission === 'all') {
		res.json({ code: statusCode.success, result: [], is_admin: 1 })
	} else {
		const authservice = new authService()
		const temp = await authservice.findDeptsByUserid(user_id)
		const deptids = temp.map(e => e.dept_id)
		res.json({ code: statusCode.success, result: deptids, is_admin: 0 })
	}
})

module.exports = router