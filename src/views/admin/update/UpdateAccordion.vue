<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Upraviť záznam</h1>

 <form method = "post" @submit.prevent = "update">

 <label for="title">Názov:
     <input type="text" id = "title" v-model = "title">
 </label>

 <label for="description">Popis:
     <textarea type="text" id = "description" v-model = "description"></textarea>
 </label>

 <input type="submit" value = "Upraviť záznam">
 </form>
</div>
</div>
</template>


<script>
    export default{
        data(){
            return{
                title: '',
                description: ''
            }
        }, 

        methods:{

            async fetchData(){
                try{
                    const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_single_accordion.php",
                    {
                        params: {id: this.$route.params.id},
                        withCredentials: false
                    });

                    this.title = response.data.title;
                    this.description = response.data.description;
                } catch(error){

                }
            },

            async update(){
                try{
                    if(!this.title || !this.description){
                        alert("Pre úspešne upravenie záznamu musia byť obe polia vypísané !");
                    } else{
                    const response = await this.$axios.post("http://localhost/GameSpace/endpoints/update/update_accordion.php",
                        {id: this.$route.params.id, title: this.title, description: this.description},
                        {withCredentials: false}
                    );

                    if(response.data.message === 'success'){
                          alert("Produkt bol úspešne upravený !");
                          return;
                    } else{
                        alert("Pri úprave produktu nastala chyba !");
                        return;
                    }
                    }
                } catch(error){

                }
            },

            
        },
        
        mounted(){
            this.fetchData();
            document.title = this.$route.params.id;
        },
    
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

        form{
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin: 0 auto;
            width: 100%;
          
             input[type = 'submit']{
                 background-color: #2979ff;
                 color: white;
                 border-radius: 10px;
                 padding: 10px;
                 margin-top: 15px;
                 transition: background-color 0.3s ease;
                 width: 100%;
                 cursor: pointer;
                 border: 1px solid white;

                 &:hover {
                   background-color: blue;
                }
                }

            label{
                display: flex;
                flex-direction: column;
                gap: 10px;
                width: 100%;

      input[type = 'text']{
      padding: 10px 14px;
      border-radius: 8px;
      border: 1.5px solid #b5d1ff;
      background-color: #ffffff;
      color: #1a1a1a;
      transition: border-color 0.2s ease, background-color 0.2s ease;

      &:hover {
        border-color: #2979ff;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.08);
      }

      &:focus {
        outline: none;
        border-color: #2979ff;
        background-color: #e6f0ff;
      }

      &::placeholder {
        color: #5f7dbb;
        opacity: 0.8;
      }
                }


      textarea{
      padding: 10px 14px;
      border-radius: 8px;
      border: 1.5px solid #b5d1ff;
      background-color: #ffffff;
      color: #1a1a1a;
      transition: border-color 0.2s ease, background-color 0.2s ease;
      resize: none;
      overflow: none;      
      min-height: 200px;  
      max-height: 300px;  

      &:hover {
        border-color: #2979ff;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.08);
      }

      &:focus {
        outline: none;
        border-color: #2979ff;
        background-color: #e6f0ff;
      }

      &::placeholder {
        color: #5f7dbb;
        opacity: 0.8;
      }
                }
            }
        }
       }
    }
</style>