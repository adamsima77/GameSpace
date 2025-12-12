<template>
    <div class = "wrapper">
         <Item v-for = "(game,index) in item" :key = "index" :item = "game" :parent-route-name="parentRouteName"></Item>
         <Loader v-if = "loading"></Loader>
    </div>
</template>


<script>
import Item from './Item.vue';
import Loader from './Loader.vue';
export default{
    props: {
        item: { type: Array, required: true },
        parentRouteName: { type: String, required: true },
        loading:{type: Boolean, required: true}
    },
    data(){
        return{
           
        }
    },
    components:{
        Item,
        Loader
    },
}

</script>

<style scoped lang = "scss">
    .wrapper{
         display: flex;
         min-width: 85%;
         gap: 30px;
         padding: 25px;
         border-radius: 15px;
         flex-wrap: wrap;
         background-color: white;
         justify-content: center;
         box-shadow: $box_sh_boxes;
         height: auto;
    }
  
</style>