import Layout from '@/views/layout/Layout'

const tmRouter = {
  path: '/tm',
  component: Layout,
  redirect: '/tm/dnc-join',
  name: 'TM',
  meta: {
    title: '物管理',
    icon: 'example'
  },
  children: [
    {
      path: 'dnc-join',
      component: () => import('@/views/tm/DncJoin'),
      name: 'DncJoin',
      meta: {title: '物接入'}
    },
    {
      path: 'gw-join',
      component: () => import('@/views/tm/GatewayJoin'),
      name: 'GatewayJoin',
      meta: {title: '网关接入'}
    },
    {
      path: 'dnc-resolve',
      component: () => import('@/views/tm/DncResolve'),
      name: 'DncResolve',
      meta: {title: '物解析'}
    },
    {
      path: 'gw-manage',
      component: () => import('@/views/tm/GatewayManage'),
      name: 'GatewayManage',
      meta: {title: '网关管理'}
    },
    {
      path: 'create-dnc/:mac/:type',
      component: () => import('@/views/tm/CreateDncDevice'),
      hidden: true,
      name: 'CreateDncDevice',
      meta: {title: ''}
    },
    {
      path: 'create-plc/:mac/:type',
      component: () => import('@/views/tm/CreatePlcDevice'),
      hidden: true,
      name: 'CreatePlcDevice',
      meta: {title: ''}
    }
  ]
};

export default tmRouter
