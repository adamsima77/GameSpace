<template>
  <div class="item-detail-page">
    <ItemDetail />

    <div class="hr_wrapp">
      <hr />
      <div class="wrapper">
        <button @click="showDescription = true" :class="{ active: showDescription }">Popis</button>
        <button @click="showDescription = false" :class="{ active: !showDescription }">Recenzie</button>
      </div>

      <div class="tab_content">
        
        <div class="tab desc_tab" v-if="showDescription">
          <h1>Popis produktu</h1>
          <p v-html="res.html_description"></p>
        </div>

       
        <div class="reviews" v-else>
         
          <button 
            v-if="userStore.user_id && !hasUserPostedReview" :class = "{active: show_form}"
            @click="show_form = !show_form" 
            class="show_form"
          >
            Pridať recenziu
          </button>

  
          <p v-if="!userStore.user_id">
            Chcete pridať recenziu ? 
            <RouterLink class="login" :to="{name: 'login'}">Prihláste sa</RouterLink>
          </p>

          
          <div class="add_review" v-if="show_form && userStore.user_id">
            <h2>Pridať recenziu</h2>
            <label for="text">Popis:
              <textarea id="text" placeholder="Zadajte text recenzie..." v-model="review_text"></textarea>
            </label>
            <div class="rating">
              <i 
                v-for="index in 5" 
                :key="index" 
                @click="userAddReviewRating = index"
                :class="index <= userAddReviewRating ? 'fas fa-star yellow_star' : 'far fa-star empty_star'"
              ></i>
            </div>
            <button @click="addReview()">Pridať recenziu</button>
          </div>

         
          <p v-if="reviews.length == 0">Neboli pridané žiadne užívateľské recenzie.</p>

    
          <div class="review_box" v-else v-for="(value, index) in reviews" :key="index">
            <div class="name_icons">
              <h3>{{ value.name }} {{ value.last_name }}</h3>
              <div class="icons" v-if="userStore.user_id">
                <i class="fas fa-edit" @click = "setEdit(value.rating, value.description)"></i>
                <i class="fas fa-trash" @click="deleteReview()"></i>
              </div>
            </div>
            <div class="rating">
              <i v-if = "!editMode"
                v-for="n in 5" 
                :key="n" 
                :class="n <= value.rating ? 'fas fa-star yellow_star' : 'far fa-star empty_star'"
              ></i>
                
              <i v-if = "editMode"
                v-for="index in 5" 
                :key="index" 
                @click="editRating = index"
                :class="index <= editRating ? 'fas fa-star yellow_star' : 'far fa-star empty_star'"
                ></i>
               
            </div>
            <p v-if = "!editMode">{{ value.description }}</p>
            <textarea type="text" v-if = "editMode" value = "" v-model = "editReviewText"></textarea>
            <button @click = "editReview()" v-if = "editMode">Upraviť recenziu</button>
          </div>

          <hr />

       
          <div class="pagination">
            <p 
              v-for="index in Math.ceil(reviews_max / review_limit)" 
              :key="index" 
              :class="{active: actual_page === index}" 
              @click="actual_page = index"
            >
              {{ index }}
            </p>
          </div>
        </div>
      </div>
    </div>

  
    <div class="title_arrows">
      <h1>Odporúčané produkty</h1>
      <div class="arrows">
        <i
          class="fas fa-arrow-left"
          @click="scrollLeft"
          :class="{ active: recommendedScrollPosition > 0, disabled: recommendedScrollPosition <= 0 }"
        ></i>
        <i
          class="fas fa-arrow-right"
          @click="scrollRight"
          :class="{ active: recommendedScrollPosition < maxScrollLeft, disabled: recommendedScrollPosition >= maxScrollLeft - 20 }"
        ></i>
      </div>
    </div>

    <div class="recommended_products" @scroll="onScroll">
      <Item
        v-for="(item, index) in recommended_products"
        :key="index"
        :item="item"
        parent-route-name="item-detail"
      />
    </div>
  </div>
</template>

