const mysqlConnect = require('../../database/mysql_config')

class fileImpl {
  all({ page, size }) {
    const sql = `select * from files where enabled = 1`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          let files = result
          const total = files.length
          if (page && size) {
            const pageList = files.filter((item, index) => index < size * page && index >= size * (page - 1))
            files = pageList
          }
          resolve({ files: files, totalElement: total })
        } else {
          reject(err)
        }
      })
    })
  }

  add(data) {
    const sql = `insert into files set ?`
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

}

module.exports = fileImpl