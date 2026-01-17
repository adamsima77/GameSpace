<template>
  <div class="sidebar" :class="{ back: !isExpanded, forward: isExpanded }">
    <div class="wrapp">

      
      <RouterLink to="/admin" class="a_title">
        <span class="title">
          <span>Game</span>Space
        </span>
      </RouterLink>

      
      <ul>
        <li>
          <RouterLink :to="{name: 'dashboard'}" title="Dashboard" :class = "{active: active === 1}">
            <i class="fas fa-tachometer-alt"></i>
            <span class="label">Dashboard</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink :to="{name: 'items'}" title="Produkty" :class = "{active: active === 2}">
            <i class="fas fa-box-open"></i>
            <span class="label">Produkty</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink :to="{name: 'orders'}" title="Objednávky" :class = "{active: active === 3}">
            <i class="fas fa-shopping-cart"></i>
            <span class="label">Objednávky</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink :to="{name: 'accordion'}" title="Akordeón" :class = "{active: active === 4}">
            <i class="fas fa-list"></i>
            <span class="label">Akordeón</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink :to="{name: 'slideshow'}" title="Slideshow" :class = "{active: active === 5}">
            <i class="fas fa-images"></i>
            <span class="label">Slideshow</span>
          </RouterLink>
        </li>

        
        <li>
          <RouterLink :to="{name: 'home'}" title="Home">
            <i class="fas fa-home"></i>
            <span class="label">Domov</span>
          </RouterLink>
        </li>
      </ul>


      <i
        class="fas fa-chevron-left expandable"
        v-if="isExpanded"
        @click="isExpanded = false"
      ></i>

      <i
        class="fas fa-chevron-right expandable"
        v-else
        @click="isExpanded = true"
      ></i>

    </div>
  </div>
</template>


<script>
export default{
    data(){
        return{
            isExpanded: false
        }
    },

    computed:{
        active(){
          switch(this.$route.name){
            case 'dashboard': return 1; 
            case 'items': return 2; 
            case 'orders': return 3; 
            case 'accordion': return 4;
            case 'slideshow': return 5; 
          }
        }
    }
}

</script>

<style lang="scss" scoped>
.sidebar {
  position: fixed;
  top: 0;
  
  left: 0;
  height: 100vh;
  width: 220px;
  background-color: white;
  padding: 20px;
  display: flex;
  flex-direction: column;
  transition: width 0.3s ease;
  z-index: 1000;

  &.forward {
    width: 220px;
  }

  &.back {
    width: 60px;
    .a_title{
      display: none;
    }

    .title {
      display: none;
    }

    ul li {
      justify-content: center;

      a {
        justify-content: center;
      }

      .label {
        display: none;
      }
    }
  }

  .wrapp {
    display: flex;
    flex-direction: column;
    gap: 15px;
    height: 90vh;

    a.active {
      background-color: #f5f5f5;
      border-radius: 15px;
    }
  }

  .a_title {
    padding: 10px;
    text-decoration: none;

    .title {
      font-size: 1.5rem;
      font-weight: 300;
      color: black;

      span {
        color: $blue; 
        font-weight: 700;
      }
    }
  }

  ul {
    display: flex;
    flex-direction: column;
    gap: 25px;
    padding: 0;
    margin: 0;
    list-style: none;

    li {
      border-radius: 10px;

      a {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 10px;
        font-weight: 500;
        color: #333;
        text-decoration: none;
        transition: all 0.2s ease-in-out;
      }

      i {
        width: 20px;
        text-align: center;
        color: #555;
      }

      &:hover {
        background-color: #f5f5f5;

        a {
          color: #007bff;
        }

        i {
          color: #007bff;
        }
      }
    }
  }

  .expandable {
    margin-top: auto;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #f0f0f0;
    display: flex;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    transition: all 0.3s ease;

    &:hover {
      background-color: #007bff;
      color: white;
      transform: scale(1.1);
    }
  }
}

@media (max-width: 800px) {
  .wrapper {
    flex-direction: column;

    .main-content {
      padding: 10px;
    }
  }

  .sidebar {
    position: relative;
    width: 100%;
    height: auto;
    flex-direction: row;

    &.back,
    &.forward {
      width: 100%;
    }

    .wrapp {
      flex-direction: row;
      align-items: center;
      height: auto;
      width: 100%;
    }

    ul {
      flex-direction: row;
      gap: 5px;
      justify-content: space-around;
      flex: 1;

      li a {
        flex-direction: column;
        font-size: 12px;
      }
    }

    .expandable {
      display: none;
    }
  }

  .dashboard-box {
    max-width: 100%;

    .kpis {
      flex-direction: column;
      gap: 20px;

      > * {
        width: 100%;
      }
    }
  }
}
</style>