import focusEl from './focusEl'

const install = function (Vue) {
  Vue.directive('focusEl', focusEl)
}

focusEl.install = install

export default focusEl
