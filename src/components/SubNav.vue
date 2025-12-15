<template>
  <div class="subnav" :class="{ scrolled: isScrolled, notScrolled: !isScrolled}">
    <ul class="links">
       <RouterLink :to = "{name: 'games'}"><li class = "category">Hry</li></RouterLink>
       <RouterLink :to = "{name: 'laptops-and-PCs'}"><li class = "category">Notebooky a PC</li></RouterLink>
       <RouterLink :to = "{name: 'accessories'}"><li class = "category">Príslušenstvo</li></RouterLink>
       <RouterLink :to = "{name: 'consoles'}"><li class = "category">Konzoly</li></RouterLink>
       <RouterLink :to = "{name: 'extras'}"><li class = "category">Doplnky</li></RouterLink>
       <RouterLink :to="{name: 'cart'}" class = "cart">
        <li><i class="fas fa-shopping-cart"></i>Košík</li>
      </RouterLink>
    </ul>
  </div>
</template>

<script>

export default {
  data() {
    return {
      isScrolled: false,
      lastScroll: 0,
      categories: [],
      showMegaMenu: true
    };
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

      &:last-child {
        border-right: none;
      }
    }

    .cart li {
      border-right: none;
      i{
        margin-right: 5px;
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


</style>
