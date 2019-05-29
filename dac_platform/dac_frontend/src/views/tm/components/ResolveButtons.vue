<template>
  <div class="button-group">
    <button
      v-focusBg
      v-for="(item, index) in buttonList"
      :key="index"
      :class="item.className"
      class="button-item"
      @click="item.handleClick"
    >
      {{ item.label }}
    </button>
  </div>
</template>

<script>
  import focusBg from '@/directive/focusBg/focusBg'

  export default {
    name: 'ResolveButtons',
    directives: {
      focusBg
    },
    props: {
      buttonList: {
        type: Array,
        required: true
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .button-group {
    position: absolute;
    bottom: 0;
    right: 16px;
    padding: 10px 0;

    .button-item {
      width: 70px;
      height: 32px;
      text-align: center;
      padding: 0;
    }

    .button {
      border: 1px solid transparent;
      line-height: 30px;
    }

    .button-plain {
      line-height: 30px;
      border-color: $borderColorBox;
      border-radius: 4px;
    }
  }

  .button-item ~ .button-item {
    margin-left: 10px;
  }
</style>
