const mysqlConnect = require('../../database/mysql_config')

class dictImpl {
  getDictDetial(dictName, page, size) {
    const sql = `select b.detail_id as id, a.description, b.label, b.value from  dict a left join dict_detail b on a.dict_id=b.dict_id where a.name='${dictName}'`
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
}

module.exports = dictImpl