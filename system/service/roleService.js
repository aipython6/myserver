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
  all(data) {
    return this.roleImpl.all(data)
  }
  // 获取所有的level
  level() {
    return this.roleImpl.level()
  }

  // 根据role_id获取对应的role
  get(role_id) {
    return this.roleImpl.level(role_id)
  }

  //添加一条记录到users_roles
  add(user_id, role_id) {
    return this.roleImpl.add(user_id, role_id)
  }

  editUserRolesByUserid(data) {
    return this.roleImpl.editUserRolesByUserid(data)
  }

  delUserRolesByUserid(user_ids) {
    return this.roleImpl.delUserRolesByUserid(user_ids)
  }

  addRole(params) {
    return this.roleImpl.addRole(params)
  }
}

module.exports = roleService