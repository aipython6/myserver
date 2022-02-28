const moment = require('moment');

// 日期处理
const handleDate = date => {
  return moment(date).locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
}

const getNow = () => {
  return moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
}


module.exports = handleDate