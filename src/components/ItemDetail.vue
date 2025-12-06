 <template>
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
    </template>

<script>
 export default{
    props:['item']
 }
</script>

<style scoped lang = "scss">
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
</style>