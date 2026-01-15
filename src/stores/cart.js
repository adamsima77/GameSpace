import { defineStore } from 'pinia'
import axios from 'axios'

export const useCartStore = defineStore('cart', {
  state: () => ({
    cart: [],
    message: {},
    total: 0,
    email: '',
    name: '',
    surname: '',
    city: '',
    street: '',
    postal_code: '',
    telephone_number: '',
    transport: -1,
    payment: -1,
    transportName: '',
    paymentName: ''
  }),

  actions: {
    async add(id, platforma){
      try{
        const response = await axios.post("http://localhost/GameSpace/endpoints/add/addToCart.php",
          { itemId: id, platform: platforma },
          { withCredentials: true }
        );
        console.log(response.data.message);
        this.message = response.data;
        await this.fetchCart();
      } catch(error){}
    },

    async fetchCart(){
      try{
        const response = await axios.get("http://localhost/GameSpace/endpoints/fetch/get_cart.php",
          {withCredentials: true}
        );
        this.cart = response.data.cart;
        this.total = response.data.total;
      } catch(error){}
    },

    async removeFromCart(id,platform){
      try{
        const response = await axios.post("http://localhost/GameSpace/endpoints/delete/remove_from_cart.php",
          {id: id, platform: platform},
          {withCredentials: true}
        );
        this.message = response.data;
        this.fetchCart();
      } catch(error){}
    },

    async decrementQuantity(id,platform){
      try{
        const response = await axios.post("http://localhost/GameSpace/endpoints/cart/decrement_quantity.php",
          {id: id, platform: platform},
          {withCredentials: true}
        );
        this.message = response.data;
        this.fetchCart();
      } catch(error){}
    },

    async addQuantity(id, platform){
      try{
        const response = await axios.post("http://localhost/GameSpace/endpoints/cart/add_quantity.php",
          {id: id, platform: platform},
          {withCredentials: true}
        );
        this.message = response.data;
        
        this.fetchCart();
      } catch(error){}
    },

    isDeliverySet(){
      return !(
        this.email === '' || this.name === '' || this.surname === '' ||
        this.city === '' || this.street === '' || this.postal_code === '' ||
        this.telephone_number === '' || this.transport === -1 || this.payment === -1
      );
    },

    setDelivery(email,name,surname,city,street,postal_code,telephone_number,transport,payment){
      this.email = email;
      this.name = name;
      this.surname = surname;
      this.city = city;
      this.street = street;
      this.postal_code = postal_code;
      this.telephone_number = telephone_number;
      this.transport = transport;
      this.payment = payment;
    },

    cleanStore(){
      this.cart = [];
      this.message = {};
      this.total = 0;
      this.email = '';
      this.name = '';
      this.surname = '';
      this.city = '';
      this.street = '';
      this.postal_code = '';
      this.telephone_number = '';
      this.transport = -1;
      this.payment = -1;
      this.transportName = '';
      this.paymentName = '';
    },

    async placeOrder(){
      try{
        const response = await axios.post("http://localhost/GameSpace/endpoints/cart/place_order.php",
          {
            email: this.email,
            name: this.name,
            surname: this.surname,
            city: this.city,
            street: this.street,
            postal_code: this.postal_code,
            telephone_number: this.telephone_number,
            transport: this.transport,
            payment: this.payment,
            cart: this.cart,
            total: this.total
          },
          { withCredentials: true }
        );
        this.cleanStore();
      } catch(error){ 

      }
    },

    async fetchSingleTransport(id){
      try{
        const response = await axios.get(
          "http://localhost/GameSpace/endpoints/fetch/fetch_single_transport.php",
          { withCredentials: false, params: { id } }
        );
        return response.data[0].name;
      } catch(error){}
    },

    async fetchSinglePayment(id){
      try{
        const response = await axios.get(
          "http://localhost/GameSpace/endpoints/fetch/fetch_single_payment.php",
          { withCredentials: false, params: { id } }
        );
        return response.data[0].name;
      } catch(error){}
    },

    async loadTransportAndPayment(){
      if(this.transport !== -1) this.transportName = await this.fetchSingleTransport(this.transport);
      if(this.payment !== -1) this.paymentName = await this.fetchSinglePayment(this.payment);
    }
  },

  persist:{
    pick: [
      'email','name','surname','city','street',
      'postal_code','telephone_number','transport','payment'
    ]
  }
});