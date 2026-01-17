<template>
  <div class="dashboard-page">
    <div class="dashboard-box">
      <h1>Prehľad</h1>

      <div class="kpis">
        <KPICard
          v-for="(value, index) in res"
          :key="index"
          :item="value"
        />
      </div>
    </div>
  </div>
</template>


<script>
import KPICard from '../../components/KPICard.vue';

export default{
    data(){
        return{
            res: []
        }
    },

    components:{
        KPICard
    },

    methods:{
        async fetchKPIs(){
            try{
                 const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_kpis.php",
                    {withCredentials: false}
                 );
                 this.res = response.data;
            } catch(error){

            }
        }
    },

    mounted(){
        this.fetchKPIs();
    }
}
</script>

<style scoped lang="scss">
.dashboard-page {
       display: flex;
       flex-direction: column;
       padding: 20px;
       height: auto;
       width: 100%;
       margin-top: 100px;
       place-self: center;
       max-width: 1200px;

       h1{
        text-align: center;
       }
}

.dashboard-box {
   background-color: white;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        gap: 15px;
        min-width: 0;     
        width: 100%;
        box-shadow: $box_sh_boxes;
         place-self: center;
}

.kpis {
 display: flex;
  gap: 35px;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}

@media (max-width: 810px) {
  .kpis {
    flex-direction: column;
    gap: 20px;
  }

  .kpis > * {
    width: 330px;
  }
}
</style>