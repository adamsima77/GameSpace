<template>
    <div class = "NotFound">
         <h1>404 - Stránka neexistuje</h1>
         <button @click = "returnHome()"><i class = "fas fa-home"></i>Domovská stránka</button>
    </div>

</template>

<script>
    export default{
        methods:{
            returnHome(){
                this.$router.push('/');
            }
        }
    }

</script>

<style scoped lang = "scss">
    .NotFound{
        display: flex;
        flex-direction: column;
        gap: 30px;

        h1{

        }

        button{
           transition: background-color 0.5s ease-in-out;
           background-color: $blue;
           color: white;
           padding: 20px;
           border-radius: 10px;

           i{
             margin-right: 10px;
           }

           &:hover{
               background-color: $dark_blue;
           }
        }
    }

</style>