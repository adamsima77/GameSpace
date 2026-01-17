<template>
  <div class="subnav" :class="{ scrolled: isScrolled, notScrolled: !isScrolled}">
    <ul class="links">
       <RouterLink :to = "{name: 'games'}" :class = "{active: activeElement == 1}"><li class = "category">Hry</li></RouterLink>
       <RouterLink :to = "{name: 'laptops-and-PCs'}" :class = "{active: activeElement == 2}"><li class = "category">Notebooky a PC</li></RouterLink>
       <RouterLink :to = "{name: 'accessories'}" :class = "{active: activeElement == 3}"><li class = "category">Príslušenstvo</li></RouterLink>
       <RouterLink :to = "{name: 'consoles'}" :class = "{active: activeElement == 4}"><li class = "category">Konzoly</li></RouterLink>
       <RouterLink :to = "{name: 'extras'}" :class = "{active: activeElement == 5}"><li class = "category">Doplnky</li></RouterLink>
       <RouterLink :to="{name: 'cart'}" class = "cart" :class = "{active: activeElement == 6}">
        <li><i class="fas fa-shopping-cart"></i>Košík<p class = "cart_count" v-if = "cartStore.cart.length > 0">{{ cartStore.cart.length }}</p></li>
      </RouterLink>
    </ul>
  </div>
</template>

<script>
import { useCartStore } from '../stores/cart';
export default {
  data() {
    return {
      isScrolled: false,
      lastScroll: 0,
      categories: [],
      showMegaMenu: true,
      cartStore: null
    };
  },

  created(){
      this.cartStore = useCartStore();
      this.cartStore.fetchCart();
  },

  methods: {
    handleScroll() {
      const currentScroll = window.scrollY;
      const direction = currentScroll - this.lastScroll;
      if(direction > 0 && currentScroll > 50){
           this.isScrolled = true;
      } else if(direction < 0){
             this.isScrolled = false;
      }
      this.lastScroll = currentScroll;
    },
      async fetchCategories(){
          try{
               const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_main_categories.php",
               {
                  withCredentials: false
               });
               this.categories = response.data;

          } catch(error){
                    if(error.response){

               } else if(error.request){

               } else {

               }
          }
      }
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
    this.fetchCategories();
  },
  beforeUnmount() {
    window.removeEventListener("scroll", this.handleScroll);
  },

  computed:{
       activeElement(){
        switch(this.$route.name){
           case 'games': return 1;
           case 'laptops-and-PCs': return 2;
           case 'accessories': return 3;
           case 'consoles': return 4;
           case 'extras': return 5;
           case 'cart': return 6;
        }
      }
  }

  
};
</script>

<style scoped lang="scss">
.subnav {
  position: fixed;
  top: 80px;
  width: 100%;
  z-index: 1000;
  background-color: white;
  border-top: 2px solid $blue;
  border-bottom: 2px solid $blue;
  transition: all 0.3s ease-in-out;
  display: flex;
  justify-content: space-between;
  align-items: center;

  ul.links {
    display: flex;
    width: 100%;
    list-style: none;
    padding: 0;
    margin: 0;

     a {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 15px;
      cursor: pointer;
      border-right: 2px solid $blue;
      transition: all 0.2s ease;
   
      &:hover {
        background-color: lighten($blue, 42%);
        color: $blue;
        box-shadow: inset 0 -3px 0 $blue;
      }

      &.active{
        background-color: lighten($blue, 42%);
        color: $blue;
        box-shadow: inset 0 -3px 0 $blue;
      }

      &:last-child {
        border-right: none;
      }
    }

    .cart li {
       display: flex;          
       align-items: center;      
       gap: 5px;                 
       border-right: none;
      i{
         margin-right: 0;  
      }

      .cart_count{
         display: inline-flex;   
         justify-content: center;
         align-items: center;
         color: white;
         background-color: red;
         border-radius: 50%;
         width: 20px;           
         height: 20px;
         font-size: 12px;
      }
    }
  }


  &.scrolled {
    top: 0;
    background: white;
    box-shadow: $box_sh_nav;
  }

  &.notScrolled{
    top: 90px;
  }
}
@media only screen and (max-width: 632px) {
    .subnav{
      display: none;
    }
}
</style>
