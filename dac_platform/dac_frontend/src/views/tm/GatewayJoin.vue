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
        :data="gatewayList"
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
        <el-table-column prop="id" label="编号" width="60"/>
        <el-table-column prop="compName" label="公司名称" sortable="custom" min-width="100"/>
        <el-table-column prop="gateMac" label="网关MAC" sortable="custom" width="180"/>
        <el-table-column prop="ServerIP" label="IP地址" sortable="custom" width="120"/>
        <el-table-column prop="gateType" label="网关类型" sortable="custom" width="120"/>
        <el-table-column prop="software_version" label="版本号" sortable="custom" width="120"/>
        <el-table-column prop="status" label="状态" sortable="custom" width="100">
          <template slot-scope="scope">
            {{ getStatus(scope.row.status) }}
          </template>
        </el-table-column>
        <el-table-column prop="lastBuildTime" label="接入时间" sortable="custom" width="180"/>
      </el-table>
    </div>
    <div class="footer-container">
      <div class="info-wrapper">
        <span class="label">网关总数</span><span class="count">{{ countInfo.total }}</span><span class="separator"></span>
        <span class="label">已启用</span><span class="count">{{ countInfo.enable }}</span>
      </div>
      <app-pagination
        v-show="total > 0"
        :total="total"
        :page.sync="queryParam.page"
        :limit.sync="queryParam.limit"
        @pagination="handlePagination"
      />
    </div>
  </div>
</template>

<script>
  import PageTitle from '@/components/PageTitle'
  import PageOperator from '@/components/PageOperator'
  import SearchInput from '@/components/SearchInput'
  import TableMixins from '@/mixins/TableMixins'
  import { getToken } from '@/utils/auth'
  // import {fetchGateWayList, enableGateWay} from '@/mock/tm'
  import {fetchGateWayList, enableGateWay} from '@/api/tm'
  import AppPagination from '@/components/Pagination'

  const statusMap = {
    0: '未激活',
    1: '已启用',
    9: '已禁用'
  };
  export default {
    name: 'GatewayJoin',
    components: {
      PageTitle,
      PageOperator,
      SearchInput,
      AppPagination
    },
    mixins: [TableMixins],
    data() {
      return {
        pageTitle: '网关列表',
        buttonMap: {
          'enable': {label: '启用', disabled: true, handleClick: this.handleEnable}
        },
        gatewayList: [],
        tableMaxHeight: 200,
        total: 0,
        listLoading: false,
        queryParam: {
          token: getToken(),
          page: 1,
          limit: 10,
          order: 'ascending', // 或 'descending'
          orderProp: 'id',
          searchKey: ''
        },
        multipleSelection: [],
        selectedStatus: [],
        selectedGateMacs: [],
        countInfo: {
          total: undefined,
          enable: undefined
        }
      }
    },
    watch: {
      selectedStatus(status) {
        this.buttonMap['enable'].disabled = status.every(status => status === 1)
      }
    },
    methods: {
      getList() {
        this.listLoading = true;
        fetchGateWayList(this.queryParam)
          .then(res => {
            this.gatewayList = res.items;
            this.total = res.totalCount;
            this.listLoading = false;
            this.countInfo = Object.assign({
              total: res.totalCount,
              enable: res.allowCount
            })
          })
          .catch(msg => {})
      },
      // 生成表格时获取状态
      getStatus(statusCode) {
        return statusMap[statusCode]
      },
      // 启用、禁用
      handleSelectionChange(selectedRows) {
        this.multipleSelection = selectedRows;
        this.selectedStatus = selectedRows.map(row => row.status);
        this.selectedGateMacs = selectedRows.map(row => row.gateMac)
      },
      handleEnable() {
        if (this.buttonMap['enable'].disabled) {
          return
        }
        enableGateWay(this.selectedGateMacs)
          .then(() => {
            this.$messageTips({
              message: '网关已启用'
            });
            this.getList()
          })
          .catch(msg => {})
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "./styles/footer";

  .message-wrapper {
    font-size: 20px;
    color: #409EFF;
    margin-top: 20px;
  }

  .footer-container {
    /*background-color: #FAFAFA;*/
    justify-content: space-between;
  }

  .info-wrapper {
    display: flex;
    align-items: center;

    .label, .count {
      height: 20px;
      line-height: 20px;
      color: rgba(0, 0, 0, 0.65);
    }

    .count {
      margin-left: 10px;
      font-weight: $fontWeightBolder;
    }

    .separator {
      width: 2px;
      height: 12px;
      background-color: #9B9B9B;
      margin: 0 24px;
    }
  }
</style>
