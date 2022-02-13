const mysqlConnect = require('../../database/mysql_config')

class permissionImpl {
  // user_id:用户id，type:某个菜单名称（如user表示用户管理）
  constructor(roles, type) {
    this.roles = roles
    this.type = type
  }
  findPermissionByUserid() {
    const sql = `select a.role_id, b.permission from roles_menus a left join menus b on a.menu_id=b.menu_id where a.role_id in (?) and (LENGTH(permission)<>0) and permission like '%${this.type}%'`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [this.roles], function (err, result) {
        if (!err) {
            resolve(result)
        } else {
            reject(err) 
          }
      })
    })
  }
}

module.exports = permissionImpl