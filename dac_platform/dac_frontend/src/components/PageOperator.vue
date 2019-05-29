<template>
  <div class="operate-container">
    <div class="button-group">
      <button
        v-focusBg="item.disabled ? {color: '0000000A'} : ''"
        v-for="(item, key) in buttonMap"
        :key="key"
        :class="{'disabled': item.disabled}"
        class="button"
        @click="item.handleClick"
      >
        {{ item.label }}
      </button>
    </div>
    <slot></slot>
  </div>
</template>

<script>
  import focusBg from '@/directive/focusBg/focusBg'

  export default {
    name: 'PageOperator',
    directives: {
      focusBg
    },
    props: {
      buttonMap: {
        type: Object,
        required: true
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .operate-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 24px;

    .button {
      width: auto;
      padding: 0 15px;
      height: 30px;
      line-height: 30px;

      & ~ .button {
        margin-left: 8px;
      }
    }
  }
</style>
