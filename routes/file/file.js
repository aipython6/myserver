const express = require('express')
const router = express.Router()
const { handleDate } = require('../../utils/handleDate')
const statusCode = require('../../utils/statusCode')
const fileService = require('../../system/service/fileService')

router.get('/', async (req, res) => {
  const { page, size } = req.query
  const params = { page: page, size: size }
  const fileservice = new fileService()
  const { files, totalElement } = await fileservice.all(params)
  const t = files.map(e => {
    return {
      user_filename: e.user_filename,
      username: e.username,
      sys_filename: e.sys_filename,
      enabled: e.enabled,
      upload_time: e.upload_time
    }
  })
  res.json({ code: statusCode.success, content: t, totalElement: totalElement }) 
})

module.exports = router