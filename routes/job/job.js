const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const jobService = require('../../system/service/jobService')
router.get('/all', async (req, res, next) => {
  const params = req.query
  const jobservice = new jobService()
  const jobs = await jobservice.all(params)
  res.json({ code: statusCode.success, content: jobs })
})

module.exports = router