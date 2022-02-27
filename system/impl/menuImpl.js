// menus相关方法的实现
const mysqlConnect = require('../../database/mysql_config')

class menuImpl {
  // 根据role_id查询所有的menu,type为menu的类型,type=0父级菜单，type=1父级菜单下的子菜单，type=2其他权限，此处为type!=2
  findMenusByRoldId (roles, type) {
    const new_type = type || 2
    const sql = ` select distinct m.* FROM menus m, roles_menus r WHERE m.menu_id = r.menu_id AND r.role_id IN (?) AND type != ${new_type} order by m.menu_id asc `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [roles], function (err, result) {
        if (!err) {
          resolve(result.map(e => {
            return {
              menu_id: e.menu_id, pid: e.pid, sub_count: e.sub_count, type: e.type, title: e.title,
              name: e.name, component: e.component, menu_sort: e.menu_sort, icon: e.icon, path: e.path, redirect: e.redirect,
              i_frame: e.iframe, cache: e.cache, hidden: e.hidden, permission: e.permission, create_by: e.create_by,
              update_by: e.update_by, create_time: e.create_time, update_time: e.update_time
            }
          }))
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = menuImpl