<template>
<div class = "wrapper">
    <div class = "wrapp">
 <h1>Upraviť produkt</h1>

 <form method = "post" @submit.prevent = "update">

 <label for="title">......
     
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
      
    }
  },

  methods: {

    
    async fetchActual() {
     
    },

    async update() {
    
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