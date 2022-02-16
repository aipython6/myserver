const mysqlConnect = require('../../database/mysql_config')
class jobImpl {
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
}

module.exports = jobImpl