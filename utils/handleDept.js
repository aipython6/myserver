// 对deptlist进行处理
const handleDept = (deptList, pid) => {
  let resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', sub_count: '', hasChildren: true, children: [] }
  let resultMapChildren = []
  let secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '', sub_count: '' }
  let secondMapChildren = []
  // pid!==undefined，懒加载数据
  if (pid) {
    deptList.forEach(a => {
      if (a.dept_id === pid) {
        resultMap.id = a.dept_id
        resultMap.pid = a.pid
        resultMap.name = a.name
        resultMap.deptSort = a.dept_sort
        resultMap.enabled = a.enabled
        deptList.forEach(b => {
          if (b.pid === a.dept_id) {
            secondMap.id = b.dept_id
            secondMap.name = b.name
            secondMap.deptSort = b.dept_sort
            secondMap.enabled = b.enabled
            secondMap.pid = b.pid
            secondMapChildren.push(secondMap)
          }
          secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '', sub_count: '' }
        })
        resultMap.children = secondMapChildren
        resultMapChildren.push(resultMap)
        secondMapChildren = []
      }
      resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', sub_count: '', hasChildren: true, children: [] }
    })
    return resultMap
    // pid===undefined 初始化时加载数据
  } else {
    deptList.forEach(a => {
      if (!a.pid) {
        resultMap.id = a.dept_id
        resultMap.pid = a.pid
        resultMap.name = a.name
        resultMap.deptSort = a.dept_sort
        resultMap.enabled = a.enabled
        resultMap.sub_count = a.sub_count
        deptList.forEach(b => {
          if (b.pid === a.dept_id) {
            secondMap.id = b.dept_id
            secondMap.name = b.name
            secondMap.deptSort = b.dept_sort
            secondMap.enabled = b.enabled
            secondMap.pid = b.pid
            secondMap.sub_count = b.sub_count
            secondMapChildren.push(secondMap)
          }
          secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '', sub_count: '' }
        })
        resultMap.children = secondMapChildren
        resultMapChildren.push(resultMap)
        secondMapChildren = []
      }
      resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', sub_count: '',  hasChildren: true, children: [] }
    })
    return resultMap
  }
}

// 根据dept查找其所有的一级、二级dept_id，实现点击树形的dept来查询用户的功能
const deptFilter = (deptList, dept_id) => {
  let filter_list = [dept_id]
  deptList.forEach(a => {
    if (a.pid === dept_id) {
      filter_list.push(a.dept_id)
      deptList.forEach(b => {
        if (a.dept_id === b.pid) {
          filter_list.push(b.dept_id)
        }
      })
    }
  })
  return filter_list
}

module.exports = { handleDept, deptFilter }