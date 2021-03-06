// 所有请求的状态码
const statusCode = {
  // token过期
  tokenExpiredError: 401,

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
  addRoleError: 210,

  // 添加menu失败
  addMenuError: 211,

  // 头像上传失败
  avatarUploadError: 212,

  // 密码更新失败
  updatePassError: 213,

  // 更新个人中心信息失败
  updateCenterUserinfoError: 214,

  // 删除menu失败
  delMenuError: 215,

  // 更新menu失败
  updateMenuError: 216,

  // 添加data失败
  addDataError: 217,

  editDataError: 218,

  delDataError: 219,

  // 添加部门失败
  addDeptError: 220,
  editDeptError: 221,

  // 上传excel失败
  uploadExcelError: 222
}

module.exports = statusCode