const dataImpl = require('../impl/dataImpl')

class dataService {
  constructor() {
    this.dataImpl = new dataImpl()
  }
  list(params) {
    return this.dataImpl.list(params)
  }
  getParentType() {
    return this.dataImpl.getParentType()
  }
  add(data) {
    return this.dataImpl.add(data)
  }
}

module.exports = dataService