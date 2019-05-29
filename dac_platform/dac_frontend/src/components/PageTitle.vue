<template>
  <div class="title-container">
    <slot>{{ title }}</slot>
  </div>
</template>

<script>
  export default {
    name: 'PageTitle',
    props: {
      title: {
        type: String,
        default: ''
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .title-container {
    padding: 24px;
    line-height: 33px;
    font-size: $fontSizeTitle;

    color: $textColorTitle;
  }
</style>
