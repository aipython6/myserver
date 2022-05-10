const xlsx = require('node-xlsx')
const config = require('../utils/urlConfig')

const getExcelData = () => {
  const workbook = xlsx.parse(config.excelUpload)
  // const sheetName = workbook[0].name
  const sheetData = workbook[0].data
  return sheetData
}

module.exports = { getExcelData: getExcelData }
