<template>
  <div class="account_managment">
    <h1>Akcie:</h1>
    <button class="delete_btn" @click="deleteAccount">
      Vymazať účet
    </button>
  </div>
</template>


<script>
import { useUserStore } from '../../../stores/user';
export default{
    data(){
        return{
            del: false,
            userStore: null
        }
    },

    created(){
        this.userStore = useUserStore();
    },

    methods:{
        async deleteAccount(){
            if(!confirm("Naozaj chcete vymazať svoj účet ?")){
              return;
            } else {
            try{
                const response = await this.$axios.post("http://localhost/GameSpace/endpoints/delete/delete_user.php",
                {},
                {withCredentials: true});
                this.userStore.cleanStore();
                this.$router.push({name: 'home'});
            } catch(error){

            }
            }
        }
    }
}
</script>

<style scoped lang = "scss">
 .account_managment {
  width: 100%;
  flex-direction: column;
  padding: 20px;
  display: flex;
  gap: 20px;

  button{
     background-color: red;
     padding: 15px;
     color: white;
     width: 20%;
     border-radius: 15px;
     transition: background-color 0.5s ease-in-out;

     &:hover{
        background-color: darkred;
     }

     
  }
 
}


@media only screen and (max-width: 600px) {
  .account_managment{
     button{
        width: 50%;
     }
  }
}
</style>