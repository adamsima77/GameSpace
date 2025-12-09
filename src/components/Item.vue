<template>
    <div class = "box">
        <RouterLink to = ""><img :src="item.image" :alt="item.alt"></RouterLink>
        <div class = "title_desc">
        <RouterLink to = ""><h2>{{ item.name }}</h2></RouterLink>
        <p>{{ item.description }}</p>
        </div>
                 <hr class = "item_hr"> 
        <div class = "price_available">
  
        <p :class = "defineAvailability(item.available)">{{ item.available }}</p>
        <p class = "price">{{ item.price }}€</p>
        </div>

    </div>
</template>

<script>
    export default{
        props:['item'],
        data(){
            return{
                
            }
        },
        methods:{
            defineAvailability(value){
                if(value === "Na sklade"){
                    return "available";
                } else{
                    return "not_available";
                }
            }
        },
        computed:{
           
        }
    }
</script>


<style scoped lang = "scss">

    .available{
        color: green;
    }

    .not_available{
        color: red;
    }
    .box{
        @include flex-between($align: left, $direction: column, $space_around:space-between);
        
        width: 20%;
        border: 1px solid rgb(178, 178, 178);
        padding: $padding_20;
        border-radius: 10px;
        box-shadow: $box_sh_boxes;
        min-height: 400px;
        img{
             @include image($height: 280px);
             transition: opacity 0.5s ease-in-out;

             &:hover{
                @include hover-transition($opacity:0.9);
             }
        }

         .title_desc{
            display: flex;
            flex-direction: column;
            margin-top: 15px;
            gap: 10px;
           

            h2{
                  text-decoration: none;
                  border-bottom: 3px solid transparent;
                  transition: border-color 0.3s ease;

                  &:hover{
                    border-color: black;
                  }
            }
         }
           .item_hr{
                border: 1px solid rgb(178, 178, 178);
                margin-top: auto;
            }
        .price_available{
            @include flex-between($space_around: space-between);
             margin-top: 10px;
            .price{
                font-weight: 700;
                font-size: 19px;
            }
        }
    }
</style>