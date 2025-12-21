<template>
<div class="wrapper"  v-if = "cart_content.length > 0">
  <CartSteps :active = "active"></CartSteps>
  <div class = "cart" v-if = "active == 1">
    <h1>Produkty v košíku</h1>
         <div class = "box" v-for = "(item,index) in cart_content" :key = "index">
               <img :src="item.image" :alt="item.alt">
               <RouterLink :to = "{name: 'cart-item-detail', params:{slug: item.slug}}"><h2>{{ item.name }}</h2></RouterLink>
               <div class = "quantity">
               <button v-if = "item.quantity > 0" @click = "decrementQuantity(item.id)">-</button>
               <p>{{ item.quantity }}</p>
               <button @click = "addQuantity(item.id)">+</button>
               </div>
               <div class = "price_trash">
               <p>{{ item.price }}€</p>
               <i class="fas fa-trash" @click = "removeFromCart(item.id)"></i>
               </div>
         </div>
       
         <p class = "total">Výsledná cena: {{ Math.round(cartStore.total * 100) / 100.0 }}€</p>
    </div>
    <router-view></router-view>
    <RouterLink :to = "{name: 'delivery'}" class = "delivery" v-if = "active == 1">Prejsť na doručenie</RouterLink>
</div>

<div class = "wrapper" v-else>
     <CartSteps :active = "active"></CartSteps>
       <div class = "empty">
            <p>Košík je prázdny.</p>
         </div> 
</div>

</template>


<script>
import CartSteps from '../../../components/CartSteps.vue';
import {useCartStore} from '../../../stores/cart'
export default{
     data(){
        return{
            active: 1,
            cartStore: null,
        }
     },

    created(){
         this.cartStore = useCartStore(); 
         this.cartStore.fetchCart();
    },
     watch:{
      $route(to, from) {
      switch (to.name) {
        case 'cart':
          this.active = 1;
          break;
        case 'delivery':
          this.active = 2;
          break;
        case 'checkout':
          this.active = 3;
          break;
        default:
          this.active = 1;
      }
    }
     }, 

     computed: {
       cart_content() {
        return this.cartStore.cart;
     }
   },

   methods:{
      removeFromCart(id){
            this.cartStore.removeFromCart(id);
      },
      decrementQuantity(id){
           this.cartStore.decrementQuantity(id);
      },

      addQuantity(id){
         this.cartStore.addQuantity(id);
      }
   },
     

     mounted(){
          switch (this.$route.name) {
      case 'cart':
        this.active = 1;
        break;
      case 'delivery':
        this.active = 2;
        break;
      case 'checkout':
        this.active = 3;
        break;
      default:
         this.active = 1;
      }
     },

     components:{
         CartSteps
     }
}

</script>


<style scoped lang = "scss">
 .wrapper {
  width: 100%;
  display: flex;
  flex-direction: column;
  background-color: white;
  border-radius: 15px;
  padding: 35px;
  box-shadow: $box_sh_boxes;
  margin-top: 10px;

  .quantity{
     display: flex;
     gap: 15px;
  }

  .price_trash{
    display: flex;
    gap: 15px;
  }

  .total{
    margin-left: auto;
    width: 15%;
    color: black;
    text-align: center;
    font-weight: 700;
    border-radius: 15px;
  }

  .empty{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 100px;
    p{
      font-size: 1.5rem;
      font-weight: 700;
    }
  }

  .delivery{
     background-color: $blue;
     color: white;
     padding: 13px;
     border-radius: 10px;
     width: 15%;
     margin-left: auto;
     margin-top: 50px;
     transition: background-color 0.5s ease-in-out;
     text-align: center;

     &:hover{
        background-color: $dark_blue;
     }
  }

  .cart {
  margin-top: 30px;

  h1 {
    margin-bottom: 20px;
  }

  .box {
    display: flex;
    align-items: center;
    gap: 20px;
    padding: 15px;
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    margin-bottom: 15px;
    background-color: #fafafa;
    transition: box-shadow 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    
    img {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 8px;
    }

    a {
      flex: 1;
      font-size: 1.05rem;
      font-weight: 600;
   
    }

    button {
      width: 30px;
      height: 30px;
      border: none;
      background-color: #f0f0f0;
      color: #333;
      font-weight: 600;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.2s ease;

      &:hover {
        background-color: #ddd;
      }
    }

    p {
      margin: 0 10px;
      font-size: 16px;
      font-weight: 500;
      color: #555;
    }

    i {
      color: #ff4d4f;
      cursor: pointer;
      font-size: 18px;
      transition: color 0.2s ease;

      &:hover {
        color: #e60000;
      }
    }
  }
}

.steps {
  display: flex;
  align-items: center;
  gap: 50px;
  justify-content: center;
}

.step {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;

  p {
    width: 55px;
    height: 55px;
    border-radius: 50%;
    background-color: #fff;
    box-shadow: $box_sh_boxes;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 18px;
    color: #aaa;
    transition: all 0.3s ease;
  }

  span {
    font-size: 14px;
    color: #777;
    text-align: center;
  }

  &.active {
    p {
      background-color: $blue;
      color: #fff;
    }

    span {
      color: $blue;
      font-weight: 500;
    }
  }

  &.completed {
    p {
      background-color: #10b981;
      color: #fff;
    }

    span {
      color: #10b981;
    }
  }
}

.line {
  width: 80px;
  height: 2px;
  background-color: #ddd;
}

.step.completed + .line {
  background-color: #10b981;
}
}

@media only screen and (max-width: 800px) {
     .wrapper{
          width: 85%;
           .delivery{
              width: 100%;
              margin-top: 15px;
              margin-right: 25px;
            }
          .cart{
            justify-content: center;
            align-items: center;
            h1{
              
              text-align: center;
               
            }

          .total{
            display: inline;
            }

           
          }

          .box{
            flex-direction: column;
            img{
               min-width: 240px;
               min-height: 180px;
            }

            h2{
              text-align: center;
            }
            .quantity{
              display: flex;
              flex-direction: row;
              gap: 15px;
            }
          }

          .price_trash{
            display: flex;
            width: 100%;
            justify-content: space-between;
            p{
              margin: 0;
            }
          }

        
     }
}


</style>