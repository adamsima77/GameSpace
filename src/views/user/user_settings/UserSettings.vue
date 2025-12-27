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
  width: 100%;
  gap: 10px;

 .wrapp {
    display: flex;
    flex-direction: column;
    width: 100%;
    background-color: white;
    border-radius: 15px;
    padding: 10px;
    position: relative;
}
}

@media only screen and (max-width: 810px) {
  .wrapper {
    flex-direction: column;
    width: 100%;
    padding: 15px; 
    gap: 15px;

    .wrapp {
      
    }
  }
}


</style>