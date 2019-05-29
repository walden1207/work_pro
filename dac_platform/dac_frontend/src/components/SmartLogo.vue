<template>
  <div class="logo-wrapper">
    <img src="@/assets/logo/dac_logo.png" alt="logo"/>
  </div>
</template>

<script>
export default {
  name: 'SmartLogo'
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .logo-wrapper {
    position: absolute;
    top: 17px;
    left: 27px;
    img {
      width: 164px;
      height: 30px;
    }
  }
</style>
