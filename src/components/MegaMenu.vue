<template>
<div class="menu">
          <div class = "section">
                <RouterLink><h2>{{ categories.name }}</h2></RouterLink>
                <ul>
                    <RouterLink to = "" v-for = "(category,index) in categories" :key = "index"><p>{{ category.subcategory }}</p></RouterLink>
                </ul>
          </div>
    </div>
</template>


<script>
export default{
    props: ['categories']
}

</script>


<style scoped lang = "scss">
.menu {
    position: absolute;
    top: 55px;
    left: 0;
    width: 100%;
    padding: 30px 40px;
    background: white;
    box-shadow: $box_sh_boxes;

    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    gap: 60px;
    flex-wrap: wrap;


    opacity: 0;
    pointer-events: none;
    transform: translateY(10px);
    transition: all 0.25s ease;

    .section {
      display: flex;
      flex-direction: column;
      gap: 10px;

      h2 {
        font-size: 18px;
        font-weight: 600;
        color: $blue;
        margin-bottom: 6px;
        transition: 0.2s ease;

        &:hover {
          color: darken($blue, 10%);
        }
      }

      ul {
        display: flex;
        flex-direction: column;
        gap: 6px;

        p {
          font-size: 15px;
          cursor: pointer;
          position: relative;
          width: fit-content;

          &::after {
            content: "";
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: $blue;
            transition: width 0.2s ease;
          }

          &:hover {
            color: $blue;
          }

          &:hover::after {
            width: 100%;
          }
        }
      }
    }
  }


  &:hover .menu {
    opacity: 1;
    transform: translateY(0);
    pointer-events: auto;
  }

</style>