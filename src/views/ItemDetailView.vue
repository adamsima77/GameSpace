<template>
   <div class="ItemDetail">
   
    <ItemDetail :item = "{}"></ItemDetail>
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
            {{ someJson.desc }}
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
   import ItemDetail from '../components/ItemDetail.vue';
   export default{
    props:['item','reviews'],
     data(){
        return{
            showDescription:true
        }
     },
     components:{
        ItemDetail
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