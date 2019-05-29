import axios from 'axios'
import qs from 'qs'
import {RESPONSE_ERROR} from './constants'
import { Message } from 'element-ui'

// 创建axios实例
const service = axios.create({
  baseURL: process.env.BASE_API, // api 的 base_url
  timeout: 50000 // 请求超时时间
})

// response 拦截器
service.interceptors.response.use(
  response => {
    const resData = response.data
    console.log(resData)
    if (resData.code === 200) {
      return resData.data // 请求成功，返回响应数据
    } else {
      // 请求失败
      if (resData.message) {
        Message({
          duration: 2000,
          showClose: true,
          type: 'error',
          message: resData.message
        })
      }
      return Promise.reject(resData.message)
    }
  },
  error => {
    console.error(error) // for debug
    Message({
      duration: 2000,
      showClose: true,
      type: 'error',
      message: '请求失败'
    })
    return Promise.reject(RESPONSE_ERROR)
  }
)

function postRequest(url, data, method = 'post') {
  return service({
    url: url,
    method: method,
    // data: data,
    // data: qs.stringify(data, {headers: {'Content-Type': 'application/x-www-form-urlencoded'}}),
    data: qs.stringify(data),
    dataType: 'json'
  })
}

export default postRequest
