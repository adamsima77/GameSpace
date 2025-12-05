<template>

<div class = "Home">
    <Slideshow :slideshow = "[
  {
    photo: 'https://i.guim.co.uk/img/media/67edb515d6a2b19ef10b002c6bdd44b40b284316/112_0_1734_1041/master/1734.jpg?width=1200&quality=85&auto=format&fit=max&s=4c6c02528f857ee541c6d0fb92cf2b64',
    desc: 'The Legend of Zelda: Breath of the Wild'
  },
  {
    photo: 'https://gameranx.com/wp-content/uploads/2022/01/God-of-War.jpg',
    desc: 'God of War (2018)'
  }
]
">
</Slideshow>

<RouterLink to = ""><h1>Novinky</h1></RouterLink>
<div class = "wrapper">
    <Item v-for = "(item,index) in testingData" :key = "index" :item = "item"></Item>
</div>

<RouterLink to = ""><h1 style = "margin-top: 15px;">Najviac očakávané hry</h1></RouterLink>
<div class = "wrapper">
    <Game v-for = "(game,index) in testingData_2" :key = "index" :game="game"></Game>   
</div>

<RouterLink to = ""><h1 style = "margin-top: 15px;">Príslušenstvo</h1></RouterLink>
<div class = "wrapper">
    <Item v-for = "(item,index) in testingData" :key = "index" :item = "item"></Item>
</div>
</div>
</template>


<script>
    import Navbar from '../components/Navbar.vue';
    import SubNav from '../components/SubNav.vue';
    import Slideshow from '../components/Slideshow.vue';
    import Item from '../components/Item.vue';
    import Game from '../components/Game.vue';
    export default{
        data(){
        return{
            testingData_2:[
    {
        img: 'https://i.guim.co.uk/img/media/67edb515d6a2b19ef10b002c6bdd44b40b284316/112_0_1734_1041/master/1734.jpg?width=1200&quality=85&auto=format&fit=max&s=4c6c02528f857ee541c6d0fb92cf2b64',
        alt: 'Game 1 Cover',
        desc: 'The Legend of Zelda: Breath of the Wild – Explore the vast world of Hyrule in this epic adventure.'
    },
    {
        img: 'https://img.sector.sk/files/novinky/0/2025/7-28-7-21-7/god-of-war-serial-od-amazonu-s-image-849.jpg',
        alt: 'Game 2 Cover',
        desc: 'God of War (2018) – Join Kratos and Atreus on a journey through Norse mythology.'
    },
    {
        img: 'https://assets.nintendo.com/image/upload/ar_16:9,c_lpad,w_1240/b_white/f_auto/q_auto/store/software/switch/70010000000964/a28a81253e919298beab2295e39a56b7a5140ef15abdb56135655e5c221b2a3a',
        alt: 'Game 3 Cover',
        desc: 'Minecraft – Build, explore, and survive in the limitless world of Minecraft.'
    },
    {
        img: 'https://store-images.s-microsoft.com/image/apps.58752.68182501197884443.ac728a87-7bc1-4a0d-8bc6-0712072da93c.0cf58754-9802-46f8-8557-8d3ff32a627a?q=90&w=480&h=270',
        alt: 'Game 4 Cover',
        desc: 'Red Dead Redemption 2 – Experience the life of an outlaw in the American frontier.'
    }
],

               testingData:[
    {
        img: 'https://i.guim.co.uk/img/media/67edb515d6a2b19ef10b002c6bdd44b40b284316/112_0_1734_1041/master/1734.jpg?width=1200&quality=85&auto=format&fit=max&s=4c6c02528f857ee541c6d0fb92cf2b64',
        alt: 'Game 1 Cover',
        title: 'The Legend of Zelda: Breath of the Wild',
        desc: 'Explore the vast world of Hyrule in this epic adventure.',
        available: 'Na sklade',
        price: 59.99
    },
    {
        img: 'https://img.sector.sk/files/novinky/0/2025/7-28-7-21-7/god-of-war-serial-od-amazonu-s-image-849.jpg',
        alt: 'Game 2 Cover',
        title: 'God of War (2018)',
        desc: 'Join Kratos and Atreus on a journey through Norse mythology.',
        available: 'Nie je na sklade',
        price: 49.99
    },
    {
        img: 'https://assets.nintendo.com/image/upload/ar_16:9,c_lpad,w_1240/b_white/f_auto/q_auto/store/software/switch/70010000000964/a28a81253e919298beab2295e39a56b7a5140ef15abdb56135655e5c221b2a3a',
        alt: 'Game 3 Cover',
        title: 'Minecraft',
        desc: 'Build, explore, and survive in the limitless world of Minecraft.',
        available: 'Na sklade',
        price: 26.50
    },
    {
        img: 'https://store-images.s-microsoft.com/image/apps.58752.68182501197884443.ac728a87-7bc1-4a0d-8bc6-0712072da93c.0cf58754-9802-46f8-8557-8d3ff32a627a?q=90&w=480&h=270',
        alt: 'Game 4 Cover',
        title: 'Red Dead Redemption 2',
        desc: 'Experience the life of an outlaw in the American frontier.',
        available: 'Nie je na sklade',
        price: 39.99
    }
]
        }
    },

    components:{
        Navbar,
        SubNav,
        Slideshow,
        Item,
        Game
    }
    } 
</script>


<style scoped lang = "scss">
  .Home {
  display: flex;
  flex-direction: column;
  gap: 20px;
  width: 100%;

  .wrapper {
    display: flex;
    flex-wrap: wrap;
    gap: 15px; 
    justify-content: flex-start;
    width: 100%;
  }
}
</style>