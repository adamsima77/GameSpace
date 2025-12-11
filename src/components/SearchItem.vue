<template>
    <div class = "wrapper" :class = "{hide: !showResults, show: showResults}">
        <div class = "search_item" v-for = "(value,index) in item" :key = "index">
            <RouterLink :to = "{name: 'search-detail', params:{slug: value.slug}}" @click = "$emit('hide-results')"><img :src="value.image" :alt="value.alt"></RouterLink>
              <RouterLink :to = "{name: 'search-detail', params:{slug: value.slug}}" @click = "$emit('hide-results')"><h2>{{ value.name }}</h2></RouterLink>
        </div>
    </div>
   
</template>


<script>
    export default{
        props: ['item'],
        data(){
        return{
              showResults: true
        }
    },
    methods:{
      
    }
    }
</script>


<style scoped lang = "scss">
.wrapper{
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 97%;

    &.hide{
        display: none;
    }

    &.show{
        display: flex;
    }
   
    .search_item{
        display: flex;
        flex-direction: row;
        gap: 40px;
        border-bottom: 2px solid $blue;
        width: 100%;
        border-radius: 10px;
        box-shadow: $box_sh_boxes;
        padding: 20px;

        img{
            width: 100px;
            height: 100px;
            border-radius: 10px;
        }
    }
}

</style>