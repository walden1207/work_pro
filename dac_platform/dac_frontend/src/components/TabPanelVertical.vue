<template>
  <div class="tab-panel-wrapper">
    <div class="tab-container">
      <button
        v-focusText
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
        <component :is="showPanel" @willDestroy="handleWillDestroy"/>
      </transition>
    </div>
  </div>
</template>

<script>
  import focusText from '@/directive/focusText/focusText'

  export default {
    name: 'TabPanelVertical',
    directives: {
      focusText
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
    },
    methods: {
      handleWillDestroy($event) {
        console.log($event)
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .tab-container {
    display: flex;

    .button-plain {
      position: relative;

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
