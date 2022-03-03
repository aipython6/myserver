const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const roleService = require('../../system/service/roleService')

// 获取所有的roles
router.get('/all', async (req, res, next) => {
  const roleservice = new roleService()
  const roles = await roleservice.all()
  res.json({ code: statusCode.success, content: roles })
})

// 获取所有的level
router.get('/level', async(req, res, next) => {
  const roleservice = new roleService()
  const levels = await roleservice.level()
  res.json({ code: statusCode.success, content: levels })
})

// 根据id获取对应的role
router.get('/get', async (req, res, next) => {
  const { id } = req.query
  const roleservice = new roleService()
  const role = await roleservice.get(id)
  res.json({ code: statusCode.success, content: role })
})

module.exports = router