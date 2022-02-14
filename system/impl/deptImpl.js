const mysqlConnect = require('../../database/mysql_config')

class deptImpl {
  // 根据传入的参数获取符合条件的部门信息
  getAllDeptsByParams(params) {
    const { enabled, sort, name, pid } = params
    let sql = ``
    // 部门是否可用
    if (!(enabled ==='' || enabled === undefined || enabled === null)) {
      sql = `select * from depts where enabled = ${parseInt(enabled)}`
    }
    // 部门名称
    if (!(name ==='' || name === undefined || name === null)) {
      sql += ` and name = '${name}'`
    }
    // 父级部门
    if (!(pid ==='' || pid === undefined || pid === null)) {
      sql += ` and pid = ${pid}`
    }
    // 排序规则
    if (!(sort ==='' || sort === undefined || sort === null)) {
      const order = sort.replace(',',' ').replace('id', 'dept_id')
      sql += ` order by ` + order
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }

  // 获取所有父级部门
  getAllSuperDepts(ids) {
    const sql = `select * from depts where dept_id in (?)`
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [ids], function(err, result) {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = deptImpl