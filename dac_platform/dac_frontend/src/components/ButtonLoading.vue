<template>
  <span class="loading-wrapper" @click.stop="">
    <i class="el-icon-loading"></i>
  </span>
</template>

<script>
export default {
  name: 'ButtonLoading'
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .loading-wrapper {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 200;
    background-color: rgba(255, 255, 255, .2);
    display: flex;
    justify-content: center;
    align-items: center;

    .el-icon-loading {
      color: #000;
      font-weight: 800;
    }
  }
</style>
