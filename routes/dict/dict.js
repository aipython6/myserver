const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const dictService = require('../../system/service/dictService')
const handleDate = require('../../utils/handleDate')

router.get('/', async (req, res) => {
  const { page, size } = req.query
  const dictservice = new dictService()
  const { dicts, totalElement } = await dictservice.all(Number.parseInt(page), Number.parseInt(size))
  if (totalElement > 0) {
    res.json({ code: statusCode.success, content: dicts, totalElement: totalElement })
  } else {
    res.json({ code: statusCode.getDictDetailError, msg: '获取字典数据失败' })
  }
})

router.get('/dictDetail', async (req, res) => {
  const { dictName, page, size } = req.query
  const dictservice = new dictService()
  const { dicts, totalElement } = await dictservice.getDictDetial(dictName, Number.parseInt(page), Number.parseInt(size))
  res.json({ code: statusCode.success, content: dicts, totalElement: totalElement })
})

router.post('/', async (req, res) => {
  const { name, description, dictDetails } = req.body
  const { username } = req.headers
  const dictservice = new dictService()
  const insert_item = { name: name, description: description, create_by: username, create_time: handleDate(new Date()) }
  const result = await dictservice.add(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '添加失败'})
  }
})

module.exports = router