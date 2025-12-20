<template>
    <div class = "filters">
        <button @click = "changeActive('Newest')"
        :class = "{active: active === 'Newest'}">Najnovšie</button>
        <button @click = "changeActive('Cheapest')"
        :class = "{active: active === 'Cheapest'}">Najlacnejšie</button>
        <button @click = "changeActive('MostExpensive')"
        :class = "{active: active === 'MostExpensive'}">Najdrahšie</button>
    </div>
    <hr>
</template>

<script>
export default{
    emits: ['filter-change'],
    data(){
    return{
        active: ''
    }
},
methods:{
    changeActive(value){
        this.active = value;
        this.$emit('filter-change', value)
    }
}
}
</script>

<style scoped lang = "scss">
    .filters{
        display: flex;
        flex-direction: row;
        gap: 20px;
        margin-top: 20px;

        button{
            background-color: $blue;
            color: white;
            box-shadow: $box_sh_boxes;
            padding: 15px;
            border-radius: 8px;
            transition: background-color 0.5s ease-in-out;
            min-width: 15%;

            &.active{
                background-color: $dark_blue;
            }

            &:hover{
                background-color: $dark_blue;
            }
        }
    }
    
    hr{
        border: 1px solid black;
        margin-top: 10px;
    }

     @media only screen and (max-width: 630px) {
          .filters{
              flex-direction: column;
          }
      } 
</style>