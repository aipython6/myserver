const mysqlConnect = require('../../database/mysql_config')

class dictDetailImpl {
  dictDetail({ dictName, page, size }) {
    const sql = `select a.name,b.* from 
    (select name,dict_id from dict where name='${dictName}')a inner join 
    (select detail_id as id,dict_id,label,value,dict_sort from dict_detail)b on a.dict_id=b.dict_id`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, (err, res) => {
        if (!err) {
          const temp_res = res.map(e => {
            return {
              id: e.id,
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
    const sql = `insert into dict_detail set ?`
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
  del(ids) {
    const sql = `delete from dict_detail where detail_id in (?)`
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
  edit({ id, label, value, dictSort, update_by, update_time }) {
    const sql = `update dict_detail set label = '${label}', value = '${value}', dict_sort = ${dictSort},
    update_by='${update_by}', update_time='${update_time}' where detail_id=${id}`
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
}


module.exports = dictDetailImpl