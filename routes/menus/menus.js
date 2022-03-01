const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const menuService = require('../../system/service/menuService')
const roleService = require('../../system/service/roleService')
const handleRouter = require('../../utils/handleRouter')
// 获取某个角色下的所有菜单
router.get('/build', async (req, res, next) => {
	// const { user_id } = req.query
  const user_id = req.headers.userid
  const roleservice = new roleService()
  const obj = await roleservice.findRoleByUserId(user_id)
  // type!=2查询所有菜单，表示排除权限
  const menuservice = new menuService(obj.roles, 2)
  const menus = await menuservice.findMenusByRoldId()
  res.json({ code: statusCode.success, menus: handleRouter(menus) })
  // res.json({ code: statusCode.success })
})

module.exports = router
