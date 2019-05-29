<template>
  <detail-market v-if="type === 'market'"/>
  <detail-market-scene v-else-if="type === 'marketScene'"/>
  <detail-apply v-else/>
</template>

<script>
  import DetailMarket from './components/DetailMarket'
  import DetailMarketScene from './components/DetailMarketScene'
  import DetailApply from './components/DetailApply'

  export default {
    name: 'AmDetail',
    components: {
      DetailMarket,
      DetailMarketScene,
      DetailApply
    },
    data() {
      return {
        type: 'market'
      }
    },
    created() {
      const type = this.$route.params['type']
      if (type.includes('market')) {
        if (type.includes('场景化')) {
          this.type = 'marketScene'
        } else {
          this.type = 'market'
        }
      } else {
        this.type = 'apply'
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
</style>
