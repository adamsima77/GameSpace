<template>
    <div class="steps">

    <div class="step" :class="{active: active == 1, completed: active == 2 || active == 3}">
      <p>1</p>
      <span>Košík</span>
    </div>

    <div class="line"></div>

    <div class="step" :class="{active: active == 2, completed: active == 3}">
      <p>2</p>
      <span>Doručenie</span>
    </div>

    <div class="line"></div>

    <div class="step" :class="{active: active == 3}">
      <p>3</p>
      <span>Platba</span>
    </div>
  </div>
</template>

<script>
   export default{
        props: ['active']
   }
</script>

<style scoped lang = "scss">
    .steps {
  display: flex;
  align-items: center;
  gap: 50px;
  justify-content: center;
}

.step {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;

  p {
    width: 55px;
    height: 55px;
    border-radius: 50%;
    background-color: #fff;
    box-shadow: $box_sh_boxes;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    font-size: 18px;
    color: #aaa;
    transition: all 0.3s ease;
  }

  span {
    font-size: 14px;
    color: #777;
    text-align: center;
  }

  &.active {
    p {
      background-color: $blue;
      color: #fff;
    }

    span {
      color: $blue;
      font-weight: 500;
    }
  }

  &.completed {
    p {
      background-color: #10b981;
      color: #fff;
    }

    span {
      color: #10b981;
    }
  }
}

.line {
  width: 80px;
  height: 2px;
  background-color: #ddd;
}

.step.completed + .line {
  background-color: #10b981;
}


@media only screen and (max-width: 800px) {
   .steps{
    gap: 25px;
    .line{
      display: none;
    }
   }
}

</style>