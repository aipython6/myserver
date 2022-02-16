const jobImpl = require('../impl/jobImpl')

class jobService {
  constructor() {
    this.jobImpl = new jobImpl()
  }
  all(params) {
    return this.jobImpl.all(params)
  }
}

module.exports = jobService