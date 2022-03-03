// 数据库操作补充的方法
const mysqlConnect = require('../database/mysql_config')

class DBUtils{

  // 根据user_id查询users_roles
  findRoleidByUserid(user_id) {
    const sql = `select * from users_roles where user_id = ${user_id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          const roleid = result.map(r => r.role_id)
          resolve(roleid)
        } else {
          reject(err)
        }
      })
    })
  }

  // 根据user_id查询usres_jobs
  findJobidByUserid(user_id) {
    const sql = `select * from users_jobs where user_id = ${user_id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          const jobid = result.map(r => {
            r.job_id
          })
          resolve(jobid)
        } else {
          reject(err)
        }
      })
    })
  }


  // 根据user_id更新users_roles
  updateUsersRolesByUserid(user_id, role_id) {
    const sql = `update users_roles set role_id = ${role_id} where user_id = ${user_id}`
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


  // 插入一条新纪录到users_roles中
  insertintoUsersRoles(user_id, role_id) {
    const sql = `insert into users_roles (user_id, role_id) values (${user_id}, ${role_id})`
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

  // 插入一条新纪录到users_jobs中
  insertintoUsersJobs(user_id, job_id) {
    const sql = `insert into users_jobs (user_id, job_id) values (${user_id}, ${job_id})`
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

  // 如果已经存在数据，则进行更新；如果数据不存在，则插入
  /*
    @param
    type{String}: 类型，users_role/users_jobs
    data{Array}: 待处理的数据
  */
  async updateOrInsert(type, data) {
    const { id, typeids } = data
    // 是否完成操作的标记
    let cu = false
    switch (type) {
      case 'users_roles':
        const roleid = await this.findRoleidByUserid(id)
        // 找出不在roles中的roleid，即不在users_roles中，前端又传递过来的，则需要插入该条记录
        const insert_role = typeids.filter(e => !roleid.includes(e))
        // 在role_id中的，则进行更新
        const update_role = typeids.filter(e => roleid.includes(e))
        // console.log(typeids, roleid)
        if (insert_role.length > 0) {
          for (let i of insert_role) {
            const r = await this.insertintoUsersRoles(id, i)
          }
          cu = true
        }
        if (update_role.length > 0) {
          for (let i of update_role) {
            const r = await this.updateUsersRolesByUserid(id ,i)
          }
          cu = true
        }
    }
    return cu
  }
}

module.exports = DBUtils