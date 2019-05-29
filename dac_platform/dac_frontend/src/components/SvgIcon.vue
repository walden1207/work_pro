<template>
  <!--<svg :class="svgClass" aria-hidden="true" v-on="$listeners">
    <use :xlink:href="iconName"/>
  </svg>-->

  <el-tooltip v-if="tips" :content="tips" :placement="placement" effect="light">
    <svg :class="svgClass" v-on="$listeners">
      <use :xlink:href="iconName"/>
    </svg>
  </el-tooltip>
  <svg v-else :class="svgClass" v-on="$listeners">
    <use :xlink:href="iconName"/>
  </svg>
</template>

<script>
export default {
  name: 'SvgIcon',
  props: {
    iconClass: {
      type: String,
      required: true
    },
    className: {
      type: String,
      default: ''
    },
    tips: {
      type: String,
      default: ''
    },
    placement: {
      type: String,
      default: 'top'
    }
  },
  computed: {
    iconName() {
      return `#icon-${this.iconClass}`
    },
    svgClass() {
      if (this.className) {
        return 'svg-icon ' + this.className
      } else {
        return 'svg-icon'
      }
    }
  }
}
</script>

<style scoped>
.svg-icon {
  width: 14px;
  height: 14px;
  /*vertical-align: -0.15em;*/
  fill: currentColor;
  overflow: hidden;
}
</style>
