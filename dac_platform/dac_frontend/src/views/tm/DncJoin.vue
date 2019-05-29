<template>
  <section>
    <h1 class="main-page">物接入</h1>
    <div class="icon-wrapper">
      <svg-icon icon-class="Group31" class="icon-test"/>
    </div>
  </section>
</template>

<script>

  export default {
    name: 'TmJoin',
    methods: {}
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "styles/footer";

  .main-page {
    line-height: 5;
    text-align: center;
    margin: 20px;
    color: #409EFF;
  }

  .icon-wrapper {
    height: 200px;
    text-align: center;

    .icon-test {
      width: 10em;
      height: 10em;
    }
  }
</style>
