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
			console.log(err)
		} else {
			res.json({ img: captcha.data, uuid: uuid, msg: 'success' })
		}
	})	
})

// 用户登录
router.post('/login', async (req, res, next) => {
	const { username, password, uuid, code } = req.body
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
						console.log(err)
					} else {
						// 该用户存在
						if (results) {
							if (await comparePassword.passDecode(results[0].password, password)) {
								res.json({ code: statusCode.success, token: token.sign(username), msg: '登录成功...' })
							} else {
								res.json({ code: statusCode.passError, msg: '密码错误' })
							}
						} else {
							res.json({ code: statusCode.userNotExist, msg: '登陆失败,用户不存在' })
						}
					}
				})
			}
		}
	})
})

// 获取用户信息:用户角色、用户菜单、用户所有信息
router.get('/info', async (req, res, next) => {
	const { username } = req.query
	console.log(req.query)
	const user_sql = `SELECT * FROM user WHERE username='${username}'`
	mysqlConnect.query(user_sql, (err, results) => {
		if (err) {
			console.log(err)
		} else {
			res.json({ user: results[0], code: statusCode.success, msg: '获取用户信息成功' })
		}
	})
})

module.exports = router