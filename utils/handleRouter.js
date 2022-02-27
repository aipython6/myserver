// 封装符合vue格式的路由对象
const handleRouter = (menuList) => {
  // parent的临时对象
  let parentMapTemp = { path: '', component: '', redirect: '', name: '',hidden: 0, meta: {}, children: [] }
  // children的临时对象
  let childrenMapTemp = { path: '', name: '', component: '', hidden: '', meta: {} }
  // children的临时数组
  let childrenList = []
  // 最终符合格式的menu数组
  let resultList = []
  let num = 0
  menuList.forEach(e => {
    if (!e.pid) {   // 所有的parent
      parentMapTemp.path = '/' + e.path
      parentMapTemp.component = e.component
      parentMapTemp.redirect = e.redirect
      parentMapTemp.name = e.path.slice(0,1).toUpperCase() + e.path.slice(1)  // parent的name和path一样的值，所以这里不加入name字段了，直接用path字段的值
      parentMapTemp.hidden = e.hidden !== 0 ? true : false
      parentMapTemp.meta = { title: e.title, icon: e.icon }
      menuList.forEach(t => {
        if (e.menu_id === t.pid) {  // 该parent下的所有children
          childrenMapTemp.path = t.path
          childrenMapTemp.name = t.name
          childrenMapTemp.component = t.component
          childrenMapTemp.hidden = t.hidden !== 0 ? true : false
          childrenMapTemp.meta = { title: t.title, icon: t.icon }
          childrenList.push(childrenMapTemp)
        }
        childrenMapTemp = { path: '', name: '', component: '', hidden: '', meta: {} }
      })
      parentMapTemp.children = childrenList
      resultList.push(parentMapTemp)
      childrenList = []
    }
      parentMapTemp = { path: '', component: '', redirect: '', name: '', hidden: 0, meta: {}, children: [] }
  })
  return resultList
}
module.exports = handleRouter