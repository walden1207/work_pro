import focusText from './focusText'

const install = function (Vue) {
  Vue.directive('focusText', focusText)
}

focusText.install = install

export default focusText
