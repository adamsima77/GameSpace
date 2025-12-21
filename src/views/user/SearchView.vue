<template>
   <div class = "wrapper">
        <ItemsShow :item = "searchStore.getResult"
         :title="`Výsledky vyhľadávania pre: '${searchStore.search_value}'`" desc = "Tu nájdeš všetky produkty, ktoré zodpovedajú tvojmu vyhľadávaniu – hry, PC, doplnky a ďalšie. 
         Prezri si výsledky a objav, čo by ťa mohlo zaujať."
        parent-route-name="search-detail" v-if = "searchStore.getResult.length > 0"
         @filter-change="fetchWithFilter"></ItemsShow>
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
    
    created(){
        this.searchStore = useSearchStore();
    },

    methods:{
        fetchWithFilter(filter){
            this.searchStore.setFilter(filter);
            this.searchStore.fetchSearch(); 
        }
    }
}

</script>


<style scoped lang = "scss">
   .wrapper{ 
    min-width: 95%;
    padding: 20px;   
    display: flex;
    flex-direction: column;
    align-items: center;
        p{ 
            text-align: center; 
            margin-top: 100px; 
        } 
    }

@media only screen and (max-width: 800px) {
    .wrapper{
        place-self: center;
        width: 75%;
    }
}
</style>