<script>
import ItemDetail from '../../components/ItemDetail.vue';
import Item from '../../components/Item.vue';
import { useUserStore } from '../../stores/user';

export default {
  props: ['item'],
  components: { ItemDetail, Item },
  data() {
    return {
      showDescription: true,
      res: {},
      recommended_products: [],
      reviews: [],
      recommendedScrollPosition: 0,
      maxScrollLeft: 0,
      review_limit: 10,
      reviews_max: 0,
      actual_page: 1,
      userStore: null,

      userAddReviewRating: -1,
      hasUserPostedReview: null,
      review_text: '',
      show_form: false,
      editMode: false,
      editRating: -1,
      editReviewText: ''
    };
  },
  methods: {
    onScroll(event) {
      const container = event.target;
      this.recommendedScrollPosition = container.scrollLeft;
    },
    scrollRight() {
      const container = this.$el.querySelector('.recommended_products');
      container.scrollBy({ left: 200, behavior: 'smooth' });
    },
    scrollLeft() {
      const container = this.$el.querySelector('.recommended_products');
      container.scrollBy({ left: -200, behavior: 'smooth' });
    },
    async fetchDesc() {
      try {
        const slug = this.$route.params.slug;
        const response = await this.$axios.get(
          'http://localhost/GameSpace/endpoints/fetch/fetch_item_html_desc.php',
          { params: { slug }, withCredentials: false }
        );
        this.res = response.data;
      } catch (error) {
      }
    },
    async recommendedProducts() {
      try {
        const slug = this.$route.params.slug;
        const response = await this.$axios.get(
          'http://localhost/GameSpace/endpoints/fetch/fetch_recommended_products.php',
          { params: { slug }, withCredentials: false }
        );
        this.recommended_products = response.data;

        this.$nextTick(() => {
          const container = this.$el.querySelector('.recommended_products');
          this.maxScrollLeft = container.scrollWidth - container.clientWidth;
        });
      } catch (error) {
      }
    },
    
    async fetchReviews(){
      const slug = this.$route.params.slug;
      const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_reviews.php",{
        params: {slug: slug, limit: this.review_limit, offset: ((this.actual_page - 1) * this.review_limit)},
        withCredentials: false
      });
      this.reviews = response.data;
  },
      async getMaxReviews(){
        try{
             const slug = this.$route.params.slug;
             const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/count_reviews.php",{
              params: {slug},
              withCredentials: false});
              return response.data.total_reviews;
        } catch(error){

        }
      },

      async addReview(){
          try{
            if(this.review_text === '' || this.userAddReviewRating === -1) return;
              const response = await this.$axios.post("http://localhost/GameSpace/endpoints/fetch/addReview.php",
                {text: this.review_text, rating: this.userAddReviewRating, slug: this.$route.params.slug},
                {withCredentials: true}
              );
              this.fetchReviews();
              this.hasUserPostedReview = -1
              this.userAddReviewRating = -1;
              this.review_text = '';
              this.show_form = false;
          } catch(error){

          }
      },

      async postedReview(){
         try{
             const slug = this.$route.params.slug;
             const response = await this.$axios.post("http://localhost/GameSpace/endpoints/fetch/has_user_posted_review.php", {
              slug: slug
              }, 
              {
              withCredentials: true
             });
             this.hasUserPostedReview = response.data.hasPosted;
         } catch(error){
             this.hasUserPostedReview = false;
         }
      },

      async editReview(){
          try{
              if(!this.editReviewText || this.editRating === -1) {alert("Recenzia nesmie byť prázdna !"); return;}
              const response = await this.$axios.post("http://localhost/GameSpace/endpoints/update/save_review.php",
              {rating: this.editRating, text: this.editReviewText, slug: this.$route.params.slug},
              {withCredentials: true});
              this.editMode = false;
              this.fetchReviews();
              if(response.data.message === 'success') alert("Recenzia bola úspešne upravená !");
              else alert("Nastala chyba pri úprave recenzie !");
          } catch(error){

          }
      },

      async deleteUserReview(){
        try{
            const response = await this.$axios.post("http://localhost/GameSpace/endpoints/delete/delete_user_review.php",
             {slug: this.$route.params.slug},{withCredentials: true});
            this.fetchReviews(); 
            this.hasUserPostedReview = false;
        } catch(error){

        }
      },

      async deleteReview(){
          if(confirm("Naozaj chcete vymazať túto recenziu ?")){
             await this.deleteUserReview();
          }
      },

      setEdit(rating, description){
         this.editMode = !this.editMode
         this.editRating = rating;
         this.editReviewText = description;
      }
  },

  created(){
      this.userStore = useUserStore();
  },

  async mounted() {
    await this.fetchDesc();
    await this.recommendedProducts();
    await this.fetchReviews();
    this.reviews_max = await this.getMaxReviews();
    this.postedReview();
  },

  watch:{
    actual_page(){
      this.fetchReviews();
    }
  }
};
</script>

