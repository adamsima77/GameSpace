<template>
  <div class="account_managment">
    <h1>Akcie:</h1>
    <div class="warning_box" v-if = "del">
      <i class="fas fa-exclamation-triangle warning_icon"></i>
      <div class="warning_text">
        <h1>Chcete naozaj vymazať svoj účet?</h1>
        <p>Táto akcia je nezvratná a všetky vaše dáta budú nenávratne odstránené.</p>
        <div class = "buttons">
            <button class = "delete" @click = "deleteAccount">Vymazať</button>
            <button class = "cancel" @click = "del = false">Zrušiť</button>
        </div>
      </div>
    </div>

    <button class="delete_btn" @click="del = true">
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
            this.del = true;
            if(!this.del) return;
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
</script>

<style scoped lang = "scss">
 .account_managment {
  width: 100%;
  flex-direction: column;
  padding: 20px;
  display: flex;
  align-items: center;
  gap: 20px;

 
}

.warning_box {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #fff4f4; 
  border: 2px solid #ff4d4f; 
  border-radius: 12px; 
  box-shadow: 0 4px 10px rgba(255, 0, 0, 0.2); 
  gap: 15px;
  padding: 20px;
  margin: 0 auto;    
  .warning_text{
    .buttons{  
         margin-top: 20px;
         display: flex;
         justify-content: center; 
         gap: 15px;
    .delete{
       background-color: red;
       color: white;
       border: none;
       padding: 12px;
       font-size: 1.1rem;
       font-weight: bold;
       border-radius: 10px;
       cursor: pointer;
       min-width: 100px;
       transition: 0.2s all ease;
       margin-right: auto;

       &:hover{
           background-color: #891b1b;
       }
    }

    .cancel{
      background-color: rgb(6, 218, 6);
      color: white;
      border: none;
      padding: 12px;
      font-size: 1.1rem;
      font-weight: bold;
      border-radius: 10px;
      min-width: 100px;
      cursor: pointer;
      transition: 0.2s all ease;
      margin-left: 15px;

      &:hover{
           background-color: green;
      }
      
    }
  }
  }
}

.warning_icon {
  color: #ff4d4f;
  font-size: 2.5rem;
}

.warning_text h1 {
  font-size: 1.5rem;
  margin: 0;
  color: #a8071a;
}

.warning_text p {
  margin: 5px 0 0 0;
  font-size: 1rem;
  color: #891b1b;
}

.delete_btn {
  background-color: #ff4d4f;
  color: white;
  border: none;
  padding: 12px 25px;
  font-size: 1.1rem;
  font-weight: bold;
  border-radius: 10px;
  cursor: pointer;
  transition: 0.2s all ease;
  margin: 0 auto;
}

.delete_btn:hover {

  background-color: #a41717;
}

@media only screen and (max-width: 600px) {
  .account_managment{
    justify-content: center;
    align-items: center;
  }
  .warning_box {
    flex-direction: column; 
    align-items: flex-start;
     
    gap: 15px;

    .warning_text {
      width: 100%;         
      h1 {
        font-size: 1.2rem;
      }
      p {
        font-size: 0.9rem;
      }

      .buttons {
        flex-direction: column;
        gap: 15px;
        width: 100%;

        .delete,
        .cancel {
          width: 100%;
          text-align: center;
          margin: 0;
        }
      }
    }
  }

  .delete_btn {
    width: 100%;
    text-align: center;
    margin: 0;
  }

  .warning_icon {
    font-size: 2rem;
    margin-bottom: 5px;
  }
}
</style>