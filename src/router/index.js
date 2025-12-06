import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { 
      path: "/:pathMatch(.*)*", 
      name: "NotFound", 
      component: () => import('../views/NotFound.vue')
   },
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomeView.vue'),
    },
    {
      path: '/kontakt',
      name: 'kontakt',
      component: () => import('../views/ContactView.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutUs.vue')
    }
  ],

    //Po načítaní nového view premiestni užívateľa na začiatok view
    scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    } else {
      return { top: 0 };
    }
  }
})

export default router
