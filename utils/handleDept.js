// 对deptlist进行处理
const handleDept = (deptList, pid) => {
  let resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', hasChildren: true, children: [] }
  let resultMapChildren = []
  let secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '' }
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
          secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '' }
        })
        resultMap.children = secondMapChildren
        resultMapChildren.push(resultMap)
        secondMapChildren = []
      }
      resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', hasChildren: true, children: [] }
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
        deptList.forEach(b => {
          if (b.pid === a.dept_id) {
            secondMap.id = b.dept_id
            secondMap.name = b.name
            secondMap.deptSort = b.dept_sort
            secondMap.enabled = b.enabled
            secondMap.pid = b.pid
            secondMapChildren.push(secondMap)
          }
          secondMap = { name: '', deptSort: '', id: '', enabled: '', pid: '' }
        })
        resultMap.children = secondMapChildren
        resultMapChildren.push(resultMap)
        secondMapChildren = []
      }
      resultMap = { id: '', name: '', deptSort: '', enabled: '', pid: '', hasChildren: true, children: [] }
    })
    return resultMap
  }
}

module.exports =handleDept