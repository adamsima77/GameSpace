<template>
    <div class = "wrapper">
     <AdminSidebar></AdminSidebar>
      <div class="main-content">
     <router-view></router-view>
     </div>
    </div>
</template>


<script>
import AdminSidebar from '../../components/AdminSidebar.vue';
export default{
    components:{
        AdminSidebar
    }
}
</script>

<style lang = "scss" scoped>
  .wrapper{
      display: flex;
  min-height: 100vh;
  width: 100%;

  .main-content {
  width: 100%;
  padding: 25px;
  display: flex;
  flex-direction: column;
  gap: 20px;
  background-color: #f9f9f9;
}
  }

  @media (max-width: 800px) {
  .wrapper {
    flex-direction: column;
    width: 100%;
  }
}
</style>