import postRequest from '@/utils/request'

export function login(userInfo) {
  return postRequest('/login', {
    username1: userInfo.mobile,
    password1: userInfo.password
  })
}

export function getVerifyCode(userInfo) {
  return postRequest('/send_identifying_code', {
    telephone: userInfo.mobile
  })
}

export function validateMobileAndCode(userInfo) {
  return postRequest('/get_identifying_code', {
    telephone: userInfo.mobile,
    cache_code: userInfo.verifyCode
  })
}

export function modifyPassword(userInfo) {
  return postRequest('/chage_passwd', {
    new_passwd: userInfo.password,
    telephone: userInfo.mobile
  })
}

export function getUserInfo(token) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve({
        name: 'admin',
        avatar: 'admin',
        roles: ['admin']
      })
    }, 200)
  })
  // return postRequest({
  //   url: '/user/info',
  //   method: 'get',
  //   params: { token }
  // })
}
//
// export function logout() {
//   return request({
//     url: '/user/logout',
//     method: 'post'
//   })
// }
