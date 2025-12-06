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
             <a href="https://www.facebook.com/?locale=sk_SK"><i class = "fab fa-facebook facebook"></i></a>
             <a href="https://www.instagram.com/" ><i class = "fab fa-instagram instagram"></i></a>
             <a href="https://www.youtube.com/" ><i class = "fab fa-youtube youtube"></i></a>
             <a href="https://www.linkedin.com/" ><i class = "fab fa-linkedin linkedin"></i></a>
         </div>
    </div>
</footer>
</template>

<script>
import { RouterLink } from 'vue-router';


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

        i {
          font-size: 1.3rem;
          color: white;
          width: 45px;
          height: 45px;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          transition: 0.3s;
        }

        .facebook {
          background: #1877F2;
        }

        .instagram {
          background: #E1306C;
        }

        .youtube {
          background: #FF0000;
        }

        .linkedin {
          background: #0A66C2;
        }

        i:hover {
          @include push-transition();
        }
      }
    }
  }
}

</style>