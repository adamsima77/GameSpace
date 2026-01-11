<template>
    <router-view></router-view>
</template>

<script>
import { useUserStore } from './stores/user';
export default {
  data() {
    return {
      userStore: null,
      sessionInterval: null,
    };
  },

  created() {
    this.userStore = useUserStore();
  },

  mounted() {
    this.sessionInterval = setInterval(async () => {
      if (this.userStore.user_id) { 
        const isLogged = await this.userStore.checkIfLogged();
        if (!isLogged) {
          alert('Session expired...');
          await this.userStore.logout();
          this.$router.push({ name: 'home' });
        }
      }
    }, 15000); 
  },

  beforeUnmount() { 
    if (this.sessionInterval) clearInterval(this.sessionInterval);
  }
};
</script>