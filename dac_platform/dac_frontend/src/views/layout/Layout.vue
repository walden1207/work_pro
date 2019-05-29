<template>
  <div :class="classObj" class="app-wrapper">
    <top-bar/>
    <sidebar class="sidebar-container"/>
    <div class="main-container">
      <app-main/>
    </div>
  </div>
</template>

<script>
  import {TopBar, Sidebar, AppMain} from './components'

  export default {
    name: 'Layout',
    components: {
      TopBar,
      Sidebar,
      AppMain
    },
    computed: {
      sidebar() {
        return this.$store.state.app.sidebar
      },
      classObj() {
        return {
          'hide-sidebar': !this.sidebar.opened,
          'open-sidebar': this.sidebar.opened
        }
      }
    },
    methods: {
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss">
  .sidebar-container {
    .horizontal-collapse-transition {
      transition: 0s width ease-in-out, 0s padding-left ease-in-out, 0s padding-right ease-in-out;
    }

    .el-scrollbar__bar.is-vertical {
      right: 0;
    }

    .is-horizontal {
      display: none;
    }
  }

  /* 隐藏 sidebar */
  .hide-sidebar {
    .submenu-title-noDropdown {
      padding-left: 10px !important;
      position: relative;
    }

    .el-submenu {
      overflow: hidden;

      .el-submenu__title {
        padding-left: 10px !important;

        .el-submenu__icon-arrow {
          display: none;
        }
      }
    }
  }
</style>
<style rel="stylesheet/scss" lang="scss" scoped>
  .app-wrapper {
    position: relative;
    height: 100%;
    width: 100%;
  }

  .sidebar-container {
    transition: width 0.28s;
    width: $sideBarWidth;
    height: 100%;
    position: fixed;
    font-size: 0;
    top: $topBarHeight;
    bottom: 0;
    left: 0;
    z-index: 1001;
    overflow: hidden;
  }

  .main-container {
    position: relative;
    min-height: 100%;
    transition: margin-left .28s;
    /*padding: 0 24px;*/
    margin-left: $sideBarWidth;
    margin-top: $topBarHeight;
  }

  /* 隐藏 sidebar */
  .hide-sidebar {
    .sidebar-container {
      width: 36px !important;
    }

    .main-container {
      margin-left: 36px;
    }
  }
</style>
