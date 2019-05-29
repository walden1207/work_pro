<template>
  <el-scrollbar wrap-class="scrollbar-wrapper">
    <el-menu
      :default-active="$route.path"
      :collapse="isCollapse"
      :background-color="menuColors.menuBg"
      :text-color="menuColors.menuText"
      :active-text-color="menuColors.menuActiveText"
      mode="vertical"
      unique-opened
    >
      <sidebar-item v-for="route in permissionRouters" :key="route.path" :item="route" :base-path="route.path"/>
    </el-menu>
  </el-scrollbar>
</template>

<script>
  import {mapGetters} from 'vuex'
  import SidebarItem from './SidebarItem'

  export default {
    components: {
      SidebarItem
    },
    data() {
      return {
        menuColors: {
          menuBg: '#353944',
          menuText: '#FFFFFFA6',
          menuActiveText: '#FFFFFF'
        }
      }
    },
    computed: {
      ...mapGetters([
        'permissionRouters',
        'sidebar'
      ]),
      isCollapse() {
        return !this.sidebar.opened
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss">
</style>
