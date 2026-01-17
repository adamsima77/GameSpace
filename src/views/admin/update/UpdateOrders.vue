<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Upraviť stav objednávky</h1>

 <form method = "post" @submit.prevent = "update">

 <label for="status">Status objednávky:
     <select id="status" name="status" v-model = "status">
           <option value="V príprave">V príprave</option>
           <option value="Spracováva sa">Spracováva sa</option>
           <option value="Odoslané">Odoslané</option>
           <option value="Doručené">Doručené</option>
           <option value="Zrušené">Zrušené</option>
           <option value="Zlyhalo">Zlyhalo</option>
           <option value="Vrátené">Vrátené</option>
      </select>
 </label>

 <input type="submit" value = "Upraviť objednávku">
 </form>
</div>
</div>
</template>


<script>
export default {
  data() {
    return {
      status: '' 
    }
  },

  methods: {

    checkStatus() {
      const allowedStatuses = [
        'V príprave',
        'Spracováva sa',
        'Odoslané',
        'Doručené',
        'Zrušené',
        'Zlyhalo',
        'Vrátené'
      ];

      if (!allowedStatuses.includes(this.status)) {
        alert("Vybraný status je nesprávny");
        return false;
      }

      return true;
    },

    async fetchActual() {
      try {
        const response = await this.$axios.get(
          "http://localhost/GameSpace/endpoints/fetch/fetch_id_update_orders.php",
          {
            params: { id: this.$route.params.id },
            withCredentials: false
          }
        );
        this.status = response.data.status;
      } catch (error) {
       
      }
    },

    async update() {
      try {
        if (!this.checkStatus()) {
          alert("Zlý status!");
          return;
        }

        const response = await this.$axios.post("http://localhost/GameSpace/endpoints/update/update_orders.php", 
         { id: this.$route.params.id, status: this.status}, 
         {withCredentials: false}
        );

        if (response.data.message === 'success') {
          alert("Objednávka bola úspešne upravená!");
        } else {
          alert("Nastala chyba pri úprave objednávky!");
        }

      } catch (error) {
       
      }
    }

  },

  mounted() {
    this.fetchActual();
    document.title = this.$route.params.id;
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