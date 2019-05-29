import Layout from '@/views/layout/Layout'

const amRouter = {
  path: '/am',
  component: Layout,
  redirect: '/am/market',
  name: 'AM',
  meta: {
    title: '算法管理',
    icon: 'example'
  },
  children: [
    {
      path: 'market',
      component: () => import('@/views/am/AmMarket'),
      name: 'AmMarket',
      meta: {title: '算法市场'}
    },
    {
      path: 'detail/:name/:type', // type 表示是算法市场还是算法应用
      component: () => import('@/views/am/AmDetail'),
      name: 'AmDetail',
      hidden: true,
      meta: {title: ''}
    },
    {
      path: 'apply',
      component: () => import('@/views/am/AmApply'),
      name: 'AmApply',
      meta: {title: '算法应用'}
    },
    {
      path: 'model/:name',
      component: () => import('@/views/am/ModelManage'),
      name: 'ModelManage',
      hidden: true,
      meta: {title: ''}
    },
    {
      path: 'create/:name',
      component: () => import('@/views/am/CreateModel'),
      name: 'CreateModel',
      hidden: true,
      meta: {title: ''}
    }
  ]
}

export default amRouter