<style scoped lang="scss">
.item-detail-page {
  display: flex;
  flex-direction: column;
  height: auto;
  gap: 35px;
  width: 100%;
  padding: 25px;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: $box_sh_boxes;
  border: 1px solid #e3ecff;
  overflow: hidden;

  .reviews {
    display: flex;
    flex-direction: column;
    gap: 20px;

    textarea{
    padding: 10px 14px;
    border-radius: 8px;
    border: 1.5px solid #b5d1ff;
    font-size: 15px;
    transition: all 0.2s ease;
    background-color: #ffffff;
    resize: none;
    overflow: none;      
    min-height: 200px;  
    max-height: 300px;  

    &:focus {
      outline: none;
      border-color: $blue;
      background-color: #e6f0ff;
    }
  }

  button {
    margin-top: 10px;
    align-self: flex-start;
    padding: 10px 18px;
    background-color: $blue;
    color: white;
    font-weight: 600;
    border-radius: 8px;
    border: none;
    cursor: pointer;
    transition: background-color 0.25s ease, box-shadow 0.25s ease;

    &:hover {
      background-color: $dark_blue;
      box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
    }
  }

  .rating {
    i {
      cursor: pointer;
      font-size: 20px;
      transition: transform 0.15s ease, color 0.2s ease;

      &:hover {
        transform: scale(1.15);
        color: gold;
      }
    }
  }

    .show_form{
       padding: 12px;
        border: none;
        background-color: $blue;
        color: white;
        font-weight: 600;
        width: 20%;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.25s ease, box-shadow 0.25s ease;
        &.active{
          background-color: $dark_blue;
        }

        &:hover {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }

        &.active {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }
    }

    .add_review{
      h2{
        margin: 0 auto;
        font-size: 26px;
      }
       display: flex;
       flex-direction: column;
       gap: 15px;
       background-color: white;
       padding: 20px;
       border-radius: 15px;
       width: 50%;
       border-radius: 25px;
       border: 1px solid black;

       textarea{
         resize: none;
         overflow: none;      
         min-height: 200px;  
         max-height: 300px;  
       }

      textarea{
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

       button {
              padding: 12px;
        border: none;
        background-color: $blue;
        color: white;
        font-weight: 600;
        width: 100%;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.25s ease, box-shadow 0.25s ease;
        margin: 0 auto;

        &:hover {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }

        &.active {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }
       }

        .rating {
    i.yellow_star {
      color: rgb(255, 255, 0); 
    }
    i.empty_star {
      color: #ccc;
    }
    i {
      cursor: pointer;
      font-size: 18px;
      transition: color 0.2s;
      &:hover {
        color: gold;
      }

    }
    }

       label{
        display: flex;
        flex-direction: column;
        gap: 5px;
       }

    }

    .login{
      color: $blue;
    }

    .pagination{
         display: flex;
         flex-direction: row;
         gap: 15px;
         justify-content: center;
         align-items: center;
         margin-top: 15px;
      p{
        background-color: white;
        box-shadow: $box_sh_boxes;
        padding: 10px;
        border-radius: 50%;
        width: 25px;
        height: 25px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease-in-out;

        &.active{
          background-color: $blue;
          color: white;
          &:hover{
            background-color: rgb(170, 170, 170);
            color: $dark_blue;
          }
        }

        &:hover{
           background-color: $dark_blue;
           color: white;
        }
      }
    }

    .review_box {
      display: flex;
      flex-direction: column;
      background-color: white;
      border-radius: 15px;
      padding: 20px;
      box-shadow: $box_sh_boxes;
      gap: 9px;

      .name_icons{
         display: flex;
         flex-direction: row;
         align-items: center;
         justify-content: space-between;

         .icons{
            display: flex;
            gap: 15px;
            cursor: pointer;

            i{
              opacity: 1;
              transition: opacity 0.5s ease-in-out;
              &:hover{
                 opacity: 0.5;
              }
            }

            i:nth-child(1){
                color: green;
            } 

            i:nth-child(2){
                color: red;
            }
         }

       h3 {
        font-size: 20px;
        font-weight: 700;
        color: $dark_blue;
      }

      }

     
      .rating {
        display: flex;
        flex-direction: row;
        gap: 3px;

        i.yellow_star {
          color: rgb(255, 255, 0);
        }

        i.empty_star {
          color: #ccc;
        }
      }

      p {
        font-size: 16px;
        color: #2a3a55;
        line-height: 1.6;
      }
    }
  }

  .title_arrows {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;

    .arrows {
      display: flex;
      flex-direction: row;
      gap: 15px;

      i {
        box-shadow: $box_sh_boxes;
        font-size: 1.2rem;
        padding: 15px;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.5s ease-in-out;

        &.active {
          background-color: $blue;
          border: 1px solid black;
          color: white;

          &:hover {
            background-color: $dark_blue;
          }
        }

        &.disabled {
          background-color: grey;
          color: white;
          pointer-events: none;
          cursor: not-allowed;
        }
      }
    }
  }

  .recommended_products {
    display: flex;
    flex-wrap: nowrap;
    max-width: 100%;
    scrollbar-width: none;
    overflow-x: auto;
    overflow-y: hidden;
    gap: 16px;
    border-radius: 10px;
    background-color: #f5f8ff;
    padding: 10px;

    & > * {
      flex: 0 0 auto;
      max-width: 250px;
      min-width: 250px;
    }
  }

  .hr_wrapp {
    display: flex;
    flex-direction: column;

    hr {
      border: 1px solid $blue;
    }

    .wrapper {
      display: flex;
      gap: 12px;
      margin-top: 15px;
      padding: 10px;
      background-color: #e6f0ff;
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(41, 121, 255, 0.1);

      button {
        padding: 12px;
        border: none;
        background-color: $blue;
        color: white;
        font-weight: 600;
        width: 20%;
        font-size: 16px;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.25s ease, box-shadow 0.25s ease;

        &:hover {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }

        &.active {
          background-color: $dark_blue;
          color: #ffffff;
          box-shadow: 0 4px 12px rgba(41, 121, 255, 0.3);
        }
      }
    }

    .tab_content {
      margin-top: 15px;
      padding: 15px;
      background-color: #f5f8ff;
      border-radius: 12px;
      border: 1px solid #c7dbff;
      box-shadow: 0 2px 8px rgba(41, 121, 255, 0.05);

      .tab {
        h3 {
          font-size: 20px;
          font-weight: 700;
          color: $dark_blue;
          margin-bottom: 10px;
        }

        p {
          font-size: 16px;
          color: #2a3a55;
          line-height: 1.6;
        }
      }
    }
  }
}

@media only screen and (max-width: 800px) {
  .item-detail-page {
    .recommended_products {
      padding: 0;
    }

    .title_arrows {
      flex-direction: column;
      justify-content: flex-start;
      align-items: flex-start;
      gap: 20px;

      .arrows {
        place-self: right;
      }
    }

    .wrapper {
      button {
        flex: 1;
      }
    }
  }
}
</style>