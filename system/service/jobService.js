const jobImpl = require('../impl/jobImpl')

class jobService {
  constructor() {
    this.jobImpl = new jobImpl()
  }
  all(params) {
    return this.jobImpl.all(params)
  }

  post(data) {
    return this.jobImpl.post(data)
  }

  edit(data) {
    return this.jobImpl.edit(data)
  }

  del(ids) {
    return this.jobImpl.del(ids)
  }

  findJobsByUserId(user_id) {
    return this.jobImpl.findJobsByUserId(user_id)
  }
  add(user_id, job_id) {
    return this.jobImpl.add(user_id, job_id)
  }
  editUserJobsByUserid(data) {
    return this.jobImpl.editUserJobsByUserid(data)
  }
  delUsersJobsByUserid(user_ids) {
    return this.jobImpl.delUsersJobsByUserid(user_ids)
  }
 }

module.exports = jobService