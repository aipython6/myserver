const express = require('express')
const router = express.Router()
const handleDate = require('../../utils/handleDate')
const userService = require('../../system/service/userService')
const statusCode = require('../../utils/statusCode')
const roleService = require('../../system/service/roleService')
const jobService = require('../../system/service/jobService')
const authService = require('../../system/service/authService')
const deptService = require('../../system/service/deptService')
/* 用户相关的所有请求 */

// 获取所有的user
router.get('/', async (req, res) => {
  const { page, size, dept_id } = req.query
  const userservice = new userService()
  const roleservice = new roleService()
  const jobservice = new jobService()
  
  const users = []
  let obj = {
    id: null,
    dept: null,
    deptname: null,
    dept_id: null,
    username: null,
    gender: null,
    avatar_name: null,
    avatar_path: null,
    is_admin: null,
    create_by: null,
    createTime: null,
    phone: null,
    enabled: null,
    roles: [],
    jobs: []
  }
  const usersTemp = await userservice.findAllUsers(page, size, Number.parseInt(dept_id))
  for (let user of usersTemp.users) {
    // 获取该用户所拥有的角色和job
    const roles = await roleservice.findRoleByUserId(user.id)
    const jobs = await jobservice.findJobsByUserId(user.id)
    let jobList = jobs.map(e => { return { id: e.job_id } })
    let roleList = roles.roles.map(e => { return { id: e } })
    obj.id = user.id
    obj.dept = user.dept,
    obj.deptname = user.dept,
    obj.dept_id = user.dept_id,
    obj.username = user.username,
    obj.gender = user.gender,
    obj.avatar_name = user.avatar_name,
    obj.avatar_path = user.avatar_path,
    obj.is_admin = user.is_admin,
    obj.create_by = user.create_by,
    obj.createTime = handleDate(user.createTime),
    obj.phone = user.phone
    obj.enabled = user.enabled === 1 ? true : false 
    obj.roles = roleList
    obj.jobs = jobList
    users.push(obj)
    // 每个新的user都重置jobList和obj
    jobList = []
    roleList = []
    obj = {}
  }
  res.json({ code: statusCode.success, content: users, totalElements: usersTemp.page })
})

// 添加用户
router.post('/add', async (req, res, next) => {
  const user_item = req.body
  // console.log(user_item)
  const userservice = new userService()
  const roleservice = new roleService()
  const authservice = new authService()
  const jobservice = new jobService()
  const deptservice = new deptService()
  try { 
    // 根据deptid查询deptname
    const dept_name = await deptservice.getDeptnameByDeptid(user_item.dept_id)
    const obj = Object.assign(user_item, { dept_name: dept_name[0].name })
    // 该用户是否已经存在
    const userRes = await authservice.findUserByUsername(obj.username)
    // 用户名不存在时,才允许添加
    if (!(userRes.length === 1)) {
      let addRole_result = false
      const result = await userservice.add(obj)
      const userItem = await userservice.findUserinfoByUsername(obj.username)
      // 一个用户可能有多个角色
      for (let r of obj.roles) {
        let t = await roleservice.add(userItem[0].user_id, r.id)
        if (t.affectedRows > 0) {
          addRole_result = true
        }
      }
      const addJob_result = await jobservice.add(userItem[0].user_id, obj.jobs[0].id)
      // console.log(addJob_result)
      // console.log(addRole_result)
      if (result.affectedRows > 0 && addRole_result && addJob_result.affectedRows > 0) {
          res.json({ code: statusCode.success, msg: '添加用户成功' })
        } else {
          throw new Error({ code: statusCode.addUserError, message: '添加用户失败' })
        }
    } else {
      // res.json({ code: statusCode.addUserError, msg: '该用户已经存在' })
      throw new Error('该用户已经存在')
    }
  } catch (err) {
    res.status(statusCode.addUserError).json(err)
  }
})

// 编辑用户
router.put('/edit', async (req, res, next) => {
  const userservice = new userService()
  const roleservice = new roleService()
  const jobservice = new jobService()
  const deptservice = new deptService()
  const { id, username, roles, jobs, deptname, phone, gender, enabled, avatar_path, is_admin, dept_id, createTime } = req.body
  const dept_name = await deptservice.getDeptnameByDeptid(dept_id)
  const user_info = { id: id, username: username, dept_id: dept_id, deptname: dept_name[0].name, phone: phone, gender: gender, enabled: enabled, avatar_path: avatar_path, is_admin: is_admin, createTime: createTime }
  const role_obj = { user_id: id, roles: roles.map(e => e.id) }
  const job_obj = { user_id: id, job_id: jobs[0].id }

  const result_info = await userservice.edit(user_info)
  const result_role = await roleservice.editUserRolesByUserid(role_obj)
  const result_job = await jobservice.editUserJobsByUserid(job_obj)
  if (result_info.affectedRows > 0 && result_role && result_job.affectedRows > 0) {
    res.json({ code: statusCode.success, msg: '更新成功' })
  } else {
    res.json({ code: statusCode.UserinfoEditError, msg: '更新失败' })
  }
  // res.json({ code: statusCode.success})
})

// 删除用户
router.delete('/del', async (req, res, next) => {
  const { userid } = req.query
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