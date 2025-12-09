<template>
<div class = "game_boxes">
    <div class = "img_date">
        <RouterLink to = ""><img :src="game.image" :alt="game.alt"></RouterLink>
        <p>{{ game.state }}</p>
    </div>
</div>

</template>


<script>
    export default{
        props:['game'],
        data(){

        }
    }
</script>

<style scoped lang = "scss">
.game_boxes {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 23%;         
  border-radius: 10px;
  box-sizing: border-box; 

  .img_date {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;

    a {
      display: block;
      width: 100%;

      img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;  
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        aspect-ratio: 3/4;
      }
    }

    p {
      
      padding: $padding_15;
      background-color: greenyellow;
      color: black;
      border-radius: 0 0 10px 10px;
      width: 100%;
      box-sizing: border-box;
      font-weight: bold;
    }
  }
}

</style>