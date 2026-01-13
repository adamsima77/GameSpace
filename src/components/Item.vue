<template>
  <div class="box">
    <RouterLink :to="{ name: parentRouteName, params: { slug: item.slug } }">
      <img :src="item.image" :alt="item.alt" loading="lazy"/>
    </RouterLink>
    <div class="title_desc">
      <RouterLink :to="{ name: parentRouteName, params: { slug: item.slug } }">
        <h2>{{ item.name }}</h2>
      </RouterLink>
      <p class = "platform" v-if = "platforms.length > 0"><p v-for = "(value,index) in platforms" :key = "index">{{ value.name?.toUpperCase() }}</p></p>
      <p>{{ sliceText(item.description) }}</p>
    </div>
    <hr class="item_hr" />
    <div class="price_available">
      <p :class="defineAvailability(item.available)">{{ item.available }}</p>
      <p class="price">{{ item.price }}€</p>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    item: { type: Object, required: true },
    parentRouteName: { type: String, required: true }
  },

  data(){
    return{
        platforms: []
    }
  },

  methods: {
    defineAvailability(value) {
      return value === "Na sklade" ? "available" : "not_available";
    },

    sliceText(description, maxLength = 150){
        return description.length > maxLength ? description.slice(0,maxLength) + "..." : description;
    },

       async fetchPlatform(){
                 try{
                      const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetchPlatforms.php",{
                        params: {slug: this.item.slug},
                        withCredentials: false
                      });
                      this.platforms = response.data;
                 } catch(error){

                 }
        }
  },

  mounted(){
    this.fetchPlatform();
  }
}
</script>


<style scoped lang = "scss">

    .available{
        color: green;
    }

    .not_available{
        color: red;
    }
    .box{
        @include flex-between($align: left, $direction: column, $space_around:space-between);
        
        width: 20%;
        border: 1px solid rgb(178, 178, 178);
        padding: $padding_20;
        border-radius: 10px;
        box-shadow: $box_sh_boxes;
        min-height: 400px;
        img{
             @include image($height: 280px);
             transition: opacity 0.5s ease-in-out;

             &:hover{
                @include hover-transition($opacity:0.9);
             }
        }

         .title_desc{
            display: flex;
            flex-direction: column;
            margin-top: 15px;

            .platform{
                font-weight: 700;
                margin-top: 5px;
            }
           
            p{
              margin-bottom: 10px;
            }
            h2{
                  text-decoration: none;
                  border-bottom: 3px solid transparent;
                  transition: border-color 0.3s ease;

                  &:hover{
                    border-color: black;
                  }
            }
         }
           .item_hr{
                border: 1px solid rgb(178, 178, 178);
                margin-top: auto;
            }
        .price_available{
            @include flex-between($space_around: space-between);
             margin-top: 10px;
            .price{
                font-weight: 700;
                font-size: 19px;
            }
        }
    }

    @media only screen and (max-width: 800px) {
    .box{
        width: 88%;
        margin-bottom: 25px;        
    }

   
}

</style>