export default {
  bind(el, binding) {
    const customOptions = Object.assign({}, binding.value)
    const options = Object.assign({
      color: '#009EBB'
    }, customOptions)
    el.addEventListener('mousedown', () => {
      el.style.color = options.color
      el.style.borderColor = options.color
      return false
    }, false)
    el.addEventListener('mouseup', () => {
      el.style.color = ''
      el.style.borderColor = ''
      return false
    }, false)
  }
}

