<template>
    <div class="img_desc">
      <img :src="item.image" :alt="item.alt" loading="lazy">
      <div class="desc">
        <h1>{{ item.name }}</h1>
        <p>{{ item.description }}</p>  
        <p class = "platform">Platforma: <p v-for = "(value,index) in platforms" :key = "index">{{ value.name?.toUpperCase() }}</p></p>
        <div class="price_available">  
          <p :class = "{available: item.available === 'Na sklade', not_available: item.available === 'Nie je na sklade'}">{{ item.available }}</p>
          <p class = "price">{{item.price}}€</p>
        </div>
        <button v-if = "item.available === 'Na sklade'" @click = "addToCart(item.id)"><i class="fas fa-shopping-cart"></i>Do Košíka</button>
      </div>
    </div>
</template>

<script>
  import {useCartStore} from '../stores/cart'
  import Success from '../components/Success.vue'
  import Error from '../components/Error.vue'
 export default{
    data(){
      return{
         item: {},
         cartStore: null,
         reskey: 0,
         platforms: []
        
      }
    },

    components:{
       Error,
       Success
    }, 
    
    created(){
        this.cartStore = useCartStore();
    },
        methods:{
             async fetchDetail(){
                  try{
                       const slug = this.$route.params.slug;
                       const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/singleItem.php",{
                           params: { slug },
                           withCredentials: false
                       });
                       this.item = response.data;
                  } catch(error){

                  }
             },

             addToCart(id){
                 this.cartStore.add(id);
                 this.reskey++;
             },

             async fetchPlatform(){
                 try{
                      const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchPlatforms.php",{
                        params: {slug: this.$route.params.slug},
                        withCredentials: false
                      });
                      this.platforms = response.data;
                 } catch(error){

                 }
             }
        },
        mounted(){
          this.fetchDetail();
          this.fetchPlatform();
        },

        
  watch:{
    '$route.params.slug'(){
        this.fetchDetail();
    }
  }
 }
</script>

<style scoped lang = "scss">

   
   .message{
      display: flex;
      flex-direction: column;
      width: 100%;
      justify-content: center;
      align-items: center;

   }

    .img_desc {
    display: flex;
    justify-content: space-between;
    gap: 30px;

    img {
      @include image($height:500px, $width:500px);
    }

    .desc {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 18px;
      padding: 10px 0;

      .platform{
        display: flex;
        flex-direction: row;
        gap: 5px;

        p{
          font-weight: 700;
          color: $dark_blue;
        }
      }

      h1 {
        font-size: 28px;
        font-weight: 700;
        color: $dark_blue;
        margin-bottom: 5px;
      }

      p {
        font-size: 16px;
        color: #2a3a55;
        line-height: 1.5;
      }

      .price_available {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #f0f6ff;
        padding: 15px;
        border-radius: 12px;
        border: 1px solid #c7dbff;
        font-weight: 700;

        .price {
          font-size: 1.1rem;
          font-weight: 700;
          color: #0053d6;
        }

        .available {
          font-size: 1.1rem;
          font-weight: 600;
          color: #0c7a12;
        }

        .not_available{
          color: red;
          font-weight: 600;
        }
      }

      button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background-color: $blue;
        color: white;
        font-weight: 600;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.25s ease, box-shadow 0.25s ease;

        i {
          margin-right: 10px;
        }

        &:hover {
          background-color: #1a63e5;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.4);
        }
      }
    }
  }

  @media only screen and (max-width: 800px) {
     .img_desc{
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 5px;
        img{
          width: 100%;
          height: 300px;
        }
     }

     .desc{
      width: 100%;
     }
  }
</style>