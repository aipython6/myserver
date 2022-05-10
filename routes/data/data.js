const express = require('express')
const router = express.Router()
const { handleDate } = require('../../utils/handleDate')
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

// 添加
router.post('/add', async (req, res) => {
  const { pid, title, path, description, has_detail, detail_type, enabled } = req.body
  const insert_item = {
    pid: pid,
    title: title,
    path: path,
    description: description,
    has_detail: has_detail,
    detail_type: detail_type,
    sql: sql,
    enabled: enabled === true ? 1 : 0,
    create_at: handleDate(new Date()),
    update_at: handleDate(new Date())
  }
  const dataservice = new dataService()
  const result = await dataservice.add(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功' })
  } else {
    res.json({ code: statusCode.addDataError, content: '添加失败' })
  }
})

// 编辑
router.put('/edit', async (req, res) => {
  const { id, pid, title, path, description, has_detail, detail_type, enabled } = req.body
  res.json({ code: statusCode.success })
})


module.exports = router