<template>
  <section>
    <h1 class="main-page">createModel</h1>
  </section>
</template>

<script>
  // import {createModel} from '@/mock/am'

  export default {
    name: 'ModelWelding',
    data() {
      return {
      }
    },
    created() {
      const name = this.$route.params['name']
      console.log('--> CreateModel', name)
    },
    methods: {}
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>

  .main-page {
    line-height: 5;
    text-align: center;
    margin: 20px;
    color: #409EFF;
  }

  .icon-wrapper {
    height: 200px;
    text-align: center;

    .icon-test {
      width: 10em;
      height: 10em;
    }
  }
</style>
