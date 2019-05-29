<template>
  <div class="panel">
    <div class="panel-header">
      <div class="first">数据分析平台</div>
      <div class="second">DAC (Data Analytic Core)</div>
    </div>
    <p class="panel-body">
      数据分析内核DAC提供功能强大的工业互联网数据接入、数据清洗、规则推理、人工智能和时序数据库，内置故障诊断、预测维修等工业常见的大数据应用场景。
    </p>
  </div>
</template>

<script>
export default {
  name: 'IntroPanel',
  data() {
    return {
      mobile: '',
      password: ''
    }
  },
  methods: {
    canplay() {
      this.videoCanPlay = true
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .panel {
    padding-top: 44px;
    width: 760px;
  }

  .panel-header {
    font-weight: $fontWeightBolder;
    color: #FFF;

    .first {
      font-size: 78px;
      line-height: 100px;
    }

    .second {
      margin-top: 18px;
      font-size: 28px;
      line-height: 44px;
    }
  }

  .panel-body {
    margin-top: 87px;
    width: 700px;
    font-size: 24px;
    line-height: 33px;

    color: rgba(255, 255, 255, 0.85);
  }
</style>
