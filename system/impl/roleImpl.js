const mysqlConnect = require('../../database/mysql_config')
const handleDate = require('../../utils/handleDate')
const DBUtils = require('../../utils/databaseUtils')
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
  all({ page, size, blurry, createTime }) {
    let sql = `select * from roles`
    if (blurry) {
      sql += ` where name like '%${blurry}%' or description like '%${blurry}%'`
    }
    if (createTime instanceof Array && createTime.length > 0) {
      if (blurry) {
        sql += ` and create_time between '${createTime[0]}' and '${createTime[1]}'`
      } else {
        sql += ` where create_time between '${createTime[0]}' and '${createTime[1]}'`
      }
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          const roles = result.map(r => {
            return {
              id: r.role_id,
              name: r.name,
              level: r.level,
              description: r.description,
              dataScope: r.data_scope,
              createTime: handleDate(r.create_time)
            }
          })
          const pageList = roles.filter((item, index) => index < size * page && index >= size * (page - 1))
          resolve({ roles: pageList, totalElements: roles.length })
        } else {
          reject(err)
        }
      })
    })
  }

  // 获取所有的level
  level(role_id) {
    const sql = `select level from roles where role_id = ${role_id}`
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

  //添加一条记录到users_roles
  add(user_id, role_id) {
    // 默认role_id=2:普通用户
    // const role_id = 2
    const sql = `insert into users_roles(user_id, role_id) values (${user_id}, ${role_id})`
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
  // 根据user_id更新users_roles
  editUserRolesByUserid(data) {
    const { user_id, roles } = data
    const params = { id: user_id, typeids: roles }
    const db = new DBUtils()
    const cu = db.updateOrInsert('users_roles', params)
    return new Promise((resolve, reject) => {
      resolve(cu)
    })
  }

  // 根据userid删除对应的记录
  delUserRolesByUserid(user_ids) {
    const sql = `delete from users_roles where user_id in (?)`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [user_ids], function(err, result){
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 添加role
  addRole(params) {
    const sql = `insert into roles set ? `
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [params], function(err, result){
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