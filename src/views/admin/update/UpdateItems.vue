<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Upraviť produkt</h1>

 <form method = "post" @submit.prevent = "update">

 <label for="name">Názov
  <input type="text" id = "name" v-model = "name">
 </label>

 <label for="price">Cena:
  <input type="text" name = "price" v-model = "price">
 </label>

 
 <label for="main_desc">Hlavný popis:
  <textarea name = "main_desc" v-model = "main_desc"></textarea>
 </label>

  <label for="img">Image:
  <input type="file" name = "img" @change = "handleFileUpload">
  <p class = "prev">Aktuálna fotka:</p>
  <img :src="current_image" v-if = "current_image" class = "preview">
 </label>

  <label for="alt">Image alt:
  <input type="text" name = "alt" v-model = "alt">
 </label>
 

 <label for="release_date">Dátum vydania:
  <input type="date" name = "release_date" v-model = "release_date">
 </label>

 <label for="html_desc">HTML popis:
 <textarea id="html_desc"></textarea>
 </label>

 <label for="main_category">Hlavná kategória:
  <select name="" id="main_category" v-model = "main_category">
    <option :value="value.idCategory" v-for = "(value,index) in res.all_main_categories" :key = "index">
         {{ value.name }}
    </option>
  </select>
 </label>

 <label>Platformy:
  <div class="checkboxes">
    <div v-for="(value, index) in res.all_platforms" :key="index">
      <input 
        type="checkbox" 
        :value="value.platform_id" 
        v-model="platform" 
      >
      {{ value.name }}
    </div>
  </div>
</label>
 <label>Subkategórie:
  <div class="checkboxes">
    <div v-for="(value, index) in res.all_subcategories" :key="index">
      <input 
        type="checkbox" 
        :value="value.idCategory" 
        v-model="subcategory" 
      >
      {{ value.name }}
    </div>
  
  </div>
</label>
 <input type="submit" value = "Upraviť produkt">
 </form>
</div>
</div>
</template>


<script>
export default {
  data() {
    return {
       name: '',
       price: '',
       main_desc: '',
       alt: '',
       html_desc: '',
       release_date: '',
       current_image: '',
       res: {},
       platform: [],
       subcategories: [],
       subcategory: [],
       main_category: '',
       picture: null
    }
  },

  methods: {

    handleFileUpload(event){
          this.picture = event.target.files[0];
    },

    async fetchActual() {
       try{
           const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_item_edit.php",
           {
             params: {id: this.$route.params.id},
             withCredentials: false
           });
           this.res = response.data;
           this.name = this.res.item.name;
           this.price = this.res.item.price;
           this.main_desc = this.res.item.description;
           this.alt = this.res.item.alt;
           this.current_image = this.res.item.image;
           this.release_date = this.res.item.release_date;
           this.html_desc = this.res.item.html_description;  
           this.main_category = this.res.item.main_category;   
           this.subcategories = this.res.subcategories;
           this.subcategory = this.res.subcategories.map(s => s.idCategory);
           this.platform = this.res.platforms.map(p => p.platform_id);
           
            tinymce.init({
              selector: '#html_desc',
              height: 600,
              plugins: 'lists link table code',
              toolbar: 'undo redo | bold italic | bullist numlist | link | code',
              setup: editor => {
                editor.on('init', () => {
                if (this.html_desc) {
                    editor.setContent(this.html_desc);
                }
                });

      editor.on('change keyup', () => {
        this.html_desc = editor.getContent();
      });
    }
  });
       } catch(error){
    
       } 
    },

    async update() {
       try{
            const formdata = new FormData();
            formdata.append("id", this.$route.params.id);
            formdata.append("img", this.picture);
            formdata.append("name", this.name);
            formdata.append("price", this.price);
            formdata.append("description", this.main_desc);
            formdata.append("alt", this.alt);
            formdata.append("html_desc", this.html_desc);
            formdata.append("release_date", this.release_date);
           this.platform.forEach(p =>
              formdata.append('platforms[]', p)
           );
           this.subcategory.forEach(s =>
              formdata.append('subcategories[]', s)
           );

            formdata.append("main_category", this.main_category);


            const response = await this.$axios.post("http://localhost/GameSpace/endpoints/update/update_item.php",
            formdata,
            {
                headers: { "Content-Type": "multipart/form-data" }
            }
            );

            if(response.data.message === 'success'){
                  alert("Záznam bol úspešne upravený !");
                  this.fetchActual();
            } else{
                alert(response.data.message);
            }
       } catch(error){

       }
    }

  },

 mounted() {
  this.fetchActual();
  document.title = this.$route.params.id;
},

   beforeUnmount() {
    if (tinymce.get('html_desc')) {
      tinymce.get('html_desc').remove();
    }
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
                .prev{
                  margin-top: 15px;
                }

                .checkboxes{
                  display: flex;
                  gap: 15px;
                  flex-wrap: wrap;
                }

                .preview{
                   width: 300px;
                    height: 200px;
                    object-fit: cover;
                    display: block;
                    border-radius: 15px;
                    margin-top: 10px;
                }

      textarea{
      resize: none;
      overflow: none;      
      min-height: 200px;  
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
      input[type = 'text'], input[type = 'date']{
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

                select{
            padding: 10px 14px;
            border-radius: 8px;
            border: 1.5px solid #b5d1ff;
            background-color: #ffffff;
            color: #1a1a1a;
            transition: border-color 0.2s ease, background-color 0.2s ease;

            &.bad_input{
                border: 3px solid red;
            }

            &.good_input{
                border: 3px solid rgb(0, 255, 81);
            }


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

             option {
               padding: 10px;
               color: #1a1a1a;
               background-color: #ffffff; 
             }
            }
            

            }
        }
       }
    }
</style>