const roleImpl = require('../impl/roleImpl')
class roleService {
  constructor(user_id) {
    this.roleImpl = new roleImpl()
    this.user_id = user_id
  }
  // 根据user_id查询roles
  findRoleByUserId() {
    return this.roleImpl.findRoleByUserId(this.user_id)
  }
}

module.exports = roleService