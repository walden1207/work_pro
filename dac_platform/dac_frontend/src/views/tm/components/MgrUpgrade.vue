<template>
  <div class="upgrade-container">
    <div class="main-container">
      <div :class="{'hidden': !hasDnc}" class="file-container">
        <span class="title">DNC网关</span>
        <transition-group name="slide-down" tag="div" class="transition-wrapper">
          <button v-if="!dncFilename" key="button" class="button-plain file-button" @click="handleDncFileClick">
            <img src="@/assets/upload-file.png" alt="" class="upload-file-img"/>选择文件
          </button>
          <div v-else key="filename" class="file-wrapper">
            <svg-icon icon-class="attach" class="attach-icon"/>
            <el-tooltip :content="dncFilename" placement="top" effect="light">
              <span class="file-name">{{ dncFilename }}</span>
            </el-tooltip>
            <i v-show="!dncUpgrading" class="delete-file el-icon-close" @click="deleteDncFile"></i>
          </div>
        </transition-group>
        <span :class="{'success': dncUpgradeSuccess, 'fail': dncUpgradeFail}" class="tips">{{ dncTips }}</span>
        <button :class="{'disabled': dncUpgradeDisabled}" class="button upgrade-button" @click="dncUpgrade">
          {{ dncUpgrading ? '升级中' : '升级' }}
        </button>
        <input ref="dncFile" type="file" class="original-input" @change="handleDncFileChange"/>
      </div>
      <div :class="{'hidden': !hasPlc}" class="file-container">
        <span class="title">PLC网关</span>
        <transition-group name="slide-down" tag="div" class="transition-wrapper">
          <button v-if="!plcFilename" key="button" class="button-plain file-button" @click="handlePlcFileClick">
            <img src="@/assets/upload-file.png" alt="" class="upload-file-img"/>选择文件
          </button>
          <div v-else key="filename" class="file-wrapper">
            <svg-icon icon-class="attach" class="attach-icon"/>
            <el-tooltip :content="plcFilename" placement="top" effect="light">
              <span class="file-name">{{ plcFilename }}</span>
            </el-tooltip>
            <i v-show="!plcUpgrading" class="delete-file el-icon-close" @click="deletePlcFile"></i>
          </div>
        </transition-group>
        <span :class="{'success': plcUpgradeSuccess, 'fail': plcUpgradeFail}" class="tips">{{ plcTips }}</span>
        <button :class="{'disabled': plcUpgradeDisabled}" class="button upgrade-button" @click="plcUpgrade">
          {{ plcUpgrading ? '升级中' : '升级' }}
        </button>
        <input ref="plcFile" type="file" class="original-input" @change="handlePlcFileChange"/>
      </div>
    </div>
    <div class="footer-wrapper">
      <button class="button" @click="handleComplete">完成</button>
    </div>
  </div>
</template>

