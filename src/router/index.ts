import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import store from '@/store'
import Home from '@/views/Home.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/account',
    name: 'Account',
    component: () => import('@/views/Account.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

router.beforeEach((to, _from, next) => {
  if (to.name !== 'Home' && !store.state.address) {
    next({ name: 'Home' })
  } else {
    next()
  }
})

export default router
