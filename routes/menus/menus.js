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
  const menuservice = new menuService()
  const menus = await menuservice.findMenusByRoldId(obj.roles, 2)
  res.json({ code: statusCode.success, menus: handleRouter(menus) })
})

// 根据pid获取对应的菜单
router.get('/lazy', async (req, res) => {
  const { pid } = req.query
  const menuservice = new menuService()
  const result = await menuservice.findMenuByPid(pid)
  res.json({ code: statusCode.success })
})

// 根据id获取children
router.get('/getChild', async (req, res) => {
  const { id } = req.query
  const menuservice = new menuService()
  const result = await menuservice.findChildByMenuid(id)
  res.json({ code: statusCode.success })
})

module.exports = router
