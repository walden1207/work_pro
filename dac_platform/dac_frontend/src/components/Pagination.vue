<template>
  <div class="pagination-wrapper">
    <el-pagination
      :background="background"
      :current-page.sync="currentPage"
      :page-size.sync="pageSize"
      :layout="layout"
      :page-sizes="pageSizeList"
      :total="total"
      v-bind="$attrs"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"/>
  </div>
</template>

<script>
  import {scrollTo} from '@/utils/scrollTo'

  export default {
    name: 'Pagination',
    props: {
      total: {
        required: true,
        type: Number
      },
      page: {
        type: Number,
        default: 1
      },
      limit: {
        type: Number,
        default: 10
      },
      pageSizeList: {
        type: Array,
        default() {
          return [10, 20, 30, 50]
        }
      },
      layout: {
        type: String,
        default: 'total, sizes, prev, pager, next, jumper'
      },
      background: {
        type: Boolean,
        default: true
      },
      autoScroll: {
        type: Boolean,
        default: true
      }
    },
    computed: {
      currentPage: {
        get() {
          return this.page
        },
        set(val) {
          this.$emit('update:page', val)
        }
      },
      pageSize: {
        get() {
          return this.limit
        },
        set(val) {
          this.$emit('update:limit', val)
        }
      }
    },
    methods: {
      handleSizeChange(val) {
        if (this.currentPage <= Math.ceil(this.total / val)) {
          this.$emit('pagination', {page: this.currentPage, limit: val});
        } else {
          this.$emit('pagination', {page: 1, limit: val});
        }
        if (this.autoScroll) {
          scrollTo(0, 800)
        }
      },
      handleCurrentChange(val) {
        this.$emit('pagination', {page: val, limit: this.pageSize});
        if (this.autoScroll) {
          scrollTo(0, 800)
        }
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss">
  $normalColorBg: #F0F2F5;

  .pagination-wrapper {
    .el-pagination__total {
      margin-right: 10px;
      color: $textColorBody;
    }

    .el-pagination__sizes .el-input .el-input__inner {
      height: 28px;
      line-height: 28px;
      border-color: $borderColorBox;

       &:hover {
         border-color: $hoverColor;
       }
    }

    .el-pagination__sizes .el-input.is-focus .el-input__inner {
      border-color: $activeColor;
    }

    .el-pagination.is-background .btn-next, .el-pagination.is-background .btn-prev, .el-pagination.is-background .el-pager li {
      background-color: $normalColorBg;
    }

    .el-pagination.is-background .btn-next:hover, .el-pagination.is-background .btn-prev:hover, .el-pagination.is-background .el-pager li:hover {
      background-color: $hoverColor;
      color: $whiteColor;
    }

    .el-pagination.is-background .el-pager li:not(.disabled).active {
      background-color: $activeColor;
      color: $whiteColor;
    }

    .el-pagination__jump {
      color: $textColorBody;
    }

    .el-pagination__jump .el-pagination__editor.el-input .el-input__inner {
      border-color: $borderColorBox;
      color: $textColorBody;

      &:hover {
        border-color: $hoverColor;
      }
    }
  }

  .el-select-dropdown__item {
    color: $textColorBody;

    &.hover {
      background-color: $tableHoverColor;
    }

    &.selected {
      color: $activeColor;
      font-weight: $fontWeightBolder;
    }
  }

</style>
