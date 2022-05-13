const fileImpl = require('../impl/fileImpl')

class fileService {
  constructor() {
    this.fileImpl = new fileImpl()
  }
  all(params) {
    return this.fileImpl.all(params)
  }
  add(data) {
    return this.fileImpl.add(data)
  }
}

module.exports = fileService