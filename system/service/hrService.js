const hrImpl = require('../impl/hrImpl')

class hrService {
  constructor (){
    this.hrImpl = new hrImpl()
  }

  list (params) {
    return this.hrImpl.list(params)
  }
}

module.exports = hrService