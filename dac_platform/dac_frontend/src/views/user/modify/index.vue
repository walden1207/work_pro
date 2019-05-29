<template>
  <div>
    <logo-modify/>
    <transition name="fade-right" mode="out-in">
      <div v-if="!showResetForm" key="verifyCode" class="container">
        <div class="form-container">
          <div class="title">忘记密码 ?</div>
          <div class="desc">输入您注册的手机号验证身份</div>
          <el-form :label-position="labelPosition" label-width="96px">
            <el-form-item :class="mobileError ? 'error' : ''" label="手机号">
              <el-input v-model.trim="mobile" clearable maxlength="11" @focus="handleMobileFocus" @blur="handleMobileBlur"/>
            </el-form-item>
            <div :class="[mobileError ? 'fade-down' : '', 'error-container']">
              <div class="text">手机号错误！</div>
            </div>
            <el-form-item :class="verifyCodeError ? 'error' : ''" label="验证码" class="verify-code-item">
              <el-input v-model.trim="verifyCode" clearable maxlength="6" @focus="handleCodeFocus" @blur="handleCodeBlur"/>
              <button :class="[sendButtonClickable ? '' : 'disabled', 'button']" @click.prevent="sendButtonClickable && getVerifyCode()">{{ sendButtonValue }}
              </button>
            </el-form-item>
            <div :class="[verifyCodeError ? 'fade-down' : '', 'error-container']">
              <div class="text">验证码错误！</div>
            </div>
          </el-form>
        </div>
        <div class="button-container">
          <button :class="[nextButton1Clickable ? '' : 'disabled', 'button']" @click.prevent="nextButton1Clickable && handleNextButton1Click()">下一步
          </button>
        </div>
      </div>
      <div v-else-if="showResetForm && !showOk" key="modifyPassword" class="container">
        <div class="form-container">
          <div class="title reset-title">重置你的密码</div>
          <el-form :label-position="labelPosition" label-width="96px">
            <el-form-item label="输入新密码">
              <el-input v-model.trim="pwd1" type="password" maxlength="20" @focus="handlePwd1Focus" @blur="handlePwd1Blur"/>
            </el-form-item>
            <div :class="[pwd1Error ? 'fade-down' : '', 'error-container', 'pwd-error-container']">
              <div class="text">密码必须是字母大写，字母小写，数字，特殊字符中任意两种组合，且不能少于8位！</div>
            </div>
            <el-form-item label="确认新密码">
              <el-input v-model.trim="pwd2" type="password" maxlength="20" @focus="handlePwd2Focus" @blur="handlePwd2Blur"/>
            </el-form-item>
            <div :class="[pwd2Error ? 'fade-down' : '', 'error-container', 'pwd-error-container']">
              <div class="text">密码必须是字母大写，字母小写，数字，特殊字符中任意两种组合，且不能少于8位！</div>
            </div>
          </el-form>
        </div>
        <div class="button-container">
          <button :class="[nextButton2Clickable ? '' : 'disabled', 'button']" @click.prevent="nextButton2Clickable && handleNextButton2Click()">下一步
          </button>
        </div>
      </div>
      <ok-panel v-else key="modifyOk"/>
    </transition>
  </div>
</template>

