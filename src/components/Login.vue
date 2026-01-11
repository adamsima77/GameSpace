<template>
    <div class = "message">
        <Error :message = "res" :key = "resKey"></Error>  
        <Success :message = "res" :key = "resKey"></Success>
    </div>
  <div class="wrapper">
  
    <div class="login" @click.stop v-if = "!changeLayout">
     

      <h1 style="text-align:center;">Prihlásenie</h1>

      <form method = "post" class="inputs" @submit.prevent = "loginUser">

        <label for = "log_email">E-mail:
          <input type="email" id = "log_email" v-model = "login_email" required >
        </label>

        <label for = "log_password">Heslo:
          <input type="password" id = "log_password" v-model = "login_password" required>
        </label>

        <p>Nie ste zaregistrovaný ? <span @click = "changeLayout = true">Zaregistrujte sa</span></p>
        <input type="submit">

      </form>
    </div>
  <form method = "post" class = "register" v-else @click.stop  @submit.prevent="createUser">
      <h1 style = "text-align: center;">Registrácia</h1>
           <div class = "inputs">
              <label for="name">Meno:
            <input type="text" id = "name" v-model = "register_name" autocomplete="on">
          </label>
          <label for="surname">Priezvisko:
            <input type="text" id = "surname" v-model = "register_surname" autocomplete="on">
          </label>
                   <label for = "email">E-mail:
          <input type="email" id = "email" v-model = "register_email" autocomplete="on">
        </label>

        <label for = "password">Heslo:
          <input type="password" id = "password" v-model = "register_password" autocomplete="off">
        </label>
        <label for = "repeat_password">Zopakujte heslo:
          <input type="password" id = "repeat_password" v-model = "register_repeat_password" autocomplete="off">
        </label>
          <p>Ste zaregistrovaný ? <span @click = "changeLayout = false">Prihláste sa</span></p>
          <input type="submit">
        
           </div>
          </form>
  </div>
</template>


<script>
import Error from './Error.vue';
import Success from './Success.vue';
import {useUserStore} from '../stores/user'
   export default{
    data(){
        return{
            changeLayout: false,
            login_email: '',
            login_password: '',
            register_name: '',
            register_surname: '',
            register_email: '',
            register_password: '',
            register_repeat_password: '',
            role: '1',
            res: {},
            resKey: 0,
            userStore: null
        }
    },

    created(){
         this.userStore = useUserStore();
    },

    methods:{
        async createUser(){
             try{
                 const response = await this.$axios.post("http://localhost/GameSpace/endpoints/add/register.php",
                   {
                     name: this.register_name,
                     surname: this.register_surname,
                     email: this.register_email,
                     password: this.register_password,
                     repeat_password: this.register_repeat_password,
                     role: this.role,
                     withCredentials: false
                   }
                 );
                 this.res = response.data;
                 this.resKey++;
                 this.changeLayout = false;
                 this.login_email = '',
                 this.login_password = '',
                 this.register_name = '',
                 this.register_surname = '',
                 this.register_email = '',
                 this.register_password = '',
                 this.register_repeat_password = ''
             } catch(error){
                  this.res = {
                      status: 'error',
                      message: error.response?.data?.message || 'SERVER_ERROR'
                  };
                   this.resKey++;
             }
                window.scrollTo({
                   top: 0,
                   behavior: 'smooth' 
                });
        },

        async loginUser(){
            try{
                const response = await this.$axios.post("http://localhost/GameSpace/endpoints/fetch/login_user.php",
                {
                   email: this.login_email,
                   password: this.login_password
                },
                {
                    withCredentials: true   
                }
                );
                this.res = response.data;
                this.resKey++;
                this.userStore.setName(this.res.name);
                this.userStore.setSurname(this.res.last_name);
                this.userStore.setEmail(this.res.email);
                this.userStore.setRole(this.res.role);
                this.userStore.setID(this.res.user_id);
                this.userStore.sessionChecked = true;
                this.login_email = '';
                this.login_password = '';

                if(this.userStore.role === 2) this.$router.push('/admin');
                else if(this.userStore.role == 1) this.$router.push({name: 'home'});
            } catch(error){
                  this.res = {
                      status: 'error',
                      message: error.response?.data?.message || 'SERVER_ERROR'
                  };
                   this.resKey++;
                   this.$router.push('/login');
            }
            window.scrollTo({
                   top: 0,
                   behavior: 'smooth' 
            });
        }
    },

    components:{
      Error,
      Success
    }
   }
</script>

<style scoped lang="scss">
   
   .message{
      display: flex;
      flex-direction: column;
      width: 48%;
      justify-content: center;
      align-items: center;
   }

  .wrapper {
  display: flex; 
  min-height: 50vh;      
  padding: 20px;
  width: 50%;

}

.register, .login {
  display: flex;
  flex-direction: column;
  gap: 15px;
  width: 100%;       
  background-color: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1); 
  border: 2px solid #ccc; 
}


.inputs {
  display: flex;
  flex-direction: column;
  gap: 15px;

  label {
    display: flex;
    flex-direction: column;
    gap: 5px;

    input {
      padding: 10px 14px;
      border-radius: 8px;
      border: 1.5px solid #b5d1ff;
      background-color: #ffffff;
      color: #1a1a1a;
      transition: border-color 0.2s ease, background-color 0.2s ease;

      &:hover {
        border-color: #2979ff;
        box-shadow: 0 0 6px rgba(0, 0, 0, 0.08);
      }

      &:focus {
        outline: none;
        border-color: #2979ff;
        background-color: #e6f0ff;
      }

      &::placeholder {
        color: #5f7dbb;
        opacity: 0.8;
      }
    }
  }

  p {
    margin-top: 10px;

    span {
      color: #2979ff;
      cursor: pointer;
      transition: color 0.3s ease;

      &:hover {
        color: blue;
      }
    }
  }

  input[type = "submit"] {
    background-color: #2979ff;
    color: white;
    border-radius: 10px;
    padding: 10px;
    margin-top: 15px;
    transition: background-color 0.3s ease;
    width: 100%;
    cursor: pointer;
    border: 1px solid white;

    &:hover {
      background-color: blue;
    }
  }
}

@media only screen and (max-width: 850px) {
   .wrapper{
       width: 100%;
       .login{
           margin-right: 5px;
           max-height: 700px;
           place-self: center;
           justify-content: space-evenly;
       }

       .register{
           justify-content: space-evenly;
           max-height: 700px;
           place-self: center;
       }
   }
}

</style>