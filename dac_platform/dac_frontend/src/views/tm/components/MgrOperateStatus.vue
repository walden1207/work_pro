<template>
  <div class="status-container">
    <div class="status-wrapper">
      <div class="status-row">
        <div class="status-title item">操作项</div>
        <div class="status-title time">操作时间</div>
        <div class="status-title status">操作状态</div>
      </div>
      <div class="status-value-wrapper modify-scroll-bar">
        <div v-for="(item, index) in statusList" :key="index" class="status-row">
          <div class="status-value item">{{ item.operateItem }}</div>
          <div class="status-value time">{{ item.operateTime }}</div>
          <div class="status-value status">{{ gatStatus(item.status) }}</div>
        </div>
      </div>
    </div>
    <div class="footer-wrapper">
      <button class="button" @click="handleComplete">完成</button>
    </div>
  </div>
</template>

<script>
  import { getGateOperateStatue } from '@/mock/tm'

  const statusMap = {
    0: '进行中',
    1: '已完成',
    9: '无待下发配置'
  };

  export default {
    name: 'MgrOperateStatus',
    inject: ['beforeClose'],
    props: {
      gateMac: {
        type: String,
        required: true
      }
    },
    data() {
      return {
        statusList: []
      }
    },
    created() {
      getGateOperateStatue({gateMac: this.gateMac})
        .then(res => {
          this.statusList = res
        })
        .catch(() => {})
    },
    methods: {
      gatStatus(status) {
        return statusMap[status]
      },
      handleComplete() {
        this.beforeClose()
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .status-container {
    padding: 0 26px 10px 24px;
  }

  .status-wrapper {
    margin: 16px 0 30px 0;
    border: 1px solid #E8E8E8;

    .status-row {
      position: relative;
      display: flex;
      align-items: center;
      height: 48px;

      &::after {
        content: ' ';
        position: absolute;
        left: 0;
        right: 0;
        bottom: 0;
        height: 1px;
        background-color: #E8E8E8;
      }

      .status-title, .status-value {
        font-size: $fontSizeBody;
        padding-left: 16px;
      }

      .status-title {
        color: $textColorTitle;
        font-weight: $fontWeightBold;
      }

      .status-value {
        color: $textColorBody;
        font-weight: $fontWeight;
      }

      .item {
        width: 172px;
      }
      .time {
        width: 230px;
      }
      .status {}
    }

    .status-row:last-child {
      &::after {
        content: none;
      }
    }
  }

  .status-value-wrapper {
    max-height: 320px;
    overflow-y: auto;
  }

  .footer-wrapper {
    text-align: right;

    .button {
      font-size: $fontSizeCaption;
      width: 54px;
      padding: 0 15px;
      text-align: center;
      height: 32px;
      line-height: 32px;
      border-radius: 3px;
    }

    .button {
      border: 1px solid transparent;
    }
  }
</style>
