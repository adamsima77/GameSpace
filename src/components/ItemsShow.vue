<template>
    <div :class = "{wrapper: item.length >= 4, wrapp: item.length >= 1 || item.length <= 3}">
         <div class = "title_desc">
             <h1>{{ title }}</h1>
             <p>{{ desc }}</p>
             <Filters @filter-change= "handleFilter"></Filters>
             <p class = "total">Zobrazených výsledkov: {{ item.length }}</p> 
              <hr>
         </div>        
         <Item v-for = "(game,index) in item" :key = "index" :item = "game" :parent-route-name="parentRouteName"></Item>
         <Loader v-if = "loading"></Loader>
    </div>
</template> 


<script>
import Item from './Item.vue';
import Loader from './Loader.vue';
import Filters from './Filters.vue';
export default{
    emits: ['filter-change'],
    props: {
        item: { type: Array, required: true },
        parentRouteName: { type: String, required: true },
        loading:{type: Boolean},
        title:{type: String, required: true},
        desc:{type: String, required: true}
    },
    data(){
        return{
           
        }
    },
    components:{
        Item,
        Loader,
        Filters
    },

    methods:{
        handleFilter(filterValue){
            this.$emit('filter-change', filterValue)
        }
    }
}

</script>

<style scoped lang = "scss">
    .wrapp{
         display: flex;
         min-width: 85%;
         gap: 30px;
         padding: 25px;
         border-radius: 15px;
         flex-wrap: wrap;
         background-color: white;
         justify-content: flex-start;
         box-shadow: $box_sh_boxes;
         height: auto;
    }
    .wrapper{
         display: flex;
         min-width: 85%;
         gap: 30px;
         padding: 25px;
         border-radius: 15px;
         flex-wrap: wrap;
         background-color: white;
         justify-content: space-between;
         box-shadow: $box_sh_boxes;
         height: auto;

         .title_desc{
            display: flex;
            flex-direction: column;
            gap: 10px;

            .total{
                margin-top: 25px;
            }

              hr{
                border: 1px solid black;
                margin-top: 10px;
              }
         }
    }

      @media only screen and (max-width: 1200px) {
          .wrapp{
             width: 100%;
              justify-content: space-between;
              .title_desc{
                p{
                    text-align: justify;
                }
              }
          }
          .wrapper{
              width: 100%;
              justify-content: space-between;
              .title_desc{
                p{
                    text-align: justify;
                }
              }
          }
      } 
  
</style>