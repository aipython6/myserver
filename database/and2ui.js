// 访问远程www.and2ui.cn的数据
const mysql = require('mysql')
const connection = mysql.createConnection(
  {
    host: 'www.and2ui.cn',
    user: 'root',
    password: '6118277ndaNDA',
    database: 'myadmin'
  }
)
connection.connect()
module.exports = connection