<template>
    <div class = "sidebar">
        <ul>
          <RouterLink :to="{name: 'order-history'}" ><li :class ="{active: active === 1}"><i class="fas fa-history"></i> História nákupov</li></RouterLink>
          <RouterLink :to="{name: 'personal-info'}"><li  :class ="{active: active === 2}"><i class="fas fa-user-edit"></i> Spravovať osobné údaje</li></RouterLink>
          <RouterLink :to="{name: 'account-management'}" ><li :class ="{active: active === 3}"><i class="fas fa-cog"></i> Spravovať účet</li></RouterLink>
        </ul>
    </div>
</template>

<script>
export default{
    data(){
        return{
            
        }
    },

    computed:{
        active(){
            switch(this.$route.name){
                case 'order-history': return 1;
                case 'order-detail': return 1;
                case 'personal-info': return 2;
                case 'account-management': return 3;
                default: return 0;
            }
        }
    }
}
</script>


<style scoped lang = "scss">
   .sidebar {
    display: flex;
    flex-direction: column;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);

    ul {
        display: flex;
        flex-direction: column;
        gap: 15px;
        padding: 0;
        margin: 0;
        list-style: none;
    }

    li {
        display: flex;
        align-items: center;
        gap: 12px;
        font-weight: 500;
        color: #333;
        padding: 10px 15px;
        border-radius: 10px;
        transition: all 0.2s ease-in-out;
        cursor: pointer;

        &.active{
            background-color: #b3b3b32f;
            color: #007bff;
        }

        i {
            color: #555;
            width: 20px;
            text-align: center;
        }

        &:hover {
            background-color: #f5f5f5;
            color: #007bff;
            i {
                color: #007bff;
            }
        }
    }

    a {
        text-decoration: none;
    }
}
</style>