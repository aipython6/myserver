const jwt = require('jsonwebtoken')
const my_token = 'EL-ADMIN-TOEKN'
class Token {
	// 设置token
	sign(username) {
		return jwt.sign({ username: username }, my_token)
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