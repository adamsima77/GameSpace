<template>
  <div class="subnav" :class="{ scrolled: isScrolled, hidden: isHidden }">
    <ul>
      <RouterLink to=""><li>aasadasd</li></RouterLink>
      <RouterLink to=""><li>aaasdasds</li></RouterLink>
      <RouterLink to=""><li>dasdaasdas</li></RouterLink>
      <RouterLink to=""><li>asdasdas</li></RouterLink>
      <RouterLink to=""><li>asdasds</li></RouterLink>
      <RouterLink to=""><li>fasfasfs</li></RouterLink>
      <RouterLink to=""><li><i class="fas fa-shopping-cart"></i>Košík</li></RouterLink>
    </ul>
  </div>
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
      const currentScroll = window.scrollY;
      this.isScrolled = currentScroll > 50;

      if (currentScroll > this.lastScroll && currentScroll > 100) {
        this.isHidden = true;
      } else {
        this.isHidden = false;
      }

      this.lastScroll = currentScroll;
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
.subnav {
  position: fixed;
  top: 0;
  width: $full_width;
  z-index: 1000;
  top: 80px;
  background-color: $grey;
  background-color: white;
  transition: all 0.3s ease-in-out;
  @include flex-between(center, row);
  border-top: 3px solid $blue;

  ul {
    display: flex;
    width: 100%;
    margin: 0;
    padding: 0;
    list-style: none;
    a{
      border-right: 2px solid $blue;
      border-bottom: 2px solid $blue;
    }

    li {
      flex: 1;
      padding: $padding_15;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: $link-size;
      border-right: 2px solid white;
      transition: $ease_in_out_background;

      i {
        margin-right: 8px;
      }


      &:last-child {
        border-right: none;
      }
    }

    li:hover {
      @include hover-transition(white, $blue);
    }

    a {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100%;
      text-decoration: none;
      color: inherit;
    }
  }

  &.scrolled {
    background-color: rgb(255, 255, 255);
    box-shadow: $box_sh_nav;
    color: black;
    top: 55px;
    a{
      border-right: 1px solid black;
    }
  }

  &.hidden {
    transform: translateY(-100%);
    top: 57px;
  }
}
</style>
