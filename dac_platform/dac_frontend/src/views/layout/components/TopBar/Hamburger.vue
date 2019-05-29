<template>
  <div class="hamburger-container" @click="toggleClick">
    <svg-icon :class="{'active': isActive}" icon-class="menu_fold" class="hamburger-icon"/>
  </div>
</template>

<script>
  export default {
    name: 'Hamburger',
    props: {
      isActive: {
        type: Boolean,
        default: false
      },
      toggleClick: {
        type: Function,
        default: null
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .hamburger-container {
    position: absolute;
    left: $sideBarWidth;
    top: 12px;
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 4px;
    text-align: center;
    cursor: pointer;
    transition: background .3s;

    .hamburger-icon {
      width: 16px;
      height: 16px;
      margin: 12px;
      display: inline-block;
      transform: rotate(180deg);
      transition: all .3s;

      &.active {
        transform: rotate(0);
      }
    }
  }

  .hamburger-container:hover {
    background-color: $activeColor;

    .hamburger-icon {
      width: 24px;
      height: 24px;
      margin: 8px;
    }
  }
</style>
