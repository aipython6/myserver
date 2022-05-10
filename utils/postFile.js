// 文件上传
const multer = require('multer')
const config = require('../utils/urlConfig')
class postFile {
  // 上传pdf文件
  postPDF() {
    const storage = multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, config.pdfUpload)
      },
      filename: (req, file, cb) => {
        const filename = file.originalname
        cb(null, filename)
      }
    })
    const uploader = multer({ storage: storage })
    return uploader
  }

  // 上传头像
  postAvatar() {
    const storage = multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, config.avatarUpload)
      },
      filename: (req, file, cb) => {
        const filename = file.originalname
        cb(null, filename)
      }
    })
    const uploader = multer({ storage: storage })
    return uploader
  }

  // 上次excel
  postExcel() {
    const storage = multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, config.excelUpload)
      },
      filename: (req, file, cb) => {
        const filename = file.originalname
        cb(null, filename)
      }
    })
    const uploader = multer({ storage: storage })
    return uploader
  }
}

const upload = new postFile()

module.exports = upload