<template>
    <div class = "wrapper">
      <div class = "wrapp">
            <h1>Prehľad KPI</h1>
            <div class = "kpis">
             <KPICard v-for = "(value,index) in res" :key = index :item = "value">
             </KPICard>
             
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


<style lang = "scss" scoped>
    .wrapper{
       display: flex;
       flex-direction: column;
       padding: 20px;
       height: auto;
       width: 100%;

       .wrapp{
        background-color: white;
        padding: 25px;
        border-radius: 15px;
        display: flex;
        flex-direction: column;
        gap: 15px;
        min-width: 0;     
        width: 100%;
        box-shadow: $box_sh_boxes;

        .kpis{
            display: flex;
            flex-direction: row;
            gap: 35px;
            justify-content: space-between;
            width: 100%;
            align-items: center;
        }
       }
    }
</style>