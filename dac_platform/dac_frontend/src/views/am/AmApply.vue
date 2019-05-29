<template>
  <div class="apply-container">
    <div class="title-container">
      <div class="title">算法应用</div>
      <div class="link">管理所有模型</div>
    </div>
    <div class="card-container">
      <am-card
        v-for="item in amList"
        :key="item.id"
        :am="item"
        card-type="applyCard"
      />
    </div>
  </div>
</template>

<script>
  import { fetchAmListApply } from '@/mock/am'
  import AmCard from './components/AmCard'

  export default {
    name: 'AmApply',
    components: {
      AmCard
    },
    data() {
      return {
        amList: []
      }
    },
    created() {
      fetchAmListApply()
        .then(res => {
          console.log(res)
          this.amList = res
        })
        .catch(() => {})
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .apply-container {
    padding: 24px 20px;
  }

  .title-container {
    margin-bottom: 45px;
    display: flex;
    align-items: center;

    .title {
      font-size: $fontSizeTitle;
      color: $textColorTitle;
      height: 33px;
      line-height: 33px;
      margin-right: 20px;
    }

    .link {
      color: $activeColor;
      height: 20px;
      line-height: 20px;
      cursor: pointer;
    }
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
