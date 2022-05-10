const basImpl = require('../impl/basImpl')
class basService {
  constructor () {
    this.basImpl = new basImpl()
  }
  excelUpload(data) {
    return this.basImpl.excelUpload(data)
  }
}

module.exports = basService