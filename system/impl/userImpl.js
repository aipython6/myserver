const mysqlConnect = require('../../database/mysql_config')
const moment = require('moment')
const password = require('../../utils/passBcrypt')
// 用户管理相关方法的实现
class userImpl {
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