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
}

module.exports = deptService