<template>
   <div class = "wrapper">
        <ItemsShow :item = "searchStore.getResult" parent-route-name="search-detail" v-if = "searchStore.getResult.length > 0"></ItemsShow>
        <p v-else>Neboli nájdené žiadne produkty</p>
    </div> 
   
</template>

<script>
import ItemsShow from '../../components/ItemsShow.vue';
import { useSearchStore } from "../../stores/search";
export default{
    data(){
        return{
            searchStore: null,
        }
    },
    components:{
       ItemsShow
    },

    methods:{
       
    },
    
    created(){
        this.searchStore = useSearchStore();
    },
}

</script>


<style scoped lang = "scss">
   .wrapper{ 
    min-width: 95%; 
        p{ 
            text-align: center; 
            margin-top: 100px; 
        } 
    }
 
</style>