<template>
  <div class="overlay" @click="$emit('close')">

    <div class="login" @click.stop v-if = "!changeLayout">
     

      <h1 style="text-align:center;">Prihlásenie</h1>

      <div class="inputs">

        <label>E-mail:
          <input type="email">
        </label>

        <label>Heslo:
          <input type="password">
        </label>

        <p>Nie ste zaregistrovaný ? <span @click = "changeLayout = true">Zaregistrujte sa</span></p>
        <button>Prihlásiť</button>

      </div>
    </div>
  <div class = "register" v-else @click.stop>
      <h1 style = "text-align: center;">Registrácia</h1>
           <div class = "inputs">
              <label for="">Meno:
            <input type="text">
          </label>
          <label for="">Priezvisko:
            <input type="text">
          </label>
                   <label>E-mail:
          <input type="email">
        </label>

        <label>Heslo:
          <input type="password">
        </label>
        <label>Zopakujte heslo:
          <input type="password">
        </label>
          <p>Ste zaregistrovaný ? <span @click = "changeLayout = false">Prihláste sa</span></p>
          <button>Registrovať</button>
        
           </div>
  </div>
  </div>
</template>


<script>
   export default{
    emits: ['close'],
    data(){
        return{
            changeLayout: false
        }
    }
   }
</script>

<style scoped lang="scss">

    .register{
       @include login_register();
       .inputs{

        p{
            margin-top: 10px;
          span{
                color: $blue;
                    cursor: pointer;
                    transition: background-color 0.8s ease-in-out;
                    &:hover{
                      color: blue;
                    } 
          }
        }
        button{
                background-color: $blue;
                color: white;
                border-radius: 10px;
                padding: 10px;
                margin-top: 5px;
                transition: background-color 1s ease-in-out;
                width: 100%;
                margin-top: 15px;

                &:hover{
                    background-color: blue;
                }
        }
        label{
             display: flex;
                flex-direction: column;
                gap: 5px;
          input{
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
       }
    }

    .login {
       @include login_register();
       
        .inputs{
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
            p{
                span{
                    color: $blue;
                    cursor: pointer;
                    transition: background-color 0.8s ease-in-out;
                    &:hover{
                      color: blue;
                    }
                }
            }
            
            button{
                background-color: $blue;
                color: white;
                border-radius: 10px;
                padding: 10px;
                margin-top: 5px;
                transition: background-color 1s ease-in-out;

                &:hover{
                    background-color: blue;
                }
            }
            label{
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
        }
    }

  .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: rgba(0, 0, 0, 0.6);
      z-index: 9998;     
}
</style>