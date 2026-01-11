<template>
     <AdminSidebar></AdminSidebar>
     <router-view></router-view>
</template>


<script>
import AdminSidebar from '../../components/AdminSidebar.vue';
export default{
    components:{
        AdminSidebar
    }
}
</script>

<style scoped lang = "scss">

</style>