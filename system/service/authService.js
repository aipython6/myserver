const authImpl = require('../impl/authImpl')

class authService {
  constructor() {
    this.authImpl = new authImpl()
  }
  // 获取验证码
  getCode(insert_item) {
    return this.authImpl.getCode(insert_item)
  }

  // 根据用户名查询用户
  findUserByUsername(username) {
    return this.authImpl.findUserByUsername(username)
  }

  findUserinfoByUsername(username) {
    return this.authImpl.findUserinfoByUsername(username)
  }

  // 查询uuid
  findUUID(uuid, code) {
    return this.authImpl.findUUID(uuid, code)
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