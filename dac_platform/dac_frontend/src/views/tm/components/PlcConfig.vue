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
    <div class="content-wrapper modify-scroll-bar">
      <div v-for="(paramList, itemIndex) in activeTabParams" :key="itemIndex" class="param-wrapper">
        <div v-for="(paramObject, paramIndex) in paramList" :key="paramIndex">
          <div v-if="paramObject.param.toUpperCase() === 'NAME'" class="item-name" @click="toggleItems">{{ paramObject.value }}</div>
        </div>
        <div class="item-wrapper">
          <div v-for="(paramObject, paramIndex) in paramList" :key="paramIndex" :style="durationStyle(paramIndex)" class="item">
            <div class="label-wrapper">
              <span :class="{'required': paramObject.required === 9}" class="label">{{ paramObject.name }}</span>
            </div>
            <el-input
              v-if="!paramObject.items.length"
              v-model="paramObject.value"
              @blur="handleParamBluer(itemIndex, paramIndex, $event)"
            />
            <el-select
              v-if="paramObject.items.length"
              :value="paramObject.selectedItem"
              @change="handleSelectChange(itemIndex, paramObject, paramIndex, $event)"
            >
              <el-option
                v-for="(option, index) in paramObject.items"
                :key="index"
                :label="option"
                :value="option"
              />
            </el-select>
          </div>
        </div>
      </div>
      <div class="add-wrapper">
        <div class="add" @click="handleAddClick">
          <svg-icon icon-class="plus-circle" class="plus-icon"/>
          <span class="label">采集项</span>
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
    name: 'PlcConfig',
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
        activeTabParams: [], //
        activeParams: [], // 当前 tab 对应的协议的参数列表
        templateName: '',
        completeMap: {},
        doComplete: this.completing,
        templateSaving: false
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
        // key 是协议名，val 参数数组 [[{}, {}], [{}, {}]]
        for (const [key, val] of Object.entries(params)) {
          this.selectedProtocolList.push(key)
          this.protocolParamsList.push(val)
          this.completeMap[key] = true
        }
        this.showTab = this.selectedProtocolList[0]
        this.activeTabParams = this.protocolParamsList[0]
      },
      durationStyle(index) {
        return {
          transition: `${300 + Math.floor(index / 4) * 80}ms`
        }
      },
      getProtocolParams(activeTabParams) {
        // 获取没有赋值的参数列表
        // 注意 param 是对象，必须要使用 Object.assign 来避免浅拷贝，同时，每次新增时候，必须调用该方法
        const paramsList = []
        for (const param of activeTabParams[0]) {
          paramsList.push(Object.assign({}, param, {
            value: '',
            selectedItem: ''
          }))
        }
        return paramsList
      },
      handleParamBluer(itemIndex, paramIndex, event) {
        // this.activeTabParams[itemIndex][paramIndex].value = event.target.value.replace(/\s+/g, '')
        this.activeTabParams[itemIndex][paramIndex].value = event.target.value.trim()
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
        this.protocolParamsList.splice(this.lastShowIndex, 1, this.activeTabParams)
        this.checkTabComplete(this.activeTabParams, this.selectedProtocolList[this.lastShowIndex])
        this.lastShowIndex = index
        this.activeTabParams = this.protocolParamsList[index]
      },
      toggleItems(event) {
        event.target.parentNode.parentNode.classList.toggle('hidden')
      },
      handleSelectChange(itemIndex, param, paramIndex, val) {
        const updateParam = Object.assign({}, param, {selectedItem: val})
        const paramList = this.activeTabParams[itemIndex]
        paramList.splice(paramIndex, 1, updateParam)
        this.activeTabParams.splice(itemIndex, 1, paramList)
      },
      handleAddClick () {
        const paramsList = this.getProtocolParams(this.activeTabParams)
        this.activeTabParams.splice(this.activeTabParams.length, 0, paramsList)
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
        const configResult = this.buildConfigResult()
        const templateInfo = Object.assign({}, {
          name,
          gateMac: this.gateMac,
          gateType: this.gateType,
          selectedProtocol: JSON.stringify(this.selectedProtocolList),
          config: JSON.stringify(configResult)
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
          result[this.selectedProtocolList[i]] = this.protocolParamsList[i]
        }
        return result
      },
      checkTabComplete(activeTabParams, protocol) {
        // 判断 tab 页是否编辑完成 true 表示完成
        let isComplete
        for (const paramList of activeTabParams) {
          isComplete = paramList.every(param => {
            if (param.required === 9) {
              // value 或者 selectedItem 只要一个有值，就说明该参数完成了
              return param.value || param.selectedItem
            }
            return true
          })
          if (!isComplete) {
            break
          }
        }
        this.completeMap = Object.assign({}, this.completeMap, {[protocol]: isComplete})
      },
      checkComplete() {
        for (let i = 0, len = this.selectedProtocolList.length; i < len; i++) {
          this.checkTabComplete(this.protocolParamsList[i], this.selectedProtocolList[i])
        }
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "../styles/config";

  .content-wrapper {
    padding-top: 19px;
    max-height: 290px;
    overflow-y: auto;
  }

  @media screen and (min-width: 1920px) {
    .content-wrapper {
      max-height: 450px;
    }
  }

  .param-wrapper {
    border: 1px solid #E8E8E8;
    margin-bottom: 16px;

    &:nth-last-child(2) {
      margin-bottom: 0;
    }

    .item-name {
      position: relative;
      padding-left: 17px;
      height: 40px;
      line-height: 40px;
      background: $tableHoverColor;
      border-radius: 1px;
      color: $textColorTitle;
      font-weight: $fontWeightBold;
      margin-bottom: 25px;
      transition: .2s;
      cursor: pointer;

      &::after {
        content: ' ';
        position: absolute;
        right: 11px;
        top: 18px;
        border: 4px solid transparent;
        border-top-color: rgba(0, 0, 0, 0.45);
        transition: .2s;
      }
    }

    .item-wrapper {
      padding: 0 14px 0 17px;
      display: flex;
      flex-wrap: wrap;
      overflow: hidden;
      /*transition: .5s;*/

      .item {
        width: 25%;
        margin-bottom: 20px;
      }

      .label-wrapper {
        margin-bottom: 4px;
      }

      .label {
        position: relative;
        color: rgba(0, 0, 0, 0.45);
        height: 14px;
        line-height: 14px;
        display: inline-block;
      }

      .label.required::after {
        content: '*';
        position: absolute;
        top: 0;
        right: 0;
        width: 6px;
        height: 6px;
        color: #F5222D;
        transform: translateX(100%);
      }
    }
  }

  .param-wrapper.hidden {
    .item-name {
      margin-bottom: 0;

      &::after {
        top: 14px;
        transform: rotate(180deg);
      }
    }

    /*.item-wrapper {
      height: 0;
    }*/
    .item {
      height: 0;
      opacity: 0;
      margin-bottom: 0;
    }
  }

  .add-wrapper {
    /*display: inline-block;*/
    padding: 7px 0 11px 0;
    z-index: 2;

    .add {
      width: 80px;
      display: flex;
      align-items: center;
      cursor: pointer;
    }

    .plus-icon {
      width: 16px;
      height: 16px;
    }

    .label {
      margin-left: 5px;
      height: 14px;
      line-height: 14px;
      color: $activeColor;
    }
  }

  .param-fade-leave-active,
  .param-fade-enter-active {
    transition: all .3s;
  }

  .param-fade-enter {
    opacity: 0;
  }

  .param-fade-leave-to {
    opacity: 0;
  }
</style>

<style rel="stylesheet/scss" lang="scss">
  .param-wrapper {

    .item-wrapper {
      .el-select, .el-input {
        width: 140px;
      }

      .el-input__inner {
        color: $textColorBody;
        height: 32px;
        line-height: 32px;
        width: 140px;
      }
    }
  }
</style>
