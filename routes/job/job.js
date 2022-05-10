const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const jobService = require('../../system/service/jobService')
const { handleDate } = require('../../utils/handleDate')
router.get('/', async (req, res) => {
  const params = req.query
  const jobservice = new jobService()
  const { jobs, totalElements } = await jobservice.all(params)
  const temp = jobs.map((job) => {
    return {
      id: job.id,
      name: job.name,
      enabled: job.enabled === 1 ? true : false,
      createTime: handleDate(job.create_time),
      jobSort: job.job_sort
    }
  })
  res.json({ code: statusCode.success, content: temp, totalElements: totalElements})
})

router.post('/add', async (req, res) => {
  const { name, jobSort, enabled } = req.body
  const { username } = req.headers
  const insert_item = { name: name, job_sort: jobSort, create_by: username, enabled: enabled === true ? 1 : 0, create_time: handleDate(new Date()) }
  const jobservice = new jobService()
  const result = await jobservice.post(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '添加失败'})
  }
})

router.put('/edit', async (req, res) => {
  const { id, name, jobSort, enabled, createTime } = req.body
  const { username } = req.headers
  const jobservice = new jobService()
  const update_item = { id: id, name: name, jobSort: jobSort, enabled: enabled === true ? 1 : 0, update_by: username, update_time: createTime }
  const result = await jobservice.edit(update_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '编辑成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '编辑失败'})
  }
})

router.delete('/del', async (req, res) => {
  const ids = req.body[0]
  const jobservice = new jobService()
  const result = await jobservice.del(ids)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '删除成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '删除失败'})
  }
})

module.exports = router