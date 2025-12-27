<template>
    <ItemsShow :item = "games" title = "Hry" desc = "Objav široký výber hier pre všetky platformy a vekové kategórie. Či už hľadáš akčné dobrodružstvá, logické výzvy, športové hry alebo zábavu pre celú rodinu, u nás si určite vyberieš. Nájdeš tu obľúbené tituly aj novinky, ktoré ti 
    prinesú hodiny zábavy doma aj s priateľmi. Vyber si hru, ktorá ťa bude baviť najviac." 
    parent-route-name="item-detail" :loading = "this.loading"
    @filter-change="fetchWithFilter"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
            games: [],
            currentPosition: null,
            loading: false,
            offset: 0,
            limit: 15,
            allLoaded: false,
            currentFilter: null 
        }
    },
   
    methods:{
        async fetchGames(filter){
            try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_games.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset,
                             filter: filter
                        },
                        withCredentials: false
                      }
                    );
                     
                this.games.push(...response.data)
                this.offset += this.limit;
               
                
                if(response.data.length < this.limit){
                    this.allLoaded = true;
                }
            } catch(error){
                  
            }
             this.loading = false;
        },

         DetectPosition(){
             this.currentPosition = window.scrollY;
             const bottomOffset = 50;
             if(this.currentPosition >= document.body.offsetHeight - bottomOffset){
                 this.fetchGames(this.currentFilter);
                 
             }        
         },   

         fetchWithFilter(filter){
             this.games = [];
             this.offset = 0;
             this.allLoaded = false;
             this.currentFilter = filter;
             this.fetchGames(this.currentFilter);
        }
    },

    mounted(){
          
        window.addEventListener("scroll", this.DetectPosition);
        this.fetchGames(this.currentFilter);
          
    },
    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    },

    components:{
        ItemsShow
    },
}
</script>


<style scoped lang = "scss">
 
</style>