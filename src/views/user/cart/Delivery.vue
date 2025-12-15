<template>
    <div class = "inputs">
    <h1>Adresa doručenia</h1>
    <label for="email">E-mail:
        <input type="text" :class="{bad_input: errors.email, good_input: !errors.email}"  @input="errors.email = false"  v-model = "email" id = "email" placeholder = "Zadajte E-mail...">
    </label>

     <label for="name">Meno:
        <input type="text" :class="{bad_input: errors.name, good_input: !errors.name}"   @input="errors.name = false" v-model = "name" id = "name" placeholder = "Zadajte meno...">
    </label>

     <label for="surname">Priezvisko
        <input type="text" :class="{bad_input: errors.surname, good_input: !errors.surname}"  @input="errors.surname = false"  v-model = "surname" id = "surname" placeholder = "Zadajte priezvisko...">
    </label>

     <label for="city">Mesto:
        <input type="text" :class="{bad_input: errors.city, good_input: !errors.city}"   @input="errors.city = false" v-model = "city" id = "city" placeholder = "Zadajte mesto...">
    </label>

     <label for="street">Ulica:
        <input type="text" :class="{bad_input: errors.street, good_input: !errors.street}"   @input="errors.street = false" v-model = "street" id = "street" placeholder = "Zadajte ulicu...">
    </label>

     <label for="postal">PSČ:
        <input type="text" :class="{bad_input: errors.postal_code, good_input: !errors.postal_code}"  @input="errors.postal_code = false"  v-model = "postal_code" id = "postal" placeholder = "Zadajte PSČ...">
    </label>

     <label for="phone_num">Telefónne číslo:
        <input type="text" :class="{bad_input: errors.telephone_number, good_input: !errors.telephone_number}"   @input="errors.telephone_number = false" v-model = "telephone_number" id = "phone_num" placeholder = "Zadajte telefónne číslo...">
    </label>

    <h1>Spôsob dopravy</h1>
    <label for="transit">Vyberte spôsob dopravy:
        <select id="transit" name="" v-model.number = "transport" :class="{bad_input: errors.transport, good_input: !errors.transport}"   @change="errors.transport = false">
            <option disabled value="-1">Vyberte spôsob dopravy...</option>
          <option :value="value.id" v-for = "(value,index) in transits" :key = "index">{{ value.name }}</option>
        </select>
        </label>
        <label for="payment">Vyberte spôsob platby:
        <select id="payment" name="" v-model.number = "payment" :class="{bad_input: errors.payment, good_input: !errors.payment}"   @change="errors.payment = false">
           <option disabled value="-1">Vyberte spôsob platby...</option>
           <option :value="value.id" v-for = "(value,index) in payments" :key = "index">{{ value.name }}</option>
        </select>
        </label>
        <div class = "buttons">
            <RouterLink :to = "{name: 'cart'}">Prejsť na košík</RouterLink>
            <button @click = "checkVariables()">Prejsť na pokladňu</button>
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
             cartStore: null
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
              
            if(this.email === ''){
                 this.errors.email = true
            } else {
                this.errors.email = false;
            }

            if(this.name === ''){
                  this.errors.name = true;
            } else {
                this.errors.name = false;
            }

            if(this.surname === ''){
                 this.errors.surname = true;
            } else{
                this.errors.surname = false;
            }

            if(this.city === ''){
                  this.errors.city = true;
            } else{
                this.errors.city = false;
            }

            if(this.street === ''){
                 this.errors.street = true;
            } else{
                this.errors.street = false;
            } 

            if(this.postal_code === ''){
                   this.errors.postal_code = true;
            } else{
                this.errors.postal_code = false;
            }

            if(this.telephone_number === ''){
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

</style>