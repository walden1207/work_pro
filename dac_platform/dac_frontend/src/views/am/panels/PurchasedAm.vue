<template>
  <div v-if="purchasedList.length" class="panel-wrapper">
    <am-panel
      v-for="item in purchasedList"
      :key="item.key"
      :category="item.category"
      :am-list="item.amList"
    />
  </div>
  <div v-else class="message-wrapper">
    暂未开放
  </div>
</template>

<script>
  import AmPanel from '../components/AmPanel'

  export default {
    name: 'PurchasedAm',
    components: {
      AmPanel
    },
    data() {
      return {
        purchasedList: []
      }
    },
    methods: {}
  }
</script>
<style rel="stylesheet/scss" lang="scss" scoped>
  .message-wrapper {
    font-size: 20px;
    color: #409EFF;
    margin-top: 20px;
  }
</style>
