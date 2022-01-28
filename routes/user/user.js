const express = require('express')
const router = express.Router()
const moment = require('moment')
const password = require('../../utils/passBcrypt')
const statusCode = require('../../utils/statusCode')
const mysqlConnect = require('../../database/mysql_config')
/* 用户相关的所有请求 */

// 添加用户
router.post('/addUser', async (req, res, next) => {
	const user_item = req.body
	const insert_item = {
		username: user_item.username,	// 职工号
		dept_name: user_item.dept_name,
		gender: user_item.gender,
		phone: user_item.phone,
		password: await password.passEncode(user_item.password),
		avatar_name: user_item.avatar_name || '用户头像',
		avatar_path: user_item.avatar_path || 'http://localhost:3001/users/userDefaultAvatar.png',
		is_admin: user_item.is_admin || 0,
		enabled: user_item.enabled || 1,
		create_by: user_item.create_by || 'admin',
		update_by: user_item.update_by || 'admin',
		pwd_reset_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss'),
		create_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss'),
		update_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
	}
	const sql = `INSERT INTO users SET ?`
	mysqlConnect.query(sql, insert_item, (err, result) => {
		if (err) {
			console.log(err)
		} else {
			res.json({ code: statusCode.success, msg: '用户添加成功' })
		}
	})
})

module.exports = router