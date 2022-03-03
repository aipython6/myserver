const mysqlConnect = require('../../database/mysql_config')
const moment = require('moment')
const password = require('../../utils/passBcrypt')
const handleDate = require('../../utils/handleDate')
// 用户管理相关方法的实现
class userImpl {

  // 获取所有用户
  findAllUsers(page, size, dept_id) {
    let sql = `select * from users`
    if (dept_id) {
      sql += ` where and dept_id = ${dept_id}`
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          const temps = result.map(e => {
            return {
              id: e.user_id,
              dept: e.dept_name,
              dept_id: e.dept_id,
              username: e.username,
              gender: e.gender,
              avatar_name: e.avatar_name,
              avatar_path: e.avatar_path,
              is_admin: e.is_admin === 1 ? '管理员' : '普通用户',
              create_by: e.create_by,
              createTime: handleDate(e.create_time),
              phone: e.phone,
              enabled: e.enabled
            }
          })
          const pageList = temps.filter((item, index) => index < size * page && index >= size * (page - 1))
          const obj = {
            users: pageList,
            page: result.length
          }
          resolve(obj)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据user_id查询用户的所有信息
  findUserinfByUserid(user_id) {
    const sql = `select * from users where user_id = ${user_id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据username查询用户信息
  findUserinfoByUsername(username) {
    const sql = `select * from users where username='${username}'`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 添加用户
  async add(userItem) {
    const item = {
      username: userItem.user_name,	// 职工号
      dept_name: userItem.dept_name,
      gender: userItem.gender,
      phone: userItem.phone,
      password: await password.passEncode(userItem.password),
      avatar_name: userItem.avatar_name || '用户头像',
      avatar_path: userItem.avatar_path || 'http://localhost:8000/images/avatar/default.png',
      is_admin: userItem.is_admin || 0,
      enabled: userItem.enabled || 1,
      create_by: userItem.create_by || 'admin',
      update_by: userItem.update_by || 'admin',
      pwd_reset_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss'),
      create_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss'),
      update_time: moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
    }
    const sql = `INSERT INTO users SET ?`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, item, function (err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
  // 删除用户
  del(user_id) {
    const sql = ` DELETE FROM users where user_id = ${user_id} `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, user_id, function (err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
  // 根据user_id编辑用户信息
  edit(userItem) {
    const { id, enabled, dept, username, gender, avatar_path, is_admin, createTime, phone } = userItem
    // const { id, enabled } = userItem
    const e = Boolean(enabled) === true ? 1 : 0
    const i = is_admin === '管理员' ? 1 : 0
    const update_time = handleDate(new Date())
    let sql = `update users set username = '${username}', gender = '${gender}', avatar_path='${avatar_path}', enabled = ${e},is_admin = ${i},create_time='${createTime}', update_time = '${update_time}', phone= '${phone}', dept_name = '${dept}' where user_id = ${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function (err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
  // 根据user_id编辑用户中心信息
  editUser(userItem) {
    const { id, enabled, dept, username, gender, avatar_path, is_admin, create_by, createTime, phone, roles, jobs } = userItem
    const e = Boolean(enabled) === true ? 1 : 0
    const r = eval(roles)
    const j = eval(jobs)
  }

}
module.exports = userImpl