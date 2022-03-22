const mssql = require('mssql')

const config = {
  user: 'andsoft',
  password: 'andsoft@123',
  database: 'OESv6',
  server: 'www.OESv6.com',
  options: {
      encrypt: false,
      trustServerCertificate: false
  }
}

const getConnection = async () => {
  let connectionPool
  connectionPool = await mssql.connect(config)
  return connectionPool
}

const querySql = async (sql) => {
  const pool = await getConnection()
  const request = pool.request()
  const result = await request.query(sql)
  return result
}

module.exports = querySql