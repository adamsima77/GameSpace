<template>
  <div class="wrapper">

    <div class="login" @click.stop v-if = "!changeLayout">
     

      <h1 style="text-align:center;">Prihlásenie</h1>

      <div class="inputs">

        <label>E-mail:
          <input type="email" v-model = "login_email" required >
        </label>

        <label>Heslo:
          <input type="password" v-model = "login_password" required>
        </label>

        <p>Nie ste zaregistrovaný ? <span @click = "changeLayout = true">Zaregistrujte sa</span></p>
        <button>Prihlásiť</button>

      </div>
    </div>
  <div class = "register" v-else @click.stop>
      <h1 style = "text-align: center;">Registrácia</h1>
           <div class = "inputs">
              <label for="">Meno:
            <input type="text" v-model = "register_name">
          </label>
          <label for="">Priezvisko:
            <input type="text" v-model = "register_surname">
          </label>
                   <label>E-mail:
          <input type="email" v-model = "register_email">
        </label>

        <label>Heslo:
          <input type="password" v-model = "register_password">
        </label>
        <label>Zopakujte heslo:
          <input type="password"v-model = "register_repeat_password">
        </label>
          <p>Ste zaregistrovaný ? <span @click = "changeLayout = false">Prihláste sa</span></p>
          <button>Registrovať</button>
        
           </div>
  </div>
  </div>
</template>


<script>
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
            register_repeat_password: ''
        }
    }
   }
</script>

<style scoped lang="scss">

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

  button {
    background-color: #2979ff;
    color: white;
    border-radius: 10px;
    padding: 10px;
    margin-top: 15px;
    transition: background-color 0.3s ease;
    width: 100%;

    &:hover {
      background-color: blue;
    }
  }
}

</style>