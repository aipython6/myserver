const mysqlConnect = require('../../database/and2ui')

class hrImpl {
  list({ page, size }) {
    let pageList = []
    let total = 0
    const sql = `select * from 在职和返聘`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          total = result.length
          if (page && size) {
            pageList = result.filter((item, index) => index < size * page && index >= size * (page - 1))
          } else {
            pageList = result
          }
          resolve({ pageList: pageList, totalElements: total })
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = hrImpl