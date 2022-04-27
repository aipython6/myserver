const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const menuService = require('../../system/service/menuService')
const roleService = require('../../system/service/roleService')
const handleRouter = require('../../utils/handleRouter')
const handleDate = require('../../utils/handleDate')
const { handleMenu2, handleDelMenu } = require('../../utils/handleMenu')
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

// 根据menu_id获取对应的菜单名称
router.get('/getMenuByMenuid', async (req, res) => {
  const { id } = req.query
  const menuservice = new menuService()
  const result = await menuservice.getMenuByMenuid(id)
  const menu_item = result.map(e => {
    return {
      id: e.menu_id,
      label: e.title
    }
  })
  res.json({ code: statusCode.success, content: menu_item })
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

// 添加菜单
router.post('/', async (req, res) => {
  const data = req.body
  const insert_item = {
    type: data.type,
    title: data.title,
    name: data.name,
    path: data.path,
    icon: data.icon,
    menu_sort: data.menuSort,
    pid: data.pid === 0 ? null : data.pid,
    component: data.component === null ? 'Layout' : data.component,
    redirect: data.redirect,
    i_frame: data.iFrame,
    cache: data.cache === false ? 0 : 1,
    hidden: data.hidden === false ? 0 : 1,
    create_time: handleDate(new Date()),
    permission: data.permission
  }
  const menuservice = new menuService()
  const result = await menuservice.add(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功'})
  } else {
    res.json({ code: statusCode.addMenuError, content: '添加失败'})
  }
})

// 编辑
router.put('/edit', async (req, res) => {
  const data = req.body
  const menuservice = new menuService()
  const update_item = {
    id: data.id,
    title: data.title,
    menu_sort: data.menuSort,
    component: data.component,
    name: data.componentName,
    i_frame: data.iFrame,
    pid: data.pid,
    icon: data.icon,
    cache: data.cache,
    hidden: data.hidden,
    type: data.type,
    permission: data.permission,
    redirect: data.redirect,
    update_time: handleDate(new Date())
  }
  const result = await menuservice.edit(update_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '更新成功'})
  } else {
    res.json({ code: statusCode.updateMenuError, content: '更新失败' })
  }
})

// 删除
router.delete('/del', async (req, res) => {
  const id = req.body[0]
  // const id = eval(req.body.data)[0]
  const menuservice = new menuService()
  const { menus } = await menuservice.all({})
  const del_list = handleDelMenu(menus, id)
  const result = await menuservice.del(del_list)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '删除菜单成功' })
  } else {
    res.json({ code: statusCode.delMenuError, content: '删除菜单失败' })
  }
})


module.exports = router