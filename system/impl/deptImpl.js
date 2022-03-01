const mysqlConnect = require('../../database/mysql_config')

class deptImpl {
  // 根据传入的参数获取符合条件的部门信息
  getAllDeptsByParams(params) {
    const { enabled, name, pid } = params
    const en = Boolean(enabled) === true ? 1 : 0
    let sql = `select * from depts where enabled = ${en}`
    // 部门名称是否可用
    if (name) {
      sql += ` and name = '${name}'`
    }
    // 父级部门是否可用
    if (pid) {
      sql += ` and pid = ${pid}`
    }
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, function(err, result) {
        if (!err) {
          const depts = result.map(e => {
            return {
              dept_id: e.dept_id,
              pid: e.pid,
              name: e.name
            }
          })
          resolve(depts)
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