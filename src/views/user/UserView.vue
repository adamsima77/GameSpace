<template>
    <div class="page-wrapper">
      <div class = "header">
    <Navbar @activate-sidebar = "handleSidebar"></Navbar>
    <SubNav></SubNav>
    <Sidebar :active = "sidebarActive" @close = "sidebarActive = false"></Sidebar>
    </div>
    <main>
        <BreadCrumbs v-if = "showBreadcrumbs" :key="$route.fullPath"></BreadCrumbs>
        <router-view></router-view>
    </main>
    <Footer></Footer>
    </div>
</template>

<script>
import Navbar from '../../components/Navbar.vue';
import SubNav from '../../components/SubNav.vue';
import Footer from '../../components/Footer.vue';
import BreadCrumbs from '../../components/BreadCrumbs.vue';
import Sidebar from '../../components/Sidebar.vue'
export default{
  data(){
   return{
       showLogin: false,
       showBreadcrumbs: true,
       route : '',
       sidebarActive: false
   }
  },
  components:{
       Navbar,
       SubNav,
       Footer,    
       BreadCrumbs,
       Sidebar
  },
  methods:{
      handleSidebar(value){
          this.sidebarActive = value;
      }
  },
  computed:{

  },
  created(){
        this.route = this.$route.path;
        this.showBreadcrumbs = this.route !== '/';
  },

  mounted(){
  },

  watch:{
     '$route.path'(newPath){
           this.route = newPath;
           this.showBreadcrumbs = this.route !== '/';
     }
  }
}
</script>

<style lang="scss">

  .page_wrapper{
    .header{
      
  display: flex;
  flex-direction: column;
  gap: 50px;

    }
  }
main{
   @include flex-direction-center($align:center,$direction:column,$con:center);
   place-self: center;
   max-width: 90%;
   min-width: 90%;
   margin-top: 200px;
}

</style>