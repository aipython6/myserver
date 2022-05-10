const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const basService = require('../../system/service/basService')
const { getTimestamp } = require('../../utils/handleDate')
const { getExcelData } = require('../../utils/handleExcel')
const config = require('../../utils/urlConfig')
const upload = require('../../utils/postFile')
const uploadObj = upload.postAvatar()

router.post('/excelUpload', uploadObj.array('file'), async (req, res) => {
  const basservice = new basService()
  const uploadUrl = config.excelUpload
  const downloadUrl = config.excelDownload
  const files = req.files
  const temp = files.map(e => {
    const uuid = getTimestamp()
    const basename = path.basename(e.path)
    const suffix = path.extname(e.path)
    const newname = uuid + suffix
    fs.rename(uploadUrl + basename, uploadUrl + newname, err => {})
		return { file: downloadUrl + newname, filename: path.basename(basename, suffix) }
	})
  const insert_data = getExcelData()
  console.log(insert_data)
  res.json({ code: statusCode.success })
  // const result = basservice.excelUpload(insert_data)
  // if (result.affectedRows > 0) {
  //   res.json({ code: statusCode.success, content: '上传文件成功' })
  // } else {
  //   res.json({ code: statusCode.uploadExcelError, content: '上传文件失败'})
  // }
})

module.exports = router