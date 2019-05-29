<template>
  <model-welding v-if="amName === 'welding'"/>
</template>

<script>
  import ModelWelding from './components/ModelWelding'

  export default {
    name: 'CreateModel',
    components: {
      ModelWelding
    },
    data() {
      return {
        amName: 'welding'
      }
    },
    created() {
      const name = this.$route.params['name']
      console.log(name.includes('焊接'))
      if (name.includes('焊接')) {
        this.amName = 'welding'
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
</style>
