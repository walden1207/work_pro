<template>
  <div class="choice-container">
    <button class="close-button" @click="handleCancelClick">
      <i class="el-dialog__close el-icon-close"></i>
    </button>
    <div class="choice-main">
      <div class="choice-wrapper">
        <el-radio v-model="type" label="protocol"/>
        <div
          :class="{'disabled': type === 'template', 'active': type === 'protocol'}"
          class="choice-panel protocol modify-scroll-bar"
        >
          <div v-show="type !== 'protocol'" class="choice-mask"></div>
          <div class="choice-head">选择协议</div>
          <div class="choice-body">
            <div v-for="(versionList, protocol) in protocolMap" :key="protocol" class="choice-item">
              <el-checkbox :label="protocol" v-model="checkedProtocolMap[protocol]" class="protocol-checkbox">
                {{ protocol }}
              </el-checkbox>
              <el-select
                v-if="versionList && versionList.length && checkedProtocolMap[protocol]"
                :value="checkedVersionMap[protocol]"
                @change="handleSelectChange(protocol, $event)"
              >
                <el-option
                  v-for="(version, index) in versionList"
                  :key="index"
                  :label="version"
                  :value="version"
                />
              </el-select>
            </div>
          </div>
        </div>
      </div>
      <div class="choice-wrapper">
        <el-radio v-model="type" label="template"/>
        <div :class="{'disabled': type === 'protocol', 'active': type === 'template'}" class="choice-panel template">
          <div v-show="type !== 'template'" class="choice-mask"></div>
          <div class="choice-head">选择模版</div>
          <div class="choice-body table-container inside-table">
            <el-table
              :data="templateList"
              :max-height="tableMaxHeight"
              fit
              size="small"
              highlight-current-row
            >
              <el-table-column label="" width="60">
                <template slot-scope="scope">
                  <el-radio v-model="selectedTemplate" :label="scope.$index"/>
                </template>
              </el-table-column>
              <el-table-column prop="name" label="模板名" />
              <el-table-column prop="protocol" label="支持协议">
                <template slot-scope="scope">
                  {{ scope.row.protocol && scope.row.protocol.join(',') }}
                </template>
              </el-table-column>
              <el-table-column prop="createTime" label="创建时间"/>
            </el-table>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-wrapper">
      <button class="button-plain" @click="handleCancelClick">取消</button>
      <button class="button next-button" @click="handleNextClick">
        下一步
        <button-loading v-if="doNext"/>
      </button>
    </div>
  </div>
</template>

<script>
  import ButtonLoading from '@/components/ButtonLoading'

  export default {
    name: 'DncChoice',
    inject: ['beforeClose'],
    components: {
      ButtonLoading
    },
    props: {
      protocolMap: {
        type: Object,
        required: true
      },
      templateList: {
        type: Array,
        required: true
      },
      selectedProtocol: {
        type: Array,
        required: true
      },
      nextLoading: {
        type: Boolean,
        default: false
      }
    },
    data() {
      return {
        type: 'protocol',
        checkedProtocolList: [],
        checkedProtocolMap: {},
        checkedVersionMap: {},
        selectedTemplate: -1,
        doNext: this.nextLoading,
        tableMaxHeight: 175
      }
    },
    watch: {
      nextLoading(newValue) {
        this.doNext = newValue
      }
    },
    created() {
      this.initData(this.selectedProtocol)
      this.$nextTick(() => {
        if (document.documentElement.offsetWidth >= 1920) {
          this.tableMaxHeight = 335
        } else {
          this.tableMaxHeight = 175
        }
      })
    },
    methods: {
      initData(param) {
        const checkedProtocolMap = {}
        const checkedVersionMap = {}
        // 初始化协议版本：有版本的协议，默认选中第一个
        for (const [protocol, versionList] of Object.entries(this.protocolMap)) {
          if (versionList.length) {
            checkedVersionMap[protocol] = versionList[0]
          }
        }
        let tempArray, protocol, version
        for (const protocolAndVersion of param) {
          tempArray = protocolAndVersion.split('_') // 获取协议和版本
          protocol = tempArray[0]
          version = tempArray[1]
          checkedProtocolMap[protocol] = this.selectedProtocol.includes(protocolAndVersion)
          checkedVersionMap[protocol] = version
        }
        this.checkedProtocolMap = Object.assign({}, this.checkedProtocolMap, checkedProtocolMap)
        this.checkedVersionMap = Object.assign({}, this.checkedVersionMap, checkedVersionMap)
      },
      handleSelectChange(protocol, value) {
        this.checkedVersionMap = Object.assign({}, this.checkedVersionMap, {[protocol]: value})
      },
      handleCancelClick() {
        this.beforeClose()
      },
      handleNextClick() {
        this.doNext = true
        if (this.type === 'protocol') {
          this.checkedProtocolList = []
          for (const protocol of Object.keys(this.checkedProtocolMap)) {
            if (this.checkedProtocolMap[protocol]) {
              if (this.checkedVersionMap[protocol]) {
                this.checkedProtocolList.push(protocol + '_' + this.checkedVersionMap[protocol])
              } else {
                this.checkedProtocolList.push(protocol)
              }
            }
          }
          if (!this.checkedProtocolList.length) {
            this.$messageTips({
              type: 'error',
              message: '请先选择协议或模板'
            })
            this.doNext = false
            return
          }
          this.$emit('choiceComplete', {
            type: 'protocol',
            value: this.checkedProtocolList
          })
        } else if (this.type === 'template') {
          if (!(this.selectedTemplate >= 0)) {
            this.$messageTips({
              type: 'error',
              message: '请先选择协议或模板'
            })
            this.doNext = false
            return
          }
          this.$emit('choiceComplete', {
            type: 'template',
            value: this.selectedTemplate
          })
        }
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "../styles/choice";
</style>

<style rel="stylesheet/scss" lang="scss">
  @import "../styles/choice-el-change";
</style>
