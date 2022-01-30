const menuImpl = require('../impl/menuImpl')
// menus的service方法
class menuService {
  constructor(roles, type) {
    this.menuImpl = new menuImpl()
    this.roles = roles
    this.type = type
  }
  // 根据roles和type查询menus
  findMenusByRoldId() {
    return this.menuImpl.findMenusByRoldId(this.roles, this.type)
  }
}

module.exports = menuService