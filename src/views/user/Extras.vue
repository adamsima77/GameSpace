<template>
    <ItemsShow :item = "extras" parent-route-name="extras-detail"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
             extras: []
        }
    },
   
    methods:{
        async fetchExtras(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_extras.php");
                this.extras = response.data;
            } catch(error){

            }
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        this.fetchExtras();
    }
}
</script> 


<style scoped lang = "scss">


</style>