const mysqlConnect = require('../../database/mysql_config')
// role相关的实现方法
class roleImpl {
  // 根据user_id查询role_id
  findRoleByUserId(user_id) {
    const sql = ` select b.role_id, b.type from users_roles a left join roles b on a.role_id=b.role_id where a.user_id= ${user_id} `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function (err, result) {
        if (!err) {
          resolve(
            {
              roles: result.map(e => e.role_id),  // 角色id列表
              types: result.map(e => e.type)      // 角色名称列表
            }
          )
        } else {
          reject(err)
        }
      })
    })
  }

  // 获取所有的role
  all() {
    const sql = `select * from roles`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          const roles = result.map(r => {
            return {
              id: r.role_id,
              name: r.name,
              level: r.level
            }
          })
          resolve(roles)
        } else {
          reject(err)
        }
      })
    })
  }

  // 获取所有的level
  level() {
    const sql = `select level from roles`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result){
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据id获取对应的role
  get(id) {
    const sql = `select * from roles where role_id = ${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result){
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = roleImpl