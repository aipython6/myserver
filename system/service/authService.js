const authImpl = require('../impl/authImpl')

class authService {
  constructor() {
    this.authImpl = new authImpl()
  }
  // 根据roles查询所有的permission
  findPermissionByRolesid(roles, type) {
    return this.authImpl.findPermissionByRolesid(roles, type)
  }
  // 根据user_id查询所有的dept_id
  findDeptsByUserid(user_id) {
    return this.authImpl.findDeptsByUserid(user_id)
  }
}

module.exports = authService