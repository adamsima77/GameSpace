<template>
    <ItemsShow :item = "laptops_pcs" parent-route-name="laptops-detail"></ItemsShow>    
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
        async fetchLaptopsAndPcs(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_laptops_pcs.php");
                this.laptops_pcs = response.data;
            } catch(error){

            }
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        this.fetchLaptopsAndPcs();
    }
}
</script>

<style scoped lang = "scss">


</style>