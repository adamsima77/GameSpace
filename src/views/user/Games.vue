<template>
    <ItemsShow :item = "games" parent-route-name="item-detail" :loading = "this.loading"></ItemsShow>    
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
            allLoaded: false
        }
    },
   
    methods:{
        async fetchGames(){
            try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_games.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset
                        }
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
                 this.fetchGames();
                 
             }
         }
    },

    mounted(){
          
        window.addEventListener("scroll", this.DetectPosition);
         this.fetchGames();
          
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