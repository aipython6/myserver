const mysqlConnect = require('../../database/mysql_config')

class basImpl {
  // 将上传的excel保存到mysql
  excelUpload(data) {
    const sql = 'INSERT INTO bas(`checker`,`out_dept`,`inpatient_no`,`patient_name`,`in_date`,`out_date`,`archive_code`,`resdent_physician`,`main_doctor`,`chief_physician`,`dept_director`,`case_type`,`inpatient_days`,`has_operation`,`one_veto_yj`,`one_veto_bj`,`sum_score`,`grade`,`remark`,`content`,`check_date`,`flag`) VALUES ?'
    return new Promise((resolve, reject) => {
      mysqlConnect.query(sql, [data], (err, result) => {
        if (!err) {
          resolve(result)
        } else {
          reject(err)
        }
      })
    })
  }
}

module.exports = basImpl