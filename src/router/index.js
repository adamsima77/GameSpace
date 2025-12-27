import { createRouter, createWebHistory } from 'vue-router'
import UserLayout from '../views/user/UserView.vue'
import { useUserStore } from '../stores/user'
import { useCartStore } from '../stores/cart'

const routes = [
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
      { path: ':slug', name: 'cart-item-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'cart', name: 'cart', component: () => import('../views/user/cart/Cart.vue'),
        children:[
            {path: 'dorucenie', name: 'delivery', component: () => import('../views/user/cart/Delivery.vue')},
            {path: 'pokladna', name: 'checkout', component: () => import('../views/user/cart/Checkout.vue')},
        ]
      },
      {path: 'uspesna-objednavka', name: 'successful-order',component: () => import('../views/user/cart/SuccessfulOrder.vue')},
      {path: 'nastavenia', name: 'user-settings', redirect: { name: 'order-history' }, meta: {requiresAuth: true}, component: () => import('../views/user/user_settings/UserSettings.vue'),
            children:[
                {path: 'historia-nakupov', name: 'order-history', component: () => import('../views/user/user_settings/OrderHistory.vue')},
                {path: 'osobne-udaje', name: 'personal-info', component: () => import('../views/user/user_settings/PersonalInfo.vue')},
                {path: 'ucet', name: 'account-management', component: () => import('../views/user/user_settings/AccountManagment.vue')},
                {path: ':id', name: 'order-detail', component: () => import('../views/user/user_settings/OrderDetail.vue')}
            ]
      },
    ],
  },

  {
    path: '/admin',
    component: () => import('../views/admin/AdminView.vue'),
    meta: { requiresAuth: true, requiresAdmin: true },
    children: [],
  },

  { path: '/:pathMatch(.*)*', name: 'NotFound', component: () => import('../views/user/NotFound.vue') },
]

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes,
  scrollBehavior(to, from, savedPosition) {
    return savedPosition || { top: 0 }
  },
})


router.beforeEach((to, from, next) => {
  const userStore = useUserStore()
  const cartStore = useCartStore()

  if(to.name === 'user-settings' && !userStore.user_id){
      return next({ name: 'home' });
  }

  const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  const requiresAdmin = to.matched.some(record => record.meta.requiresAdmin)

  if (requiresAuth && !userStore.user_id) {
    return next({ name: 'login' })
  }

  if (requiresAdmin && userStore.role !== 2) {
    return next({ name: 'home' })
  }

  if (requiresAuth && cartStore.cart.length === 0 && !['user-settings', 'order-detail', 'order-history', 'personal-info', 'account-management'].includes(to.name)) {
    return next({ name: 'cart' }) 
  }

  if (to.name === 'checkout' && !cartStore.isDeliverySet()) {
    return next({ name: 'delivery' }) 
  }

  next()
})
export default router
