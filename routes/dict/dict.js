const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const dictService = require('../../system/service/dictService')

router.get('/', async (req, res) => {
  const { dictName, page, size } = req.query
  const dictservice = new dictService()
  const { dicts, totalElement } = await dictservice.getDictDetial(dictName, Number.parseInt(page), Number.parseInt(size))
  if (totalElement > 0) {
    res.json({ code: statusCode.success, content: dicts, totalElement: totalElement })
  } else {
    res.json({ code: statusCode.getDictDetailError, msg: '获取字典数据失败' })
  }
})

module.exports = router