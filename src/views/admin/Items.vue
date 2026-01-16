<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Produkty</h1>
 <button @click = "this.$router.push({name: 'add-items'})">Pridať záznam</button>
 <AdminTable 
  @page="changePage"
  :columns="[
  { label: 'ID', key: 'id' },
  { label: 'Názov produktu', key: 'name' },
  { label: 'Image', key: 'img' },
  { label: 'Image alt', key: 'alt' },
  { label: 'Dátum vydania', key: 'release_date' },
  { label: 'Slug', key: 'slug' },
  { label: 'Cena', key: 'price' },
  { label: 'Popis', key: 'description' },
  { label: 'HTML popis', key: 'html_description' },

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
           async deleteRecord(id){
              try{
                  if(!confirm("Chcete naozaj vymazať produkt ?")){
                      return;
                  } else {
                  const response = await this.$axios.post("http://localhost/GameSpace/endpoints/delete/delete_item_admin.php",
                  {id: id},
                  {withCredentials: false}
                  );

                  if(response.data.message === 'success'){
                      alert("Produkt bol úspešne vymazaný !");
                      this.fetchItems();
                  } else{
                      alert("Nastala chyba pri vymazávaní produktu");
                  } 
                  }
              } catch(error){

              }
           },

           updateRecord(id){
                this.$router.push({name: 'update-items', params:{id: id}});
           },

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
       margin-top: 100px;
       place-self: center;
       max-width: 1200px;

       .wrapp{
        background-color: white;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        gap: 15px;
        min-width: 0;     
        width: 100%;
        box-shadow: $box_sh_boxes;
         place-self: center;
         button{
            padding-left: 45px;
            background-color: $blue;
            border-radius: 15px;
            padding: 15px;
            width: 20%;
            color: white;
            box-shadow: $box_sh_boxes;
            transition: background-color 0.5s ease-in-out;
            &:hover{
              background-color: $dark_blue;
            }
        }
       }
    }

    @media only screen and (max-width: 800px) {
        .wrapper{
                 max-width: 400px;
                 overflow-x: hidden;
                 
            .wrapp{
                 margin-left: 50px;
                button{
                    width: 50%;
                }
            }
        }
    }
</style>