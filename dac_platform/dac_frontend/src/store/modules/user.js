import {login, getVerifyCode, validateMobileAndCode, modifyPassword, getUserInfo} from '@/api/user'
import {getToken, setToken, removeToken} from '@/utils/auth'

const user = {
  state: {
    token: getToken(),
    name: '',
    avatar: '',
    roles: []
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    }
  },

  actions: {
    // 登录
    Login({commit}, userInfo) {
      return new Promise((resolve, reject) => {
        login(userInfo)
          .then(res => {
            setToken(res.token);
            commit('SET_TOKEN', res.token);
            resolve(res)
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },

    // 获取验证码
    GetVerifyCode({commit}, userInfo) {
      return new Promise((resolve, reject) => {
        getVerifyCode(userInfo)
          .then(res => {
            resolve(res)
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },

    // 验证手机号、验证码是否正确
    ValidateMobileAndCode({commit}, userInfo) {
      return new Promise((resolve, reject) => {
        validateMobileAndCode(userInfo, userInfo)
          .then(res => {
            resolve(res)
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },

    ModifyPassword({commit}, userInfo) {
      return new Promise((resolve, reject) => {
        modifyPassword(userInfo, userInfo)
          .then(res => {
            resolve(res)
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },

    // 获取用户信息
    GetUserInfo({commit, state}) {
      return new Promise((resolve, reject) => {
        getUserInfo(state.token)
          .then(res => {
            if (res.roles && res.roles.length > 0) { // 验证返回的roles是否是一个非空数组
              commit('SET_ROLES', res.roles)
            }
            commit('SET_NAME', res.name);
            commit('SET_AVATAR', res.avatar);
            resolve(res)
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },
    //
    // 登出
    // LogOut({ commit, state }) {
    //   return new Promise((resolve, reject) => {
    //     logout(state.token).then(() => {
    //       commit('SET_TOKEN', '')
    //       commit('SET_ROLES', [])
    //       removeToken()
    //       resolve()
    //     }).catch(error => {
    //       reject(error)
    //     })
    //   })
    // },
    LogOut({commit, state}) {
      return new Promise((resolve, reject) => {
        commit('SET_TOKEN', '');
        removeToken();
        resolve()
      })
    }
    //
    // // 前端 登出
    // FedLogOut({ commit }) {
    //   return new Promise(resolve => {
    //     commit('SET_TOKEN', '')
    //     removeToken()
    //     resolve()
    //   })
    // }
  }
};

export default user
