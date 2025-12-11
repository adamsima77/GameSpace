<template>
    <ItemsShow :item = "games" parent-route-name="item-detail"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
             games: []
        }
    },
   
    methods:{
        async fetchGames(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_games.php");
                this.games = response.data;
            } catch(error){

            }
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        this.fetchGames();
    }
}
</script>


<style scoped lang = "scss">
 
</style>