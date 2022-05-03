const mysqlConnect = require('../../database/mysql_config')

class dictImpl {
  all(page, size) {
    const sql = `select dict_id, description, name from dict`
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
  getDictDetial(dictName, page, size) {
    const sql = `select * from dict a left join dict_detail b on a.dict_id=b.dict_id where a.name='${dictName}'`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, res) => {
        if (!err) {
          const temp_res = res.map(e => {
            return {
              dictName: e.name,
              label: e.label,
              value: e.value,
              dictSort: e.dict_sort
            }
          })
          let dicts = temp_res
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
}

module.exports = dictImpl