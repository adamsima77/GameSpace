<template>
    <div :class="{ blurred: showLogin }" class="page-wrapper">
    <Navbar @open-login="showLogin = true"></Navbar>
    <SubNav></SubNav>
    <main>
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
export default{
 
  data(){
   return{
       showLogin: false
   }
  },
  components:{
       Navbar,
       SubNav,
       Footer,    
       Login
  },
  methods:{
     
  },
  computed:{

  }
}
</script>

<style lang="scss">
$main-color: #42b983;

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