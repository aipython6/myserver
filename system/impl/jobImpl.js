const mysqlConnect = require('../../database/mysql_config')
const DBUtils = require('../../utils/databaseUtils')
class jobImpl {
  // 获取所有job
  all(params) {
    const { page, size, enabled } = params
    const enabled_ = Boolean(enabled)
    const sql = `select * from jobs where enabled = ${(enabled_?1:0)}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result){
        if(!err) {
          const jobs = result.filter((item, index) => index < size * page && index >= size * (page - 1))
          resolve(jobs)
        } else {
          reject(err)
        }
      })
    })
  }

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
}

module.exports = jobImpl