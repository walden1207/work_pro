<template>
  <div class="container">
    <video-bg/>
    <div class="logo-wrapper">
      <img src="@/assets/logo/dac_logo.png" alt="logo"/>
    </div>
    <div class="main-content">
      <intro-panel class="intro-container"/>
      <div :class="[loginError ? 'error' : '', 'login-container']">
        <div class="title">登录</div>
        <el-input v-model="mobile" placeholder="账号（手机号）" clearable maxlength="20" @focus="handleFocus"/>
        <el-input v-model="password" type="password" placeholder="密码" clearable maxlength="20" @focus="handleFocus"/>
        <div class="error-tip">
          <div class="text">用户名或密码错误</div>
        </div>
        <slide-verify ref="slideRef" @slideOk="handleSlideOk"/>
        <button :class="[loginClickable ? '' : 'disabled', 'button']" @click="loginClickable && handleLogin()">登录
        </button>
        <router-link class="forget" to="/modify">忘记密码？</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import VideoBg from '../components/VideoBg'
import IntroPanel from '../components/IntroPanel'
import SlideVerify from '../components/SlideVerify'
import { RESPONSE_ERROR } from '@/utils/constants'

export default {
  name: 'Login',
  components: {
    IntroPanel,
    VideoBg,
    SlideVerify
  },
  data() {
    return {
      mobile: '',
      password: '',
      slideDone: false,
      loginError: false,
      redirect: ''
    }
  },
  computed: {
    loginClickable() {
      return this.mobile && this.password && this.slideDone
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  methods: {
    handleFocus() {
      this.loginError = false
    },
    handleLogin() {
      const userInfo = {
        mobile: this.mobile,
        password: this.password
      };
      this.$store.dispatch('Login', userInfo)
        .then(res => {
          // this.$router.push({ path: this.redirect } || '/')
          this.$router.push('/')
        })
        .catch(msg => {
          if (msg !== RESPONSE_ERROR) {
            this.loginError = true;
            this.slideDone = false;
            this.mobile = '';
            this.password = '';
            this.$refs.slideRef.initSlide()
          }
        })
    },
    handleSlideOk() {
      this.slideDone = true
    }
  }
}

</script>

<style rel="stylesheet/scss" lang="scss">
  .login-container .el-input__inner {
    background: rgba(32, 85, 122, 0.5);
    border: 1px solid rgba(0, 215, 255, 1);
    color: $whiteColor;
    transition: border .5s;
  }

  .login-container.error .el-input__inner {
    border: 1px solid rgba(245, 34, 45, 1);
  }
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
  .container {
    position: relative;
    min-width: 1240px;
    padding: 0 9px;
  }

  .main-content {
    position: relative;
    z-index: 2;
    top: 200px;
    display: flex;
    justify-content: center;
  }

  .logo-wrapper {
    position: absolute;
    top: 80px;
    left: 80px;
    width: 164px;
    height: 30px;

    img {
      width: 100%;
      max-width: 100%;
    }
  }

  .intro-container, .login-container {
    flex: 0 0 auto;
  }

  .login-container {
    width: 462px;
    background: rgba(12, 34, 68, 0.65);
    /*border-radius: 8px;*/
    border-radius: 0 8px 8px 0;
    padding: 40px 70px 40px 70px;
  }

  .title {
    font-weight: $fontWeightBolder;
    color: $whiteColor;
    text-align: center;
    font-size: 24px;
    line-height: 33px;
    margin-bottom: 40px;

   /*&.title-ch {
      font-size: 42px;
      line-height: 59px;
    }

   &.title-en {
     margin: 8px 0 40px 0;
     font-size: 24px;
     line-height: 33px;
   }*/
  }

  /*.el-input + .el-input {
    margin-top: 24px;
  }*/

  .el-input {
    margin-bottom: 24px;
  }

/*  .error-tip {
    position: relative;
    height: 23px;

    .text {
      position: absolute;
      top: -14px;

      line-height: 14px;

      color: rgba(245, 34, 45, 1);
    }
  }*/

  .error-tip {
    position: relative;
    height: 0;
    opacity: 0;
    transition: all .3s;

    .text {
      position: absolute;
      top: -28px;
      opacity: 0;

      line-height: 14px;

      color: rgba(245, 34, 45, 1);
      transition: all .5s;
    }
  }

  .login-container.error {
    .error-tip {
      height: 23px;
      opacity: 1;

      .text {
        top:-14px;
        opacity: 1;
      }
    }
  }

  .button {
    width: 100%;
    margin-top: 49px;
    transition: margin-top .5s;

    &.disabled {
      background-color: rgba(152, 205, 215, 1);
      color: rgba(255, 255, 255, 0.5);
    }
  }

  .login-container.error {
    .button {
      margin-top: 26px;
    }
  }

  .forget {
    margin-top: 53px;
    display: block;
    text-align: center;
    font-size: 16px;
    font-weight: $fontWeightBolder;
    color: $whiteColor;
    line-height: 22px;
    text-decoration: underline;
    transition: all .2s;

    &:hover {
      color: rgba(0, 215, 255, 1);
    }
  }

</style>
