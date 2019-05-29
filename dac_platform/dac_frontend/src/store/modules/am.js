// import {fetchAmList} from '@/mock/am'
import {fetchAmList} from '@/api/am'

const am = {
  state: {
    amMap: {},
    searchResult: []
  },

  mutations: {
    SET_AM_MAP: (state, amMap) => {
      state.amMap = amMap
    },
    SET_SEARCH_RESULT: (state, searchResult) => {
      state.searchResult = searchResult
    }
  },

  actions: {
    FetchAmList({commit}, searchParams) {
      return new Promise((resolve, reject) => {
        fetchAmList(searchParams)
          .then(res => {
            const amMap = {}
            let categoryTempArray
            const allAms = []
            const specificAmMap = {}
            let index = 1
            for (const [category, value] of Object.entries(res)) {
              index++
              categoryTempArray = category.split('_')
              allAms.push({key: 'category' + index, category: categoryTempArray[0], amList: value})
              specificAmMap[categoryTempArray[1]] = [{
                key: 'category' + index,
                category: categoryTempArray[0],
                amList: value
              }]
            }
            Object.assign(amMap, {all: allAms}, specificAmMap)

            commit('SET_AM_MAP', amMap)
            resolve('OK')
          })
          .catch(msg => {
            reject(msg)
          })
      })
    },
    SearchAmList({commit}, {keywords}) {
      return new Promise((resolve, reject) => {
        fetchAmList({keywords})
          .then(res => {
            let index = 1
            const resultAms = []
            if (res) {
              for (const [category, value] of Object.entries(res)) {
                index++
                resultAms.push({
                  key: 'search' + index,
                  category: category.split('_')[0],
                  amList: value
                })
              }
            }
            commit('SET_SEARCH_RESULT', resultAms)
            resolve('OK')
          })
          .catch(msg => {
            reject(msg)
          })
      })
    }
  }
}

export default am
