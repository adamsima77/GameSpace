<template>
    <div class = "wrapper">
        <UserSettingsSidebar></UserSettingsSidebar>
        <div class = "wrapp">
            <router-view></router-view>
        </div>
    </div>
</template>

<script>
import UserSettingsSidebar from '../../../components/UserSettingsSidebar.vue';
export default{
    
    components:{
        UserSettingsSidebar
    },


}
</script>

<style scoped lang = "scss">
    .wrapper {
    display: flex;
    flex-direction: row; 
    justify-content: flex-start;
    padding: 25px;
    width: 90%;
    gap: 10px; 
    .wrapp {
        flex: 1; 
        display: flex;
        flex-direction: column;
        gap: 25px;
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border-radius: 15px;
        padding: 20px;
    }
}

@media only screen and (max-width: 810px) {
   .wrapper{
      flex-direction: column;
      width: 100%;
      padding: 0;
      .wrapp{
        padding: 0;
        width: 100%;
      }
   }
}


</style>