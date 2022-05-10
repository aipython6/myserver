const path = require('path');

const base_url = 'http://localhost:8000'

const config = {
  base_url: base_url,

  // 默认头像的地址
  defaultAvatar: base_url + '/images/avatar/default.png',

  // pdf上传的地址
  pdfUpload: path.join(__dirname, '../public/files/pdfs/'),

  // pdf下载的地址
  pdfDownload: base_url + '/files/pdfs/',
  
  // 用户头像上传地址
  avatarUpload: path.join(__dirname, '../public/images/avatar/'),

  // 用户头像下载地址
  avatarDownload: base_url + '/images/avatar/',

  // excel上传
  excelUpload: path.join(__dirname, '../public/bas/excel/'),

  // excel下载
  excelDownload: base_url + '/bas/excel/'
}


module.exports = config