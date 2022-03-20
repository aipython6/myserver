const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const deptService = require('../../system/service/deptService')
// 根据参数获取所有的部门名称
router.get('/getDepts', async (req, res, next) => {
  // params may contain {enabled, sort, name, pid}
  const params = req.query
  const deptservice = new deptService()
  const depts = await deptservice.getAllDeptsByParams(params)
  // 所有部门
  if (!JSON.parse(params.children)) {
    // 一级的map
    let firstMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', hasChildren: true, children: [] }
    // 一级map对应的children数组
    let firstChildrenList = []

    // 二级的map
    let secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '' }

    // 最终depts数组
    const resultList = []

    depts.forEach(f => {
      if (!f.pid) {
        firstMap.name = f.name
        firstMap.id = f.dept_id
        firstMap.pid = f.pid
        firstMap.deptSort = f.dept_sort,
        enabled = f.enabled
        depts.forEach(s => {
          if (s.pid === f.dept_id) {
            secondMap.name = s.name
            secondMap.id = s.dept_id
            secondMap.pid = s.pid
            secondMap.deptSort = s.dept_sort
            secondMap.enabled = s.enabled
            firstChildrenList.push(secondMap)
          }
          secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '' }
        })
        firstMap.children = firstChildrenList
        resultList.push(firstMap)
        firstChildrenList = []
      }
      firstMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', hasChildren: true, children: [] }
    })
    res.json({ code: statusCode.success, content: resultList })
  } else {
    // 二级部门
    const deptlist = depts.filter(d => typeof d.pid === 'number').map(e => {
      return {
        id: e.dept_id, label: e.name
    }})
    res.json({ code: statusCode.success, content: deptlist })
  }
})

router.post('/getDeptSuperior', async (req, res, next) => {
  const { data } = req.body
  const deptservice = new deptService()
  const dept = await deptservice.getAllSuperDepts(eval(data))
  res.json({ code: statusCode.success, conten: dept })
})

module.exports = router