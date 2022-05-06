const mysqlConnect = require('../../database/mysql_config')
const DBUtils = require('../../utils/databaseUtils')
class jobImpl {
  // 根据userid获取所有的job
  findJobsByUserId(user_id) {
    const sql = `select a.job_id,b.name from users_jobs a left join jobs b on a.job_id=b.job_id where a.user_id = ${user_id}`
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

  // 插入一条记录到users_jobs中
  add(user_id, job_id) {
    // 默认人事专员
    // const job_id = 8
    const sql = `insert into users_jobs (user_id, job_id) values (${user_id}, ${job_id})`
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

  // 根据userid更新数据到usres_jobs
  // 根据user_id更新users_jobs
  editUserJobsByUserid(data) {
    const { user_id, job_id } = data
    const sql = `update users_jobs set job_id = ${job_id} where user_id = ${user_id}`
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

  delUsersJobsByUserid(user_ids) {
    const sql = `delete from users_jobs where user_id in (?)`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [user_ids], (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 对job的CRUD操作
  // 1.获取所有job
  all(params) {
    const { page, size, name } = params
    let sql = `select job_id as id, name, enabled, job_sort, create_time from jobs`
    if (name) {
      sql += ` where name like '%${name}%'`
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result){
        if (!err) {
          const total = result.length
          const jobs = result.filter((item, index) => index < size * page && index >= size * (page - 1))
          resolve({ jobs: jobs, totalElements: total })
        } else {
          reject(err)
        }
      })
    })
  }

  // 2.添加
  post(data) {
    const sql = `insert into jobs set ?`
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

  // 3.编辑
  edit(data) {
    const { id, name, update_time, jobSort, update_by, enabled } = data
    const sql = `update jobs set name='${name}', enabled=${enabled}, update_time = '${update_time}', job_sort = ${jobSort}, update_by = ${update_by} where job_id = ${id}`
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
  // 4.删除
  del(ids) {
    const sql = `delete from jobs where job_id in (?)`
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

module.exports = jobImpl