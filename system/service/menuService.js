const menuImpl = require('../impl/menuImpl')
// menus的service方法
class menuService {
  constructor() {
    this.menuImpl = new menuImpl()
  }
  // 根据roles和type查询menus
  findMenusByRoldId(roles, type) {
    return this.menuImpl.findMenusByRoldId(roles, type)
  }

  findMenuByPid(pid) {
    return this.menuImpl.findMenuByPid(pid)
  }

  findChildByMenuid(id) {
    return this.menuImpl.findChildByMenuid(id)
  }
}

module.exports = menuService