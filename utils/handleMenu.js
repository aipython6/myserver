// 对menu的三个级别进行处理
const handleMenu = menuList => {
  const treeData = []
  // 所有内容的map
  let resultMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '',  createTime: '', children: [] }
  let resultMapChildren = []

  // resultMap.children下的map
  let secondMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '', createTime: '', children: [] }
  let secondMapChildren = []

  // secondMap.children下的map
  let thirdMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '', createTime: '' }
  menuList.forEach(a => {
    if (!a.pid) {
      resultMap.id = a.menu_id
      resultMap.pid = a.pid
      resultMap.title = a.title
      resultMap.icon = a.icon
      resultMap.Menusort = a.Menusort
      resultMap.permission = a.permission
      resultMap.component = a.component
      resultMap.iFrame = a.i_frame
      resultMap.cache = a.cache
      resultMap.hidden = a.hidden
      resultMap.createTime = a.createTime
      menuList.forEach(b => {
        if (b.pid === a.menu_id) {
          secondMap.id = b.menu_id
          secondMap.pid = b.pid
          secondMap.title = b.title
          secondMap.icon = b.icon
          secondMap.Menusort = b.Menusort
          secondMap.permission = b.permission
          secondMap.component = b.component
          secondMap.iFrame = b.i_frame
          secondMap.cache = b.cache
          secondMap.hidden = b.hidden
          secondMap.createTime = b.createTime
          menuList.forEach(c => {
            if (c.pid === b.menu_id) {
              thirdMap.id = c.menu_id
              thirdMap.pid = c.pid
              thirdMap.title = c.title
              thirdMap.icon = c.icon
              thirdMap.Menusort = c.Menusort
              thirdMap.permission = c.permission
              thirdMap.component = c.component
              thirdMap.iFrame = c.i_frame
              thirdMap.cache = c.cache
              thirdMap.hidden = c.hidden
              thirdMap.createTime = c.createTime
              secondMapChildren.push(thirdMap)
            }
            thirdMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '', createTime: '' }
          })
          secondMap.children = secondMapChildren
          resultMapChildren.push(secondMap)
          secondMapChildren = []
        }
          secondMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '', createTime: '', children: [] }
      })
      resultMap.children = resultMapChildren
      treeData.push(resultMap)
      resultMapChildren = []
    }
    resultMap = { id: '', pid: '', title: '', icon: '', Menusort: '', permission: '', component: '', iFrame: '', cache: '', hidden: '',  createTime: '', children: [] }
  })
  return treeData
}
module.exports = handleMenu;