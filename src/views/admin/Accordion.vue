<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Akordeón</h1>
 <AdminTable 
  @page="changePage"
  :columns="[
    { label: 'ID', key: 'idAccordion' },
    { label: 'Názov', key: 'title' },
    { label: 'Popis', key: 'description' },
    { label: 'Vytvorenie príspevku', key: 'created_at'},
    { label: 'Posledná úprava', key: 'last_update'}
  ]"
  :records="res"
  :total_pages="total_pages"
  :limit="limit"
  :actual_page = "actual_page"
/>
</div>
</div>
</template>


<script>
    import AdminTable from '../../components/AdminTable.vue';
    export default{
        data(){
            return{
                res: [],
                total_pages: 0,
                actual_page: 1,
                limit: 10
            }
        }, 

        methods:{
            async fetchAccordion(){
                try{
                    const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchFAQAdmin.php",
                    {
                        params: {limit: this.limit, offset: this.limit * (this.actual_page - 1)},
                        withCredentials: false});
                    this.res = response.data;
                } catch(error){

                }
            },

            async totalPages(){
                try{
                    const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/getTotalAccordionPages.php",{withCredentials: false});
                    this.total_pages = response.data.total_pages;
                } catch(error){

                }
            },

            async changePage(page){
                 this.actual_page = page;
                 await this.fetchAccordion(); 
            }
        },
        
        mounted(){
            this.fetchAccordion();
            this.totalPages();
        },
        
        components:{
            AdminTable
        } 
    }
</script>

<style lang = "scss" scoped>
    .wrapper{
       display: flex;
       flex-direction: column;
       padding: 20px;
       height: auto;
       width: 100%;;

       .wrapp{
        background-color: white;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        gap: 15px;
         min-width: 0;     
        width: 100%;

        h1{
            padding-left: 40px;
        }
       }
    }
</style>