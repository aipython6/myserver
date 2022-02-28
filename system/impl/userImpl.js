const mysqlConnect = require('../../database/mysql_config')
const moment = require('moment')
const password = require('../../utils/passBcrypt')
const handleDate = require('../../utils/handleDate')
// 用户管理相关方法的实现
class userImpl {

  // 获取所有用户
  findAllUsers(page, size, dept_id) {
    let sql = `select * from users where enabled = 1`
    if (dept_id) {
      sql += ` and dept_id = ${dept_id}`
    }
    console.log(sql)
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          const temps = result.map(e => {
            return {
              userid: e.user_id,
              dept: e.dept_name,
              username: e.username,
              gender: e.gender,
              avatar_name: e.avatar_name,
              avatar_path: e.avatar_path,
              is_admin: e.is_admin === 1 ? '管理员' : '普通用户',
              create_by: e.create_by,
              createTime: handleDate(e.create_time),
              phone: e.phone
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
  // 编辑用户信息
  // edit(userItem) {

  // }
}
module.exports = userImpl