<template>
  <div class="am-card">
    <div class="card-icon">
      <svg-icon :icon-class="am.icon"/>
    </div>
    <div class="card-header">
      {{ am.name }}
    </div>
    <div class="card-body">
      {{ am.synopsis }}
    </div>
    <div class="card-footer">
      <span class="detail" @click="goDetail(am.name)">详情></span>
    </div>
  </div>
</template>

<script>

  export default {
    name: 'AmCard',
    props: {
      am: {
        type: Object,
        required: true
      },
      // 算法市场或算法应用中的算法卡片
      cardType: {
        type: String,
        default: 'market'
      }
    },
    mounted() {
      console.log(this.cardType)
    },
    methods: {
      goDetail(name) {
        this.$router.push(`/am/detail/${name}/${this.cardType}`)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .am-card {
    position: relative;
    width: 288px;
    height: 244px;
    background: $whiteColor;
    border-radius: 3px;
    border: 1px solid $borderColor;
    padding: 24px 24px 0 24px;
    transition: all .3s;

    &:hover {
      box-shadow: 0 1px 6px 2px rgba(201, 201, 201, 0.4);
      border: 1px solid $activeColorMenu;
    }
  }

  .card-icon {
    width: 50px;
    height: 50px;

    .svg-icon {
      width: 100%;
      height: 100%;
    }
  }

  .card-header {
    margin-top: 20px;
    height: 20px;
    line-height: 20px;
    font-size: $fontSizeBolder;
    font-weight: $fontWeightBolder;
    color: rgba(0, 0, 0, 0.65);
  }

  .card-body {
    padding: 20px 0;
    color: rgba(0, 0, 0, 0.65);
    width: 100%;
    height: 80px;
    line-height: 20px;

    overflow:hidden;
    text-overflow:ellipsis;
    display:-webkit-box;
    -webkit-box-orient:vertical;
    -webkit-line-clamp:2;

    &::after {
      content: ' ';
      position: absolute;
      left: 0;
      right: 0;
      bottom: 50px;
      height: 1px;
      background-color: $borderColorBox;
    }
  }

  .card-footer {
    padding: 14px 0;

    .detail {
      display: inline-block;
      width: 73px;
      height: 20px;
      line-height: 20px;
      color: $activeColorMenu;
      cursor: pointer;
    }
  }
</style>
