<template>
  <nav :class="{ scrolled: isScrolled, hidden: isHidden }">
    <RouterLink to="/"><span class="title"><span>Game</span>Space</span></RouterLink>
    <transition name="slide">
    <input type="text" v-if="showSearch" class = "search" 
    placeholder="Hľadajte...">
    </transition>
    <div class="user_search">
      <i :class="!showSearch ? 'fas fa-search' : 'fas fa-times'" @click = "invert()"></i>
      <i class="fas fa-user" @click="openLogin"></i>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      isScrolled: false,
      isHidden: false,
      lastScroll: 0,
      showSearch:false
    };
  },
  methods: {
    invert(){
        this.showSearch = !this.showSearch
    },
     openLogin() {
      this.$emit("open-login")
    },
    handleScroll() {
      const scroll = window.scrollY;

      this.isScrolled = scroll > 50;

      if (scroll > this.lastScroll && scroll > 100) {
        this.isHidden = true;
      } else {
        this.isHidden = false;
      }

      this.lastScroll = scroll;
    },
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  beforeUnmount() {
    window.removeEventListener("scroll", this.handleScroll);
  },
};
</script>

<style scoped lang="scss">

nav {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
  @include flex-between(center,$space_around:space-between);
  background-color: white;
  box-shadow: $box_sh_nav;
  padding: $padding_20;
  transition: all 0.3s ease-in-out;

  &.scrolled {
    background-color: white;
    padding: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    color: black;

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
</style>
