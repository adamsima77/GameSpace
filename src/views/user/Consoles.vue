<template>
    <ItemsShow :item = "consoles" parent-route-name="consoles-detail" :loading = "loading"></ItemsShow>    
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
            allLoaded: false
        }
    },
   
    methods:{
        async fetchConsoles(){
           try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_consoles.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset
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
                 this.fetchGames();
                 
             }
         }
    },

    components:{
        ItemsShow
    },

    mounted(){
         window.addEventListener("scroll", this.DetectPosition);
        this.fetchConsoles();
    },

    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    }
}
</script> 

<style scoped lang = "scss">


</style>