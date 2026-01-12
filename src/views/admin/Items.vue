<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Produkty</h1>
 <AdminTable 
  @page="changePage"
  :columns="[
  { label: 'ID', key: 'idItems' },
  { label: 'Názov produktu', key: 'name' },
  { label: 'Image', key: 'img' },
  { label: 'Image alt', key: 'alt' },
  { label: 'Dátum vydania', key: 'release_date' },
  { label: 'Slug', key: 'slug' },
  { label: 'Počet kusov', key: 'stock' },
  { label: 'Cena', key: 'price' },
  { label: 'Popis', key: 'description' },
  { label: 'HTML popis', key: 'html_description' },
  { label: 'Dostupnosť', key: 'available' },
  { label: 'Kategória', key: 'category' },
  { label: 'Platformy', key: 'platforms' }
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
           async fetchItems(){
               const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchItemsAdmin.php",{
                params: {limit: this.limit, offset: this.limit * (this.actual_page - 1)},
                withCredentials: false});
               this.res = response.data;
           },

           async getTotalPages(){
               try{
                   const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/getTotalPagesItemsAdmin.php",
                    {withCredentials: false}
                   );
                   this.total_pages = response.data.total_pages;
               } catch(error){

               }
           },

           async changePage(page){
               this.actual_page = page;
               await this.fetchItems(); 
           }
        },
        
        mounted(){
            this.getTotalPages();
            this.fetchItems();
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
            padding-left: 30px;
        }
       }
    }
</style>