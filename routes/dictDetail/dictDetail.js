const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const handleDate = require('../../utils/handleDate')
const dictDetailService = require('../../system/service/dictDetailService')

router.get('/', async (req, res) => {
  const dictdetailservice = new dictDetailService()
  let { dictName, page, size } = req.query
  const tPage = Number.parseInt(page) === 0 ? page += 1 : page
  const params = { dictName: dictName, page: tPage, size: size }
  const { dicts, totalElement } = await dictdetailservice.dictDetail(params)
  res.json({ code: statusCode.success, content: dicts, totalElement: totalElement })
})

router.post('/', async (req, res) => {
  const { dict, label, value, dictSort } = req.body
  const dictdetailservice = new dictDetailService()
  const insert_item = { dict_id: dict.id ,label: label, value: value, dict_sort: dictSort }
  const result = await dictdetailservice.add(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '添加失败'})
  }
})

router.delete('/:id', async (req, res) => {
  const { id } = req.params
  const dictdetailservice = new dictDetailService()
  const result = await dictdetailservice.del(Number.parseInt(id))
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '删除成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '删除失败'})
  }
})

router.put('/', async (req, res) => {
  const { label, id, value, dictSort, dictName } = req.body
  const { username } = req.headers
  const dictdetailservice = new dictDetailService()
  const update_item = { detail_id: id, label: label, value: value, dictSort: dictSort, update_by: username, update_time: handleDate(new Date()) }
  const result = await dictdetailservice.edit(update_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '修改成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '修改失败'})
  }
})

module.exports = router