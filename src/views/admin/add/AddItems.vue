<template>
  <div class="wrapper">
    <div class="wrapp">
      <h1>Pridať produkt</h1>

      <form @submit.prevent="add">

        <label for="name">Názov
          <input type="text" id="name" v-model="name">
        </label>

        <label for="price">Cena:
          <input type="text" v-model="price">
        </label>

        <label for="main_desc">Hlavný popis:
          <textarea v-model="main_desc"></textarea>
        </label>

        <label for="img">Image:
          <input type="file" @change="handleFileUpload">
        </label>

        <label for="alt">Image alt:
          <input type="text" v-model="alt">
        </label>

        <label for="release_date">Dátum vydania:
          <input type="date" v-model="release_date">
        </label>

        <label for="html_desc">HTML popis:
          <textarea id="html_desc"></textarea>
        </label>

       <label for="main_category">
  Hlavná kategória:
  <select id="main_category" v-model="main_category">
    <option :value="cat.idCategory" v-for="cat in res.all_main_categories" :key="cat.idCategory">
      {{ cat.name }}
    </option>
  </select>
</label>


        <label>Platformy:
          <div class="checkboxes">
            <div v-for="p in res.all_platforms" :key="p.platform_id">
              <input type="checkbox" :value="p.platform_id" v-model="platform">
              {{ p.name }}
            </div>
          </div>
        </label>

        <label>Subkategórie:
          <div class="checkboxes">
            <div v-for="s in res.all_subcategories" :key="s.idCategory">
              <input type="checkbox" :value="s.idCategory" v-model="subcategory">
              {{ s.name }}
            </div>
             <p v-if = "res.all_subcategories.length === 0">Nebola zvolená hlavná kategória.</p>
          </div>
        </label>

        <input type="submit" value="Pridať produkt">
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
      platform: [],
      subcategory: [],
      main_category: null,
      picture: null,
      current_image: '',
      res: {
        all_main_categories: [],
        all_platforms: [],
        all_subcategories: []
      }
    }
  },

  methods: {

    handleFileUpload(event){
          this.picture = event.target.files[0];
    },

    async fetchCategoriesPlatforms() {
       try{
           const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchAddItems.php",
           {
             withCredentials: false
           });
           const data = response.data;
           
           this.res.all_main_categories = data.all_main_categories || [];
           this.res.all_platforms = data.all_platforms || [];
           
       } catch(error){
    
       } 
    },

    async add() {
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


            const response = await this.$axios.post("http://localhost/GameSpace/endpoints/add/add_item.php",
            formdata,
            {
                headers: { "Content-Type": "multipart/form-data" }
            }
            );

            if(response.data.message === 'success'){
                  alert("Záznam bol úspešne pridaný !");
                  this.clean();
            } else{
                alert(response.data.message);
            }
       } catch(error){

       }
    },

    clean(){
   this.name = '';
   this.price = '';
   this.main_desc = '';
   this.alt = '';
   this.release_date = '';
   this.html_desc = '';
   this.main_category = null;  
   this.subcategory = [];
   this.platform = [];
   this.picture = null;
   this.current_image = '';
           if (tinymce.get('html_desc')) {
             tinymce.get('html_desc').setContent('');
           }
    },

    async fetchSubcategories(category){
        try{
            const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_subcategory_add.php",
            {
                params: {category: category},
                withCredentials: false
            });
            this.res.all_subcategories = response.data;
        } catch(error){

        }
    }

  },

 mounted() {
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
  this.fetchCategoriesPlatforms();
},

   beforeUnmount() {
    if (tinymce.get('html_desc')) {
      tinymce.get('html_desc').remove();
    }
  },

  watch: {
  main_category(newVal) {
    if (newVal) {
      this.fetchSubcategories(newVal);
    } else {
      this.res.all_subcategories = [];
      this.subcategory = [];
    }
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

    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
      width: 100%;

      label {
        display: flex;
        flex-direction: column;
        gap: 10px;
        width: 100%;

        select {
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

          option {
            padding: 10px;
            color: #1a1a1a;
            background-color: #ffffff;
          }
        }
      }

      .checkboxes {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
      }

      .prev {
        margin-top: 15px;
      }

      .preview {
        width: 300px;
        height: 200px;
        object-fit: cover;
        display: block;
        border-radius: 15px;
        margin-top: 10px;
      }

      textarea,
      input[type='text'],
      input[type='date'] {
        padding: 10px 14px;
        resize: none;
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

      input[type='submit'] {
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
    }
  }
}
</style>