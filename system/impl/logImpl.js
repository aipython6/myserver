const mysqlConnect = require('../../database/mysql_config')

class logImpl {
  // 个人中心展示用户的请求行为
  addLog(data) {
    const sql = `insert into logs set ?`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, data, function (err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  getLogs({ page, size }) {
    let pageList = []
    const sql = `select * from logs`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function (err, result) {
        if (!err) {
          if (page && size) {
            pageList = result.filter((item, index) => index < size * page && index >= size * (page - 1))
          } else {
            pageList = result
          }
          resolve({ logsList: pageList, totalElements: result.length })
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = logImpl