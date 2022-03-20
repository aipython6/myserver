const logImpl = require('../impl/logImpl')

class logService {
  constructor() {
    this.logImpl = new logImpl()
  }
  addLog(data) {
    return this.logImpl.addLog(data)
  }
  getLogs(data) {
    return this.logImpl.getLogs(data)
  }
}

module.exports = logService