<script>
  import LogoModify from '../components/LogoModify'
  import OkPanel from '../components/OkPanel'
  import {RESPONSE_ERROR} from '@/utils/constants'

  export default {
    name: 'Modify',
    components: {
      LogoModify,
      OkPanel
    },
    data() {
      return {
        showResetForm: false,
        showOk: false,
        labelPosition: 'right',
        mobile: '',
        verifyCode: '',
        mobileInputCompleted: false,
        codeInputCompleted: false,
        pwd1: '',
        pwd2: '',
        sendButtonValue: '发送',
        waitSecond: 60,
        mobileError: false,
        verifyCodeError: false,
        pwd1Error: false,
        pwd2Error: false,
        pwd1InputCompleted: false,
        pwd2InputCompleted: false
      }
    },
    computed: {
      sendButtonClickable() {
        return this.mobileInputCompleted && !this.mobileError && (this.waitSecond === 60)
      },
      nextButton1Clickable() {
        // 手机号存在且正确，验证码存在且正确，验证码没有过期
        return this.mobileInputCompleted && !this.mobileError &&
          this.codeInputCompleted && !this.verifyCodeError &&
          (this.waitSecond !== 60)
      },
      nextButton2Clickable() {
        return this.pwd1InputCompleted && this.pwd2InputCompleted
      }
    },
    methods: {
      handleMobileFocus() {
        if (this.mobileError) {
          this.mobileError = false
        }
        if (this.mobileInputCompleted) {
          this.mobileInputCompleted = false
        }
      },
      handleCodeFocus() {
        if (this.verifyCodeError) {
          this.verifyCodeError = false
        }
        if (this.codeInputCompleted) {
          this.codeInputCompleted = false
        }
      },
      handleMobileBlur() {
        if (!this.mobile) {
          return
        }
        if (!/^1[34578]\d{9}$/.test(this.mobile)) {
          this.mobileError = true
        } else {
          this.mobileInputCompleted = true
        }
      },
      handleCodeBlur() {
        if (!this.verifyCode) {
          return
        }
        if (!/^\d{6}$/.test(this.verifyCode)) {
          this.verifyCodeError = true
        } else {
          this.codeInputCompleted = true
        }
      },
      handlePwd1Focus() {
        if (this.pwd1Error) {
          this.pwd1Error = false
        }
        if (this.pwd1InputCompleted) {
          this.pwd1InputCompleted = false
        }
      },
      handlePwd1Blur() {
        if (!this.pwd1) {
          return
        }
        if (this.checkPwd(this.pwd1) < 2) {
          this.pwd1Error = true
        } else {
          this.pwd1InputCompleted = true
        }
      },
      handlePwd2Focus() {
        if (this.pwd2Error) {
          this.pwd2Error = false
        }
        if (this.pwd2InputCompleted) {
          this.pwd2InputCompleted = false
        }
      },
      handlePwd2Blur() {
        if (!this.pwd2) {
          return
        }
        if (this.checkPwd(this.pwd2) < 2) {
          this.pwd2Error = true
        } else {
          this.pwd2InputCompleted = true
        }
      },
      checkPwd(pwd) {
        if (pwd.length < 8) {
          return 0
        }
        let result = 0
        if (/[a-z]+/.test(pwd)) {
          result++
        }
        if (/[0-9]+/.test(pwd)) {
          result++
        }
        if (/[A-Z]+/.test(pwd)) {
          result++
        }
        if (/[^a-zA-Z0-9]+/.test(pwd)) {
          result++
        }
        return result
      },
      getVerifyCode() {
        const userInfo = {
          mobile: this.mobile
        }
        this.$store.dispatch('GetVerifyCode', userInfo)
          .then(res => {
          })
          .catch(msg => {
            if (msg !== RESPONSE_ERROR) {
              this.$messageTips({
                type: 'error',
                message: '获取验证码失败'
              });
            }
          });
        this.countDown()
      },
      countDown() {
        if (this.waitSecond > 0) {
          this.waitSecond--
          this.sendButtonValue = this.waitSecond
          const self = this
          setTimeout(() => {
            self.countDown()
          }, 1000)
        } else {
          this.waitSecond = 60
          this.sendButtonValue = '重新获取'
        }
      },
      handleNextButton1Click() {
        const userInfo = {
          mobile: this.mobile,
          verifyCode: this.verifyCode
        }
        this.$store.dispatch('ValidateMobileAndCode', userInfo)
          .then(res => {
            this.showResetForm = true
          })
          .catch(msg => {
            if (msg === RESPONSE_ERROR) {
              return
            }
            if (msg === 'cache_code') {
              this.verifyCodeError = true // 验证码错误
            } else {
              this.mobileError = true // 手机号错误
            }
          })
      },
      handleNextButton2Click() {
        if (this.pwd2 !== this.pwd1) {
          this.$messageTips({
            type: 'error',
            message: '两次输入的密码不同'
          });
          return
        }
        const userInfo = {
          mobile: this.mobile,
          password: this.pwd1
        };
        this.$store.dispatch('ModifyPassword', userInfo)
          .then(res => {
            this.showOk = true
          })
          .catch(msg => {
            if (msg !== RESPONSE_ERROR) {
              this.$messageTips({
                type: 'error',
                message: '修改密码失败'
              });
            }
          })
      }
    }
  }

</script>

<style rel="stylesheet/scss" lang="scss">
  /* 修改 element-ui 样式*/
  .form-container {
    .el-form-item__label {
      height: 30px;
      line-height: 30px;
      color: rgba(0, 0, 0, 0.65);
    }

    .el-form-item__content {
      height: 30px;
      line-height: 30px;
    }

    .el-input__inner {
      height: 30px;
      line-height: 30px;
      border-radius: 3px;
      border: 1px solid rgba(0, 0, 0, 0.15);
      transition: border .5s;
    }

    .el-form-item {
      margin-bottom: 8px;
    }
  }

  .el-form-item.error .el-input__inner {
    border: 1px solid rgba(245, 34, 45, 1);
  }

  .verify-code-item {
    .el-input {
      width: 165px;
    }

    /*.el-form-item__content {*/
    /*display: flex;*/
    /*justify-content: space-between;*/
    /*}*/
  }
</style>

<style rel="stylesheet/scss" lang="scss" scoped>
  $bgColor: #FFFFFF;
  $errorColor: rgba(245, 34, 45, 1);
  $ableColor: #00D7FF;

  .container {
    width: 600px;
    margin: 100px auto 0 auto;
    background: $bgColor;
  }

  .form-container {
    width: 100%;
    box-shadow: 0 1px 6px 0 rgba(201, 201, 201, 1);
    border-radius: 1px;
    padding: 12px 120px 39px 120px;

    .title {
      font-size: 24px;
      line-height: 33px;

      color: rgba(0, 0, 0, 0.85);
      text-align: center;
    }

    .desc {
      text-align: center;
      margin: 2px 0 36px 0;
      font-size: 13px;
      line-height: 18px;

      color: rgba(0, 0, 0, 0.45);
    }

    .reset-title {
      margin-bottom: 56px;
    }
  }

  .button-container {
    width: 100%;
    text-align: right;
    margin-top: 20px;
  }

  .button {
    width: 100px;
    height: 30px;
    line-height: 26px;
    font-size: $fontSizeCaption;

    border-radius: 3px;
    border: 1px solid rgba(217, 217, 217, 1);
  }

  .verify-code-item {
    .button {
      width: 90px;
      line-height: 26px;
      margin-left: 5px;
    }
  }

  .error-container {
    position: relative;
    height: 0;
    opacity: 0;
    transition: all .3s;

    .text {
      position: absolute;
      top: -10px;
      left: 96px;
      font-size: $fontSizeCaption;

      color: $errorColor;
      line-height: 14px;
      opacity: 0;
      transition: all .5s;
    }
  }

  .error-container.fade-down {
    height: 30px;
    opacity: 1;

    &.pwd-error-container {
      height: 40px;
    }

    .text {
      top: 5px;
      opacity: 1;
    }
  }
</style>
