const jobImpl = require('../impl/jobImpl')

class jobService {
  constructor() {
    this.jobImpl = new jobImpl()
  }
  all(params) {
    return this.jobImpl.all(params)
  }
  findJobsByUserId(user_id) {
    return this.jobImpl.findJobsByUserId(user_id)
  }
  add(user_id) {
    return this.jobImpl.add(user_id)
  }
  editUserJobsByUserid(data) {
    return this.jobImpl.editUserJobsByUserid(data)
  }
 }

module.exports = jobService