<template>
  <div class="ok-container">
    <div class="icon">
      <img src="@/assets/icon/icon_yes.svg"/>
    </div>
    <div class="body">成功</div>
    <div class="footer">返回
      <router-link class="back" to="/login">登录</router-link>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'LogoForget'
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .ok-container {
    width: 600px;
    margin: 100px auto 0 auto;
    background: $whiteColor;
    padding: 60px 0;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 0 1px 6px 0 rgba(201, 201, 201, 1);
    border-radius: 1px;
  }

  .icon {
    width: 64px;
    height: 64px;
    border-radius: 50%;

    img {
      width: 100%;
      max-width: 100%;
    }
  }

  .body {
    margin-top: 19px;
    font-size: 24px;

    color: rgba(51, 51, 51, 1);
    line-height: 33px;
  }

  .footer {
    margin-top: 17px;
    font-size: 13px;

    color: rgba(112, 112, 112, 1);
    line-height: 18px;

    .back {
      color: #1890FF;
      padding-left: 1px;
    }
  }
</style>
