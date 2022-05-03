const dictImpl = require('../impl/dictImpl')

class dictService {
  constructor() {
    this.dictImpl = new dictImpl()
  }
  all(page, size) {
    return this.dictImpl.all(page, size)
  }
  getDictDetial(dictName, page, size) {
    return this.dictImpl.getDictDetial(dictName, page, size)
  }
  add(data) {
    return this.dictImpl.add(data)
  }
}

module.exports = dictService