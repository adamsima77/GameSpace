<template>
    <ItemsShow :item = "accessories" title = "Príslušenstvo" 
    desc = "Vytvorte si dokonalé herné prostredie. Objavte široký výber herného príslušenstva, ktoré posunie váš zážitok z hrania na vyššiu úroveň. Herné myši, klávesnice, slúchadlá, podložky či ovládače – všetko navrhnuté pre maximálnu presnosť, pohodlie a výkon. Či už ste príležitostný
     hráč alebo hardcore gamer, u nás nájdete vybavenie, ktoré vám pomôže zvíťaziť." 
    parent-route-name="accessories-detail" :loading = "loading"
    @filter-change="fetchWithFilter"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
            accessories: [],
            currentPosition: null,
            loading: false,
            offset: 0,
            limit: 15,
            allLoaded: false,
            currentFilter: null 
        }
    },
   
    methods:{
        async fetchAccessories(filter){
            try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_accessories.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset,
                             filter
                        },
                        withCredentials: false
                      }
                    );
                this.accessories.push(...response.data)
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
                 this.fetchAccessories(this.currentFilter);
                 
             }
         },

           fetchWithFilter(filter){
             this.accessories = [];
             this.offset = 0;
             this.allLoaded = false;
             this.currentFilter = filter;
             this.fetchAccessories(this.currentFilter);
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        window.addEventListener("scroll", this.DetectPosition);
        this.fetchAccessories(this.currentFilter);
    },
    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    },
}
</script> 


<style scoped lang = "scss">


</style>