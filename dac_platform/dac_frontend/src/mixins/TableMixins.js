const TableMixins = {
  created() {
    this.$nextTick(() => {
      // title: 81 , operator: 78 , footer: 69
      this.tableMaxHeight = this.$refs['tmContainer'].getBoundingClientRect().height - 81 - 78 - 60 - 24
    })
    this.getList()
  },
  methods: {
    // 排序、搜索、分页
    sortChange(data) {
      const {prop, order} = data
      if (prop && order) {
        Object.assign(this.queryParam, {orderProp: prop, order})
        this.getList()
      }
    },
    handleSearch(searchKey) {
      this.queryParam.searchKey = searchKey
      this.queryParam.page = 1
      this.getList()
    },
    handlePagination(val) {
      Object.assign(this.queryParam, val)
      this.getList(this.queryParam)
    },
    handleSearchClear() {
      this.queryParam.searchKey = ''
      this.getList()
    }
  }
}

export default TableMixins
