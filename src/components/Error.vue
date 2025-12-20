<template>
  <div class="error" v-show="message.status === 'error' && showLoadingBar">
    {{ message.message }}

    <div class="loading-bar-container">
      <div class="loading-bar" :style="{ width: barWidth }"></div>
    </div>
  </div>
</template>
<script>
export default {
  props: ['message'],
  data() {
    return {
      barWidth: '0%',
      showLoadingBar: false,
    }
  },
 watch: {
  'message.status': {
    immediate: true,
    handler(newStatus) {
      if (newStatus === 'error') {
        this.startLoading();
      }
    }
  }
},
  methods: {
    startLoading() {
  this.showLoadingBar = true
  this.barWidth = '0%'

  requestAnimationFrame(() => {
    this.barWidth = '100%'
  })

  setTimeout(() => {
    this.showLoadingBar = false
    this.barWidth = '0%'
  }, 5000)
}
  },

  mounted(){
       
  } 
}
</script>

<style scoped lang="scss">
.error {
  background-color: red;
  color: white;
  width: 100%;
  text-align: center;
  padding: 15px;
  border-radius: 15px;
  font-size: 1.1rem;
  display: flex;
  flex-direction: column;
  gap: 10px; 
  font-family: 'Roboto', sans-serif;

  .loading-bar-container {
    width: 100%;
    height: 5px;
    background-color: #eeeeee6f;
    border-radius: 5px;
    overflow: hidden;
  }

  .loading-bar {
    height: 100%;
    background-color: white;
    width: 0%;
    transition: width 5s linear;
  }
}
</style>