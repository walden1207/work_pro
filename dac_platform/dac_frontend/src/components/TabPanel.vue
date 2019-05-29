<template>
  <div class="tab-panel-wrapper">
    <div class="tab-container">
      <button
        v-for="item in tabList"
        :key="item.key"
        :class="{'active': showKey === item.key}"
        class="button-plain"
        @click="showKey = item.key"
      >
        {{ item.value }}
      </button>
      <div class="right-bg"></div>
    </div>
    <div class="content-container">
      <transition name="fade-right" mode="out-in">
        <component :is="showPanel"/>
      </transition>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'TabPanel',
    directives: {
    },
    props: {
      tabList: {
        type: Array,
        required: true
      },
      initShowKey: {
        type: String,
        default: undefined
      },
      panelMap: {
        type: Object,
        required: true
      }
    },
    data() {
      return {
        showKey: this.initShowKey || this.tabList[0].key
      }
    },
    computed: {
      showPanel() {
        return this.panelMap[this.showKey]
      }
    },
    watch: {
      initShowKey(showKey) {
        this.showKey = showKey
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .tab-container {
    display: flex;

    .button-plain {
      position: relative;
      border-bottom: none;

      &:hover {
        border-color: $hoverColorMenu;
        color: $hoverColorMenu;
      }

      &.active {
        border-color: $activeColorMenu;
        color: $activeColorMenu;
      }

      &::after {
        content: ' ';
        position: absolute;
        bottom: 0;
        left: -1px;
        right: -1px;
        height: 1px;
        background-color: $borderColorBox;
        transition: all .5s;
      }

      &:hover::after {
        left: 50%;
        right: 50%;
      }

      &.active::after {
        left: 50%;
        right: 50%;
      }
    }

    .button-plain:hover + .button-plain {
      border-left-color: transparent;
    }

    .button-plain.active + .button-plain:hover {
      border-left-color: transparent;
    }

    .right-bg {
      position: relative;
      width: 100%;

      &::after {
        content: ' ';
        position: absolute;
        bottom: 0;
        left: -1px;
        right: 0;
        height: 1px;
        background-color: $borderColorBox;
      }
    }
  }

</style>
