const mysqlConnec = require('../../database/mysql_config')
const handleDate = require('../../utils/handleDate')
class dataImpl {
  // CRUD操作
  // 获取全部详细数据列表
  list({ page, size }) {
    let pageList = []
    const sql = `select a.*,b.category from datadetails a left join datatypes b on a.pid=b.pid where a.enabled=1`
    return new Promise((resolve, reject) => {
      mysqlConnec.query(sql, (err, result) => {
        if (!err) {
          const menus = result.map(e => {
            return {
              id: e.data_id,
              pid: e.pid,
              parentName: e.category,
              title: e.title,
              path: e.path,
              description: e.description,
              has_detail: e.has_detail,
              detail_type: e.detail_type,
              sql: e.sql,
              enabled: e.enabled === 1 ? '是' : '否',
              create_at: handleDate(e.create_at)
            }
          })
          if (page && size) {
            pageList = menus.filter((item, index) => index < size * page && index >= size * (page - 1))
          } else {
            pageList = menus
          }
          resolve({ content: pageList, totalElements: menus.length })
        } else {
          reject(err)
        }
      })
    })
  }

  getParentType() {
    const sql = `select * from datatypes where enabled = 1`
    let types = []
    return new Promise((resolve, reject) => {
      mysqlConnec.query(sql, (err, result) => {
        if (!err) {
          types = result.map(e => {
            return {
              value: e.pid,
              label: e.category
            }
          })
          resolve(types)
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = dataImpl