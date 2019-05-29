import focusBg from './focusBg'

const install = function (Vue) {
  Vue.directive('focusBg', focusBg)
}

focusBg.install = install

export default focusBg
