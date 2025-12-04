<template>
<footer>
    <div class = "aligment">
         <p>© {{ new Date().getFullYear() }} —  Created by Adam Šima</p>
         <div class = "socials">
             <a href=""><i class = "fab fa-facebook facebook"></i></a>
             <a href="" ><i class = "fab fa-instagram instagram"></i></a>
             <a href="" ><i class = "fab fa-youtube youtube"></i></a>
             <a href="" ><i class = "fab fa-linkedin linkedin"></i></a>
         </div>
    </div>
</footer>
</template>

<script>

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

    .socials {
      @include socials-style();
      display: flex;

      a {
        text-decoration: none;

        i {
          font-size: 18px;
          color: white;
          width: 38px;
          height: 38px;
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