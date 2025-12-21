<template>
    <div class = "sidebar" :class="{active: active, hide: !active}">
        <div class = "wrapper">
            <div class = "logo_close">
              <RouterLink to="/"><span class="title"><span>Game</span>Space</span></RouterLink>
              <i class="fas fa-times" @click = "$emit('close')"></i>
            </div>
            <div class = "icons">
                <i class="fas fa-user log" @click = "logUser" v-if = "!userStore.user_id"></i>
                  <div class = "logged" v-else>
                     <i class="fas fa-user-circle" @click = "userSettings"></i>
                     <i class="fas fa-sign-out-alt" @click = "logout"></i>  
                  </div>
            </div>
            <input type="text" class="search" placeholder="Hľadajte..." v-model="search" @keyup.enter = "setSearchValue()">
            <ul class="links">
           <RouterLink :to = "{name: 'games'}" @click = "closeSidebar()"><li class = "category">Hry</li></RouterLink>
           <RouterLink :to = "{name: 'laptops-and-PCs'}" @click = "closeSidebar()"><li class = "category">Notebooky a PC</li></RouterLink>
           <RouterLink :to = "{name: 'accessories'}" @click = "closeSidebar()"><li class = "category">Príslušenstvo</li></RouterLink>
           <RouterLink :to = "{name: 'consoles'}" @click = "closeSidebar()"><li class = "category">Konzoly</li></RouterLink>
           <RouterLink :to = "{name: 'extras'}" @click = "closeSidebar()"><li class = "category">Doplnky</li></RouterLink>
           <RouterLink :to="{name: 'cart'}" class = "cart" @click = "closeSidebar()">
           <li><i class="fas fa-shopping-cart"></i>Košík<p class = "cart_count" v-if = "cartStore.cart.length > 0">{{ cartStore.cart.length }}</p></li>
      </RouterLink>
    </ul>
        </div>
        
    </div>
</template>

<script>
import { useUserStore } from '../stores/user'
import { useCartStore } from '../stores/cart'
import { useSearchStore } from '../stores/search';
export default{
    props:['active'],
    data(){
        return{
            userStore: null,
            cartStore: null,
            searchStore: null,
            search: ''
        }
    },

    created(){
        this.userStore = useUserStore();
        this.cartStore = useCartStore();
        this.searchStore = useSearchStore();
        this.cartStore.fetchCart();
    },

    methods:{
         closeSidebar() {
             this.$emit('close')
         },

         userSettings(){
            this.$emit('close')
            this.$router.push({name: 'user-settings'})
         },

        async logout(){
            await this.userStore.logout();
            this.$emit('close')
            this.$router.push({ name: 'home' });
        },

        logUser(){
            this.$router.push({name: 'login'})
            this.$emit('close')
        },

        async setSearchValue(){
              if(!this.search) return;
              this.searchStore.setSearch(this.search);
              await this.searchStore.fetchSearch();
              this.$emit('close')
              this.$router.push({ name: 'search' });
              this.search = "";
        }
    }
}
</script>


<style scoped lang = "scss">
    .sidebar {
  position: fixed;
  inset: 0 auto 0 0;
  z-index: 1000000;
  width: 50%;
  height: 100vh;
  background-color: white;
  box-shadow: $box_sh_boxes;
  padding: 20px;
  display: flex;
  flex-direction: column;
  transition: transform 0.4s ease, opacity 0.4s ease;

  &.active{
      transform: translateX(0);
  }

  &.hide{
    transform: translateX(-100%);
  }

  .wrapper {
    display: flex;
    flex-direction: column;
    gap: 20px;

    .logo_close {
      display: flex;
      justify-content: space-between;
      align-items: center;

      .title {
        font-size: 1.3rem;
        font-weight: 300;
        text-decoration: none;
        color: black;

        span {
          color: $blue;
          font-weight: 700;
        }
      }

      i {
        font-size: 1.4rem;
        cursor: pointer;
        color: #666;
        transition: color 0.2s ease, transform 0.2s ease;

        &:hover {
          color: $blue;
          transform: rotate(90deg);
        }
      }
    }

    .icons {
      display: flex;
      gap: 15px;

      i {
        font-size: 1.3rem;
        cursor: pointer;
        color: #555;
        transition: color 0.2s ease, transform 0.2s ease;

        &:hover {
          color: $blue;
          transform: scale(1.1);
        }
      }

      .logged {
        display: flex;
        gap: 15px;
      }
    }

    .search {
      padding: 10px 12px;
      border-radius: 8px;
      border: 1px solid #ddd;
      font-size: 0.95rem;
      outline: none;
      transition: border 0.2s ease, box-shadow 0.2s ease;

      &:focus {
        border-color: $blue;
        box-shadow: 0 0 0 2px rgba($blue, 0.15);
      }
    }

    .links {
      display: flex;
      flex-direction: column;
      gap: 12px;

      a {
        text-decoration: none;
        color: inherit;
      }

      .category {
        padding: 10px 12px;
        border-radius: 8px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.2s ease, color 0.2s ease;

        &:hover {
          background-color: rgba($blue, 0.08);
          color: $blue;
        }
      }

      .cart li {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 10px 12px;
        border-radius: 8px;
        transition: background-color 0.2s ease;

        &:hover {
          background-color: rgba($blue, 0.08);
        }

        i {
          font-size: 1.1rem;
        }

        .cart_count {
          margin-left: auto;
          display: inline-flex;
          align-items: center;
          justify-content: center;
          width: 20px;
          height: 20px;
          border-radius: 50%;
          background-color: red;
          color: white;
          font-size: 12px;
          font-weight: 600;
        }
      }
    }
  }
}

</style>