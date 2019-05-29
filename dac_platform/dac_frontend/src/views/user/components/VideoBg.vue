<template>
  <div class="video-container">
    <div class="filter"></div>
    <video ref="bgVideo" class="bg-video" muted autoplay loop @canplay="handleCanplay">
      <source src="@/assets/user/dac_login.mp4" type="video/mp4"/>
    </video>
    <div v-if="!videoCanPlay" class="poster">
      <img src="@/assets/user/video_cover.jpg" alt="poster"/>
    </div>
  </div>
</template>

<script>
export default {
  name: 'VideoBg',
  data() {
    return {
      videoCanPlay: false
    }
  },
  methods: {
    handleCanplay() {
      this.videoCanPlay = true
      this.$refs.bgVideo.play()
    }
  }
}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .video-container {
  }

  .filter, .bg-video, .poster {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    min-width: 100%;
    min-height: 100%;
    z-index: -100;
    /*-webkit-filter: grayscale(20%);*/
  }

  .filter {
    background: rgba(0, 0, 0, 0.2);
    z-index: 2;
  }

/*  .poster {
    img {
      width: 100%;
      max-width: 100%;
    }
  }*/
</style>
