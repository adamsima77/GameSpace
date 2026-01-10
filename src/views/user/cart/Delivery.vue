<template>
    <div class = "inputs">
    <h1>Adresa doručenia</h1>
    <label for="email">E-mail:
        <input type="text" :class="{bad_input: !isEmailValid && touched.email, good_input: isEmailValid && touched.email}"  @input="touched.email = true"  v-model = "email" id = "email" placeholder = "Zadajte E-mail...">
    </label>

     <label for="name">Meno:
        <input type="text" v-model = "name"  :class="{bad_input: !isName && touched.name, good_input: isName && touched.name}"   @input="touched.name = true"  id = "name" placeholder = "Zadajte meno...">
    </label>

     <label for="surname">Priezvisko
        <input type="text" :class="{bad_input: !isSurnameValid && touched.surname, good_input: isSurnameValid && touched.surname}"  @input="touched.surname = true"  v-model = "surname" id = "surname" placeholder = "Zadajte priezvisko...">
    </label>

     <label for="city">Mesto:
        <input type="text" :class="{bad_input: !isCityValid && touched.city, good_input: isCityValid && touched.city}"   @input="touched.city = true" v-model = "city" id = "city" placeholder = "Zadajte mesto...">
    </label>

     <label for="street">Ulica:
        <input type="text" :class="{bad_input: !isStreetValid && touched.street, good_input: isStreetValid && touched.street}"   @input="touched.street = true" v-model = "street" id = "street" placeholder = "Zadajte ulicu...">
    </label>

     <label for="postal">PSČ:
        <input type="text" :class="{bad_input: !isPostalValid && touched.postal_code, good_input: isPostalValid && touched.postal_code}"  @input="touched.postal_code = true"  v-model = "postal_code" id = "postal" placeholder = "Zadajte PSČ...">
    </label>

     <label for="phone_num">Telefónne číslo:
        <input type="text" :class="{bad_input: !isTelephoneValid && touched.telephone_number, good_input: isTelephoneValid && touched.telephone_number}"  @input="touched.telephone_number = true"   v-model = "telephone_number" id = "phone_num" placeholder = "Zadajte telefónne číslo...">
    </label>

    <h1>Spôsob dopravy</h1>
    <label for="transit">Vyberte spôsob dopravy:
        <select id="transit" name="" v-model.number = "transport" :class="{bad_input: !isTransportValid && touched.transport, good_input: isTransportValid && touched.transport}"   @change="touched.transport = true">
            <option disabled value="-1">Vyberte spôsob dopravy...</option>
          <option :value="value.id" v-for = "(value,index) in transits" :key = "index">{{ value.name }}</option>
        </select>
        </label>
        <label for="payment">Vyberte spôsob platby:
        <select id="payment" name="" v-model.number = "payment" :class="{bad_input: !isPaymentValid && touched.payment, good_input: isPaymentValid && touched.payment}"   @change="touched.payment = true">
           <option disabled value="-1">Vyberte spôsob platby...</option>
           <option :value="value.id" v-for = "(value,index) in payments" :key = "index">{{ value.name }}</option>
        </select>
        </label>
        <div class = "buttons">
            <RouterLink :to = "{name: 'cart'}">Prejsť na košík</RouterLink>
            <button @click = "checkVariables()"
            :disabled="!isFormValid" :class="{ disabled_btn: !isFormValid }">Prejsť na pokladňu</button>
        </div>
        </div>
</template>

