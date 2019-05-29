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
            <template v-if="protocolList.length">
              <div v-for="(protocol, index) in protocolList" :key="index" class="choice-item">
                <el-checkbox :label="protocol" v-model="checkedProtocolMap[protocol]" class="protocol-checkbox">
                  {{ protocol }}
                </el-checkbox>
              </div>
            </template>
            <div v-else class="no-protocol">
              暂无数据
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
      protocolList: {
        type: Array,
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
        for (const protocol of param) {
          checkedProtocolMap[protocol] = this.selectedProtocol.includes(protocol)
        }
        this.checkedProtocolMap = Object.assign({}, this.checkedProtocolMap, checkedProtocolMap)
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
                this.checkedProtocolList.push(protocol)
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
