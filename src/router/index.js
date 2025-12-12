import { createRouter, createWebHistory } from 'vue-router'
import UserLayout from '../views/user/UserView.vue'
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      component: UserLayout,
      children: [
        { path: '', name: 'home', component: () => import('../views/user/HomeView.vue') },
        { path: 'kontakt', name: 'kontakt', component: () => import('../views/user/ContactView.vue') },
        { path: 'about', name: 'about', component: () => import('../views/user/AboutUs.vue') },
        { path: 'hry', name: 'games', component: () => import('../views/user/Games.vue') },
        { path: 'hry/:slug', name: 'item-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'laptop-pc', name: 'laptops-and-PCs', component: () => import('../views/user/LaptopsAndPcs.vue') },
        { path: 'laptops-pcs/:slug', name: 'laptops-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'accessories', name: 'accessories', component: () => import('../views/user/Accessories.vue') },
        { path: 'accessories/:slug', name: 'accessories-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'consoles', name: 'consoles', component: () => import('../views/user/Consoles.vue') },
        { path: 'consoles/:slug', name: 'consoles-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'extras', name: 'extras', component: () => import('../views/user/Extras.vue') },
        { path: 'extras/:slug', name: 'extras-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'search', name: 'search', component: () => import('../views/user/SearchView.vue') },
        { path: 'search/:slug', name: 'search-detail', component: () => import('../views/user/ItemDetailView.vue') },
        { path: 'login', name: 'login', component: () => import('../views/user/LoginView.vue') },
      ],
    },

    {
      path: '/admin',
      component: () => import('../views/admin/AdminView.vue'),
      children: [
       
      ],
    },

    { path: '/:pathMatch(.*)*', name: 'NotFound', component: () => import('../views/user/NotFound.vue') },
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
