const jwt = require('jsonwebtoken')
const my_token = 'EL-ADMIN-TOEKN'
class Token {
	// 设置token
	sign(username) {
		return jwt.sign({ username: username }, my_token)
	}
	// 校验token
	verify(token, username) {
		const result = jwt.verify(token, my_token)
		if (result) {
			return username === result.username
		} else {
			return 'token验证失败'
		}
	}
}

const t = new Token()
module.exports = t