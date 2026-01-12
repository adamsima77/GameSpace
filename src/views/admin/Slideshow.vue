<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Slideshow</h1>
 <AdminTable 
  @page="changePage"
  :columns="[
    { label: 'ID', key: 'idSlideshow' },
    { label: 'Image', key: 'img' },
    { label: 'Image alt', key: 'alt' },
    { label: 'Link', key: 'link'},
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
           async fetchSlideshow(){
               const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/getSlideshowAdmin.php",{
                params: {limit: this.limit, offset: this.limit * (this.actual_page - 1)},
                withCredentials: false});
               this.res = response.data;
           },

           async getTotalPages(){
               try{
                   const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/getTotalPagesSlideshow.php",
                    {withCredentials: false}
                   );
                   this.total_pages = response.data.total_pages;
               } catch(error){

               }
           },

           async changePage(page){
               this.actual_page = page;
               await this.fetchSlideshow(); 
           }
        },
        
        mounted(){
            this.getTotalPages();
            this.fetchSlideshow();
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