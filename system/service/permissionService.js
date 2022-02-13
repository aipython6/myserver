const permissionImpl = require('../impl/permissionImpl')

class permissionService {
  constructor(roles, type) {
    this.permissionImpl = new permissionImpl(roles, type)
  }
  findPermissionByUserid() {
    return this.permissionImpl.findPermissionByUserid()
  }
}

module.exports = permissionService