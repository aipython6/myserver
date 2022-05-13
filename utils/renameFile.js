const fs = require('fs')
const path = require('path')
const { getTimestamp, standardTime } = require('../utils/handleDate')
class renameFileHandle {
  renameFile(files, uploadUrl, downloadUrl) {
    return new Promise((resolve, reject) => {
      const temp = files.map(e => {
        const uuid = getTimestamp()
        const basename = path.basename(e.path)
        const suffix = path.extname(e.path)
        const newname = uuid + suffix
        fs.rename(uploadUrl + basename, uploadUrl + newname, err => {})
        return { file: downloadUrl + newname, filename: path.basename(basename, suffix), newname: newname, msg: '文件上传成功', upload_time: standardTime(uuid) }
      })
      if (temp.length > 0) {
        resolve(temp)
      } else {
        reject('数据处理失败')
      }
    })
  }
}
const rfh = new renameFileHandle()

module.exports = rfh