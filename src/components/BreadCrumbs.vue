<template>
    <div class = "breadCrumbs">
        <RouterLink to = "/"><span><i class = "fas fa-home"></i> /</span></RouterLink>
        <RouterLink v-if = "routerPath != ''" v-for = "(value,index) in names" :to = "getPath(index)"><span>{{ decodeURIComponent(names[index]) }}</span></RouterLink>
    </div>
</template>

<script>
    export default{
     
        data(){
            return{
                   routerPath: '',
                   names: [],
                   raw: []
            }
        },
        
        created(){
             this.updateBreadcrumbs(this.$route.path);
        },

        methods:{
             updateBreadcrumbs(path) {
                  this.routerPath = path;
                  this.raw = path.split('/')
                  this.names = path.split('/');

                  this.namesBetterFormat();
            },

            namesBetterFormat(){
                let formatted = []
                for(let i = 0; i < this.names.length; i++){
                    let name = this.names[i];

                    const words = name.split("-");
                    for(let j = 0; j < words.length; j++){
                         if(j == 0){
                            words[j] = words[j].charAt(0).toUpperCase() + words[j].slice(1);
                         }
                    } 
                    formatted.push(words.join(' '));
                }
                this.names = formatted
            },

       getPath(index){
           return this.raw.slice(0,index + 1).join("/");
       }
        },
        watch:{
            '$route.path'(newPath){
                 this.updateBreadcrumbs(newPath);
            }
        }
    }

</script>


<style scoped lang = "scss">
.breadCrumbs {
  display: flex;
  align-items: center;
  align-self: flex-start;
  color: #555;  
  margin-top: 20px;
  margin-bottom: 10px;
  span {
    position: relative;
    margin-left: 3px;

    &:not(:last-child)::after {
      content: '/';
      position: absolute;
      right: -8px;
      color: #aaa;
    }
  }

  a {
    text-decoration: none;
    color: #333; 
    font-weight: 500;
    transition: color 0.2s;

    &:hover {
      color: #000; 
    }
  }
}
</style>