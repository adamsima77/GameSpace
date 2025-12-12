<template>
    <ItemsShow :item = "accessories" parent-route-name="accessories-detail" :loading = "loading"></ItemsShow>    
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
            allLoaded: false
        }
    },
   
    methods:{
        async fetchAccessories(){
            try{
                if (this.loading || this.allLoaded) return;
                this.loading = true;
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_accessories.php",
                      {
                         params: {
                             limit: this.limit,
                             offset: this.offset
                        }
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
                 this.fetchAccessories();
                 
             }
         }
    },

    components:{
        ItemsShow
    },

    mounted(){
        window.addEventListener("scroll", this.DetectPosition);
        this.fetchAccessories();
    },
    beforeUnmount(){
        window.removeEventListener("scroll", this.DetectPosition);
    },
}
</script> 


<style scoped lang = "scss">


</style>