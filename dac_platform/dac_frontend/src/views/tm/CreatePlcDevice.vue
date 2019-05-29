<template>
  <div ref="createContainer" class="create-device" style="min-height: calc(100vh - 138px)">
    <page-title>
      <span class="create-title">
        建物影子
        <svg-icon icon-class="question" class="question-icon" tips="物影子是设备对应云端的映像" />
      </span>
      <button class="button" @click="handleNewClick">
        <svg-icon icon-class="plus" class="plus-icon"/>新建
      </button>
    </page-title>
    <div class="table-container create-device-table">
      <el-table
        v-loading="listLoading"
        :data="deviceList"
        :max-height="tableMaxHeight"
        fit
        size="small"
        highlight-current-row
        style="width: 100%;"
      >
        <el-table-column label="编号" width="60">
          <template slot-scope="scope">
            {{ scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column prop="deviceName" label="设备名称" min-width="160">
          <template slot-scope="scope">
            <div v-if="!deviceNameEditStatus[scope.$index]">
              {{ scope.row.deviceName }}
            </div>
            <div v-else>
              <el-input
                v-focus-el
                :ref="'deviceName' + scope.$index"
                v-model="scope.row.deviceName"
                :key="'name' + scope.$index"
                placeholder="请输入设备名称"
                maxlength="50"
                @focus="handleDeviceNameFocus(scope.$index)"
                @blur="handleDeviceNameBlur(scope.$index, scope.row.deviceName)"
              />
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="deviceCode" label="设备编码" min-width="160">
          <template slot-scope="scope">
            <div v-if="!deviceCodeEditStatus[scope.$index]">
              {{ scope.row.deviceCode }}
            </div>
            <div v-else>
              <el-input
                v-model="scope.row.deviceCode"
                :key="'code' + scope.$index"
                placeholder="请输入设备编码"
                maxlength="50"
                @focus="handleDeviceCodeFocus(scope.$index)"
                @blur="handleDeviceCodeBlur(scope.$index, scope.row.deviceCode)"
              />
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="deviceDesc" label="设备描述" min-width="160">
          <template slot-scope="scope">
            <div v-if="!deviceDescEditStatus[scope.$index]">
              {{ scope.row.deviceDesc }}
            </div>
            <div v-else>
              <el-input
                v-model="scope.row.deviceDesc"
                :key="'desc' + scope.$index"
                placeholder="请输入设备描述"
                @focus="handleDeviceDescFocus(scope.$index)"
                @blur="handleDeviceDescBlur(scope.$index, scope.row.deviceDesc)"
              />
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="protocols" label="协议" min-width="220">
          <template slot-scope="scope">
            <div
              v-if="scope.row.protocols && scope.row.protocols.length"
              class="protocol-cell"
              @click="handleChoiceClick(scope.$index)"
            >
              {{ scope.row.protocols.join(',') }}
            </div>
            <div
              v-else
              class="protocol-cell"
              @click="handleChoiceClick(scope.$index)"
            >
              <span class="label">选择协议/选择模板</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="采集项" width="100">
          <template slot-scope="scope" >
            <div class="item-cell" @click="handleConfigClick(scope.$index)">
              <span class="label">
                配置采集项
                <button-loading v-if="configLoadingShowStatus[scope.$index]"/>
              </span>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="80">
          <template slot-scope="scope">
            <div class="operate-cell">
              <svg-icon
                icon-class="edit"
                class="edit-icon"
                tips="编辑"
                @click="handleRowEdit(scope.$index)"
              />
              <svg-icon
                icon-class="delete"
                class="delete-icon"
                tips="删除"
                @click="handleRowDelete(scope.$index)"
              />
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <div class="cancel-save-container">
      <button class="button-plain" @click="handleCancelClick">取消</button>
      <button class="button " @click="handleSaveClick">保存</button>
    </div>

    <el-dialog
      :visible.sync="dialogShow"
      :before-close="handleDialogClose"
      :close-on-click-modal="false"
      class="dnc-resolve-dialog"
    >
      <div slot="title" class="dnc-dialog-title">
        <transition-group :name="panelTransitionName" mode="out-in">
          <span v-if="choiceShow" key="choice" class="step">选择协议或模板</span>
          <span v-if="configShow" key="config" class="step">配置采集项</span>
        </transition-group>
      </div>
      <transition :name="panelTransitionName">
        <plc-choice
          v-if="choiceShow"
          :key="'choice' + latestIndex"
          :protocol-list="protocolList"
          :template-list="templateList"
          :selected-protocol="selectedProtocol"
          :next-loading="nextLoading"
          @choiceComplete = "handleChoiceComplete($event)"
        />
      </transition>
      <transition :name="panelTransitionName">
        <plc-config
          v-if="configShow"
          :key="'config' + latestIndex"
          :gate-mac="gateMac"
          :gate-type="gateType"
          :config-params="configParams"
          :template-names="templateNameList"
          :completing="completing"
          :show-previous="configShowPrevious"
          @previous="handlePreviousClick"
          @cancel="handleConfigCancelClick"
          @saveTemplate="handleSaveTemplate"
          @configComplete="handleConfigComplete"
        />
      </transition>
    </el-dialog>
  </div>
</template>

<script>
  import CreateDevice from './mixins/CreateDevice'
  import PageTitle from '@/components/PageTitle'
  import ButtonLoading from '@/components/ButtonLoading'
  import focusEl from '@/directive/focusEl/focusEl'
  // import { fetchPlcProtocolList } from '@/mock/tm'
  import { fetchPlcProtocolList } from '@/api/tm'
  import PlcChoice from './components/PlcChoice'
  import PlcConfig from './components/PlcConfig'

  export default {
    name: 'CreatePlcDevice',
    provide () {
      return {
        beforeClose: this.handleDialogClose
      }
    },
    components: {
      PageTitle,
      ButtonLoading,
      PlcChoice,
      PlcConfig
    },
    directives: {
      focusEl
    },
    mixins: [CreateDevice],
    data() {
      return {
        protocolList: [] // 所有协议
      }
    },
    methods: {
      fetchProtocolList() {
        const queryParam = {
          gateMac: this.gateMac,
          gateType: this.gateType
        }
        fetchPlcProtocolList(queryParam)
          .then(res => {
            this.protocolList = res
          })
          .catch(msg => {})
      },
      handleChoiceClick(index) {
        if (this.protocolList && this.templateList) {
          this.doChoiceClick(index)
        }
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "./styles/create";
</style>
<style rel="stylesheet/scss" lang="scss">
  @import "styles/create-el-change";

  .main-container {
    &::after {
      content: none;
    }
  }
</style>
