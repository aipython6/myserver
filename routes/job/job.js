const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const jobService = require('../../system/service/jobService')
router.get('/all', async (req, res, next) => {
  const params = req.query
  const jobservice = new jobService()
  const temp = await jobservice.all(params)
  const jobs = temp.map((job) => {
    return {
      id: job.job_id,
      name: job.name
    }
  })
  res.json({ code: statusCode.success, content: jobs })
})

module.exports = router