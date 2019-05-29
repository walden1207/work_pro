<template>
  <div v-if="!item.hidden" class="menu-wrapper">
    <template
      v-if="hasOneShowingChild(item.children, item) && (!onlyOneChild.children || onlyOneChild.noShowingChildren) && !item.alwaysShow">
      <app-link :to="resolvePath(onlyOneChild.path)" class="item-link">
        <el-menu-item :index="resolvePath(onlyOneChild.path)" :class="{'submenu-title-noDropdown': !isNest}">
          <app-item
            v-if="onlyOneChild.meta"
            :icon="onlyOneChild.meta.icon||(item.meta && item.meta.icon)"
            :title="onlyOneChild.meta.title"
          />
        </el-menu-item>
      </app-link>
    </template>

    <el-submenu v-else ref="subMenu" :index="resolvePath(item.path)" popper-append-to-body>
      <template slot="title">
        <app-item v-if="item.meta" :icon="item.meta && item.meta.icon" :title="item.meta.title"/>
      </template>
      <sidebar-item
        v-for="child in item.children"
        :is-nest="true"
        :item="child"
        :key="child.path"
        :base-path="resolvePath(child.path)"
        class="nest-menu"
      />
    </el-submenu>
  </div>
</template>

<script>
  import path from 'path'
  import AppItem from './Item'
  import AppLink from './Link'

  export default {
    name: 'SidebarItem',
    components: {AppItem, AppLink},
    props: {
      item: {
        type: Object,
        required: true
      },
      isNest: {
        type: Boolean,
        default: false
      },
      basePath: {
        type: String,
        default: ''
      }
    },
    data() {
      return {
        onlyOneChild: null
      }
    },
    methods: {
      hasOneShowingChild(children = [], parent) {
        const showingChildren = children.filter(item => {
          if (item.hidden) {
            return false
          } else {
            this.onlyOneChild = item;
            return true
          }
        });

        // 只有一个子路由，默认显示该子路由
        if (showingChildren.length === 1) {
          return true
        }

        // 没有要显示的子路由，显示父路由
        if (showingChildren.length === 0) {
          this.onlyOneChild = {...parent, path: '', noShowingChildren: true}
          return true
        }

        return false
      },
      resolvePath(routePath) {
        return path.resolve(this.basePath, routePath)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss">

</style>

<style rel="stylesheet/scss" lang="scss" scoped>
  .item-link {
    display: inline-block;
    width: 100%;
    overflow: hidden;
  }
</style>
