<template>
    <div class = "wrapper">
        <h1>Vaša objednávka bola úspešná</h1>
        <p>Za {{ time }} sekúnd budete presmerovaní na domovskú stránku</p>
        <button @click = "$router.push({name: 'home'})">Návrat na domovskú stránku</button>
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
            cleanInterval(this.interval);
            this.$router.push({name: 'home'});
        }
    },

    mounted(){
        this.startInterval();
    },

    beforeUnmount(){
          cleanInterval(this.interval);
    }
}
</script>

<style scoped lang = "scss">

</style>