// 所有请求的状态码

const statusCode = {
  // 所有请求成功后统一返回的状态码
	success: 200,
	// 1. 用户登录
	// 1.1 用户不存在
	userNotExist: 201,
	// 1.2 密码错误
	passError: 202,
	// 1.3 验证码错误
	verifyCodeError: 203,
	
	// 请求的URL未携带token
	NotToken: 204
}

module.exports = statusCode