<template>
    <ItemsShow :item = "laptops_pcs" parent-route-name="accessories-detail"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
             laptops_pcs: []
        }
    },
   
    methods:{
        async fetchAccessories(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_accessories.php");
                this.laptops_pcs = response.data;
            } catch(error){

            }
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        this.fetchAccessories();
    }
}
</script> 


<style scoped lang = "scss">


</style>