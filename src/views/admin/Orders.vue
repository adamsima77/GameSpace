<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Objednávky</h1>
 <AdminTable 
  @page="changePage"
  :columns="[
    { label: 'ID', key: 'id'},
    { label: 'Vytvorenie objednávky', key: 'creation_date'},
    { label: 'Posledná úprava', key: 'last_update'},
    { label: 'Status', key: 'status' },
    { label: 'Celková cena', key: 'total_price' },
  ]"
  :records="res"
  :total_pages="total_pages"
  :limit="limit"
  :actual_page = "actual_page"
  @delete = "deleteRecord"
  @update = "updateRecord"
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
           async fetchOrders(){
               const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchOrdersAdmin.php",{
                params: {limit: this.limit, offset: this.limit * (this.actual_page - 1)},
                withCredentials: false});
               this.res = response.data;
           },

           async getTotalPages(){
               try{
                   const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchTotalPagesOrdersAdmin.php",
                    {withCredentials: false}
                   );
                   this.total_pages = response.data.total_pages;
               } catch(error){

               }
           },

           async deleteRecord(id){
              try{
                  if(!confirm("Chcete naozaj vymazať objednávku ?")){
                      return;
                  } else {
                  const response = await this.$axios.post("http://localhost/GameSpace/endpoints/delete/delete_order_admin.php",
                  {id: id},
                  {withCredentials: false}
                  );

                  if(response.data.message === 'success'){
                      alert("Objednávka bola úspešne vymazaná !");
                      this.fetchOrders();
                  } else{
                      alert("Nastala chyba pri vymazávaní objednávky");
                  } 
                  }
              } catch(error){

              }
           },

           updateRecord(id){
               this.$router.push({name: 'update-orders', params:{id: id}});
           },

           async changePage(page){
               this.actual_page = page;
               await this.fetchOrders(); 
           }
        },
        
        mounted(){
            this.getTotalPages();
            this.fetchOrders();
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
       width: 100%;
       margin-top: 100px;

       .wrapp{
        background-color: white;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        gap: 15px;
         min-width: 0;     
        width: 100%;
       }
    }
</style>