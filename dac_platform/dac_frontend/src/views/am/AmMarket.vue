<template>
  <section style="padding: 0 24px">
    <div class="search-container">
      <search-input @doSearch="handleSearch" @doClear="handleSearchClear"/>
    </div>
    <tab-panel :tab-list="tabList" :panel-map="panelMap" :init-show-key="showKey"/>
  </section>
</template>

<script>
  import {RESPONSE_ERROR} from '@/utils/constants'
  import SearchInput from '@/components/SearchInput'
  import TabPanel from '@/components/TabPanel'
  import {PurchasedAm, AllAm, StatisticalAnalysis, TimeSeries, DataPreprocess, SceneAm} from './panels'
  import SearchResult from './panels/SearchResult'

  export default {
    name: 'AmMarket',
    components: {
      SearchInput,
      TabPanel,
      PurchasedAm,
      AllAm,
      StatisticalAnalysis,
      TimeSeries,
      DataPreprocess,
      SceneAm,
      SearchResult
    },
    data() {
      return {
        tabList: [
          {key: 'purchased', value: '已购买'},
          {key: 'all', value: '全部'},
          {key: 'am1', value: '数据预处理'},
          {key: 'am2', value: '时间序列'},
          {key: 'am3', value: '数学统计方法和分析'},
          {key: 'am4', value: '场景化算法'}
          // {key: 'search', value: '搜索结果'}
        ],
        panelMap: {
          purchased: PurchasedAm,
          all: AllAm,
          am3: StatisticalAnalysis,
          am2: TimeSeries,
          am1: DataPreprocess,
          am4: SceneAm,
          search: SearchResult
        },
        showKey: 'all',
        keywords: null
      }
    },
    mounted() {
      this.$store.dispatch('FetchAmList', {keywords: ''})
        .catch(msg => {
          if (msg !== RESPONSE_ERROR) {
            this.$messageTips({
              type: 'error',
              message: '获取算法列表失败'
            });
          }
        })
    },
    methods: {
      handleSearch(keywords) {
        if (!keywords) {
          return
        }
        this.$store.dispatch('SearchAmList', {keywords})
          .then(() => {
            if (this.tabList[this.tabList.length - 1].key === 'search') {
              this.tabList.pop();
            }
            this.tabList.push({key: 'search', value: '搜索结果'});
            this.showKey = 'search'
          })
          .catch(msg => {
            if (msg !== RESPONSE_ERROR) {
              this.$messageTips({
                type: 'error',
                message: '搜索失败'
              });
            }
          })
      },
      handleSearchClear() {
        if (this.tabList[this.tabList.length - 1].key === 'search') {
          this.tabList.pop();
        }
        this.showKey = 'all'
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .search-container {
    padding: 24px 0;
    text-align: right;
  }

  .message-wrapper {
    font-size: 20px;
    color: #409EFF;
    margin-top: 20px;
  }
</style>
