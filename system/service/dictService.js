const dictImpl = require('../impl/dictImpl')

class dictService {
  constructor() {
    this.dictImpl = new dictImpl()
  }
  getDictDetial(dictName, page, size) {
    return this.dictImpl.getDictDetial(dictName, page, size)
  }
}

module.exports = dictService