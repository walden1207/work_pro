import postRequest from '@/utils/request'

/** *************************************************************************************************
 * 网关接入
 *****************************************************************************************************/
export function fetchGateWayList(queryParams) {
  // return postRequest('/tm/gateinfo', {
  //   token: queryParams.token,
  //   page: queryParams.page,
  //   limit: queryParams.limit,
  //   searchKey: queryParams.searchKey,
  //   orderProp: queryParams.orderProp,
  //   order: queryParams.order
  // })
  return postRequest('/tm/gateinfo', queryParams)
}

// 启用
export function enableGateWay(params) {
  return postRequest('/tm/enable_gate', {
    gateMac: params
  })
}

/** *************************************************************************************************
 * 物解析
 *****************************************************************************************************/
// 获取表格列表
export function fetchResoveList(queryParams) {
  return postRequest('/tm/get_MatterAnalysis', queryParams)
}

// 获取物影子表格列表
export function fetchDeviceList(queryParams) {
  return postRequest('/tm/get_deviceList', queryParams)
}

// 获取协议列表
export function fetchDncProtocolMap(queryParams) {
  return postRequest('/tm/get_protocols', queryParams)
}

// 获取协议列表
export function fetchPlcProtocolList(queryParams) {
  return postRequest('/tm/get_protocols', queryParams)
}

// 获取模板列表
export function fetchTemplateList(queryParams) {
  return postRequest('/tm/get_templateList', queryParams)
}

// 删除单条物影子
export function deleteDevice(deviceInfo) {
  return postRequest('/tm/delete_device', deviceInfo)
}

// 获取采集项
export function fetchCollectItems(queryParams) {
  return postRequest('/tm/get_params_infos', queryParams)
}

// 获取模板信息
export function fetchTemplateDetail(queryParams) {
  return postRequest('/tm/get_params_infos', queryParams)
}

// 保存模板
export function saveTemplate(templateInfo) {
  return postRequest('/tm/new_template', templateInfo)
}

// 保存单条物影子
export function saveConfig(deviceInfo) {
  return postRequest('/tm/new_device', deviceInfo)
}

// 保存多条物影子的设备名称或设备描述
export function saveMultiConfig(deviceInfos) {
  return postRequest('/tm/update_device ', deviceInfos)
}

// 清空协议和物影子
export function clearConfig(deviceInfo) {
  return postRequest('/tm/del_device', deviceInfo)
}

// 下发
export function dispatchConfig(deviceInfo) {
  return postRequest('/tm/dispatch', deviceInfo)
}
