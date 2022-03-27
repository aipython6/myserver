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
  
  add(params) {
    return this.deptImpl.add(params)
  }

  all() {
    return this.deptImpl.all()
  }

  delUsersDeptsByUuserid(user_ids) {
    return this.deptImpl.delUsersDeptsByUuserid(user_ids)
  }
  
}

module.exports = deptService