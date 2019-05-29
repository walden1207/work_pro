<template>
  <div ref="tmContainer" style="min-height: calc(100vh - 64px)">
    <page-title :title="pageTitle"/>
    <page-operator :button-map="buttonMap">
      <search-input :tips="''" @doSearch="handleSearch" @doClear="handleSearchClear"/>
    </page-operator>
    <div class="table-container">
      <el-table
        v-loading="listLoading"
        :data="resolveList"
        :max-height="tableMaxHeight"
        stripe
        fit
        size="small"
        highlight-current-row
        style="width: 100%;"
        @sort-change="sortChange"
        @selection-change="handleSelectionChange"
      >
        <el-table-column type="selection" align="center" width="30"/>
        <el-table-column prop="id" label="编号" width="60"/>
        <el-table-column prop="gateName" label="网关名称" sortable="custom" min-width="140"/>
        <el-table-column prop="gateMac" label="网关MAC" sortable="custom" width="180"/>
        <el-table-column prop="gateType" label="网关类型" sortable="custom" width="120"/>
        <el-table-column prop="protocols" label="协议" min-width="240">
          <template slot-scope="scope">
            {{ scope.row.protocols && scope.row.protocols.join(',') }}
          </template>
        </el-table-column>
        <el-table-column prop="machCode" label="物影子" min-width="240">
          <template slot-scope="scope">
            {{ scope.row.machCode && scope.row.machCode.join(',') }}
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
  </div>
</template>

<script>
  import PageTitle from '@/components/PageTitle'
  import PageOperator from '@/components/PageOperator'
  import SearchInput from '@/components/SearchInput'
  import AppPagination from '@/components/Pagination'
  import TableMixins from '@/mixins/TableMixins'
  import {getToken} from '@/utils/auth'
  import {fetchResoveList, clearConfig, dispatchConfig} from '@/api/tm'
  // import {fetchResoveList, clearConfig, dispatchConfig} from '@/mock/tm'
  import CreateDevice from './CreateDncDevice'

  export default {
    name: 'DncResolve',
    components: {
      PageTitle,
      PageOperator,
      SearchInput,
      AppPagination,
      CreateDevice
    },
    mixins: [TableMixins],
    data() {
      return {
        pageTitle: '物解析',
        buttonMap: {
          'edit': {label: '编辑', disabled: true, handleClick: this.handleEditClick},
          'reset': {label: '重置', disabled: true, handleClick: this.handleResetClick},
          'dispatch': {label: '下发', disabled: true, handleClick: this.handleDispatchClick}
        },
        resolveList: [],
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
        multipleSelection: []
      }
    },
    watch: {
      multipleSelection(rows) {
        this.buttonMap['edit'].disabled = rows.length === 0 || rows.length > 1;
        this.buttonMap['reset'].disabled = rows.length === 0
        this.buttonMap['dispatch'].disabled = rows.length === 0
      }
    },
    methods: {
      getList() {
        this.listLoading = true;
        fetchResoveList(this.queryParam)
          .then(res => {
            this.resolveList = res.items;
            this.total = res.totalCount;
            this.listLoading = false;
          })
          .catch(msg => {})
      },
      handleSelectionChange(selectedRows) {
        this.multipleSelection = selectedRows;
      },
      handleEditClick() {
        if (this.buttonMap['edit'].disabled) {
          return
        }
        const {gateMac, gateType} = this.multipleSelection[0];
        if (gateType.toUpperCase().includes('DNC')) {
          this.$router.push(`create-dnc/${gateMac}/${gateType}`)
        } else if (gateType.toUpperCase().includes('PLC')) {
          this.$router.push(`create-plc/${gateMac}/${gateType}`)
        }
      },
      handleResetClick() {
        if (this.buttonMap['reset'].disabled) {
          return
        }
        this.$confirm('是否确认清空所选网关所有配置信息?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
          .then(() => {
            const gateMacList = this.multipleSelection.map(resolve => resolve.gateMac);
            clearConfig({gateMac: JSON.stringify(gateMacList)})
              .then(() => {
                this.$messageTips({
                  message: '已清空所选网关配置信息。'
                });
                this.getList()
              })
              .catch(msg => {})
          })
          .catch(() => {});
      },
      handleDispatchClick() {
        if (this.buttonMap['dispatch'].disabled) {
          return
        }
        const gateMacList = this.multipleSelection.map(resolve => resolve.gateMac);
        dispatchConfig({gateMac: JSON.stringify(gateMacList)})
          .then(() => {
            this.$messageTips({
              message: '下发成功。'
            });
            this.getList()
          })
          .catch(msg => {})
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "styles/footer";
</style>
