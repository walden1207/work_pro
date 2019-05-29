import postRequest from '@/utils/request'

export function fetchAmList(queryParams) {
  console.log(queryParams)
  return postRequest('/am/get_algorithm_details', {
    keywords: queryParams.keywords
  })
}

export function fetchAmDetail(queryParams) {
  console.log(queryParams.name)
  return postRequest('/am/get_details', queryParams)
}
