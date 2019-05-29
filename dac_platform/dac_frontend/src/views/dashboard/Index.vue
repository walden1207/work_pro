<template>
  <section>
    <h1 class="main-page">登录成功</h1>
    <div class="main-page">
      <el-button type="danger" round @click="logout">退出登录</el-button>
    </div>
  </section>
</template>

<script>

export default {
  name: 'MainPage',
  methods: {
    logout() {
      this.$store.dispatch('LogOut').then(() => {
        location.reload() // 为了重新实例化vue-router对象 避免bug
      })
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
.main-page {
  line-height: 5;
  text-align: center;
  margin: 20px;
  color: #409EFF;
}
</style>
