const jwt = require('jsonwebtoken')
const my_token = 'EL-ADMIN-TOEKN'

class Token {
	// 设置token
  sign(username, rememberMe, tokenCookieExpires) {
    // 默认token保存为1天
    let expiresIn = { expiresIn: 60 * 60 * 24 }
    // 如果用户设置了rememberMe，则根据前端的配置来设置token的过期时间（前端的设置是以天为单位）
    if (rememberMe && tokenCookieExpires) {
    // 设置token过期时间：1天
      expiresIn.expiresIn = tokenCookieExpires * 60 * 60 * 24
    }
		return jwt.sign({ username: username }, my_token, { expiresIn: expiresIn.expiresIn })
	}
	// 根据用户传入的username校验token
	verify(token, username) {
		if (!token) {
			return false
		} else {
			return new Promise((resolve, reject) => {
				jwt.verify(token, my_token, function (err, result) {
					if (err) {
						reject(err)
					} else {
						resolve(result.username.toString() === username.toString())
					}
				})
			})
		}
	}
}

const t = new Token()
module.exports = t