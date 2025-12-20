<template>
    <ItemsShow :item = "laptops_pcs" title="Notebooky a PC" desc = "Vyberte si spoľahlivý výkon pre prácu, štúdium aj zábavu. V našej ponuke nájdete notebooky a stolné PC pre každodenné používanie, náročných profesionálov aj hráčov. Od kompaktných zariadení na cesty až po výkonné herné zostavy – všetko s modernými technológiami, rýchlym chodom a
     elegantným dizajnom. Doprajte si výkon, na ktorý sa môžete spoľahnúť každý deň."
      parent-route-name="laptops-detail" :loading = "loading"
      @filter-change="fetchWithFilter"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
            laptops_pcs: [],
            currentPosition: null,
            loading: false,
            offset: 0,
            limit: 15,
            allLoaded: false,
            currentFilter: null 
        }
    },
   
    methods:{
        async fetchLaptopsAndPcs(filter){
           try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_laptops_pcs.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset,
                             filter: filter
                        },
                        withCredentials: false
                      }
                    );
                this.laptops_pcs.push(...response.data)
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
                 this.fetchLaptopsAndPcs(this.currentFilter);
             }
         },

          fetchWithFilter(filter){
             this.laptops_pcs = [];
             this.offset = 0;
             this.allLoaded = false;
             this.currentFilter = filter;
             this.fetchLaptopsAndPcs(this.currentFilter);
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        window.addEventListener("scroll", this.DetectPosition);
        this.fetchLaptopsAndPcs();
    },

     beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    },
}
</script>

<style scoped lang = "scss">


</style>