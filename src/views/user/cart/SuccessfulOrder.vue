<template>
  <div class="wrapper">
    <h1>Vaša objednávka bola úspešná</h1>
    <p>Za <span class="time">{{ time }}</span> sekúnd budete presmerovaní na domovskú stránku</p>
    <button @click="$router.push({ name: 'home' })">Návrat na domovskú stránku</button>
  </div>
</template>


<script>
export default{
    data(){
        return{
            time: 15,
            interval: null
        }
    },

    methods:{
        startInterval(){
             this.interval = setInterval(() => {
                this.time--;

                if(this.time <= 0){
                    this.home();
                }
             }, 1000);

        },

        home(){
            clearInterval(this.interval);
            this.$router.push({name: 'home'});
        }
    },

    mounted(){
        this.startInterval();
    },

    beforeUnmount(){
          clearInterval(this.interval);
    }
}
</script>

<style scoped lang = "scss">
   .wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 40px;
  margin: 50px auto;
  max-width: 1000px;
  background-color: $white;
  border-radius: 20px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  text-align: center;

  h1 {
    margin-bottom: 15px;
  }

  p {
    .time {
      font-weight: bold;
      color: $dark-blue;
    }
  }

  button {
    background-color: $blue;
    color: #fff;
    padding: 12px 25px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease-in-out;

    &:hover {
      background-color: $dark-blue;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
  }
}
</style>