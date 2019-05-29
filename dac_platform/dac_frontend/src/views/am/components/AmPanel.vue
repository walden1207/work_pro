<template>
  <div class="am-panel">
    <div class="category">{{ category }}</div>
    <div class="card-container">
      <am-card
        v-for="item in amList"
        :key="item.id"
        :am="item"
        :card-type="'market' + category"
      />
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'
  import AmCard from './AmCard'

  export default {
    name: 'AmPanel',
    components: {
      AmCard
    },
    props: {
      category: {
        type: String,
        required: true
      },
      amList: {
        type: Array,
        required: true
      }
    },
    computed: {
      ...mapGetters([
        'sidebar'
      ])
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .am-panel {
    padding-top: 40px;
    padding-bottom: 15px;
    width: 100%;
  }

  .category {
    height: 24px;
    line-height: 24px;
    font-size: 17px;
    font-weight: $fontWeightBolder;
    color: rgba(0, 0, 0, 0.65);
    margin-bottom: 10px;
  }

  .card-container {
    width: 100%;
    display: flex;
    flex-wrap: wrap;

    .am-card {
      margin-bottom: 25px;
      margin-right: 24px;
    }
  }
</style>
