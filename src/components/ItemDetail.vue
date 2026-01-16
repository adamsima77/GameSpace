<template>
    <div class="img_desc">
      <img :src="item.image" :alt="item.alt" loading="lazy">
      <div class="desc">
        <h1>{{ item.name }}</h1>
        <p>{{ item.description }}</p>  
        <div class="price_available">  
        <p 
  :class="{ available: isAvailable, not_available: !isAvailable }"> 
  {{ isAvailable ? 'Na sklade' : 'Nie je na sklade' }}
</p>
          <p class = "price">{{item.price}}€</p>
        </div>

<div class="platforms" v-if = "!isPlatformIndependent">
  <button 
    v-for="platform in platforms"
    :key="platform.platform_id"
    :class="{ active: selectedPlatform === platform.platform_id }"
    @click="selectedPlatform = platform.platform_id" class = "platform"
  >
    {{ platform.name }}
  </button>
</div>

      <button :disabled="!isAvailable" @click="addToCart" :class = "{notAvailable: !isAvailable}"><i class="fas fa-shopping-cart"></i>
       Do Košíka</button>
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
          platforms: [],     
          selectedPlatform: null
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

             addToCart(){
                 this.cartStore.add(this.item.id,this.selectedPlatform);
             },

             async fetchPlatform(){
                 try{
                      const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchPlatforms.php",{
                        params: {slug: this.$route.params.slug},
                        withCredentials: false
                      });
                      this.platforms = Array.isArray(response.data) ? response.data : [];

                      if(this.platforms.length > 0){
                          this.selectedPlatform = this.platforms[0].platform_id;
                      }
                   
                 } catch(error){

                 }
             },

              titleBetterFormat() {
                   const slug = this.$route.params.slug
                   if (!slug) return ''
                   const arr = slug.split('-')
                   const better = []

                   for (let i = 0; i < arr.length; i++) {
                      let word = arr[i]
                      word = word.charAt(0).toUpperCase() + word.slice(1)
                      better.push(word)
                   }
                   return better.join(' ')
              },
        },

        mounted(){
          this.fetchDetail();
          this.fetchPlatform();
          document.title = this.titleBetterFormat();
        },

  computed: {
selectedPlatformData() {
  return this.platforms.find(
    p => Number(p.platform_id) === Number(this.selectedPlatform)
  );
},

 isPlatformIndependent(){
        return this.platforms.some(p => p.name === 'Platform Independent');
 }, 

selectedPlatformStock() {
  return this.selectedPlatformData
    ? Number(this.selectedPlatformData.stock)
    : 0;
},

isAvailable() {
  return this.selectedPlatformStock > 0;
}
},
      
  watch:{
    '$route.params.slug'(){
        this.fetchDetail();
        this.fetchPlatform();
        document.title = this.titleBetterFormat();
    }
  }
 }
</script>

<style scoped lang="scss">
.message{
  display: flex;
  flex-direction: column;
  width: 100%;
  justify-content: center;
  align-items: center;
}

.img_desc{
  display: flex;
  justify-content: space-between;
  gap: 30px;

  img{
    @include image($height:500px, $width:500px);
  }

  .desc{
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 18px;
    padding: 10px 0;

    h1{
      font-size: 28px;
      font-weight: 700;
      color: #0c2a55;
      margin-bottom: 5px;
    }

    p{
      font-size: 16px;
      color: #2a3a55;
      line-height: 1.5;
    }

    .price_available{
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #f0f6ff;
      padding: 15px;
      border-radius: 12px;
      border: 1px solid #c7dbff;
      font-weight: 700;

      .price{
        font-size: 1.1rem;
        font-weight: 700;
        color: #0053d6;
      }

      .available{
        font-size: 1.1rem;
        font-weight: 600;
        color: #0c7a12;
      }

      .not_available{
        font-size: 1.1rem;
        font-weight: 600;
        color: red;
      }
    }

    .platforms{
      display: flex;
      flex-direction: row;
      gap: 15px;

      button{
        background-color: #f0f0f0;
        color: #333;
        padding: 10px 16px;
        border: 1.5px solid #d9d9d9;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.25s ease;
        flex: 1 1 auto;
        text-align: center;
        min-width: 80px;

        &:hover{
          background-color: #e0f0ff;
          border-color: #2979ff;
        }

        &.active{
          background-color: #2979ff;
          color: #fff;
          border-color: #2979ff;
          box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        &.notAvailable{
          background-color: grey !important;
          cursor: not-allowed;
          box-shadow: none;
          color: #fff;

          &:hover{
            background-color: grey;
            box-shadow: none;
          }
        }
      }
    }

    .platform{
      display: flex;
      flex-direction: row;
      gap: 5px;

      p{
        font-weight: 700;
        color: #0c2a55;
      }
    }

    button{
      width: 100%;
      padding: 12px;
      border: none;
      border-radius: 10px;
      background-color: #0053d6;
      color: white;
      font-weight: 600;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.25s ease, box-shadow 0.25s ease;

      i{
        margin-right: 10px;
      }

      &:hover{
        background-color: #1a63e5;
        box-shadow: 0 4px 12px rgba(41,121,255,0.4);
      }

      &.notAvailable{
        background-color: grey !important;
        cursor: not-allowed;
        box-shadow: none;
        color: #fff;

        &:hover{
          background-color: grey;
          box-shadow: none;
        }
      }
    }
  }
}

@media only screen and (max-width: 800px) {
  .img_desc {
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 5px;

    img {
      width: 100%;
      height: 300px;
    }

    .desc {
      width: 100%;

      .platforms {
        flex-direction: column;
        gap: 10px;
      }
    }
  }
}
</style>
