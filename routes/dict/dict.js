const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const dictService = require('../../system/service/dictService')
const { handleDate } = require('../../utils/handleDate')

router.get('/', async (req, res) => {
  const { page, size, blurry } = req.query
  const dictservice = new dictService()
  const { dicts, totalElement } = await dictservice.all({ page: Number.parseInt(page), size: Number.parseInt(size), name: blurry })
  if (totalElement > 0) {
    res.json({ code: statusCode.success, content: dicts, totalElement: totalElement })
  } else {
    res.json({ code: statusCode.getDictDetailError, msg: '获取字典数据失败' })
  }
})

// 添加
router.post('/', async (req, res) => {
  const { name, description } = req.body
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

// 修改
router.put('/', async (req, res) => {
  const { dict_id, name, description } = req.body
  const { username } = req.headers
  const dictservice = new dictService()
  const update_item = { id: dict_id, name: name, description: description, create_by: username, update_time: handleDate(new Date()) }
  const result = await dictservice.edit(update_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '编辑成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '编辑失败'})
  }
})

// 删除
router.delete('/', async (req, res) => {
  const ids = req.body
  const dictservice = new dictService()
  const result = await dictservice.del(eval(ids))
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '删除成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '删除失败'})
  }
})
module.exports = router