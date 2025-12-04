<template>
    <Navbar></Navbar>
    <SubNav></SubNav>
    <main>
  <Slideshow 
  :slideshow="[
    {
      photo: 'https://store-images.s-microsoft.com/image/apps.34838.63407868131364914.bcaa868c-407e-42c2-baeb-48a3c9f29b54.1463028d-79fa-46e5-9fc2-63203992a4dc?q=90&w=480&h=270',
      desc: 'First'
    },
     {
      photo: 'https://store-images.s-microsoft.com/image/apps.32577.14254372351363255.ac3906d1-13b6-4af0-a00a-e10c8a92007b.f74e6e13-69bd-49f0-a873-2f8346a30ead?q=90&w=480&h=270',
      desc: 'Second'
    },
     {
      photo: 'https://store-images.s-microsoft.com/image/apps.34497.14322280443288156.36e7f1cd-07a6-4e2a-a35d-485380706ab1.e8f404c0-ee13-41c4-962d-b4d73f73f3cf?q=90&w=480&h=270',
      desc: 'Third'
    }
  ]"
/>
  
    </main>
    <Footer></Footer>
</template>

<script>
 import Navbar from './components/Navbar.vue';
import SubNav from './components/SubNav.vue';
import Footer from './components/Footer.vue';
import Slideshow from './components/Slideshow.vue';
export default{
 
  data(){
   return{

   }
  },
  components:{
       Navbar,
       SubNav,
       Footer,
       Slideshow
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
   margin-top: 200px;
}

</style>