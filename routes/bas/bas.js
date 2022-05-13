const express = require('express')
const router = express.Router()
const rfh = require('../../utils/renameFile')
const statusCode = require('../../utils/statusCode')
const basService = require('../../system/service/basService')
const fileService = require('../../system/service/fileService')
const { getExcelData } = require('../../utils/handleExcel')
const config = require('../../utils/urlConfig')
const upload = require('../../utils/postFile')
const handleDate = require('../../utils/handleDate')
const uploadObj = upload.postExcel()

router.post('/excelUpload', uploadObj.array('file'), async (req, res) => {
  const { username } = req.headers
  const basservice = new basService()
  const fileservice = new fileService()
  const uploadUrl = config.excelUpload
  const downloadUrl = config.excelDownload
  const files = req.files
  rfh.renameFile(files, uploadUrl, downloadUrl).then(temp => {
    setTimeout(async () => {
      const insert_data = getExcelData(temp[0].newname)
      const result = await basservice.excelUpload(insert_data)
      const insert_item = { user_filename: temp[0].filename, sys_filename: temp[0].newname, upload_time: temp[0].upload_time, upload_by: username, enabled: 1 }
      const result1 = await fileservice.add(insert_item)
      // const content = Object.assign({}, temp[0], { username: username, enabled: 1 })
      if (result.affectedRows > 0 && result1.affectedRows > 0) {
        res.json({ code: statusCode.success, file: temp })
      } else {
        res.json({ code: statusCode.uploadExcelError, content: '上传文件失败'})
      }
    },100)
  })
})

router.get('/getdata',async (req, res) => {
  const insert_data = getExcelData('1652231149031.xlsx')
  res.json({ code: insert_data })
})

module.exports = router