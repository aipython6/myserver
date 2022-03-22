const express = require('express')
const router = express.Router()
const handleDate = require('../../utils/handleDate')
const dataService = require('../../system/service/dataService')
const statusCode = require('../../utils/statusCode')
router.get('/', async (req, res) => {
  const { page, size } = req.query
  const dataservice = new dataService()
  const { content, totalElements } = await dataservice.list({ page: page, size: size })
  res.json({ code: statusCode.success, content: content, totalElements: totalElements })
})

router.get('/getParentType', async (req, res) => {
  const dataservice = new dataService()
  const result = await dataservice.getParentType()
  res.json({ code: statusCode.success, content: result })
})


module.exports = router