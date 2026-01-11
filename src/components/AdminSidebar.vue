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
          <RouterLink to="" title="Dashboard">
            <i class="fas fa-tachometer-alt"></i>
            <span class="label">Dashboard</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink to="" title="Produkty">
            <i class="fas fa-box-open"></i>
            <span class="label">Produkty</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink to="" title="Objednávky">
            <i class="fas fa-shopping-cart"></i>
            <span class="label">Objednávky</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink to="" title="Akordeón">
            <i class="fas fa-list"></i>
            <span class="label">Akordeón</span>
          </RouterLink>
        </li>

        <li>
          <RouterLink to="" title="Slideshow">
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
        class="fas fa-caret-left expandable"
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
            isExpanded: true
        }
    }
}

</script>

<style lang="scss" scoped>
.sidebar {
  position: fixed;
  inset: 0 auto 0 0;
  z-index: 1000000;
  width: 15%;
  height: 100vh;
  background-color: white;
  box-shadow: $box_sh_boxes;
  padding: 20px;
  display: flex;
  flex-direction: column;
  transition: width 0.4s ease;

  &.forward {
    width: 15%;
  }

  &.back {
    width: 60px;

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
  }

  .a_title {
    padding: 10px;
    text-decoration: none;
  }

  .title {
    font-size: 1.5rem;
    font-weight: 300;
    color: black;

    span {
      color: $blue;
      font-weight: 700;
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
</style>