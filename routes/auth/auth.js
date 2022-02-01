const express = require('express')
const router = express.Router()
const svgCaptcha = require('svg-captcha')
const mysqlConnect = require('../../database/mysql_config')
const { v4: uuidv4 } = require('uuid')
const comparePassword = require('../../utils/passBcrypt')
const statusCode = require('../../utils/statusCode')
const token = require('../../utils/signAndverifyToken')
// 获取验证码
router.get('/code', async (req, res, next) => {
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
	const insert_item = { uuid: uuid, code: captcha.text }
	sql = `INSERT INTO uuid SET ?`
	mysqlConnect.query(sql, insert_item, (err, results) => {
		if (err) {
			console.error(err)
		} else {
			res.json({ img: captcha.data, uuid: uuid, msg: 'success' })
		}
	})	
})

// 用户登录
router.post('/login', async (req, res, next) => {
  const { username, password, uuid, code } = req.body
  console.log(req.body)
	const query_user = `SELECT * FROM users WHERE username = '${username}'`
	// 查询uuid
	const query_uuid = `SELECT uuid, code FROM uuid WHERE uuid = '${uuid}'`
	mysqlConnect.query(query_uuid, (err, results) => {
		if (err) {
			console.log(err)
		} else {
			if (!(results[0].code.toLowerCase() === code.toLowerCase())) {
				res.json({ code: statusCode.verifyCodeError, msg: '验证码错误' })
			} else {
				mysqlConnect.query(query_user, async (err, results) => {
					if (err) {
						console.error(err)
					} else {
						// 该用户存在
						if (results.length === 1) {
							if (await comparePassword.passDecode(results[0].password, password)) {
								res.json({ code: statusCode.success, token: token.sign(username), msg: '登录成功' })
							} else {
								res.json({ code: statusCode.passError, msg: '密码错误,请重新输入' })
							}
						} else {
							res.json({ code: statusCode.userNotExist, msg: '登陆失败,该用户不存在' })
						}
					}
				})
			}
		}
	})
})

// 获取用户信息
router.get('/info', async (req, res, next) => {
	const { username } = req.query
	// 根据username查询用户（信息，角色等）
	const user_sql = ` select c.user_id,c.username,c.dept_name,c.avatar_path,c.gender,c.phone,c.is_admin,c.enabled,c.create_by,c.create_time,d.name,d.level,d.data_scope,d.description,d.type 
	from ( select a.role_id,b.* from users_roles a left join users b on a.user_id = b.user_id where b.username = '${ username }') c left join roles d on c.role_id = d.role_id `
	mysqlConnect.query(user_sql, function(err, result) {
		if (err) {
			console.error(err)
		} else {
			// 用户角色,可能有多个
			const roles = result.map(e => {
				return {
					roles: e.type,
					name: e.name,
					level: e.level,
					data_scope: e.data_scope,
					descrption: e.descrption
				}
			})
			// 用户基本信息
			const basic_info = {
				user_id: result[0].user_id,
				username: result[0].username,
				dept_name: result[0].dept_name,
				avatar_path: result[0].avatar_path,
				gender: result[0].gender,
				phone: result[0].phone,
				is_admin: result[0].is_admin,
				enabled: result[0].enabled,
				create_by: result[0].create_by,
				create_time: result[0].time
			}
			res.json({ code: statusCode.success, user: basic_info, roles: roles ,msg: '获取用户信息成功' })
		}
	})
})

module.exports = router