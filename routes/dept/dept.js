const express = require('express')
const router = express.Router()
const statusCode = require('../../utils/statusCode')
const handleDate = require('../../utils/handleDate')
const { handleDept } = require('../../utils/handleDept')
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

// dept的CRUD操作

// 查询
router.get('/', async (req, res) => {
  const { page, size, pid } = req.query
  const deptservice = new deptService()
  const { deptList, totalElements } = await deptservice.all({ page: page, size: size })
  const list = handleDept(deptList, Number.parseInt(pid))
  res.json({ code: statusCode.success, content: list, totalElements: totalElements})
})

// 添加
router.post('/add', async (req, res) => {
  const { id, name, isTop, subCount, pid, deptSort, enabled } = req.body
  const deptservice = new deptService()
  const insert_item = {
    pid: pid,
    name: name,
    dept_sort: deptSort,
    enabled: enabled === 'true' ? 1 : 0,
    sub_count: subCount,
    create_time: handleDate(new Date())
  }
  const result = await deptservice.add(insert_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '添加成功' })
  } else {
    res.json({ code: statusCode.addDeptError, content: '添加失败'})
  }
})

// 编辑
router.put('/edit', async (req, res) => {
  const { id, name, isTop, subCount, pid, deptSort, enabled } = req.body
  const deptservice = new deptService()
  const update_item = {
    pid: pid,
    name: name,
    dept_sort: deptSort,
    enabled: enabled === 'true' ? 1 : 0,
    sub_count: subCount,
    update_time: handleDate(new Date())
  }
  const result = await deptservice.edit(update_item)
  if (result.affectedRows > 0) {
    res.json({ code: statusCode.success, content: '编辑成功' })
  } else {
    res.json({ code: statusCode.editDeptError, content: '编辑失败'})
  }
})

router.delete('/del', async (req, res) => {
  const id = req.body[0]
  const deptservice = new deptService()
  await deptservice.del(id)
  res.json({ code: statusCode.success, msg: '删除部门信息成功'})
})

module.exports = router