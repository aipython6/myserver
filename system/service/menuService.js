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
  getMenusByRoleid(role_id) {
    return this.menuImpl.getMenusByRoleid(role_id)
  }

  editMenus(id, menu_id) {
    return this.menuImpl.editMenus(id, menu_id)
  }

  // 根据role_id删除对应的menu_id
  delMenus(id) {
    return this.menuImpl.delMenus(id)
  }
  all(params) {
    return this.menuImpl.all(params)
  }
}

module.exports = menuService