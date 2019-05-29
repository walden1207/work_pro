<template>
  <div class="config-container">
    <button class="close-button" @click="handleCancelClick">
      <i class="el-dialog__close el-icon-close"></i>
    </button>
    <div class="tab-wrapper">
      <button
        v-for="(val, index) in selectedProtocolList"
        :key="index"
        :class="{'active': showTab === val, 'incomplete': incompleteTabs.includes(val)}"
        class="button-plain"
        @click="handleTabClick(val, index)"
      >
        {{ val }}
      </button>
      <div class="right-bg"></div>
    </div>
    <div class="content-wrapper">
      <div class="normal-wrapper">
        <div class="normal-row">
          <div class="normal-title upload">
            <el-checkbox v-model="isCheckAll" :indeterminate="isIndeterminate" @change="handleCheckAllClick"/>
            <span style="margin-left: -25px">是否上传到DAC</span>
          </div>
          <div class="normal-title name">采集量</div>
          <div class="normal-title param">参数地址</div>
          <div class="normal-title unit">单位</div>
        </div>
        <div class="table-container modify-scroll-bar">
          <div v-for="(item, index) in activeTabNormalParams" :key="index" class="normal-row">
            <div class="normal-value upload">
              <el-checkbox v-model="item.upload" :true-label="9" :false-label="0" @change="handleCheckboxChange"/>
            </div>
            <div class="normal-value name">{{ item.name }}</div>
            <div class="normal-value param">
              <el-input
                v-model="item.param"
                :disabled="item.disabled === 1"
                :placeholder="item.placeholder"
                @blur="handleParamBlur(index, $event)"
              />
            </div>
            <div class="normal-value unit">
              <el-input v-model="item.unit" @blur="handleUnitBlur(index, $event)"/>
            </div>
          </div>
        </div>
      </div>
      <div v-if="activeTabAdvancedParams && activeTabAdvancedParams.length" class="advanced-wrapper">
        <div class="advanced-title" @click="toggleAdvance">高级配置</div>
        <div class="advanced-body">
          <div v-for="(item, index) in activeTabAdvancedParams" :key="index" class="advanced-row">
            <div :class="{'required': !item.disabled}" class="label">{{ item.name }}:</div>
            <div class="value">
              <template v-if="item.name === 'IP地址'">
                <el-input v-model="item.value" :disabled="item.disabled" @blur="handleIpBlur(index, $event)"/>
              </template>
              <template v-else>
                <el-input v-model="item.value" :disabled="item.disabled" @blur="handleAdvancedBlur(index, $event)"/>
              </template>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="template-wrapper">
      <div class="label">输入模板名:</div>
      <div class="value">
        <el-input v-model="templateName" maxlength="50" @blur="handleTemplateBlur"/>
      </div>
      <div class="save" @click="saveTemplate">
        存为模板
        <button-loading v-if="templateSaving"/>
      </div>
    </div>
    <div class="footer-wrapper">
      <button v-if="showPrevious" class="button-plain" @click="handlePreviousClick">上一步</button>
      <button class="button-plain" @click="handleCancelClick">取消</button>
      <button class="button complete-button" @click="handleCompleteClick">
        完成
        <button-loading v-if="doComplete"/>
      </button>
    </div>
  </div>
</template>

