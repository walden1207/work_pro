'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  // BASE_API: '"https://easy-mock.com/mock/5950a2419adc231f356a6636/vue-admin"',
  // BASE_API: '"http://192.168.6.134:80"' // 张聪
  BASE_API: '"http://192.168.3.176"'
  // BASE_API: '"http://192.168.6.116:8030"' // 高友鹏
})
