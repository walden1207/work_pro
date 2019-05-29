<template>
  <div class="right-menu">
    <el-dropdown class="right-menu-item" trigger="click" @command="handleCommand">
      <div class="user-container">
        <img src="@/assets/icon/icon_yes.svg" class="avatar" alt="user"/>
        <span class="username">用户名</span>
        <i class="el-icon-caret-bottom"></i>
      </div>
      <el-dropdown-menu slot="dropdown" class="right-menu-drop-down">
        <el-dropdown-item>
          <span>账号名</span>
        </el-dropdown-item>
        <el-dropdown-item command="openInfo">
          <span>个人档案</span>
        </el-dropdown-item>
        <el-dropdown-item command="modifyInfo">
          <span>修改密码</span>
        </el-dropdown-item>
        <el-dropdown-item>
          <span>帮助</span>
        </el-dropdown-item>
        <el-dropdown-item command="logout">
          <span>退出</span>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>

    <el-dialog :visible.sync="showInfoDialog" title="个人档案" class="right-menu-dialog info-dialog" append-to-body>
      <button class="button modify" @click="handleOpenModify">修改个人档案</button>
      <div class="info-wrapper">
        <label class="label">账号名:</label><span class="value">Maggie Lee</span>
      </div>
      <div class="info-wrapper">
        <label class="label">手机号:</label><span class="value">18856326689</span>
      </div>
      <div class="info-wrapper">
        <label class="label">邮件:</label><span class="value">maggie.lee@zhan-wan.com</span>
      </div>
    </el-dialog>
    <el-dialog :visible.sync="showModifyDialog" title="修改个人档案" class="right-menu-dialog modify-dialog" append-to-body>
      <div slot="footer" class="dialog-footer">
        <button class="button" @click="showModifyDialog = false">确 定</button>
      </div>
    </el-dialog>
    <el-dialog :visible.sync="showLogoutDialog" :show-close="showClose" class="right-menu-dialog logout-dialog" append-to-body>
      <div>确认退出账号吗？</div>
      <div slot="footer">
        <button class="button cancel" @click="showLogoutDialog = false">取消</button>
        <button class="button confirm" @click="handleLogout">确定</button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'

  export default {
    name: 'RightMenu',
    props: {
      handleLogout: {
        type: Function,
        default: null
      }
    },
    data() {
      return {
        showInfoDialog: false,
        showModifyDialog: false,
        showLogoutDialog: false,
        showClose: false
      }
    },
    computed: {
      ...mapGetters([
        'name',
        'avatar'
      ])
    },
    methods: {
      handleCommand(command) {
        if (command === 'openInfo') {
          if (!this.showInfoDialog) {
            this.showInfoDialog = true
          }
        }
        if (command === 'modifyInfo') {
          if (!this.showModifyDialog) {
            this.showModifyDialog = true
          }
        }
        if (command === 'logout') {
          if (!this.showLogoutDialog) {
            this.showLogoutDialog = true
          }
        }
      },
      handleOpenModify() {
        this.showModifyDialog = true;
        this.showInfoDialog = false
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .right-menu {
    position: absolute;
    top: 12px;
    right: 14px;
    height: 40px;

    .right-menu-item {
      height: 100%;
      cursor: pointer;
      transition: background .3s;
      padding: 0 10px;
      border-radius: 4px;

      &:hover {
        background-color: $hoverColor;
      }
    }
  }

  .user-container {
    display: flex;
    align-items: center;
    height: 100%;

    .avatar {
      cursor: pointer;
      width: 24px;
      height: 24px;
      border-radius: 50%;
      margin-right: 8px;
    }

    .username {
      height: 22px;
      line-height: 22px;
      color: rgba(255, 255, 255, 0.85);
      margin-right: 8px;
    }

    .el-icon-caret-bottom {
      cursor: pointer;
      font-size: $fontSizeCaption;
      color: rgba(255, 255, 255, .85);
    }
  }

  .right-menu-dialog {
    .modify {
      position: absolute;
      top: 12px;
      right: 52px;
      width: 116px;
      height: 32px;
      padding: 5px 15px;
      border-radius: 4px;
      line-height: 22px;
    }

    .info-wrapper {
      margin-bottom: 17px;
      height: 20px;
      line-height: 20px;

      &:last-child {
        margin-bottom: 0;
      }

      .label {
        margin-right: 15px;
        text-align: right;
        color: $textColorBody;
        width: 50px;
      }

      .value {
        color: $textColorTitle;
      }
    }
  }

  .right-menu-dialog.logout-dialog {
    .cancel, .confirm {
      width: 77px;
      height: 28px;
      line-height: 26px;
      font-size: $fontSizeCaption;
      font-weight: $fontWeightBold;
      border-radius: 14px;
    }

    .cancel {
      background-color: $whiteColor;
      color: $textColorBody;
      border: 1px solid $borderColor;
      margin-right: 6px;

      &:hover {
        background-color: $hoverColor;
        color: $whiteColor;
      }
    }

    .confirm {
      border: 1px solid $activeColor;
    }
  }
</style>
