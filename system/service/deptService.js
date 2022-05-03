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

  delUsersDeptsByUuserid(user_ids) {
    return this.deptImpl.delUsersDeptsByUuserid(user_ids)
  }

  all(params) {
    return this.deptImpl.all(params)
  }

  add(data) {
    return this.deptImpl.add(data)
  }

  del(ids) {
    return this.deptImpl.del(ids)
  }
  
}

module.exports = deptService