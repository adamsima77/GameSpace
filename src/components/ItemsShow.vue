<template>
    <div class = "wrapper">
         <Item v-for = "(game,index) in item" :key = "index" :item = "game" :parent-route-name="parentRouteName"></Item>
    </div>
</template>


<script>
import Item from './Item.vue';
export default{
    props: {
        item: { type: Object, required: true },
        parentRouteName: { type: String, required: true }
    },
    data(){
        return{
             
        }
    },
    components:{
        Item
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
         box-shadow: $box_sh_boxes;
         height: auto;
    }
  
</style>