const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const menuService = require('../../system/service/menuService')
const roleService = require('../../system/service/roleService')
const handleRouter = require('../../utils/handleRouter')
const { handleMenu2, handleMenu3 } = require('../../utils/handleMenu')
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


// 角色管理页面加载时获取treeData（最开始时只获取一级菜单）
router.get('/initMenus', async (req, res) => {
  const menuservice = new menuService()
  const result = await menuservice.findMenuByPid(pid = null)
  const menus = result.map(e => {
    return {
      id: e.menu_id,
      label: e.title
    }
  })
  res.json({ code: statusCode.success, content: menus })
})

// 根据pid获取对应的菜单
router.get('/lazy', async (req, res) => {
  const { pid } = req.query
  const menuservice = new menuService()
  const result = await menuservice.findMenuByPid(pid)
  const menus = result.map(e => {
    return {
      id: e.menu_id,
      label: e.title
    }
  })
  res.json({ code: statusCode.success, content: menus })
})

// 根据id获取children
router.get('/child', async (req, res) => {
  const { id } = req.query
  const menuservice = new menuService()
  const result = await menuservice.findChildByMenuid(id)
  const childIds = result.map(e => e.menu_id)
  childIds.push(parseInt(id))
  res.json({ code: statusCode.success, childIds: childIds })
})

// 对菜单的CURD操作
// 1.获取
router.get('/', async (req, res) => {
  const { page, size, pid } = req.query
  const menuservice = new menuService()
  const { menus, totalElements } = await menuservice.all({ page: page, size: size })
  const list = handleMenu2(menus, parseInt(pid))
  res.json({ code: statusCode.success, content: list, totalElements: totalElements})
})
module.exports = router