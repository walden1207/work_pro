<template>
  <div class="top-bar">
    <smart-logo/>
    <hamburger :toggle-click="toggleSideBar" :is-active="sidebar.opened"/>
    <right-menu :handle-logout="handleLogout"/>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import SmartLogo from '@/components/SmartLogo'
import Hamburger from './Hamburger'
import RightMenu from './RightMenu'

export default {
  components: {
    SmartLogo,
    Hamburger,
    RightMenu
  },
  computed: {
    ...mapGetters([
      'sidebar'
    ])
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('toggleSideBar')
    },
    handleLogout() {
      this.$store.dispatch('LogOut')
        .then(() => {
          location.reload()// In order to re-instantiate the vue-router object to avoid bugs
        })
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .top-bar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: $topBarHeight;
    background: linear-gradient(149deg, #3A435A 0%, #353944 100%);
    box-shadow: 0 2px 6px 0 rgba(0, 0, 0, 0.07);
    z-index: 2;
  }
</style>
