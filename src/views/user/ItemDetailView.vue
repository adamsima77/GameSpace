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

        <div class = "reviews" v-else>
           <p v-if = "reviews.length == 0">Neboli pridané žiadne užívateľské recenzie.</p>
           <div class = "review_box" v-else v-for = "(value,index) in reviews" :key = "index">
               <h3>{{ value.name }} {{ value.last_name }}</h3>
              <div class="rating">
                  <i v-for="n in 5" :key="n" 
                  :class="n <= value.rating ? 'fas fa-star yellow_star' : 'far fa-star empty_star'">
                  </i>
              </div>
               <p>{{ value.description }}</p>
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
      maxScrollLeft: 0
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
        params: {slug},
        withCredentials: false
      });
      this.reviews = response.data;
  },
  },

  mounted() {
    this.fetchDesc();
    this.recommendedProducts();
    this.fetchReviews();
  },
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

    .review_box {
      display: flex;
      flex-direction: column;
      background-color: white;
      border-radius: 15px;
      padding: 20px;
      box-shadow: $box_sh_boxes;
      gap: 9px;

      h3 {
        font-size: 20px;
        font-weight: 700;
        color: $dark_blue;
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