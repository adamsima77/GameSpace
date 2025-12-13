import './assets/main.css'
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import piniaPersist from 'pinia-plugin-persistedstate'
import axios from 'axios'

import App from './App.vue'
import router from './router'

const app = createApp(App)

app.config.globalProperties.$axios = axios;

const pinia = createPinia()
pinia.use(piniaPersist)
app.use(pinia)

app.use(router)

app.mount('#app')