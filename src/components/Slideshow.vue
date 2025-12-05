<template>

<div class = "slideshow">
    <div class = "images" v-if = "slideshow.length">
         
         <RouterLink to = ""><img :src="slideshow[actualImage].photo" :alt="slideshow[actualImage].desc"></RouterLink>
     
         <div class = "controls">
             <i class = "fas fa-arrow-left left" @click = "goLeft()"></i>
             <i class = "fas fa-arrow-right right" @click = "goRight()"></i>         
         </div>
    </div>
       <div class = "dots">
           <span v-for = "(image,index) in slideshow" :key = "index" :class = "{active: index === actualImage}" @click = "setImage(index)"></span>
       </div>
</div>

</template>

<script>
    export default{
        props:['slideshow'],
        data(){
            return{
                actualImage: 0,
                Interval: null,
             
            }
        },
        methods:{
              goLeft(){
                   
                   if(this.actualImage == 0){
                         this.actualImage = this.slideshow.length - 1;
                   } else{
                       this.actualImage--;
                   }
              },
              goRight(){
                    
                     if(this.actualImage >= this.slideshow.length - 1){
                            this.actualImage = 0;
                     } else{
                          this.actualImage++;
                     }
              },
              setImage(index){
                  this.actualImage = index;
              },

              interval(){
                  this.Interval = setInterval(() => {this.goRight()},3000);
              }
        },
        mounted(){
            this.interval();           
        },
        beforeUnmount(){
          clearInterval(this.Interval);
        }

    }
   
</script>

<style scoped lang="scss">
.slideshow {
  padding: $padding_15;
  place-self: center;
  @include flex-direction-center($align: center, $direction: column, $con: center);
  width: 100%;
  

  .images {
    position: relative;
    width: 100%;
    overflow: hidden;
    @include flex-direction-center($align: center, $direction: column, $con: center);
      height: 800px;

    a{
      display: block;
    width: 100%;
    height: 100%;
    img {
      display: block;
      width: 100%;  
      height: 100%;    
      object-fit: cover; 
      border-radius: 10px;
      transition: opacity 0.5s ease-in-out;

       &:hover{
         @include hover-transition($opacity:0.8);
       }
    }
  }

    .controls {
      position: absolute;
      top: 50%;
      left: 0px;
      right: 0px;
      display: flex;
      justify-content: space-between;
      transform: translateY(-50%);
      pointer-events: none; 

      i {
        pointer-events: auto; 
        color: $white;
        font-size: $arrow_size;
        cursor: pointer;
        background-color: $blue;
        padding: 15px;
        transition: $ease_in_out_opacity;
        box-shadow: $box_sh_icons;

        &:hover {
          @include hover-transition($color: none, $background: none, $opacity: 0.8);
        }
      }
      .left{
        border-top-right-radius: 25%;
        border-bottom-right-radius: 25%;
      }
      .right{
        border-top-left-radius: 25%;
        border-bottom-left-radius: 25%;
      }
    }
  }

  .dots {
    width: 100%;
    display: flex;
    justify-content: center;
    gap: 8px;
    margin-top: 20px;

    span {
      width: 25px;
      height: 25px;
      border-radius: 50%;
      background-color: #f5f5f5;
      border: 0.1px solid black;
      cursor: pointer;
      transition: $ease_in_out_opacity;

      &.active {
        background-color: $blue;
      }

      &:hover {
        @include hover-transition($color: none, $background: none, $opacity: 0.8);
      }
    }
  }
}
</style>
