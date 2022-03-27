/*reference: https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Error */
function handleError({ message, name, status }) {
  this.name = name;
  this.message = message;
  this.status = status;
}

function TokenExpiredError({ status }) {
  this.status = status
}
handleError.prototype = Object.create(Error.prototype);
handleError.prototype.constructor = handleError

TokenExpiredError.prototype = Object.create(Error.prototype);
TokenExpiredError.prototype.constructor = TokenExpiredError

module.exports = { handleError, TokenExpiredError };