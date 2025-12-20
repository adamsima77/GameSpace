<template>
  <div class="checkout">
    <h1>Rekapitulácia objednávky</h1>

    <section class="card">
      <h2>Osobné údaje</h2>
      <div class="row"><span>Meno</span><strong>{{ cartStore.name }}</strong></div>
      <div class="row"><span>Priezvisko</span><strong>{{ cartStore.surname }}</strong></div>
      <div class="row"><span>E-mail</span><strong>{{ cartStore.email }}</strong></div>
      <div class="row"><span>Telefón</span><strong>{{ cartStore.telephone_number }}</strong></div>
    </section>

    <section class="card">
      <h2>Adresa</h2>
      <div class="row"><span>Mesto</span><strong>{{ cartStore.city }}</strong></div>
      <div class="row"><span>Ulica</span><strong>{{ cartStore.street }}</strong></div>
      <div class="row"><span>PSČ</span><strong>{{ cartStore.postal_code }}</strong></div>
    </section>

    <section class="card">
      <h2>Doprava a platba</h2>
      <div class="row"><span>Doprava</span><strong>{{ cartStore.transportName}}</strong></div>
      <div class="row"><span>Platba</span><strong>{{ cartStore.paymentName }}</strong></div>
    </section>

    <button class="confirm" @click = "placeOrder()">Potvrdiť objednávku</button>
  </div>
</template>

<script>
import { useCartStore } from '../../../stores/cart'
export default{
    data(){
        return{
            cartStore: null
        }
    },

    created(){
        this.cartStore = useCartStore();
        this.cartStore.loadTransportAndPayment();
    },

    methods:{
        async placeOrder(){
            await this.cartStore.placeOrder();
            this.$router.push({name: 'successful-order'});
        }
    }
}

</script>

<style scoped lang = "scss">
.checkout {  
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 25px;

  h1 {
    font-size: 28px;
    margin-bottom: 10px;
  }

  .card {
    background: #fff;
    border-radius: 14px;
    padding: 20px;
    box-shadow: $box_sh_boxes;
    display: flex;
    flex-direction: column;
    gap: 12px;

    h2 {
      font-size: 18px;
      margin-bottom: 8px;
      color: #1a1a1a;
    }

    .row {
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #eef2f7;
      padding-bottom: 6px;
      font-size: 15px;

      span {
        color: #6b7280;
      }

      strong {
        color: #111827;
        font-weight: 600;
      }

      &:last-child {
        border-bottom: none;
      }
    }
  }

  .confirm {
    background-color: $blue;
    color: white;
    padding: 16px;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    cursor: pointer;
    transition: background-color 0.3s ease;

    &:hover {
      background-color: $dark_blue;
    }
  }
}

@media only screen and (max-width: 800px) {
   .checkout{
    justify-content: center;
    align-items: center;
    h1{
      text-align: center;
    }
   .card{
    width: 100%;
   }
   }
}

</style>