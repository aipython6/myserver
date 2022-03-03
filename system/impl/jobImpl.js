const mysqlConnect = require('../../database/mysql_config')
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
    const sql = `select * from users_jobs where user_id = ${user_id}`
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
  add(user_id) {
    // 默认人事专员
    const job_id = 8
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
}

module.exports = jobImpl