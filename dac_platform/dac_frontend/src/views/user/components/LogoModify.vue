<template>
  <div class="logo-container">
    <div class="logo-wrapper">
      <img src="@/assets/logo/dac_logo.png" alt="logo"/>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LogoModify'
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .logo-container {
    width: 100%;
    height: 50px;
    background: linear-gradient(149deg,rgba(58,67,90,1) 0%,rgba(53,57,68,1) 100%);
    box-shadow: 0 2px 6px 0 rgba(0,0,0,0.07);
    padding: 10px 0 10px 27px;
  }

  .logo-wrapper {
    width: 164px;
    height: 30px;

    img {
      width: 100%;
      max-width: 100%;
    }
  }
</style>
