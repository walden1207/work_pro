<template>
  <div class="edit-container">
    <div class="edit-wrapper">
      <div class="edit-row">
        <div class="label">网关Mac:</div>
        <div class="mac-value">
          <div>{{ gateMac }}</div>
        </div>
      </div>
      <div class="edit-row">
        <div class="label">网关名称:</div>
        <div class="name-value">
          <el-input v-model="gateName" maxlength="50"/>
        </div>
      </div>
    </div>
    <div class="footer-wrapper">
      <button class="button-plain" @click="handleCancelClick">取消</button>
      <button class="button" @click="handleSaveClick">保存</button>
    </div>
  </div>
</template>

<script>
  import { saveGateName } from '@/mock/tm'

  export default {
    name: 'MgrEdit',
    inject: ['beforeClose'],
    props: {
      gateMac: {
        type: String,
        required: true
      },
      gateNameOld: {
        type: String,
        required: true
      }
    },
    data() {
      return {
        gateName: this.gateNameOld
      }
    },
    methods: {
      handleCancelClick() {
        this.beforeClose()
      },
      handleSaveClick() {
        const trimmedName = this.gateName.trim()
        if (!trimmedName) {
          this.$messageTips({
            type: 'error',
            message: '请输入设备名称'
          })
          return
        }
        saveGateName({gateMac: this.gateMac, gateName: trimmedName})
          .then(() => {
            this.$messageTips({
              message: '保存成功'
            })
            this.$emit('saved')
            setTimeout(() => {
              this.beforeClose()
            }, 800)
          })
          .catch(() => {})
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .edit-container {
    padding: 24px 0 10px 24px;
  }

  .edit-wrapper {
    padding-bottom: 24px;

    .edit-row {
      display: flex;
      align-items: center;
      height: 48px;

      .label {
        padding-right: 15px;
        height: 20px;
        line-height: 20px;
        color: $textColorBody;
      }

      .mac-value {
        height: 32px;
        line-height: 32px;
        width: 280px;
        padding-left: 15px;
        border: 1px solid $borderColorInput;
        border-radius: 4px;
      }
    }
  }

  .footer-wrapper {
    text-align: right;
    padding-right: 24px;

    .button-plain, .button {
      font-size: $fontSizeCaption;
      width: 54px;
      padding: 0 15px;
      text-align: center;
      height: 32px;
      line-height: 32px;
      border-radius: 3px;
    }

    .button-plain {
      margin-right: 10px;
      border: 1px solid $borderColorBox;
    }

    .button {
      border: 1px solid transparent;
    }
  }
</style>

<style rel="stylesheet/scss" lang="scss">
  .edit-wrapper {
    .name-value {
      .el-input__inner {
        width: 280px;
        height: 32px;
        line-height: 32px;
      }
    }
  }
</style>
