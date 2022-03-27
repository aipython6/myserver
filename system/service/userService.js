// 用户管理的所有API
const userImpl = require('../impl/userImpl')
class userService {
  constructor() {
    this.userImpl = new userImpl()
  }

  // 获取所有用户
  findAllUsers(page, size, dept_ids) {
    return this.userImpl.findAllUsers(page, size, dept_ids)
  }

  // 根据user_id查询用户的所有信息
  findUserinfByUserid(user_id) {
    return this.userImpl.findUserinfByUserid(user_id)
  }
  // 添加用户
  add(userItem) {
    return this.userImpl.add(userItem)
  }

  // 根据username查询password
  findPassByUsername(username) {
    return this.userImpl.findPassByUsername(username)
  }

  // 根据username更新password
  updatePass(data) {
    return this.userImpl.updatePass(data)
  }

  // 更新个人中心的其他信息
  updateCenterInfo(data) {
    return this.userImpl.updateCenterInfo(data)
  }

  // 删除用户
  del(user_ids) {
    return this.userImpl.del(user_ids)
  }

  // 根据user_id编辑用户信息
  edit(userItem) {
    return this.userImpl.edit(userItem)
  }

  // 根据username查询用户信息
  findUserinfoByUsername(username) {
    return this.userImpl.findUserinfoByUsername(username)
  }
}

module.exports = userService