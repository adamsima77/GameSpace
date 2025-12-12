<template>
    <ItemsShow :item = "extras" parent-route-name="extras-detail" :loading = "loading"></ItemsShow>    
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
            allLoaded: false
        }
    },
   
    methods:{
        async fetchExtras(){
           try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_extras.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset
                        }
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
                 this.fetchExtras();
                 
             }
         }
    },

    components:{
        ItemsShow
    },

    mounted(){
         window.addEventListener("scroll", this.DetectPosition);
        this.fetchExtras();
    },
    
    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    }
}
</script> 


<style scoped lang = "scss">


</style>