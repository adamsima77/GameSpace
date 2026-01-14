import { createRouter, createWebHistory } from 'vue-router'
import UserLayout from '../views/user/UserView.vue'
import { useUserStore } from '../stores/user'
import { useCartStore } from '../stores/cart'

const routes = [
  {
    path: '/',
    component: UserLayout,
    children: [
      { path: '', name: 'home', meta: {title: 'GameSpace'}, component: () => import('../views/user/HomeView.vue') },
      { path: 'kontakt', name: 'kontakt', meta: {title: 'Kontakt'}, component: () => import('../views/user/ContactView.vue') },
      { path: 'about', name: 'about', meta: {title: 'O nás'}, component: () => import('../views/user/AboutUs.vue') },
      { path: 'hry', name: 'games', meta: {title: 'Hry'}, component: () => import('../views/user/Games.vue') },
      { path: 'hry/:slug', name: 'item-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'laptop-pc', name: 'laptops-and-PCs',meta: {title: 'Laptopy a PC'}, component: () => import('../views/user/LaptopsAndPcs.vue') },
      { path: 'laptops-pcs/:slug', name: 'laptops-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'accessories', name: 'accessories',meta: {title: 'Herné príslušenstvo'}, component: () => import('../views/user/Accessories.vue') },
      { path: 'accessories/:slug', name: 'accessories-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'consoles', name: 'consoles', meta: {title: 'Konzoly'}, component: () => import('../views/user/Consoles.vue') },
      { path: 'consoles/:slug', name: 'consoles-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'extras', name: 'extras', meta: {title: 'Doplnky'}, component: () => import('../views/user/Extras.vue') },
      { path: 'extras/:slug', name: 'extras-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'search', name: 'search', meta: {title: 'Search'}, component: () => import('../views/user/SearchView.vue') },
      { path: 'search/:slug', name: 'search-detail',  component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'login', name: 'login', meta: {title: 'Prihlásenie'}, component: () => import('../views/user/LoginView.vue') },
      { path: ':slug', name: 'cart-item-detail', component: () => import('../views/user/ItemDetailView.vue') },
      { path: 'cart', name: 'cart', meta: {title: 'Košík'}, component: () => import('../views/user/cart/Cart.vue'),
        children:[
            {path: 'dorucenie', name: 'delivery', meta: {title: 'Doručenie'}, component: () => import('../views/user/cart/Delivery.vue')},
            {path: 'pokladna', name: 'checkout', meta: {title: 'Pokladňa'}, component: () => import('../views/user/cart/Checkout.vue')},
        ]
      },
      {path: 'uspesna-objednavka', name: 'successful-order', meta: {title: 'Úspešná objednávka'},component: () => import('../views/user/cart/SuccessfulOrder.vue')},
      {path: 'nastavenia', name: 'user-settings', redirect: { name: 'order-history' }, meta: {title: 'Nastavenia účtu'}, component: () => import('../views/user/user_settings/UserSettings.vue'),
            children:[
                {path: 'historia-nakupov', name: 'order-history', meta: {title: 'História objednávok'}, component: () => import('../views/user/user_settings/OrderHistory.vue')},
                {path: 'osobne-udaje', name: 'personal-info', meta: {title: 'Osobné informácie'},component: () => import('../views/user/user_settings/PersonalInfo.vue')},
                {path: 'ucet', name: 'account-management', meta: {title: 'Spravovanie účtu'}, component: () => import('../views/user/user_settings/AccountManagment.vue')},
                {path: ':id', name: 'order-detail', component: () => import('../views/user/user_settings/OrderDetail.vue')}
            ]
      },
    ],
  },

  {
    path: '/admin',
    name: 'admin',
    component: () => import('../views/admin/AdminView.vue'),
    children: [
          {path: 'dashboard', name: 'dashboard', meta: {title: 'Dashboard'}, component: () => import('../views/admin/Dashboard.vue')},
          {path: 'items', name: 'items', meta: {title: 'Produkty'}, component: () => import('../views/admin/Items.vue')},
          {path: 'orders', name: 'orders', meta: {title: 'Objednávky'}, component: () => import('../views/admin/Orders.vue')},
          {path: 'accordion', name: 'accordion', meta: {title: 'Akordeón'}, component: () => import('../views/admin/Accordion.vue')},
          {path: 'slideshow', name: 'slideshow', meta: {title: 'Slideshow'}, component: () => import('../views/admin/Slideshow.vue')},
          {path: 'add-accordion', name: 'add-accordion',  meta: {title: 'Pridať záznam'},component: () => import('../views/admin/add/AddAccordion.vue')},
          {path: 'accordion/:id', name: 'update-accordion', component: () => import('../views/admin/update/UpdateAccordion.vue')},
          {path: 'add-slideshow', name: 'add-slideshow', meta: {title: 'Pridať záznam'}, component: () => import('../views/admin/add/AddSlideshow.vue')},
          {path: 'slideshow/:id', name: 'update-slideshow', component: () => import('../views/admin/update/UpdateSlideshow.vue')},
          {path: 'orders/:id', name: 'update-orders', component: () => import('../views/admin/update/UpdateOrders.vue')},
          {path: 'items/:id', name: 'update-items', component: () => import('../views/admin/update/UpdateItems.vue')},

    ],
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


router.beforeEach(async(to, from, next) => {

  document.title = to.meta.title || 'GameSpace';

  const userStore = useUserStore()
  const cartStore = useCartStore()

    if (!userStore.sessionChecked) {
    const isLogged = await userStore.checkIfLogged();
    if (!isLogged) {
      await userStore.logout();
    }
  }
   
  if(to.name === 'admin' && (!userStore.user_id || userStore.role !== 2)){
      return next({name: 'login'});
  }

  if(to.name === 'delivery' && cartStore.cart.length === 0){
        return next({name: 'cart'});
  }

  if(to.name === 'checkout' && !cartStore.isDeliverySet()){
       return next({name: 'cart'});
  }

  if(to.name === 'login' && userStore.user_id){
       return next({name: 'home'});
  }

  return next()
})
export default router
