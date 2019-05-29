<template>
  <div ref="tmContainer" style="min-height: calc(100vh - 64px)">
    <page-title :title="pageTitle"/>
    <page-operator :button-map="buttonMap" class="operate-wrapper">
      <search-input :tips="''" @doSearch="handleSearch" @doClear="handleSearchClear"/>
    </page-operator>
    <div class="table-container">
      <el-table
        v-loading="listLoading"
        ref="infoTable"
        :data="gateList"
        :max-height="tableMaxHeight"
        stripe
        fit
        size="small"
        highlight-current-row
        class="dac-table"
        style="width: 100%;"
        @sort-change="sortChange"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" align="center" width="30"/>
        <el-table-column label="编号" width="60">
          <template slot-scope="scope">
            {{ scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column prop="gateName" label="网关名称" sortable="custom" min-width="140"/>
        <el-table-column prop="gateMac" label="网关MAC" sortable="custom" width="180"/>
        <el-table-column prop="serverIP" label="IP地址" sortable="custom" width="120"/>
        <el-table-column prop="gateType" label="网关类型" sortable="custom" width="120"/>
        <el-table-column prop="software_version" label="版本号" sortable="custom" width="120"/>
        <el-table-column prop="status" label="状态" sortable="custom" width="100">
          <template slot-scope="scope">
            {{ getStatus(scope.row.status) }}
          </template>
        </el-table-column>
        <el-table-column label="更多操作" width="120">
          <template slot-scope="scope">
            <div class="operate-cell">
              <svg-icon
                icon-class="edit"
                class="edit-icon"
                tips="编辑网关名称"
                @click="handleGateEdit(scope.$index)"
              />
              <svg-icon
                icon-class="docs"
                class="docs-icon"
                tips="查看上次操作"
                @click="handleGateViewStatus(scope.$index)"
              />
              <svg-icon
                icon-class="delete"
                class="delete-icon"
                tips="删除网关"
                @click="handleGateDelete(scope.$index)"
              />
            </div>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="footer-container">
      <app-pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParam.page"
        :limit.sync="queryParam.limit"
        @pagination="handlePagination"
      />
    </div>

    <el-dialog
      :visible.sync="dialogShow"
      :before-close="handleDialogClose"
      :close-on-click-modal="false"
      :class="{'show-confirm': confirmShow}"
      class="gate-manage-dialog"
    >
      <div slot="title" class="gate-dialog-title">
        <transition-group name="slide-left">
          <span v-if="editShow" key="edit" class="title">编辑网关名称</span>
          <span v-if="operateStatusShow" key="status" class="title">上次操作状态</span>
          <span v-if="upgradeShow" key="upgrade" class="title">网关程序升级</span>
        </transition-group>
      </div>
      <!-- 编辑对话框 -->
      <transition-group name="slide-left">
        <mgr-edit
          v-if="editShow"
          key="edit-panel"
          :gate-mac="gateMac"
          :gate-name-old="gateName"
          @saved="handleEditSaved"
        />
        <!-- 查看上次操作状态对话框 -->
        <mgr-operate-status
          v-if="operateStatusShow"
          key="operate-status-panel"
          :gate-mac="gateMac"
        />
        <!-- 升级及确认对话框 -->
        <mgr-upgrade
          v-show="upgradeShow"
          ref="upgradePanel"
          key="upgrade-panel"
          :has-dnc="upgradeHasDnc"
          :dnc-mac-list="upgradeDncMacList"
          :has-plc="upgradeHasPlc"
          :plc-mac-list="upgradePlcMacList"
          @showConfirm="handleShowConfirmUpgrade"
          @dncUpgrading="handleDncUpgrading"
          @dncUpgradeSuccess="handleDncUpgradeSuccess"
          @dncUpgradeFail="handleDncUpgradeFail"
          @plcUpgrading="handlePlcUpgrading"
          @plcUpgradeSuccess="handlePlcUpgradeSuccess"
          @plcUpgradeFail="handlePlcUpgradeFail"
        />
        <confirm-dialog
          v-show="confirmShow"
          key="confirm-panel"
          :on-cancel="handleCancelUpgrade"
          :on-confirm="handleConfirmUpgrade"
          msg="是否确认升级选中DNC网关的网关程序？"
        />
      </transition-group>
    </el-dialog>
  </div>
</template>

<script>
  import PageTitle from '@/components/PageTitle'
  import PageOperator from '@/components/PageOperator'
  import SearchInput from '@/components/SearchInput'
  import AppPagination from '@/components/Pagination'
  import ConfirmDialog from '@/components/ConfirmDialog'
  import TableMixins from '@/mixins/TableMixins'
  import {getToken} from '@/utils/auth'
  // import {fetchResoveList, clearConfig, dispatchConfig} from '@/api/tm'
  import {
    manageFetchGateList,
    deleteGate,
    dispatchConfig,
    syncConfig,
    gateRestart
  } from '@/mock/tm'
  import MgrEdit from './components/MgrEdit'
  import MgrUpgrade from './components/MgrUpgrade'
  import MgrOperateStatus from './components/MgrOperateStatus'

  const statusMap = {
    0: '未激活',
    1: '已启用',
    9: '已禁用'
  };

  export default {
    name: 'GatewayManage',
    components: {
      PageTitle,
      PageOperator,
      SearchInput,
      AppPagination,
      ConfirmDialog,
      MgrEdit,
      MgrUpgrade,
      MgrOperateStatus
    },
    mixins: [TableMixins],
    provide () {
      return {
        beforeClose: this.handleDialogClose
      }
    },
    data() {
      return {
        pageTitle: '网关列表',
        buttonMap: {
          'upgrade': {label: '程序升级', disabled: true, handleClick: this.handleUpgradeClick},
          'dispatch': {label: '配置下发', disabled: true, handleClick: this.handleDispatchClick},
          'sync': {label: '同步离线数据', disabled: true, handleClick: this.handleSyncClick},
          'restart': {label: '网关重启', disabled: true, handleClick: this.handleRestartClick}
        },
        gateList: [],
        tableMaxHeight: 200,
        total: 0,
        listLoading: false,
        queryParam: {
          token: getToken(),
          page: 1,
          limit: 10,
          order: 'ascending',
          orderProp: 'id',
          searchKey: ''
        },
        multipleSelection: [],
        gateMac: '',
        gateName: '',
        upgradeHasDnc: '',
        upgradeHasPlc: '',
        upgradeDncMacList: [],
        upgradePlcMacList: [],
        upgradeType: '',
        dialogShow: false,
        editShow: false,
        operateStatusShow: false,
        upgradeShow: false,
        confirmShow: false
      }
    },
    watch: {
      multipleSelection(rows) {
        this.buttonMap['upgrade'].disabled = rows.length === 0
        this.buttonMap['dispatch'].disabled = rows.length === 0
        this.buttonMap['sync'].disabled = rows.length === 0
        this.buttonMap['restart'].disabled = rows.length === 0
      }
    },
    methods: {
      getList() {
        this.listLoading = true;
        manageFetchGateList(this.queryParam)
          .then(res => {
            this.gateList = res.items;
            this.total = res.totalCount;
            this.listLoading = false;
          })
          .catch(msg => {})
      },
      getStatus(statusCode) {
        return statusMap[statusCode]
      },
      handleSelectionChange(selectedRows) {
        this.multipleSelection = selectedRows;
      },
      // 保存网关名称
      handleGateEdit (index) {
        if (this.gateList[index].status === '') {
          return
        }
        this.gateMac = this.gateList[index].gateMac
        this.gateName = this.gateList[index].gateName
        this.dialogShow = true
        this.editShow = true
      },
      handleEditSaved () {
        this.getList()
      },
      // 查看网关上次操作状态
      handleGateViewStatus (index) {
        if (this.gateList[index].status === '') {
          return
        }
        this.gateMac = this.gateList[index].gateMac
        this.dialogShow = true
        this.operateStatusShow = true
      },
      // 删除网关
      handleGateDelete (index) {
        const {status, gateMac} = this.getList[index]
        // 升级中的网关不能做任何操作
        if (status === '') {
          return
        }
        deleteGate({gateMac})
          .then(() => {
            this.$messageTips({
              message: '删除成功。'
            });
            this.getList()
          })
          .catch(msg => {})
      },
      handleUpgradeClick() {
        if (this.buttonMap['upgrade'].disabled) {
          return
        }
        this.upgradeDncMacList = this.multipleSelection.map(
          gate => gate.gateType.toUpperCase().includes('DNC') ? gate.gateMac : ''
        )
          .filter(mac => mac)
        this.upgradePlcMacList = this.multipleSelection.map(
          gate => gate.gateType.toUpperCase().includes('PLC') ? gate.gateMac : ''
        )
          .filter(mac => mac)
        this.upgradeHasDnc = this.upgradeDncMacList.length > 0
        this.upgradeHasPlc = this.upgradePlcMacList.length > 0
        this.dialogShow = true
        this.upgradeShow = true
        this.confirmShow = false
      },
      handleShowConfirmUpgrade(value) {
        this.upgradeShow = false
        this.confirmShow = true
        this.upgradeType = value.type
      },
      handleCancelUpgrade() {
        this.upgradeShow = true
        this.confirmShow = false
      },
      handleConfirmUpgrade() {
        this.upgradeShow = true
        this.confirmShow = false
        this.$refs['upgradePanel'].doUpgrade(this.upgradeType)
      },
      handleDncUpgrading() {
        this.changeStatus(this.upgradeDncMacList, 9)
      },
      handleDncUpgradeSuccess() {
        this.changeStatus(this.upgradeDncMacList, 9)
      },
      handleDncUpgradeFail() {
        this.changeStatus(this.upgradeDncMacList, 9)
      },
      handlePlcUpgrading() {
        this.changeStatus(this.upgradePlcMacList, 9)
      },
      handlePlcUpgradeSuccess() {
        this.changeStatus(this.upgradePlcMacList, 9)
      },
      handlePlcUpgradeFail() {
        this.changeStatus(this.upgradePlcMacList, 9)
      },
      handleDispatchClick() {
        if (this.buttonMap['dispatch'].disabled) {
          return
        }
        // 过滤掉升级中的网关
        const gateMacList = this.multipleSelection
          .map(resolve => resolve.status === '' ? '' : resolve.gateMac)
          .filter(mac => mac)
        dispatchConfig({gateMac: JSON.stringify(gateMacList)})
          .then(() => {
            this.$messageTips({
              message: '下发成功。'
            });
            this.changeStatus(gateMacList, 9)
          })
          .catch(msg => {})
      },
      handleSyncClick() {
        if (this.buttonMap['sync'].disabled) {
          return
        }
        // 过滤掉升级中的网关
        const gateMacList = this.multipleSelection
          .map(resolve => resolve.status === '' ? '' : resolve.gateMac)
          .filter(mac => mac)
        syncConfig({gateMac: JSON.stringify(gateMacList)})
          .then(() => {
            this.$messageTips({
              message: '同步离线数据成功。'
            });
            this.changeStatus(gateMacList, 9)
          })
          .catch(msg => {})
      },
      handleRestartClick() {
        if (this.buttonMap['restart'].disabled) {
          return
        }
        // 过滤掉升级中的网关
        const gateMacList = this.multipleSelection
          .map(resolve => resolve.status === '' ? '' : resolve.gateMac)
          .filter(mac => mac)
        gateRestart({gateMac: JSON.stringify(gateMacList)})
          .then(() => {
            this.$messageTips({
              message: '重启成功。'
            });
            this.changeStatus(gateMacList, 9)
          })
          .catch(msg => {})
      },
      handleDialogClose() {
        this.dialogShow = false
        this.closePanel()
      },
      closePanel() {
        this.editShow = false
        this.operateStatusShow = false
        this.upgradeShow = false
        this.confirmShow = false
      },
      changeStatus(gateMacList, newStatus) {
        for (const gate of this.gateList) {
          if (gateMacList.includes(gate.gateMac)) {
            gate.status = newStatus
          }
        }
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "styles/footer";

  .operate-cell {
    height: 100%;
    display: flex;
    align-items: center;

    .edit-icon {
      width: 16px;
      height: 16px;
      margin-right: 20px;
    }

    .docs-icon {
      width: 12px;
      height: 16px;
      margin-right: 20px;
    }

    .edit-icon, .docs-icon, .delete-icon {
      cursor: pointer;
    }
  }

  $transitionDuration: 300ms;
  .slide-left-enter-active {
    transition: transform $transitionDuration, opacity $transitionDuration, hight $transitionDuration;
  }

  .slide-left-leave-active {
    transition: transform $transitionDuration, opacity $transitionDuration;
    overflow: hidden;
  }

  .slide-left-enter, .slide-left-leave-to {
    height: 0;
    padding-top: 0;
    padding-bottom: 0;
    opacity: 0;
    transform: translateX(100%) scale(0);
  }

  .slide-left-leave-to {
    transform: translateX(-100%) scale(0);
  }
</style>

<style rel="stylesheet/scss" lang="scss">
  .gate-manage-dialog {
    .el-dialog {
      width: 580px;
      max-height: 520px;
      overflow: hidden;
      transition: transform 300ms;

      .el-dialog__header {
        height: 55px;
      }

      .el-dialog__body {
        transition: height .3s;
      }

      .gate-dialog-title {
        .title {
          font-size: $fontSizeHead;
          color: $textColorTitle;
          font-weight: $fontWeight;
        }
      }

      .el-dialog__headerbtn .el-dialog__close {
        color: rgba(0, 0, 0, 0.45);
      }

      .el-dialog__headerbtn:hover {
        .el-dialog__close {
          color: $hoverColor;
        }
      }
    }

    .el-dialog__body {
      position: relative;
      padding: 0;

      &::before {
        content: ' ';
        position: absolute;
        left: 0;
        right: 0;
        bottom: 52px;
        height: 1px;
        background-color: rgba(0, 0, 0, 0.09);
        z-index: 2;
      }
    }
  }

  .gate-manage-dialog.show-confirm {
    .el-dialog {
      width: 400px;
      transform: translateY(120px);
    }

    .el-dialog__header {
      display: none;
    }

    .el-dialog__body {
      &::before {
        content: none;
      }
    }
  }
</style>
