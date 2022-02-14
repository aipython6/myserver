const mysqlConnect = require('../../database/mysql_config')

class authImpl {
  // roles:用户所拥有的roles，type:某个菜单名称（如user表示用户管理）
  // 根据roles查询所有的permission
  findPermissionByRolesid(roles, type) {
    const sql = `select a.role_id, b.permission from roles_menus a left join menus b on a.menu_id=b.menu_id where a.role_id in (?) and (LENGTH(permission)<>0) and permission like '%${type}%'`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [roles], function(err, result) {
        if (!err) {
            resolve(result)
        } else {
            reject(err) 
          }
      })
    })
  }

  // 根据user_id查询所有的depts,用于显示该用户所拥有某个部门的数据
  findDeptsByUserid(user_id) {
    const sql = `select b.dept_id from users a left join users_depts b on a.user_id=b.user_id where a.user_id=${user_id}`
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
}

module.exports = authImpl