<script>
import { useCartStore } from '../../../stores/cart'
export default{
    data(){
        return{
            transits: [],
            payments: [],
            email: '',
            name: '',
            surname: '',
            city: '',
            street: '',
            postal_code: '',
            telephone_number: '',
            transport: -1,
            payment: -1,
             errors: {
              email: false,
              name: false,
              surname: false,
              city: false,
              street: false,
              postal_code: false,
              telephone_number: false,
              transport: false,
              payment: false
             },
             cartStore: null,
               touched: {
                   email: false,
                   name: false,
                   surname: false,
                   city: false,
                   street: false,
                   postal_code: false,
                   telephone_number: false,
                   transport: false,
                   payment: false
                }
        }
    },

    created(){
         this.cartStore = useCartStore();
    },

    methods:{
        async fetchTransits(){
              try{
                  const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_transit.php",
                  {withCredentials: false}
                );
                this.transits = response.data;
              } catch(error){

              }
        },

        async fetchPayments(){
                try{
                  const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_payments.php",
                  {withCredentials: false}
                );
                this.payments = response.data;
              } catch(error){

              }
        },

        checkVariables(){
            this.onLoad = false;
            if(this.email === ''){
                 this.errors.email = true
            } else {
                this.errors.email = false;
            }

            if (!this.name || this.name.length < 2 || !this.isFirstLetterUpper(this.name)) {
                   
                   this.errors.name = true;
            }else {
                this.errors.name = false;
            }

           if (!this.surname || this.surname.length < 2 || !this.isFirstLetterUpper(this.surname)) {
                 this.errors.surname = true;
            } else{
                this.errors.surname = false;
            }

           if (!this.city || this.city.length < 2 || !this.isFirstLetterUpper(this.city)) {
                  this.errors.city = true;
            } else{
                this.errors.city = false;
            }

            if (!this.street || this.street.length < 2 || !this.isFirstLetterUpper(this.street)) {
                 this.errors.street = true;
            } else{
                this.errors.street = false;
            } 

            if(!this.postal_code || !this.checkPostalCode(this.postal_code)){
                   this.errors.postal_code = true;
            } else{
                this.errors.postal_code = false;
            }

            if(!this.telephone_number || !this.checkTelephoneNumber(this.telephone_number)){
                 this.errors.telephone_number = true;
            } else{
                this.errors.telephone_number = false;
            }

            if(this.transport === -1){
                 this.errors.transport = true;
            } else{
                this.errors.transport = false;
            }

            if(this.payment === -1){
                this.errors.payment = true;
            } else{
                this.errors.payment = false;
            }

             if (!(this.errors.email || this.errors.name || this.errors.surname || this.errors.city ||
                 this.errors.street || this.errors.postal_code || this.errors.telephone_number ||
                 this.errors.transport || this.errors.payment)) {
                       this.cartStore.setDelivery(this.email,this.name,this.surname,this.city,this.street,
                                                  this.postal_code,this.telephone_number,this.transport,this.payment);
                       this.$router.push({name: 'checkout'});                         
                }
        },

   checkTelephoneNumber(number) {
    if (!number) return false;

    let plusCount = 0;
    let digitCount = 0;

    for (let i = 0; i < number.length; i++) {
        const char = number[i];

        if (char === '+') {
            plusCount++;
            if (i !== 0) return false; 
        } else if ((char >= '0' && char <= '9')) {
            digitCount++;
    
        } else if(char == ' '){
            continue;
        } else {
            return false; 
        }
    }

    if (plusCount > 1) return false;
    if (digitCount < 5 || digitCount > 15) return false;

    return true;
},

      isFirstLetterUpper(str) {
          if (!str) return false; 
          const firstChar = str.charAt(0);
          return firstChar === firstChar.toUpperCase();
      },

      checkPostalCode(postal_code){
          if(!postal_code) return false;
          let isDigit = true;
          for(let i = 0; i < postal_code.length; i++){
               if(!(postal_code.charAt(i) >= '0' && postal_code.charAt(i) <= '9')){
                     isDigit = false;
                     break;
               }
          }
          if(isDigit) return true;
          else return false;
      },


        ifDeclaredAssign(){
            this.email = this.cartStore.email;
            this.name = this.cartStore.name;
            this.surname = this.cartStore.surname;
            this.city = this.cartStore.city;
            this.street = this.cartStore.street;
            this.postal_code = this.cartStore.postal_code;
            this.telephone_number = this.cartStore.telephone_number;
            this.transport = this.cartStore.transport;
            this.payment = this.cartStore.payment;
        },

        checkEmail(email){
             let isEmail = false;
             for(let i = 0; i < email.length; i++){
                      if(email.charAt(i) == '@'){
                           isEmail = true;
                      }
             }

             return isEmail;
        }

    },

    computed:{

    isFormValid() {
        return (this.isEmailValid && this.isName && this.isSurnameValid &&
                this.isCityValid && this.isStreetValid && this.isPostalValid &&
                this.isTelephoneValid && this.isTransportValid && this.isPaymentValid);
    },


         isTelephoneValid(){
            return this.checkTelephoneNumber(this.telephone_number);
         },
         isEmailValid(){
            return this.checkEmail(this.email);
         },
         isName(){
            return this.isFirstLetterUpper(this.name);
         },
         isSurnameValid() {
            return this.surname.length >= 2 && this.isFirstLetterUpper(this.surname);
         },
         isCityValid() {
           return this.city.length >= 2 && this.isFirstLetterUpper(this.city);
         },
         isStreetValid() {
              return this.street.length >= 2 && this.isFirstLetterUpper(this.street);
         },
         isPostalValid() {
            return this.checkPostalCode(this.postal_code);
         },
        isTransportValid() {
           return this.transport !== -1;
        },
        isPaymentValid() {
           return this.payment !== -1;
        }
    },


    mounted(){
         this.fetchTransits();
         this.fetchPayments();
         this.ifDeclaredAssign();
    }
}

</script>

<style scoped lang = "scss">

 
    .inputs{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 35px;
        width: 90%;
        place-self: center;
        margin-top: 50px;
        box-shadow: $box_sh_boxes;
        padding: 45px;
        border-radius: 15px;

        .buttons{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;

            a,button{
                 background-color: $blue;
                 color: white;
                 padding: 13px;
                 border-radius: 10px;
                 width: 15%;
                 margin-top: 50px;
                 transition: background-color 0.5s ease-in-out;
                 text-align: center;
                 &:hover{
                      background-color: $dark_blue;
                 }

                 &.disabled_btn {
                   background-color: #ccc;
                   color: #666;
                   cursor: not-allowed;

                &:disabled {
                   opacity: 0.7;
                }
                }
            }
        }

        h1{
            margin-right: auto;
        }

        label{
            display: flex;
            flex-direction: column;
            gap: 10px;
            width: 100%;
        }

        input,select{
            padding: 10px 14px;
            border-radius: 8px;
            border: 1.5px solid #b5d1ff;
            background-color: #ffffff;
            color: #1a1a1a;
            transition: border-color 0.2s ease, background-color 0.2s ease;

            &.bad_input{
                border: 3px solid red;
            }

            &.good_input{
                border: 3px solid rgb(0, 255, 81);
            }


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

             option {
               padding: 10px;
               color: #1a1a1a;
               background-color: #ffffff; 
             }
        }
    }

@media only screen and (max-width: 800px) {
        .inputs{
            justify-content: center;
            align-items: center;
            h1{
                display: inline;
                text-align: center;
            
            }

            .buttons{
                gap: 20px;
                width: 100%;
                a,button{
                    flex: 1;
                }
            }

            label{
                width: 100%;
                justify-content: center;
                margin-right: 25px;
                input{
                    width: 100%;
                }

                select{
                    width: 100%;
                }
            }
        }
}

</style>