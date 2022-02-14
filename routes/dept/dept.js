const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const deptService = require('../../system/service/deptService')
// 根据参数获取所有的部门名称
router.get('/getDepts', async (req, res, next) => {
  // params may contain {enabled, sort, name, pid}
  const params = req.query
  const deptservice = new deptService()
  const depts = await deptservice.getAllDeptsByParams(params)
  res.json({ code: statusCode.success, content: depts })
})

router.post('/getDeptSuperior', async (req, res, next) => {
  const { data } = req.body
  const deptservice = new deptService()
  const dept = await deptservice.getAllSuperDepts(eval(data))
  res.json({ code: statusCode.success, conten: dept })
})

module.exports = router