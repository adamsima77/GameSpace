<template>

<div class = "Home">
    <Slideshow :slideshow = "slides">
</Slideshow>

<h1>Novinky</h1>
<div class = "wrapper">
    <Item v-for = "(item,index) in ItemsNewest" :key = "index" :item = "item" parent-route-name="item-detail"></Item>
</div>

<h1 style = "margin-top: 15px;">Najviac očakávané hry</h1>
<div class = "wrapper">
    <Game v-for = "(game,index) in most_anticipated" :key = "index" :game="game"></Game>   
</div>

<h1 style = "margin-top: 15px;">Príslušenstvo</h1>
<div class = "wrapper">
    <Item v-for = "(item,index) in accessories" :key = "index" :item = "item" parent-route-name="accessories-detail"></Item>
</div>
</div>
</template>


<script>
    import Navbar from '../../components/Navbar.vue';
    import SubNav from '../../components/SubNav.vue';
    import Slideshow from '../../components/Slideshow.vue';
    import Item from '../../components/Item.vue';
    import Game from '../../components/Game.vue';
    export default{
        data(){
        return{
            ItemsNewest:[],
            slides: [],
            most_anticipated: [],
            accessories: []
        }
    },

    components:{
        Navbar,
        SubNav,
        Slideshow,
        Item,
        Game
    },
    methods:{
        async fetchSlides(){
            try{
            const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/slideshow.php",
            {
                 withCredentials: false
            })
            this.slides = response.data;
            } catch(error){
                   if (error.response) {
                      
                   } else if (error.request) {
                      
                   } else {
                       
                   }
            }
          
        },
        async fetchNewestItems(){
             try {
                 const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_newest_items.php",
                 {
                     withCredentials: false
                 });
                 this.ItemsNewest = response.data;
            } catch(error){
                if (error.response) {
                      
                } else if (error.request) {
                      
                } else {
                       
                }
            }
        },
        async fetchMostAnticipatedGames(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/most_anticipated_games.php",
                {
                     withCredentials: false
                });
                this.most_anticipated = response.data;
            } catch(error){

            }
        },
        async fetchAccessories(){
            try{
                const response = await this.$axios.get("http://localhost/GameSpace/endpoints/fetch/fetch_newest_accessories.php",
                {
                     withCredentials: false
                });
                this.accessories = response.data;
            } catch(error){

            }
        }
    }, 

    mounted(){
           this.fetchSlides();
           this.fetchNewestItems();
           this.fetchMostAnticipatedGames();
           this.fetchAccessories();
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
    gap: 15px; 
    justify-content: flex-start;
    width: 100%;
  }
}

@media only screen and (max-width: 800px) {
    .Home{
        justify-content: center;
        align-items: center;
        place-self: center;
        width: 100%;

        .wrapper{
            display: block;
            place-items: center;
        }
    }
}


</style>