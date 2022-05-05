const dictDetailImpl = require('../impl/dictDetailImpl')

class dictDetailService {
  constructor() {
    this.dictDetailImpl = new dictDetailImpl()
  }
  dictDetail(params) {
    return this.dictDetailImpl.dictDetail(params)
  }
  add(data) {
    return this.dictDetailImpl.add(data)
  }
  del(ids) {
    return this.dictDetailImpl.del(ids)
  }
  edit(data) {
    return this.dictDetailImpl.edit(data)
  }
}
module.exports = dictDetailService
