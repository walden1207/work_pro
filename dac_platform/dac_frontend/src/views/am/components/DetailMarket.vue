<template>
  <div style="padding-top: 20px">
    <bread-crumb :item-list="linkList" :current="currentPage"/>
    <div class="name-wrapper">
      <img src="@/assets/am_detail_bg.jpg" alt=""/>
      <div class="name-box">
        <div class="name">{{ amDetail.name }}</div>
        <div class="name en">{{ amDetail.nameEn }}</div>
      </div>
    </div>
    <div class="content-wrapper">
      <div class="download-area">
        <button class="button" @click="handleDownload">下载文档</button>
      </div>
      <div v-for="(titleKey, index) in titleKeyList" :key="index" :class="{'open': showList[index]}" class="example-area">
        <div class="example-title" @click="toggleItem(index)">
          <i class="el-icon-arrow-down example-icon"></i>{{ titleMap[titleKey] }}
        </div>
        <transition name="down-fade">
          <div v-show="showList[index]" class="example-content" v-html="amDetail[titleKey]"></div>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>
  // import {fetchAmDetail} from '@/mock/am'
  import {fetchAmDetail} from '@/api/am'
  import BreadCrumb from '@/components/BreadCrumb'

  export default {
    name: 'DetailMarket',
    components: {
      BreadCrumb
    },
    data() {
      return {
        linkList: [{id: 1, name: '算法市场', path: '/am'}],
        currentPage: '',
        amDetail: {},
        showList: [true, false, false, false, false, false],
        titleKeyList: [
          'content', 'inputFormat', 'inputJson', 'outputJson', 'outputContent', 'api'
        ],
        titleMap: {
          content: '算法简介',
          inputFormat: '输入格式',
          inputJson: '输入 json 文件样例',
          outputJson: '输出 json 文件',
          outputContent: '输出内容',
          api: 'API'
        }
      }
    },
    created() {
      const name = this.$route.params['name']
      fetchAmDetail({name})
        .then(res => {
          this.amDetail = Object.assign({}, res)
          this.currentPage = this.amDetail.name
          console.log(this.amDetail.type)
        })
        .catch(msg => {})
    },
    methods: {
      handleDownload() {
        window.print()
        this.$messageTips({
          type: 'error',
          message: '暂未开通'
        });
      },
      toggleItem(index) {
        // event.target.parentNode.classList.toggle('open')
        // this.showList[index] = !this.showList[index]
        const isShow = this.showList[index]
        this.showList.splice(index, 1, !isShow)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "../styles/detail";
</style>

<style lang="scss">
  .example-content {
    p, ul {
      margin: 0;
      padding: 0;
    }
  }
</style>
