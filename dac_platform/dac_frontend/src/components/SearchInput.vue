<template>
  <el-input
    v-model.trim="searchKey"
    :placeholder="tips"
    class="search-input"
    clearable
    @focus="handleFocus"
    @keyup.enter.native="handleSubmit"
    @clear="$emit('doClear')"
  >
    <i slot="suffix" class="el-input__icon el-icon-search"></i>
  </el-input>
</template>

<script>
  export default {
    name: 'SearchInput',
    props: {
      tips: {
        type: String,
        default: 'Search'
      }
    },
    data() {
      return {
        searchKey: '',
        error: false
      }
    },
    watch: {
      searchKey(val) {
        if (!val) {
          this.$emit('doClear')
        }
      }
    },
    methods: {
      handleFocus() {
        if (this.error) {
          this.error = false
        }
      },
      handleSubmit() {
        this.$emit('doSearch', this.searchKey)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss">
  .search-input {
    width: 200px;
    height: 28px;

    .el-input__inner {
      border-color: $borderColorInput;
      color: $textColorBody;
      height: 28px;
      line-height: 28px;
    }

    .el-input__icon {
      line-height: 28px;
    }
  }

</style>
