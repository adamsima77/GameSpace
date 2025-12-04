<template>
  <nav :class="{ scrolled: isScrolled, hidden: isHidden }">
    <RouterLink to=""><span class="title"><span>Game</span>Space</span></RouterLink>
    <ul>
      <RouterLink to=""><li>Asdsa</li></RouterLink>
      <RouterLink to=""><li>sdafas</li></RouterLink>
      <RouterLink to=""><li>adasd</li></RouterLink>
      <RouterLink to=""><li>asdasd</li></RouterLink>
      <RouterLink to=""><li>asdasd</li></RouterLink>
    </ul>
    <div class="user_search">
      <i class="fas fa-search"></i>
      <i class="fas fa-user"></i>
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
    };
  },
  methods: {
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
  @include flex-between(center);
  background-color: white;
  box-shadow: $box_sh_nav;
  padding: $padding_20;
  transition: all 0.3s ease-in-out;

  ul {
    list-style: $none;
    @include flex-direction-center(center);
    li {
      font-size: $link-size;
      padding: $padding_10;
    }
  }

  &.scrolled {
    background-color: white;
    padding: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
    color: black;
    
  }

  &.hidden {
    transform: translateY(-100%);
  }
}

.user_search {
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
</style>
