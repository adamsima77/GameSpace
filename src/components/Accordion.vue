<template>
    <div class = "accordion">
        <div class = "box" v-for = "(value,index) in item" :key = "index" @click = "toggle(index)" :class="{ active: activeIndex === index }">
        <button>{{ value.title }}<i :class = "carret"></i></button>
        <div class = "description" @click.stop>
            <p>{{ value.description }}</p>
        </div>
        </div>

    </div>

</template>


<script>
   export default{
        props:['item'],
        data(){
            return{
                activeIndex:false,
                carret: 'fas fa-caret-down'
            }
        },
        methods:{
            toggle(index){
                   this.activeIndex = this.activeIndex === index ? null : index;
                if(this.activeIndex == null){
                    this.carret = "fas fa-caret-down";
                } else {
                    this.carret = "fas fa-caret-up"
                }
            }
        }
   }
</script>


<style scoped lang = "scss">

.accordion {
  width: 100%;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  gap: 10px;

  .box {
    border-radius: 8px;
    background: $blue;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);

    button {
      width: 100%;
      background: $blue;
      color: $white;
      border: none;
      outline: none;
      padding: 1rem 1.4rem;
      font-size: 1.1rem;
      font-weight: bold;
      cursor: pointer;
      display: flex;
      justify-content: space-between;
      align-items: center;
      transition: background 0.25s ease;

      i {
        font-size: 1.2rem;
        transition: transform 0.3s ease;
      }

      &:hover {
        background: lighten($blue, 8%);
      }

      &.active i {
        transform: rotate(180deg);
      }
    }

    .description {
      max-height: 0;
      overflow: hidden;
      background: $white;  
      color: black;
      padding: 0 1.4rem;
      transition: max-height 0.35s ease, padding 0.3s ease;
      border-top: 2px solid $dark_blue;
      p {
        padding: 1rem 0;
        line-height: 1.6;
      }
    }

    &.active {
      .description {
        max-height: 500px;
        padding: 1rem 1.4rem;
      }
    }
  }
}
</style>