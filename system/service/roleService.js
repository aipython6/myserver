const roleImpl = require('../impl/roleImpl')
class roleService {
  constructor() {
    this.roleImpl = new roleImpl()
  }
  // 根据user_id查询roles
  findRoleByUserId(user_id) {
    return this.roleImpl.findRoleByUserId(user_id)
  }
  // 获取所有的role
  all() {
    return this.roleImpl.all()
  }
  // 获取所有的level
  level() {
    return this.roleImpl.level()
  }

  // 根据id获取对应的role
  get(id) {
    return this.roleImpl.level()
  }
}

module.exports = roleService