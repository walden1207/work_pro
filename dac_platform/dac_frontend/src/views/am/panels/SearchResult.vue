<template>
  <div v-if="amSearchResult.length" class="panel-wrapper">
    <am-panel
      v-for="item in amSearchResult"
      :key="item.key"
      :category="item.category"
      :am-list="item.amList"
    />
  </div>
  <div v-else class="message-wrapper">
    无
  </div>
</template>

<script>
  import AmPanel from '../components/AmPanel'
  import {mapGetters} from 'vuex'

  export default {
    name: 'SearchResult',
    components: {
      AmPanel
    },
    computed: {
      ...mapGetters([
        'amSearchResult'
      ])
    },
    methods: {}
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .message-wrapper {
    font-size: 20px;
    color: #409EFF;
    padding-top: 40px;
  }
</style>

