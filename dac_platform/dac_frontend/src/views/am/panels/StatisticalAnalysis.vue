<template>
  <div class="panel-wrapper">
    <am-panel
      v-for="item in amMap.am3"
      :key="item.key"
      :category="item.category"
      :am-list="item.amList"
    />
  </div>
</template>

<script>
  import AmPanel from '../components/AmPanel'
  import {mapGetters} from 'vuex'

  export default {
    name: 'StatisticalAnalysis',
    components: {
      AmPanel
    },
    computed: {
      ...mapGetters([
        'amMap'
      ])
    },
    methods: {}
  }
</script>