<script>
  import ButtonLoading from '@/components/ButtonLoading'
  import { gateUpgrade } from '@/mock/tm'

  export default {
    name: 'MgrUpgrade',
    inject: ['beforeClose'],
    components: {
      ButtonLoading
    },
    props: {
      hasDnc: {
        type: Boolean,
        required: true
      },
      dncMacList: {
        type: Array,
        required: true
      },
      hasPlc: {
        type: Boolean,
        required: true
      },
      plcMacList: {
        type: Array,
        required: true
      }
    },
    data() {
      return {
        dncFile: undefined,
        dncUpgrading: false,
        dncUpgradeFail: false,
        dncUpgradeSuccess: false,
        dncTips: '未选择任何文件',
        plcFile: undefined,
        plcUpgrading: false,
        plcUpgradeFail: false,
        plcUpgradeSuccess: false,
        plcTips: '未选择任何文件'
      }
    },
    computed: {
      dncFilename () {
        return this.dncFile && this.dncFile.name
      },
      dncUpgradeDisabled() {
        // 没有选择文件，或者 升级中，或者 升级失败，或者 升级成功
        return !this.dncFilename || this.dncUpgrading || this.dncUpgradeFail || this.dncUpgradeSuccess
      },
      plcFilename () {
        return this.plcFile && this.plcFile.name
      },
      plcUpgradeDisabled() {
        return !this.plcFilename || this.plcUpgrading || this.plcUpgradeFail || this.plcUpgradeSuccess
      }
    },
    watch: {
    },
    created() {
    },
    methods: {
      handleDncFileClick() {
        this.$refs['dncFile'].value = ''
        this.$refs['dncFile'].click()
      },
      handleDncFileChange(event) {
        if (event.target.files && event.target.files.length) {
          this.dncFile = event.target.files[0]
          this.dncTips = ''
        }
      },
      deleteDncFile() {
        this.resetDncStatus()
      },
      dncUpgrade() {
        this.$emit('showConfirm', {type: 'dnc'})
      },
      doDncUpgrade() {
        this.$emit('dncUpgrading')
        this.dncUpgrading = true
        this.dncTips = ''
        const infoData = new FormData()
        infoData.append('file', this.dncFile)
        infoData.append('type', 'DNC')
        infoData.append('gateMac', this.dncMacList)
        gateUpgrade(infoData)
          .then(() => {
            this.$emit('dncUpgradeSuccess')
            this.dncUpgrading = false
            this.dncUpgradeSuccess = true
            this.dncTips = '升级成功'
          })
          .catch(
            () => {
              this.$emit('dncUpgradeFail')
              this.dncUpgrading = false
              this.dncUpgradeFail = true
              this.dncTips = '升级失败'
            }
          )
      },
      resetDncStatus() {
        this.dncTips = '未选择任何文件'
        this.dncFile = undefined
        this.dncUpgrading = false
        this.dncUpgradeFail = false
        this.dncUpgradeSuccess = false
      },
      handlePlcFileClick() {
        this.$refs['plcFile'].value = ''
        this.$refs['plcFile'].click()
      },
      handlePlcFileChange(event) {
        if (event.target.files && event.target.files.length) {
          this.plcFile = event.target.files[0]
          this.plcTips = ''
        }
      },
      deletePlcFile() {
        this.resetPlcStatus()
      },
      plcUpgrade() {
        this.$emit('showConfirm', {type: 'plc'})
      },
      doPlcUpgrade() {
        this.$emit('plcUpgrading')
        this.plcUpgrading = true
        this.plcTips = ''
        const infoData = new FormData()
        infoData.append('file', this.dncFile)
        infoData.append('type', 'PLC')
        infoData.append('gateMac', this.plcMacList)
        gateUpgrade(infoData)
          .then(() => {
            this.$emit('plcUpgradeSuccess')
            this.plcUpgrading = false
            this.plcUpgradeSuccess = true
            this.plcTips = '升级成功'
          })
          .catch(
            () => {
              this.$emit('plcUpgradeFail')
              this.plcUpgrading = false
              this.plcUpgradeFail = true
              this.plcTips = '升级失败'
            }
          )
      },
      resetPlcStatus() {
        this.plcTips = '未选择任何文件'
        this.plcFile = undefined
        this.plcUpgrading = false
        this.plcUpgradeFail = false
        this.plcUpgradeSuccess = false
      },
      doUpgrade(type) {
        if (type === 'dnc') {
          this.doDncUpgrade()
        } else {
          this.doPlcUpgrade()
        }
      },
      handleComplete() {
        this.beforeClose()
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .upgrade-container {
    position: relative;
    padding: 0 0 10px 0;
  }

  .main-container {
    padding: 40px 0 50px 0;
    display: flex;
    position: relative;

    &::after {
      content: '';
      position: absolute;
      top: 30px;
      bottom: 34px;
      left: 50%;
      width: 1px;
      background-color: rgba(0, 0, 0, 0.09);
    }
  }

  .file-container {
    width: 50%;
    padding: 0 16px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;

    &.hidden {
      opacity: 0;
    }

    .title {
      color: $textColorBody;
      font-weight: $fontWeightBolder;
      height: 20px;
      line-height: 20px;
      text-align: center;
      margin-bottom: 24px;
    }

    .transition-wrapper {
      display: flex;
    }

    .file-button, .upgrade-button {
      border: 1px solid $borderColorInput;
      border-radius: 4px;
      width: 106px;
      height: 32px;
      line-height: 32px;
      text-align: center;
      padding: 0;
    }

    .file-wrapper {
      height: 32px;
      line-height: 32px;
      color: $textColorCaption;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;

      .attach-icon {
        width: 14px;
        height: 14px;
        margin-right: 8px;
        flex-shrink: 0;
      }

      .file-name {
        flex-grow: 0;
        max-width: 200px;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow-x: hidden;
        cursor: pointer;
      }

      .delete-file {
        margin-left: 16px;
        cursor: pointer;
        width: 14px;
        height: 14px;

        &:hover {
          color: $hoverColor;
        }
      }
    }

    .file-button {
      .upload-file-img {
        width: 14px;
        height: 14px;
        margin-right: 4px;
      }
    }

    .tips {
      height: 22px;
      line-height: 22px;
      color: $textColorCaption;
      margin-top: 4px;

      &.success {
        color: #52C41A;
      }

      &.fail {
        color: #E02020;
      }
    }

    .upgrade-button.button {
      border: 1px solid transparent;
      margin-top: 24px;

      &.disabled {
        border: 1px solid $borderColorInput;
      }
    }
  }

  .original-input {
    position: absolute;
    top: -1000px;
    right: -1000px;
    opacity: 0;
  }

  .footer-wrapper {
    text-align: right;
    padding-right: 16px;

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

  $transitionDuration: 300ms;

  .slide-down-enter-active, .slide-down-leave-active {
    transition: $transitionDuration cubic-bezier(.55,0,.1,1);
  }
  .slide-down-enter {
    opacity: 0;
    transform: translateY(-96px);
  }

  .slide-down-leave-to {
    opacity: 0;
    transform: translateX(-100%);
  }

  /* slide left */
  .slide-left-enter-active, .slide-left-leave-active {
    transition: $transitionDuration cubic-bezier(.55,0,.1,1);
  }

  .slide-left-enter {
    opacity: 0;
    transform: translateX(100%);
  }

  .slide-left-leave-to {
    opacity: 0;
    transform: translateX(-100%);
  }
</style>

<style rel="stylesheet/scss" lang="scss">
</style>
