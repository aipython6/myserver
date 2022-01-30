const mysqlConnect = require('../../database/mysql_config')
// role相关的实现方法
class roleImpl {
  // 根据user_id查询role_id
  findRoleByUserId(user_id) {
    const sql = ` select b.role_id from users_roles a left join roles b on a.role_id=b.role_id where a.user_id= ${user_id} `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function (err, result) {
        if (!err) {
          resolve(
            result.map(e => e.role_id)
          )
        } else {
          reject(err)
        }
      })
    })
  }
}


module.exports = roleImpl