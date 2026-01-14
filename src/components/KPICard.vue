<template>
  <div class="kpi">
    <div class="kpi-header">
      <h3>{{ item.title }}</h3>
    </div>

    <div class="kpi-value">
      {{ item.value }}
    </div>

    <hr>
    <div
      class="kpi-trend"
      :class="{up: item.trend > 0, down: item.trend < 0, nothing: item.trend === null}"
    >
      {{ getArrow(item.trend) }} {{ getPercentage(item.trend)}}
    </div>
  </div>
</template>

<script>
export default {
  props: {
    item: {
      type: Object,
      required: true
    }
  },

  methods:{
    getArrow(trend){
        if(trend > 0){
            return '▲';
        } else if(trend < 0){
            return '▼';
        } else {
            return '―'
        }
    },

    getPercentage(trend){
        if(Math.abs(trend) === 0){
            return '%';
        } else {
            return Math.abs(trend) + "%";
        }
    }
  }
}
</script>
<style lang = "scss" scoped>
.kpi {
  background: #fff;
  padding: 20px;
  border-radius: 16px;
  width: 250px;
  min-height: 250px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  
    hr{
        border: none;
        border-top: 3px solid #d1d5db;
    }


  &:hover {
    box-shadow: 0 12px 32px rgba(0, 0, 0, 0.12);
  }

  &-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    h3 {
      font-size: 14px;
      font-weight: 600;
      color: #666;
      margin: 0;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .icon {
      font-size: 20px;
      opacity: 0.6;
    }
  }

  &-value {
    font-size: 28px;
    font-weight: 700;
    color: #111;
    margin: 10px 0;
  }

  &-trend {
    font-size: 14px;
    font-weight: 600;

    &.up {
      color: #16a34a; 
    }

    &.down {
      color: #dc2626; 
    }
  }
}
</style>