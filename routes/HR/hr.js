const express = require('express')
const router = express.Router()
const hrService = require('../../system/service/hrService')
const handleDate = require('../../utils/handleDate')
const statusCode = require('../../utils/statusCode')
router.get('/', async (req, res) => {
  const hrservice = new hrService()
  const { page, size } = req.query
  const { pageList, totalElements } = await hrservice.list({ page: page, size: size })
  res.json({ code: statusCode.success, content: pageList, totalElements: totalElements })
})
module.exports = router