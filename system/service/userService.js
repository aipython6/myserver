// 用户管理的所有API
const userImpl = require('../impl/userImpl')
class userService {
  constructor() {
    this.userImpl = new userImpl()
  }
  // 添加用户
  add(userItem) {
    return this.userImpl.add(userItem)
  }
  // 删除用户
  del(user_id) {
    return this.userImpl.del(user_id)
  }
}

module.exports = userService