<template>
  <div class="breadcrumb-container">
    <div v-for="item in itemList" :key="item.id" class="link-wrapper">
      <router-link :to="item.path" class="name">{{ item.name }}</router-link>
      <span class="separator">&gt;</span>
    </div>
    <div class="current-wrapper">
      {{ current }}
    </div>
  </div>
</template>

<script>
  export default {
    name: 'BreadCrumb',
    props: {
      itemList: {
        type: Array,
        required: true
      },
      current: {
        type: String,
        required: true
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .breadcrumb-container {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding-right: 21px;
    height: 22px;
    line-height: 22px;
    font-size: $fontSizeCaption;
  }

  .link-wrapper {
    color: $activeColor;

    .separator {
    }
  }

  .current-wrapper {
    margin-left: 3px;
    color: $textColorBody;
  }
</style>
