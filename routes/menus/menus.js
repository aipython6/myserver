const express = require('express')
const router = express.Router()
const mysqlConnect = require('../../database/mysql_config')
const statusCode = require('../../utils/statusCode')
// 获取某个角色下的所有菜单
router.get('/build', async (req, res, next) => {
	const { user_id } = req.query
	const menus_sql = ` select f.* from (
		select d.role_id,d.menu_id from (
		select b.role_id from users_roles a left join roles b on a.role_id=b.role_id where a.user_id=${user_id}
		) c left join roles_menus d on c.role_id=d.role_id
		) e left join menus f on e.menu_id = f.menu_id `
		mysqlConnect.query(menus_sql, function (err, result) {
			if (err) {
				console.error(err)
			} else {
				res.json({ code: statusCode.success, msg: '获取菜单成功', menus: result })
			}
		})
})

module.exports = router
