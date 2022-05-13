const xlsx = require('node-xlsx')
const config = require('../utils/urlConfig')
const { v4: uuidv4 } = require('uuid')

const getExcelData = (filename) => {
  const uuid = uuidv4()
  const full_path = config.excelUpload + filename
  const workbook = xlsx.parse(full_path)
  const sheetData = workbook[0].data
  return sheetData.slice(1-sheetData.length)
}

module.exports = { getExcelData: getExcelData }
