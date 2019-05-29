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
        <span class="model-link" @click="goModelManage">模型管理</span>
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
  import {fetchAmDetailApply} from '@/mock/am'
  // import {fetchAmDetailApply} from '@/api/am'
  import BreadCrumb from '@/components/BreadCrumb'

  export default {
    name: 'DetailMarket',
    components: {
      BreadCrumb
    },
    data() {
      return {
        linkList: [{id: 1, name: '算法应用', path: '/am/apply'}],
        currentPage: '',
        amDetail: {},
        showList: [true, false],
        titleKeyList: ['introduction', 'useMethod'],
        titleMap: {
          introduction: '介绍',
          useMethod: '使用方法'
        }
      }
    },
    created() {
      const name = this.$route.params['name']
      console.log(name)
      this.currentPage = name
      fetchAmDetailApply({name})
        .then(res => {
          this.amDetail = Object.assign({}, res)
        })
        .catch(msg => {})
    },
    methods: {
      handleDownload() {
        this.$messageTips({
          type: 'error',
          message: '暂未开通'
        });
      },
      toggleItem(index) {
        const isShow = this.showList[index]
        this.showList.splice(index, 1, !isShow)
      },
      goModelManage() {
        this.$router.push(`/am/model/${this.currentPage}`)
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
