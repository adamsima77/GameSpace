<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Pridať záznam</h1>

 <form method = "post" @submit.prevent = "add">

 <label for="img">Image:
     <input type="file" id="img" @change="handleFileUpload" accept="image/*"  ref="imgInput" />
 </label>
<label for="alt">Alt:
     <input type="text" id = "alt" v-model = "alt">
 </label>
<label for="link">Link:
     <input type="text" id = "link" v-model = "link">
 </label>

 

 <input type="submit" value = "Pridať záznam">
 </form>
</div>
</div>
</template>


<script>
    export default{
        data(){
            return{
                img: null,
                alt: '',
                link: ''
            }
        }, 

        methods:{

              handleFileUpload(event) {
                  this.img = event.target.files[0]; 
              },
            async add(){
                try{
                    const formData = new FormData();
                    formData.append("img", this.img);
                    formData.append("alt", this.alt);
                    formData.append("link", this.link);
                    const response = await this.$axios.post("http://localhost/GameSpace/endpoints/add/addSlideshow.php",
                    formData,
                    {
                       headers: { "Content-Type": "multipart/form-data" }
                    }
                    );

                    if(response.data.message === 'success'){
                            alert("Slide bol úspešne pridaný !");
                             this.alt = '';
                             this.link = '';
                             this.imgFile = null;
                             this.$refs.imgInput.value = null;
                    } else{
                        alert("Slide sa nepodarilo pridať ! Dôvod: " + response.data.reason);
                    }
                } catch(error){

                }
            } 
        },
        
        mounted(){
            
        },
    
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