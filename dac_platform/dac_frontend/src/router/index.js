import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

import Layout from '@/views/layout/Layout'

/* Router Modules */
import amRouter from './modules/am'
import tmRouter from './modules/tm'

export const constantRouterMap = [
  {
    path: '/login',
    component: () => import('@/views/user/login/index'),
    hidden: true
  },
  {
    path: '/modify',
    component: () => import('@/views/user/modify/index'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/errorPage/404'),
    hidden: true
  },
  {
    path: '/401',
    component: () => import('@/views/errorPage/401'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: '/dashboard',
        component: () => import('@/views/dashboard/Index'),
        name: 'Dashboard',
        meta: { title: 'Dashboard', icon: 'dashboard', noCache: true, affix: true }
      }
    ]
  }
]

export default new Router({
  // mode: 'history', //后端支持可开
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
})

export const asyncRouterMap = [
  amRouter,
  tmRouter,
  {
    path: '*',
    redirect: '/404',
    hidden: true
  }
]
