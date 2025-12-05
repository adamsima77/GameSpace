<template>
  <div class="ItemDetail">
    <div class="img_desc">
      <img :src="item.img" :alt="item.alt">
      <div class="desc">
        <h1>{{ item.title }}</h1>
        <p>{{ item.desc }}</p>  
        <div class="price_available">  
          <p>{{ item.available }}</p>
          <p>{{item.price}}</p>
        </div>
        <button><i class="fas fa-shopping-cart"></i>Do Košíka</button>
      </div>
    </div>

    <div class="hr_wrapp">
      <hr>
      <div class="wrapper">
            <button @click="showDescription = true" :class="{ active: showDescription }">Popis</button>
            <button @click="showDescription = false" :class="{ active: !showDescription }">Recenzie</button>
      </div>

      <div class="tab_content">
        <div class="tab desc_tab" v-if = "showDescription">
          <h3>Popis produktu</h3>
          <p>
            {{ item.desc }}
          </p>
        </div>
        <div class="tab reviews_tab" v-else-if="!showDescription">
          <h3>Recenzie</h3>
          <p v-for = "(review,index) in reviews" :key = "index">{{ review.comment }}</p>
        </div>
      </div>
    </div>
    <h1>Odporúčané produkty</h1>
    <div class = "recommended_products">
      
    </div>
  </div>
</template>


<script>
   export default{
    props:['item','reviews'],
     data(){
        return{
            showDescription:true
        }
     }
   }
</script>


<style scoped lang="scss">
.ItemDetail {
  display: flex;
  flex-direction: column;
  min-width: 100%;
  height: auto;
  gap: 35px;
  padding: 25px;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 4px 15px rgba(0, 50, 150, 0.08);
  border: 1px solid #e3ecff;

  .img_desc {
    display: flex;
    justify-content: space-between;
    gap: 30px;

    img {
      @include image();
      border-radius: 12px;
      max-width: 45%;
    }

    .desc {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 18px;
      padding: 10px 0;

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

        .price {
          font-size: 22px;
          font-weight: 700;
          color: #0053d6;
        }

        .available {
          font-size: 16px;
          font-weight: 600;
          color: #0c7a12;
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
</style>
