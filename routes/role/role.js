const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const roleService = require('../../system/service/roleService')
const menuService = require('../../system/service/menuService')
const roleType = require('../../utils/roleType')
const handleDate = require('../../utils/handleDate')
// 获取所有的roles
router.get('/', async (req, res, next) => {
  const { page, size, id, blurry, createTime } = req.query
  const roleservice = new roleService()
  const menuservice = new menuService()
  const { roles, totalElements } = await roleservice.all({page: page, size: size, blurry: blurry, createTime: createTime})
  let temp_map = {}
  const result_roles = []
  // 获取roles对应的所有menu_ids
  for (let r of roles) {
    temp_map = Object.assign(r, { menus: [] })
    let menu_ids = await menuservice.getMenusByRoleid(r.id)
    temp_map.menus = [...new Set(menu_ids)]
    result_roles.push(temp_map)
    temp_map = {}
  }
  res.json({ code: statusCode.success, content: result_roles, totalElements: totalElements })
})

// 获取所有的level
router.get('/level', async(req, res, next) => {
  const roleservice = new roleService()
  const user_id = req.headers.userid
  const { roles } = await roleservice.findRoleByUserId(Number.parseInt(user_id))
  let level_list = []
  let level = null
  for (let r of roles) {
    level = await roleservice.get(r)
    level_list.push(level[0].level)
    level = null
  }
  res.json({ code: statusCode.success, level: Math.min(...level_list) })
})

// 根据id获取对应的role
router.get('/get', async (req, res, next) => {
  const { id } = req.query
  const roleservice = new roleService()
  const role = await roleservice.get(id)
  res.json({ code: statusCode.success, content: role })
})


// 根据role_id保存前端提交过来的所有menu_id
router.put('/menu', async (req, res) => {
  const { id, menus } = req.body
  const menuservice = new menuService()
  let num = 0
  // 用户每次点击菜单保存按钮时,都会将选中的所有menus传递过来,用户可能会进行添加或删除的情况,所以需要先删除该role_id下的所有menu_id，
  // 然后再添加所有的新传递过来的menu_id
  menuservice.delMenus(id).then(async result => {
      // 循环添加记录到roles_menus中
    for (let m of menus) {
      const t = await menuservice.editMenus(id, m.id)
      if (t.affectedRows > 0) num++
    }
    if (num === menus.length) {
      res.json({ code: statusCode.success, msg: '菜单保存成功' })
    } else {
      res.json({ code: statusCode.editMenusError, msg: '菜单保存失败' })
    }
    })
})

// 保存role
router.post('/', async (req, res) => {
  const data = req.body
  const username = req.headers.username
  const roleservice = new roleService()
  const role_item = {
    name: data.name,
    description: data.description,
    level: parseInt(data.level),
    data_scope: data.dataScope,
    create_time: data.createTime,
    type: roleType[data.name].type,
    update_time: handleDate(new Date()),
    update_by: username,
    create_by: username
  }
  const result = await roleservice.addRole(role_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success })
  } else {
    res.json({ code: statusCode.addRoleError })  
  }
})

module.exports = router