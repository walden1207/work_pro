export default {
  bind(el, binding) {
    const customOptions = Object.assign({}, binding.value)
    const options = Object.assign({
      color: '#009EBB'
    }, customOptions)
    el.addEventListener('mousedown', () => {
      el.style.backgroundColor = options.color
      return false
    }, false)
    el.addEventListener('mouseup', () => {
      el.style.backgroundColor = ''
      return false
    }, false)
  }
}

