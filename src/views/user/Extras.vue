<template>
    <ItemsShow :item = "extras" title = "Doplnky" 
    desc = "Dolaďte svoje zariadenie k dokonalosti. V našej ponuke nájdete široký výber doplnkov, ktoré zlepšia funkčnosť, pohodlie aj ochranu vašej techniky. Od káblov, adaptérov a obalov až po stojany, nabíjačky či ochranné prvky – všetko pre jednoduchšie a pohodlnejšie používanie každý deň. 
    Vyberte si doplnky, ktoré spravia vaše zariadenie ešte lepším."
    parent-route-name="extras-detail" :loading = "loading"
    @filter-change="fetchWithFilter"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
            extras: [],
            currentPosition: null,
            loading: false,
            offset: 0,
            limit: 15,
            allLoaded: false,
            currentFilter: null 
        }
    },
   
    methods:{
        async fetchExtras(filter){
           try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_extras.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset,
                             filter: filter
                        },
                        withCredentials: false
                      }
                    );
                this.extras.push(...response.data)
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
                 this.fetchExtras(this.currentFilter);
                 
             }
         },

        fetchWithFilter(filter){
             this.extras = [];
             this.offset = 0;
             this.allLoaded = false;
             this.currentFilter = filter;
             this.fetchExtras(this.currentFilter);
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
         window.addEventListener("scroll", this.DetectPosition);
        this.fetchExtras(this.currentFilter);
    },
    
    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    }
}
</script> 


<style scoped lang = "scss">


</style>