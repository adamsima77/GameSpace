<template>
    <div :class="{ blurred: showLogin }" class="page-wrapper">
    <Navbar @open-login="showLogin = true"></Navbar>
    <SubNav></SubNav>
    <main>
        <BreadCrumbs v-if = "showBreadcrumbs"></BreadCrumbs>
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