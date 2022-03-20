const express = require('express')
const router = express.Router()
const logService = require('../../system/service/logService')
const handleDate = require('../../utils/handleDate')
const statusCode = require('../../utils/statusCode')

router.get('/user', async (req, res) => {
  const { page, size } = req.query
  console.log(req.query)
  const logservice = new logService()
  const { logsList, totalElements } = await logservice.getLogs({ page: parseInt(page) + 1, size: parseInt(size) })
  const logs = logsList.map(e => {
    return {
      req_username: e.req_username,
      req_url: e.req_url,
      origin: e.origin,
      browser: e.browser,
      user_agent: e.user_agent,
      createTime: handleDate(e.create_time)
    }
  })
  res.json({ code: statusCode.success, content: logs, totalElements: totalElements })
})

module.exports = router