<script>
  // import { saveTemplate } from '@/mock/tm'
  import { saveTemplate } from '@/api/tm'
  import ButtonLoading from '@/components/ButtonLoading'

  export default {
    name: 'DncConfig',
    inject: ['beforeClose'],
    components: {
      ButtonLoading
    },
    props: {
      configParams: {
        type: Object,
        required: true
      },
      templateNames: {
        type: Array,
        required: true
      },
      gateType: {
        type: String,
        required: true
      },
      gateMac: {
        type: String,
        required: true
      },
      completing: {
        type: Boolean,
        default: false
      },
      showPrevious: {
        type: Boolean,
        required: true
      }
    },
    data() {
      return {
        lastShowIndex: 0,
        showTab: '',
        selectedProtocolList: [],
        protocolParamsList: [], // 选择的协议对应的参数
        activeTabNormalParams: [],
        activeTabAdvancedParams: [],
        templateName: '',
        completeMap: {},
        doComplete: this.completing,
        templateSaving: false,
        isCheckAll: false,
        isIndeterminate: false
      }
    },
    computed: {
      incompleteTabs() {
        return Object.keys(this.completeMap)
          .map(protocol => this.completeMap[protocol] ? '' : protocol)
          .filter(protocol => protocol)
      }
    },
    watch: {
      configParams(newValue) {
        this.initData(newValue)
      },
      completing(newValue) {
        this.doComplete = newValue
      }
    },
    created() {
      this.initData(this.configParams)
    },
    methods: {
      initData(params) {
        this.lastShowIndex = 0
        this.showTab = ''
        this.selectedProtocolList = []
        this.protocolParamsList = []
        this.activeTabNormalParams = []
        this.activeTabAdvancedParams = []
        // key 是协议名，val 参数对象 {normal: [], advanced: []}
        for (const [key, val] of Object.entries(params)) {
          this.selectedProtocolList.push(key)
          this.protocolParamsList.push(val)
          this.completeMap[key] = true
        }
        this.showTab = this.selectedProtocolList[0]
        this.activeTabNormalParams = this.protocolParamsList[0]['normal']
        this.activeTabAdvancedParams = this.protocolParamsList[0]['advanced']
        this.$nextTick(() => {
          this.checkAllStatus()
        })
      },
      handleUnitBlur(index, event) {
        // this.activeTabNormalParams[index].unit = event.target.value.replace(/\s+/g, '')
        this.activeTabNormalParams[index].unit = event.target.value.trim()
      },
      handleParamBlur(index, event) {
        // this.activeTabNormalParams[index].param = event.target.value.replace(/\s+/g, '')
        this.activeTabNormalParams[index].param = event.target.value.trim()
      },
      handleIpBlur(index, event) {
        // const value = event.target.value.replace(/\s+/g, '')
        const value = event.target.value.trim()
        const ipRegExp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
        if (ipRegExp.test(value)) {
          this.activeTabAdvancedParams[index].value = value
        } else {
          this.$messageTips({
            type: 'error',
            message: 'IP地址格式错误'
          })
          this.activeTabAdvancedParams[index].value = ''
        }
      },
      handleAdvancedBlur(index, event) {
        // this.activeTabAdvancedParams[index].value = event.target.value.replace(/\s+/g, '')
        this.activeTabAdvancedParams[index].value = event.target.value.trim()
      },
      handleTemplateBlur (event) {
        // this.templateName = event.target.value.replace(/\s+/g, '')
        this.templateName = event.target.value.trim()
      },
      handleTabClick(val, index) {
        if (this.lastShowIndex === index) {
          return
        }
        this.showTab = val
        this.protocolParamsList.splice(this.lastShowIndex, 1, {
          normal: this.activeTabNormalParams,
          advanced: this.activeTabAdvancedParams
        })
        this.checkTabComplete(
          this.activeTabNormalParams,
          this.activeTabAdvancedParams,
          this.selectedProtocolList[this.lastShowIndex]
        )
        this.lastShowIndex = index
        this.activeTabNormalParams = this.protocolParamsList[index]['normal']
        this.activeTabAdvancedParams = this.protocolParamsList[index]['advanced']
        this.checkAllStatus()
      },
      toggleAdvance(event) {
        event.target.parentNode.classList.toggle('hidden')
      },
      handlePreviousClick() {
        this.$emit('previous')
      },
      handleCancelClick() {
        this.$emit('cancel')
        this.beforeClose()
      },
      handleCompleteClick() {
        this.doComplete = true
        this.checkComplete()
        if (this.incompleteTabs.length) {
          this.$messageTips({
            type: 'error',
            message: '协议没有配置完成'
          });
          this.doComplete = false
          return
        }
        this.$emit('configComplete', this.buildConfigResult())
      },
      saveTemplate() {
        this.templateSaving = true
        this.checkComplete()
        if (this.incompleteTabs.length) {
          this.$messageTips({
            type: 'error',
            message: '协议没有配置完成'
          });
          this.templateSaving = false
          return
        }
        const name = this.templateName
        if (!name) {
          this.$messageTips({
            type: 'error',
            message: '请先输入模板名，方便下次直接调用'
          });
          this.templateSaving = false
          return
        }
        if (this.templateNames.includes(name)) {
          this.$messageTips({
            type: 'error',
            message: '模板名重复，请重新输入'
          });
          this.templateSaving = false
          return
        }
        const templateInfo = Object.assign({}, {
          name,
          gateMac: this.gateMac,
          gateType: this.gateType,
          selectedProtocol: JSON.stringify(this.selectedProtocolList),
          config: JSON.stringify(this.buildConfigResult())
        })
        saveTemplate(templateInfo)
          .then(() => {
            this.$messageTips({
              message: '模板保存成功'
            });
            this.templateSaving = false
            this.$emit('saveTemplate')
          })
          .catch(() => {
            this.templateSaving = false
          })
      },
      buildConfigResult() {
        const result = {}
        for (let i = 0, len = this.selectedProtocolList.length; i < len; i++) {
          result[this.selectedProtocolList[i]] = {
            normal: this.protocolParamsList[i]['normal'],
            advanced: this.protocolParamsList[i]['advanced']
          }
        }
        return result
        // const result = {}
        // let normalParams;
        // let advancedParams
        // for (let i = 0, len = this.selectedProtocolList.length; i < len; i++) {
        //   normalParams = this.protocolParamsList[i]['normal'].slice()
        //   normalParams = normalParams.map(item => {
        //     if (item.disabled !== 1) {
        //       if (!item.param) {
        //         item.param = item.placeholder
        //       }
        //     }
        //     return item
        //   })
        //   advancedParams = this.protocolParamsList[i]['advanced'].slice()
        //   result[this.selectedProtocolList[i]] = {
        //     normal: normalParams,
        //     advanced: advancedParams
        //   }
        // }
        // return result
      },
      checkTabComplete(normalParams, advancedParams, protocol) {
        // 判断 tab 页是否编辑完成 true 表示完成
        // 上传网关，并且没有填 单位，则表示没有完成
        const isNormalComplete = normalParams.every(item => item.upload ? item.unit : true)
        // 非 disabled 必须要有值
        const isAdvancedComplete = advancedParams.every(item => item.disabled ? true : item.value)
        this.completeMap = Object.assign({}, this.completeMap, {[protocol]: isNormalComplete && isAdvancedComplete})
      },
      checkComplete() {
        for (let i = 0, len = this.selectedProtocolList.length; i < len; i++) {
          this.checkTabComplete(
            this.protocolParamsList[i]['normal'],
            this.protocolParamsList[i]['advanced'],
            this.selectedProtocolList[i]
          )
        }
      },
      /* 全选功能 */
      handleCheckAllClick(value) {
        this.activeTabNormalParams.forEach(paramInfo => {
          paramInfo.upload = value ? 9 : 0
        })
        this.checkAllStatus()
      },
      handleCheckboxChange () {
        this.checkAllStatus()
      },
      checkAllStatus () {
        this.isCheckAll = this.activeTabNormalParams.every(paramInfo => !!paramInfo.upload)
        this.isIndeterminate = !this.isCheckAll && this.activeTabNormalParams.some(paramInfo => !!paramInfo.upload)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "../styles/config";

  .normal-wrapper {
    margin: 16px 0 30px 0;
    border: 1px solid #E8E8E8;

    .normal-row {
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

      .normal-title {
        color: $textColorTitle;
        font-size: $fontSizeBody;
        font-weight: $fontWeightBold;
        height: 21px;
        line-height: 21px;
      }

      .upload {
        width: 180px;
        padding: 0 10px;
        text-align: center;
      }

      .name {
        width: 260px;
        padding-left: 20px;
      }

      .param {
        width: 280px;

        .el-input {
          width: 180px;
        }
      }

      .unit {
        width: 144px;

        .el-input {
          width: 90px;
        }
      }
    }

    .normal-row:last-child {
      &::after {
        content: none;
      }
    }
  }

  .advanced-wrapper {
    .advanced-title {
      font-weight: $fontWeightBold;
      color: $textColorTitle;
      height: 21px;
      line-height: 14px;
      cursor: pointer;
    }

    .advanced-body {
      display: flex;
      flex-wrap: wrap;
    }

    .advanced-row {
      width: 50%;
      display: flex;
      align-items: center;
      height: 48px;
      padding-left: 40px;
      transition: height .3s, opacity .3s;

      .label {
        padding-right: 15px;
        height: 20px;
        line-height: 20px;
        color: $textColorBody;
      }

      .label.required {
        position: relative;
        &::after {
          content: '*';
          position: absolute;
          color: #F5222D;
          top: -5px;
          right: 10px;
        }
      }

      .value {

        .el-input__inner {
          height: 32px;
          line-height: 32px;
        }
      }
    }
  }

  .advanced-wrapper.hidden {
    .advanced-row {
      height: 0;
      opacity: 0;
    }
  }

  .table-container {
    max-height: 160px;
    overflow-y: auto;
  }

  @media screen and (min-width: 1920px) {
    .table-container {
      max-height: 320px;
    }
  }
</style>
