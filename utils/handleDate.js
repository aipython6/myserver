const moment = require('moment');

// 日期处理
const handleDate = date => {
  return moment(date).locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
}

const getNow = () => {
  return moment().locale('zh-cn').format('YYYY-MM-DD HH:mm:ss')
}

// 当前时间的时间戳
const getTimestamp = () => {
  return moment(new Date()).valueOf()
}


module.exports = { handleDate: handleDate, getTimestamp: getTimestamp } 