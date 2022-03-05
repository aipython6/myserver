const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const roleService = require('../../system/service/roleService')

// 获取所有的roles
router.get('/', async (req, res, next) => {
  const { page, size } = req.query
  const roleservice = new roleService()
  const { roles, totalElements } = await roleservice.all(page, size)
  res.json({ code: statusCode.success, content: roles, totalElements: totalElements })
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

module.exports = router