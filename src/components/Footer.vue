<template>
<footer>
    <div class = "aligment">
         <p>© {{ new Date().getFullYear() }} —  Created by Adam Šima</p>
         <div class = "links">
             <ul>
                 <RouterLink to = "/kontakt"><li>Kontakt</li></RouterLink> 
                 <hr>
                 <RouterLink to = "/about"><li>O nás</li></RouterLink> 
             </ul>
         </div>
         <div class = "socials">
             <a :href="icon.link" v-for = "(icon,index) in socials" :key = "index" :style = "{backgroundColor: icon.background_color}">
              <i :class="icon.icon_name" :style="{ color: icon.color }"></i></a>
         </div>
    </div>
</footer>
</template>

<script>
import { RouterLink } from 'vue-router';
   export default{
      data(){
         return{
             socials: []
         }
      },

      methods:{
       async fetchFooterIcons(){
        try{
           const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/footer_socials.php",
           {
             withCredentials: false
           });
           if(response.status !== 200){
                   return;
           }
           this.socials = response.data;
          } catch(error){
               if(error.response){

               } else if(error.request){

               } else {

               }
          }
       } 
      },
       mounted(){
            this.fetchFooterIcons()
       }
   }
 
</script>

<style scoped lang="scss">

footer {
  @include flex-between(center, row, space-between);
  width: $full_width;
  box-shadow: $box_sh_nav;
  margin-top: auto;
  border-top: 2px solid $blue;
  margin-top: 100px;

  .aligment {
    @include flex-between(center, row, space-between);
    width: $full_width;
    padding: $padding_30;

    .links{

      ul{
         display: flex;
         gap: 20px;
      a{
        li{
            padding: 5px
        }
      }
      }
    }

    .socials {
      @include socials-style();
      display: flex;

      a {
        text-decoration: none;
        border-radius: 50%;
        transition: all 0.2s ease-in-out;

        i {
          font-size: 1.3rem;
          width: 45px;
          height: 45px;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          transition: 0.3s;
        }

        &:hover {
          @include push-transition();
        }
      }
    }
  }
}

</style>