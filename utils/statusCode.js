// 所有请求的状态码
const statusCode = {
  statusErrorCode: 306,
  // 所有请求返回的状态码和提示信息
	success: 200,
	// 1. 用户登录
	// 1.1 用户不存在
	userNotExist: 201,
	// 1.2 密码错误
	passError: 202,
	// 1.3 验证码错误
	verifyCodeError: 203,
	
	// 请求的URL未携带token
  tokenVerifyError: 204,
  
  // 添加用户失败
  addUserError: 205,

  // 用户删除失败
  delUserError: 206,

  // 获取字典数据失败
  getDictDetailError: 207,

  // 用户信息更新失败
  UserinfoEditError: 208,

  // 菜单保存失败
  editMenusError: 209,

  // 添加role失败
  addRoleError: 210
}

module.exports = statusCode