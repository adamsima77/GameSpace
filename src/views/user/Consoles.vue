<template>
    <ItemsShow :item = "consoles" parent-route-name="consoles-detail"></ItemsShow>    
</template>


<script>
import ItemsShow from '../../components/ItemsShow.vue';
export default{
    data(){
        return{
             consoles: []
        }
    },
   
    methods:{
        async fetchConsoles(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_consoles.php");
                this.consoles = response.data;
            } catch(error){

            }
        }
    },

    components:{
        ItemsShow
    },

    mounted(){
        this.fetchConsoles();
    }
}
</script> 

<style scoped lang = "scss">


</style>