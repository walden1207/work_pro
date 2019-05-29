<template>
  <div class="confirm-container">
    <div class="header-container">
      <div class="title">提示</div>
      <button class="close-button" @click="onCancel">
        <i class="icon el-icon-close"></i>
      </button>
    </div>
    <div class="body-container">
      <i class="icon el-icon-warning"></i>
      <span class="msg">{{ msg }}</span>
    </div>
    <div class="footer-wrapper">
      <button class="button-plain" @click="onCancel">取消</button>
      <button class="button" @click="onConfirm">确认</button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'ConfirmDialog',
    inject: ['beforeClose'],
    props: {
      msg: {
        type: String,
        required: true
      },
      onCancel: {
        type: Function,
        required: true
      },
      onConfirm: {
        type: Function,
        required: true
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .confirm-container {
    position: relative;
    width: 400px;
    padding: 20px 15px 12px 25px;
  }

  .header-container {
    width: 100%;

    .title {
      font-size: $fontSizeBody;
      color: $textColorTitle;
      font-weight: $fontWeightBolder;
      height: 16px;
      line-height: 16px;
    }

    .close-button {
      position: absolute;
      top: 15px;
      right: 15px;
      padding: 0;
      background: 0 0;
      border: none;
      outline: 0;
      cursor: pointer;
      font-size: 9px;

      .icon {
        color: rgba(0, 0, 0, 0.45);
      }

      &:hover {
        .icon {
          color: $hoverColor;
        }
      }
    }
  }

  .body-container {
    display: flex;
    align-items: center;
    padding: 24px 0;

    .icon {
      font-size: $fontSizeTitle;
      color: #FAAD14;
      margin-right: 12px;
    }

    .msg {
      line-height: 24px;
      color: $textColorBody;
    }
  }

  .footer-wrapper {
    text-align: right;

    .button-plain, .button {
      padding: 0;
      width: 54px;
      height: 32px;
      line-height: 32px;
    }

    .button-plain {
      border: 1px solid $borderColorBox;
      border-radius: 4px;
      margin-right: 10px;
    }

    .button {
      border: 1px solid transparent;
      border-radius: 3px;
    }
  }
</style>
