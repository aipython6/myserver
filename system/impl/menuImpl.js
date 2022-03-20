// menus相关方法的实现
const mysqlConnect = require('../../database/mysql_config')
const handleDate = require('../../utils/handleDate')
class menuImpl {
  // 根据role_id查询所有的menu,type为menu的类型,type=0父级菜单，type=1父级菜单下的子菜单，type=2其他权限，此处为type!=2
  findMenusByRoldId (roles, type) {
    const new_type = type || 2
    const sql = ` select distinct m.* FROM menus m, roles_menus r WHERE m.menu_id = r.menu_id AND r.role_id IN (?) AND type != ${new_type} order by m.menu_id asc `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [roles], (err, result) => {
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

  // 根据role_id获取所有对应的menu_id
  getMenusByRoleid(role_id) {
    const sql = `select menu_id from roles_menus where role_id = ${role_id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result){
        if (!err) {
          const menu_ids = result.map(e => {
            return {
              id: e.menu_id
            }
          })
          resolve(menu_ids)
        } else {
          reject(err)
        }
      })
    })
  }

  findMenuByPid(pid) {
    let sql = ``
    if (!pid) {
      sql = `select * from menus where pid is null`
    } else {
      sql = `select * from menus where pid = ${pid}`
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  findChildByMenuid(id) {
    const sql = `select * from menus where pid = ${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据menu_id获取对应的记录
  getMenuByMenuid(menu_id) {
    const sql = `select * from menus where menu_id = ${menu_id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据role_id保存menu_id到roles_menus中
  editMenus(id, menu_id) {
    const sql = `insert into roles_menus (role_id, menu_id) values (${id}, ${menu_id})`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据role_id删除对应的menu_id
  delMenus(id) {
    const sql = `delete from roles_menus where role_id = ${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // menus的CRUD操作
  // 获取全部的menus
  all(params) {
    const { page, size } = params
    let pageList = []
    const sql = `select * from menus`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          const menus = result.map(e => {
            return {
              type: e.type,
              pid: e.pid,
              menu_id: e.menu_id,
              title : e.title,
              icon: e.icon,
              path: e.path,
              Menusort : e.menu_sort,
              permission : e.permission,
              component : e.component,
              iFrame : e.i_frame,
              cache : e.cache,
              hidden : e.hidden,
              createTime : handleDate(e.create_time),
            }
          })
          if (page && size) {
            const s = size + 9999
            pageList = menus.filter((item, index) => index < s * page && index >= s * (page - 1))
          } else {
            pageList = menus
          }
          const total = menus.filter(e => e.type === 0).length
          resolve({ menus: pageList, totalElements: total })
        } else {
          reject(err)
        }
      })
    })
  }

  // 添加menu
  add(data) {
    const sql = `insert into menus set ?`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, data, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 更新
  edit(data) {
    const { id, title, menu_sort, component, name, i_frame, pid, icon, cache, hidden, type, permission, redirect,update_time } = data
    const sql = `update menus set title='${title}',menu_sort=${menu_sort}, 
    component='${component}', name='${name}', i_frame='${i_frame}', 
    pid = ${pid}, icon='${icon}',cache=${cache}, hidden=${hidden}, type=${type}, permission=${permission}, 
    redirect=${redirect}, update_time=${update_time} where menu_id = ${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 删除
  del(ids) {
    const sql = `delete from menus where menu_id in (?)`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [ids], (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = menuImpl