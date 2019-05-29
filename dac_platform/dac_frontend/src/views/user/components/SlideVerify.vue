<template>
  <div
    id="drag"
    @mouseleave="!isComplete && handleMouseleave($event)"
    @mousemove="!isComplete && handleMousemove($event)"
    @mouseup="!isComplete && handleMouseup($event)">
    <div :style="{width: bgWidth + 'px'}" class="drag_bg"></div>
    <div
      :class="[isComplete ? 'drag_ok_text' : 'drag_ing_text', 'drag_text']"
      onselectstart="return false;"
      unselectable="on"
    >
      {{ dragText }}
    </div>
    <div
      :style="{left: handlerLeft + 'px'}"
      :class="[isComplete ? 'handler_ok_bg' : 'handler_bg', 'handler']"
      @mousedown="!isComplete && handleMousedown($event)"
    >
    </div>
  </div>
</template>

<script>
  export default {
    name: 'SlideVerify',
    data() {
      return {
        maxWidth: 283,
        isMove: false,
        handlerLeft: 3,
        bgWidth: 0,
        x: undefined,
        dragText: '向右滑块完成验证',
        isComplete: false
      }
    },
    methods: {
      initSlide() {
        this.isMove = false
        this.handlerLeft = 3
        this.bgWidth = 3
        this.x = undefined
        this.dragText = '向右滑块完成验证'
        this.isComplete = false
      },
      handleMouseleave() {
        this.isMove = false
        if (!this.isComplete) {
          this.handlerLeft = 3
          this.bgWidth = 0
        }
      },
      handleMousemove(e) {
        const _x = e.pageX - this.x
        if (this.isMove) {
          if (_x > 0 && _x <= this.maxWidth) {
            this.handlerLeft = _x
            this.bgWidth = _x
          } else if (_x > this.maxWidth) {
            this.handlerLeft = this.maxWidth
            this.bgWidth = this.maxWidth
            this.dragOk()
          }
        }
      },
      handleMouseup(e) {
        this.isMove = false
        if (!this.x) {
          return
        }
        const _x = e.pageX - this.x
        if (!isNaN(_x)) {
          if (_x <= this.maxWidth) {
            this.handlerLeft = 3
            this.bgWidth = 0
          } else {
            this.handlerLeft = this.maxWidth
            this.bgWidth = this.maxWidth
            this.dragOk()
          }
        }
      },
      handleMousedown(e) {
        this.isMove = true
        this.x = e.pageX - this.handlerLeft
      },
      dragOk() {
        this.isComplete = true
        this.dragText = '验证成功'
        this.$emit('slideOk')
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  #drag {
    box-sizing: border-box;
    position: relative;
    width: 320px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    padding: 3px;
    border-radius: 4px;
    background-color: rgba(32, 85, 122, 0.5);
    border: 1px solid rgba(0, 215, 255, 1);

    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  .handler {
    position: absolute;
    top: 3px;
    left: 3px;
    width: 32px;
    height: 32px;
    cursor: move;
    box-sizing: border-box;
    border-radius: 4px;
  }

  .handler_bg {
    background: $whiteColor url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTEyNTVEMURGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTEyNTVEMUNGMkVFMTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MTc5NzNmZS02OTQxLTQyOTYtYTIwNi02NDI2YTNkOWU5YmUiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+YiRG4AAAALFJREFUeNpi/P//PwMlgImBQkA9A+bOnfsIiBOxKcInh+yCaCDuByoswaIOpxwjciACFegBqZ1AvBSIS5OTk/8TkmNEjwWgQiUgtQuIjwAxUF3yX3xyGIEIFLwHpKyAWB+I1xGSwxULIGf9A7mQkBwTlhBXAFLHgPgqEAcTkmNCU6AL9d8WII4HOvk3ITkWJAXWUMlOoGQHmsE45ViQ2KuBuASoYC4Wf+OUYxz6mQkgwAAN9mIrUReCXgAAAABJRU5ErkJggg==") no-repeat center;
  }

  .handler_ok_bg {
    background: $whiteColor url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDhlNWY5My05NmI0LTRlNWQtOGFjYi03ZTY4OGYyMTU2ZTYiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDlBRDI3NjVGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDlBRDI3NjRGMkQ2MTFFNEI5NDBCMjQ2M0ExMDQ1OUYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKE1hY2ludG9zaCkiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDphNWEzMWNhMC1hYmViLTQxNWEtYTEwZS04Y2U5NzRlN2Q4YTEiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6NGQ4ZTVmOTMtOTZiNC00ZTVkLThhY2ItN2U2ODhmMjE1NmU2Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+k+sHwwAAASZJREFUeNpi/P//PwMyKD8uZw+kUoDYEYgloMIvgHg/EM/ptHx0EFk9I8wAoEZ+IDUPiIMY8IN1QJwENOgj3ACo5gNAbMBAHLgAxA4gQ5igAnNJ0MwAVTsX7IKyY7L2UNuJAf+AmAmJ78AEDTBiwGYg5gbifCSxFCZoaBMCy4A4GOjnH0D6DpK4IxNSVIHAfSDOAeLraJrjgJp/AwPbHMhejiQnwYRmUzNQ4VQgDQqXK0ia/0I17wJiPmQNTNBEAgMlQIWiQA2vgWw7QppBekGxsAjIiEUSBNnsBDWEAY9mEFgMMgBk00E0iZtA7AHEctDQ58MRuA6wlLgGFMoMpIG1QFeGwAIxGZo8GUhIysmwQGSAZgwHaEZhICIzOaBkJkqyM0CAAQDGx279Jf50AAAAAABJRU5ErkJggg==") no-repeat center;
    border-radius: 0 4px 4px 0;
  }

  .drag_bg {
    background-color: rgba(0, 215, 255, 0.65);
    border-radius: 4px 0 0 4px;
    height: 32px;
    width: 0;
  }

  .drag_text {
    position: absolute;
    top: -1px;
    left: 40px;
    right: 40px;

    font-weight: $fontWeightBold;
    line-height: 40px;
    padding: 0 4px;
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  .drag_ing_text {
    color: rgba(255, 255, 255, 0.65);
    text-align: left;
  }

  .drag_ok_text {
    left: 3px;
    text-align: center;
    color: $whiteColor;
    z-index: 2;
  }
</style>
