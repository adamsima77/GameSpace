<template>
    <div class = "wrapper">
     <AdminSidebar></AdminSidebar>
     <router-view></router-view>
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
    justify-content: center;
    width: 80%;
    margin: 0 auto;
    gap: 15px;
  }
</style>