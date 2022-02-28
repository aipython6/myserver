const express = require('express')
const router = express.Router()
const userService = require('../../system/service/userService')
const statusCode = require('../../utils/statusCode')

/* 用户相关的所有请求 */

// 获取所有的user
router.get('/', async (req, res) => {
  const { page, size, dept_id } = req.query
  const userservice = new userService()
  const users = await userservice.findAllUsers(page, size, parseInt(dept_id))
  res.json({ code: statusCode.success, content: users.users, totalElements: users.page })
})

// 添加用户
router.post('/add', async (req, res, next) => {
  const user_item = req.body
  const userservice = new userService()
  userservice.add(user_item).then(result => {
    if (result) {
      res.json({ code: statusCode.success, msg: '添加用户成功' })
    } else {
      res.json({ code: statusCode.addUserError, msg: '添加用户失败' })
    }
  })
})

// 删除用户
router.delete('/del', async (req, res, next) => {
  const { userid } = req.query
  console.log(userid)
  const userservice = new userService()
  userservice.del(userid).then(result => {
    if (result) {
      res.json({ code: statusCode.success, msg: '删除用户成功' })
    } else {
      res.json({ code: statusCode.delUserError, msg: '删除用户失败' })
    }
  })
})



module.exports = router