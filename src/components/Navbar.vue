<template>
  <nav :class="{ scrolled: isScrolled, notScrolled: !isScrolled}">
  <RouterLink to="/"><span class="title"><span>Game</span>Space</span></RouterLink>

  <div class="search_wrapper">
    <transition name="slide">
      <input v-if="showSearch" type="text" class="search" 
      placeholder="Hľadajte..." v-model="search" @keyup.enter = "setSearchValue()">
    </transition>

    <div class="search_results" v-if = "hideresult">
      <SearchItem :item="searchResult" v-if = "searchResult.length > 0" @hide-results = "cleanSearch()"></SearchItem>
      <p v-else>Nenašli sa žiadne produkty</p>
    </div>
    
  </div>

  <div class="user_search">
    <i :class="!showSearch ? 'fas fa-search' : 'fas fa-times'" @click="invert()"></i>
    <i class="fas fa-user" @click = "$router.push({name: 'login'})"></i>
  </div>
</nav>
</template>

<script>
import SearchItem from './SearchItem.vue';
import { useSearchStore } from "../stores/search";
export default {
  data() {
    return {
      isScrolled: false,
      lastScroll: 0,
      showSearch:false,
      search: '',
      searchResult: [],
      delay: null,
      hideresult: false,
      searchStore: null
    };
  },
  created(){
      this.searchStore = useSearchStore();
  },

  methods: {
    invert(){
        this.showSearch = !this.showSearch
        if(this.showSearch == false){
              this.hideresult = false;
              
        }
    },

     cleanSearch(){
         this.hideresult = false
         
     },

    handleScroll() {
      const scroll = window.scrollY;
      const direction = scroll - this.lastScroll;
      if(direction > 0 && scroll > 50){
           this.isScrolled = true;
      } else if(direction < 0){
             this.isScrolled = false;
      }

      this.lastScroll = scroll;
    },

    async searchValue(value){
        try{
            const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/search_items.php", {
                 params: { value },
                 withCredentials: false
            });
            this.searchResult = response.data;
        } catch(error){

        }
    },
    
    async setSearchValue(){
        this.searchStore.setSearch(this.search);
        this.hideresult = false;
        await this.searchStore.fetchSearch();
        this.$router.push({ name: 'search' });
        this.search = "";
    }
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  beforeUnmount() {
    window.removeEventListener("scroll", this.handleScroll);
  },

  watch:{
     search(currentValue){
          if (!this.showSearch) return;
          clearTimeout(this.delay);
          if(currentValue.length >= 3){
               this.delay = setTimeout(() => {
                  this.hideresult = true;
                  this.searchValue(currentValue);
               }, 500) 
          }
          if(currentValue == '') {this.hideresult = false;}
     }
  },

  components:{
    SearchItem
  }
};
</script>

<style scoped lang="scss">

nav {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1002;
  @include flex-between(center,$space_around:space-between);
  background-color: white;
  padding: $padding_20;
  transition: transform 0.3s ease-in-out;
  min-height: 50px;

  &.notScrolled{
      transform: translateY(0);

      .search_results{
        transform: translateY(0);
      }
  }

  &.scrolled {
    transform: translateY(-100%);
    .search_results{
          transform: translateY(-100%);
    }



    .search{
       padding: 8px
    }
  }

  &.hidden {
    transform: translateY(-100%);
  }
}

.disabledSearch{
  display: block;
  transform: translateX(100%); 
  opacity: 0;
  transition: all 0.2s ease-in-out;
}

.search{
  transform: translateX(0); 
  opacity: 1;
  border-radius: 15px;
  padding: $padding_10;
  width: 70%;
  border: 2px solid $blue;
  

  &:focus{
    outline: 1px solid $blue;
  }
}

.user_search {
  margin-right: 50px;
  position: relative; 
  display: flex;
  flex-direction: row;
  

  i {
    padding: $padding_10;
    font-size: $icons_size;
    cursor: pointer;
    transition: $ease_in_out_opacity;
    box-shadow: $box_sh_icons;

    &:hover {
      @include hover-transition(none, none, 0.7);
    }
  }
}

.title {
  font-size: $title_font_size;
  font-weight: 300;
  span {
    color: $blue;
    font-weight: 700;
  }
}

.slide-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-enter-to {
  transform: translateX(0);
  opacity: 1;
}

.slide-leave-from {
  transform: translateX(0);
  opacity: 1;
}

.slide-leave-to {
  transform: translateX(100%);
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active {
  transition: all 0.4s ease;
}



.search_wrapper {
  position: relative;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.search_results {
 position: absolute;
  top: calc(100% + 5px);
  left: 0;
  width: 100%;
  background: white;
  border-radius: 12px;
  padding: 10px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.15);
  z-index: 100001;
  overflow: visible;   
  max-height: none;     
  
}


.user_search i {
  z-index: 100001;
}
</style>
