import router from './router'
import store from './store'
import { Message } from 'element-ui'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import { getToken } from '@/utils/auth'

NProgress.configure({ showSpinner: false });

function hasPermission(roles, permissionRoles) {
  if (roles.indexOf('admin') >= 0) {
    return true
  }
  if (!permissionRoles) {
    return true
  }
  return roles.some(role => permissionRoles.indexOf(role) >= 0)
}

// 不重定向白名单
const whiteList = ['/login', '/modify'];

router.beforeEach((to, from, next) => {
  NProgress.start();
  if (getToken()) {
    if (to.path === '/login') {
      next({ path: '/' });
      NProgress.done() // if current page is dashboard will not trigger	afterEach hook, so manually handle it
    } else {
      if (store.getters.roles.length === 0) {
        store.dispatch('GetUserInfo')
          .then(res => {
            const roles = res.roles; // note: roles must be a array! such as: ['editor','develop']
            store.dispatch('GenerateRoutes', { roles })
              .then(() => {
                // 根据roles权限生成可访问的路由表
                router.addRoutes(store.getters.addRouters) // 动态添加可访问路由表
                next({ ...to, replace: true }) // hack方法 确保addRoutes已完成
              })
          })
          .catch(err => {
            Message.error(err);
            next({ path: '/' })
          })
      } else {
        if (hasPermission(store.getters.roles, to.meta.roles)) {
          next()
        } else {
          next({ path: '/401', replace: true, query: { noGoBack: true }})
        }
      }
    }
  } else {
    if (whiteList.indexOf(to.path) !== -1) {
      next()
    } else {
      // 否则全部重定向到登录页
      next(`/login?redirect=${to.path}`);
      NProgress.done()
    }
  }
});

router.afterEach(() => {
  NProgress.done() // finish progress bar
});
