<template>
  <div ref="tmContainer" style="min-height: calc(100vh - 64px)">
    <page-title>
      <div>{{ pageTitle }}</div>
      <bread-crumb :item-list="linkList" :current="currentPage"/>
    </page-title>
    <page-operator :button-map="buttonMap" class="operate-wrapper">
      <search-input :tips="''" @doSearch="handleSearch" @doClear="handleSearchClear"/>
    </page-operator>
    <div class="table-container">
      <el-table
        v-loading="listLoading"
        ref="infoTable"
        :data="modelList"
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
        <el-table-column prop="modelName" label="模型名称" sortable="custom" width="180"/>
        <el-table-column prop="status" label="训练状态" sortable="custom" width="210">
          <template slot-scope="scope">
            <template v-if="isNaN(parseFloat(scope.row.status))">
              {{ scope.row.status }}
            </template>
            <el-progress v-else :stroke-width="8" :percentage="parseFloat(scope.row.status)"/>
          </template>
        </el-table-column>
        <el-table-column prop="accuracy" label="正确率" sortable="custom" width="75"/>
        <el-table-column prop="time" label="时间" sortable="custom" width="180"/>
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
                class="view-icon"
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
  </div>
</template>

<script>
  import BreadCrumb from '@/components/BreadCrumb'
  import PageTitle from '@/components/PageTitle'
  import PageOperator from '@/components/PageOperator'
  import SearchInput from '@/components/SearchInput'
  import TableMixins from '@/mixins/TableMixins'
  import { getToken } from '@/utils/auth'
  import {fetchAmModelList, modelDispatch} from '@/mock/am'
  import AppPagination from '@/components/Pagination'

  export default {
    name: 'ModelManage',
    components: {
      BreadCrumb,
      PageTitle,
      PageOperator,
      SearchInput,
      AppPagination
    },
    mixins: [TableMixins],
    data() {
      return {
        pageTitle: '模型管理',
        amName: '',
        linkList: [],
        currentPage: '模型管理',
        buttonMap: {
          'create': {label: '新建模型', disabled: false, handleClick: this.handleCreateClick},
          'dispatch': {label: '模型下发', disabled: true, handleClick: this.handleDispatchClick}
        },
        modelList: [],
        tableMaxHeight: 200,
        total: 0,
        listLoading: false,
        queryParam: {
          token: getToken(),
          page: 1,
          limit: 10,
          order: 'ascending', // 或 'descending'
          orderProp: 'id',
          searchKey: '',
          amName: ''
        },
        multipleSelection: [],
        selectedModelName: []
      }
    },
    watch: {
      multipleSelection(selectedRows) {
        this.buttonMap['dispatch'].disabled = selectedRows.length === 0
      }
    },
    created() {
      this.amName = this.$route.params['name']
      this.linkList = [{
        id: 1, name: '算法应用', path: '/am/apply'
      }, {
        id: 2, name: '算法详情', path: `/am/detail/${this.amName}/applyCard`
      }]
    },
    methods: {
      getList() {
        this.queryParam.amName = this.amName
        console.log(this.queryParam)
        this.listLoading = true;
        fetchAmModelList(this.queryParam)
          .then(res => {
            this.modelList = res.items;
            this.total = res.totalCount;
            this.listLoading = false;
          })
          .catch(msg => {})
      },
      // 启用、禁用
      handleSelectionChange(selectedRows) {
        this.multipleSelection = selectedRows;
      },
      handleCreateClick() {
        // 跳转到新建模型页面，需要参数 算法名称
        this.$router.push(`/am/create/${this.amName}`)
      },
      handleDispatchClick() {
        if (this.buttonMap['dispatch'].disabled) {
          return
        }
        this.selectedModelName = this.multipleSelection.map(
          // 只下发训练完成的
          model => model.status === '' ? model.modelName : ''
        )
          .filter(modelName => modelName)
        modelDispatch(this.selectedGateMacs)
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

    .view-icon {
      width: 12px;
      height: 16px;
      margin-right: 20px;
    }

    .edit-icon, .view-icon, .delete-icon {
      cursor: pointer;
    }
  }

  .title-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    &::after {
      content: ' ';
      position: absolute;
      left: 21px;
      right: 21px;
      bottom: 0;
      height: 1px;
      background-color: #E1E1E1;
    }
  }
</style>
