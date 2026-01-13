<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Slideshow</h1>
  <button @click = "$router.push({name: 'add-slideshow'})">Pridať záznam</button>
 <AdminTable 
  @page="changePage"
  :columns="[
    { label: 'ID', key: 'id' },
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

          updateRecord(id){
              this.$router.push({name: 'update-slideshow', params: {id: id}});
          },

           async deleteRecord(id){
               try{
                   if(!confirm("Chcete tento záznam naozaj vymazať !")){
                      return;
                   } else{
                   const response = await this.$axios.post("http://localhost/GameSpace/endpoints/delete/delete_slideshow.php",
                   {id: id},
                   {withCredentials: false}
                );

                console.log(response.data.message);
                if(response.data.message === 'success'){
                    alert("Záznam bol úspešne vymazaný !");
                    await this.fetchSlideshow();
                } else{
                    alert("Záznam sa nepodarilo vymazať !");
                }
                }
               } catch(error){

               }
           },

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
       margin-top: 100px;
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
</style>