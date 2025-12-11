<template>
    <div :class="{ blurred: showLogin }" class="page-wrapper">
      <div class = "header">
    <Navbar @open-login="showLogin = true"></Navbar>
    <SubNav></SubNav>
    </div>
    <main>
        <BreadCrumbs v-if = "showBreadcrumbs" :key="$route.fullPath"></BreadCrumbs>
        <router-view></router-view>
    </main>
    <Footer></Footer>
    </div>
    <Login v-if="showLogin" @close="showLogin = false" />
</template>

<script>
import Navbar from './components/Navbar.vue';
import SubNav from './components/SubNav.vue';
import Footer from './components/Footer.vue';
import Login from './components/Login.vue'
import BreadCrumbs from './components/BreadCrumbs.vue';
export default{
 
  data(){
   return{
       showLogin: false,
       showBreadcrumbs: true,
       route : ''
   }
  },
  components:{
       Navbar,
       SubNav,
       Footer,    
       Login,
       BreadCrumbs
  },
  methods:{
      
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

.page-wrapper.blurred {
  opacity: 0.3;
  pointer-events: none; 
}



</style>