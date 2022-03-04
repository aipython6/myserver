const deptImpl = require('../impl/deptImpl')

class deptService {
  constructor() {
    this.deptImpl = new deptImpl()
  }
  getAllDeptsByParams(params) {
    return this.deptImpl.getAllDeptsByParams(params)
  }
  getAllSuperDepts(ids) {
    return this.deptImpl.getAllSuperDepts(ids)
  }
  getDeptnameByDeptid(dept_id) {
    return this.deptImpl.getDeptnameByDeptid(dept_id)
  }
}

module.exports = deptService