const mysqlConnect = require('../../database/mysql_config')

class dictImpl {
  all(page, size) {
    const sql = `select dict_id as id, description, name from dict`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, result) => {
        if (!err) {
          let dicts = result
          const total = dicts.length
          if (page && size) {
            const pageList = dicts.filter((item, index) => index < size * page && index >= size * (page - 1))
            dicts = pageList
          }
          resolve({ dicts: dicts, totalElement: total })
        } else {
          reject(err)
        }
      })
    })
  }

  add(data) {
    const sql = `insert into dict set ?`
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
  
  edit(data) {
    const { id, name, description } = data
    const sql = `update dict set name='${name}', description='${description}' where dict_id=${id}`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, res) => {
        if (!err) {
          resolve(res)
        } else {
          reject(err)
        }
      })
    })
  }

  del(ids) {
    const sql = `delete from dict where dict_id in (?)`
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

module.exports = dictImpl