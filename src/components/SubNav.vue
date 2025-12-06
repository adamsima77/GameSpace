<template>
  <div class="subnav" :class="{ scrolled: isScrolled, hidden: isHidden }">
    <ul class="links">
      <li class = "category"v-for="(value,index) in categories" :key="index">
       {{ value.name }}
      </li>
      <RouterLink to="" class = "cart">
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
      isHidden: false,
      lastScroll: 0,
      categories: [
  { "name": "Electronics" },
  { "name": "Clothing" },
  { "name": "Books" },
  { "name": "Home & Kitchen" },
  { "name": "Sports & Outdoors" },
  { "name": "Toys & Games" }
]
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

    .category,
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
    top: 55px;
    background: white;
    box-shadow: $box_sh_nav;
  }


  &.hidden {
    transform: translateY(-100%);
  }
}


</style>
