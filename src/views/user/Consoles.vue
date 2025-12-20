<template>
    <ItemsShow :item = "consoles" title = "Konzoly"
    desc = "Vstúpte do sveta špičkovej hernej zábavy. Herné konzoly ponúkajú plynulé hranie, exkluzívne tituly a nezabudnuteľné zážitky pre hráčov všetkých vekových kategórií. Či už hráte sami, s rodinou alebo online s priateľmi, konzoly vám prinesú maximálny výkon, jednoduché ovládanie a hodiny zábavy.
     Vyberte si konzolu, ktorá vás vtiahne do hry od prvého zapnutia." 
    parent-route-name="consoles-detail" :loading = "loading"
    @filter-change="fetchWithFilter"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
            consoles: [],
            currentPosition: null,
            loading: false,
            offset: 0,
            limit: 5,
            allLoaded: false,
            currentFilter: null 
        }
    },
   
    methods:{
        async fetchConsoles(filter){
           try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_consoles.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset,
                             filter: filter
                        },
                        withCredentials: false
                      }
                    );
                this.consoles.push(...response.data)
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
             this.consoles = [];
             this.offset = 0;
             this.allLoaded = false;
             this.currentFilter = filter;
             this.fetchConsoles(this.currentFilter);
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
         window.addEventListener("scroll", this.DetectPosition);
        this.fetchConsoles(this.currentFilter);
    },

    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    }
}
</script> 

<style scoped lang = "scss">


</style>