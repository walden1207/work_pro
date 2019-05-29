/** *************************************************************************************************
 * 网关接入
 *****************************************************************************************************/
export function fetchGateWayList(queryParams) {
  const {page, limit} = queryParams
  const totalList = [
    {
      id: 1,
      compName: '2016-05-03',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 1,
      lastBuildTime: 200333
    }, {
      id: 2,
      compName: '2016-05-02',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 3,
      compName: '2016-05-04',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 4,
      compName: '2016-05-01',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 5,
      compName: '2016-05-08',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 6,
      compName: '2016-05-06',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 7,
      compName: '2016-05-07',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    },
    {
      id: 8,
      compName: '2016-05-03',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 9,
      compName: '2016-05-02',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 10,
      compName: '2016-05-04',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 11,
      compName: '2016-05-01',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 12,
      compName: '2016-05-08',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 13,
      compName: '2016-05-06',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 14,
      compName: '2016-05-07',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    },
    {
      id: 15,
      compName: '2016-05-03',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 16,
      compName: '2016-05-02',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 17,
      compName: '2016-05-04',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 18,
      compName: '2016-05-01',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 19,
      compName: '2016-05-08',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 20,
      compName: '2016-05-06',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 21,
      compName: '2016-05-07',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    },
    {
      id: 22,
      compName: '2016-05-03',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 23,
      compName: '2016-05-02',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 24,
      compName: '2016-05-04',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 25,
      compName: '2016-05-01',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 26,
      compName: '2016-05-08',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 27,
      compName: '2016-05-06',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '2',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 28,
      compName: '2016-05-07',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 29,
      compName: '2016-05-06',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }, {
      id: 30,
      compName: '2016-05-07',
      gateMac: '王小虎',
      ServerIP: '上海',
      gateType: '普陀区',
      software_version: '1',
      status: 0,
      lastBuildTime: 200333
    }]
  const data = {
    items: totalList.slice((page - 1) * limit, page * limit),
    // items: [],
    totalCount: 30,
    allowCount: 10,
    forbidCount: 10
  }

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

export function enableGateWay(params) {
  const data = {
    totalCount: 30,
    allowCount: 10,
    forbidCount: 16
  }
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

/** *************************************************************************************************
 * 物解析
 *****************************************************************************************************/
// 获取表格列表
export function fetchResoveList(queryParams) {
  const data = {
    // items: totalList.slice((page - 1) * limit, page * limit),
    items: [
      {
        id: 1,
        gateName: 'Jane',
        gateMac: 'AA:AA:AA:AA:AA:AA',
        gateType: 'DNC',
        protocols: ['FOCAS', 'ABB', 'KUKA'],
        machCode: ['582-093']
      }, {
        id: 2,
        gateName: 'Wangjx',
        gateMac: 'AA:AA:AA:AA:AA:AA',
        gateType: 'PLC',
        protocols: [],
        machCode: []
      }
    ],
    totalCount: 2
  }

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取物影子表格列表
export function fetchDeviceList(queryParams) {
  console.log(queryParams.gateMac)
  console.log(queryParams.gateType)
  const data = [
    {
      deviceName: '设备1',
      deviceCode: 'code1',
      deviceDesc: 'desc1',
      protocols: ['FOCAS_v1', 'ABB_v4', 'KUKA']
    },
    {
      deviceName: '设备2',
      deviceCode: 'code2',
      deviceDesc: 'desc2',
      protocols: []
    }
  ]

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取协议列表
export function fetchDncProtocolMap(queryParams) {
  console.log(queryParams.gateMac)
  console.log(queryParams.gateType)

  const data = {
    'FOCAS': ['v1', 'v2'],
    'ABB': ['v3', 'v4'],
    'KUKA': [],
    'OPC UA': [],
    'OPC DA': []
  }

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取协议列表
export function fetchPlcProtocolList(queryParams) {
  console.log(queryParams.gateMac)
  console.log(queryParams.gateType)

  const data = [
    'MODBUS_TCP', 'MODBUS_RTU', 'PPI', 'FINS', 'MITSU_FX', 'NET_S7', 'OMRON_CMODE',
    'ISO_TCP', 'MT_PPI', 'FATEK', 'SCALES', 'FINS_UDP', 'MODBUS_ASCII'
  ]

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取模板列表
export function fetchTemplateList(queryParams) {
  console.log(queryParams.gateMac)
  console.log(queryParams.gateType)

  // 获取模板列表
  const data = [
    {
      name: '模板1',
      protocol: ['MODBUS_TCP', 'MODBUS_RTU'],
      createTime: '创建时间'
    },
    {
      name: '模板2',
      protocol: ['SCALES', 'FINS_UDP'],
      createTime: '创建时间'
    },
    {
      name: '模板3',
      protocol: ['SCALES'],
      createTime: '创建时间'
    }
  ]

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 删除单条物影子
export function deleteDevice(deviceInfo) {
  console.log(deviceInfo.gateMac)
  console.log(deviceInfo.deviceCode)

  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 200)
  })
}

// 获取采集项
export function fetchCollectItems(queryParams) {
  // Mac 网关联系 设备编码 选择的协议
  console.log('--> fetchCollectItems')
  console.log(queryParams.gateType)
  console.log(queryParams.gateType.includes('DNC'))
  if (queryParams.gateType.includes('DNC')) {
    const data = {
      'ABB_v1': {
        normal: [
          {name: 'normal1', unit: '', upload: false, param: '', disabled: true, placeholder: ''},
          {name: 'normal2', unit: '', upload: true, param: '', disabled: false, placeholder: 'sssssss'}
        ],
        advanced: [
          {name: 'advanced1', value: '', disabled: false},
          {name: 'advanced2', value: '', disabled: true}
        ]
      },
      'KUKA': {
        normal: [
          {name: 'KUKA normal1', unit: '', upload: false, param: '', disabled: true},
          {name: 'KUKA normal2', unit: '', upload: true, param: '', disabled: false}
        ],
        advanced: []
      },
      'OPC UA': {
        normal: [
          {name: 'OPC normal1', unit: '', upload: false, param: '', disabled: true},
          {name: 'OPC normal2', unit: '', upload: false, param: '', disabled: false}
        ],
        advanced: []
      }
    }
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(data)
      }, 200)
    })
  } else {
    const data = {
      'FINS': [
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: false},
          {param: 'ip', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: true},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: true},
          {param: 'name', value: '', items: [], selectedItem: ''}
        ]
      ],
      'ISO_TCP': [
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'name', value: '采集项1', items: [], selectedItem: ''}
        ],
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'name', value: '采集项2'}
        ],
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: false},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: true},
          {param: 'name', value: '采集项3'}
        ]
      ]
    }
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(data)
      }, 200)
    })
  }
}

// 获取模板信息
export function fetchTemplateDetail(queryParams) {
  console.log(queryParams.templateName)
  console.log(queryParams.gateType)
  if (queryParams.gateType === 'DNC') {
    const data = {
      'ABB_v1': {
        normal: [
          {name: 'normal1', unit: '', upload: false, param: '', disabled: true},
          {name: 'normal2', unit: '', upload: true, param: '', disabled: false}
        ],
        advanced: [
          {name: 'advanced1', value: '', disabled: false},
          {name: 'advanced2', value: '', disabled: true}
        ]
      },
      'KUKA': {
        normal: [
          {name: 'KUKA normal1', unit: '', upload: false, param: '', disabled: true},
          {name: 'KUKA normal2', unit: '', upload: false, param: '', disabled: false}
        ],
        advanced: [
        ]
      },
      'OPC UA': {
        normal: [
          {name: 'OPC normal1', unit: '', upload: false, param: '', disabled: false},
          {name: 'OPC normal2', unit: '', upload: false, param: '', disabled: false}
        ],
        advanced: [
        ]
      }
    }
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(data)
      }, 200)
    })
  } else {
    const data = {
      'FINS': [
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 0},
          {param: 'Ip', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 9},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: 9},
          {param: 'name', value: '', items: [], selectedItem: ''}
        ]
      ],
      'ISO_TCP': [
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'name', value: '采集项1', items: [], selectedItem: ''}
        ],
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'name', value: '采集项2'}
        ],
        [
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'Name', name: 'Name', value: '', items: [], selectedItem: '', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'IP', name: 'IP', value: '', items: ['ip1', 'ip2', 'ip3'], selectedItem: 'ip2', required: 0},
          {param: 'SeriaNum', name: '串口号', value: '2020', items: [], selectedItem: '', required: 9},
          {param: 'name', value: '采集项3'}
        ]
      ]
    }
    return new Promise(resolve => {
      setTimeout(() => {
        resolve(data)
      }, 200)
    })
  }
}

// 保存模板
export function saveTemplate(templateInfo) {
  console.log(templateInfo)
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 200)
  })
}

// 保存单条物影子
export function saveConfig(deviceInfo) {
  console.log(deviceInfo)
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 200)
  })
}

// 保存多条物影子的设备名称或设备描述
export function saveMultiConfig(deviceInfoList) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 200)
  })
}

// 清空协议和物影子
export function clearConfig(deviceInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 1000)
  })
}

/** *************************************************************************************************
 * 网关管理
 *****************************************************************************************************/

// 获取网关列表
export function manageFetchGateList(queryParams) {
  const {page, limit} = queryParams
  const totalList = [
    {
      gateName: 'James James James James James James James James James James James',
      gateMac: 'AA:AA:AA:AA:AA:AA',
      serverIP: '192.168.3.176',
      gateType: 'GW_DNC',
      software_version: '2.3.1.743',
      status: 0
    }, {
      gateName: 'James',
      gateMac: 'AA:AA:AA:AA:AA:BB',
      serverIP: '192.168.3.176',
      gateType: 'GW_PLC',
      software_version: '2.3.1.743',
      status: 0
    }, {
      gateName: 'James',
      gateMac: 'AA:AA:AA:AA:AA:CC',
      serverIP: '192.168.3.176',
      gateType: 'GW_DNC',
      software_version: '2.3.1.743',
      status: 0
    }]
  const data = {
    items: totalList.slice((page - 1) * limit, page * limit),
    totalCount: 3
  }

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 保存网关名称
export function saveGateName(gateInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 查看网关上次操作状态
export function getGateOperateStatue(gateInfo) {
  const data = [
    {
      operateItem: '程序升级',
      operateTime: '2019-02-02 12:12',
      status: 0
    }, {
      operateItem: '配置下发',
      operateTime: '2019-02-02 12:12',
      status: 1
    }, {
      operateItem: '同步数据',
      operateTime: '2019-02-02 12:12',
      status: 2
    }, {
      operateItem: '网关重启',
      operateTime: '2019-02-02 12:12',
      status: 3
    }, {
      operateItem: '物解析配置',
      operateTime: '2019-02-02 12:12',
      status: 4
    }, {
      operateItem: '程序升级',
      operateTime: '2019-02-02 12:12',
      status: 0
    }, {
      operateItem: '配置下发',
      operateTime: '2019-02-02 12:12',
      status: 1
    }, {
      operateItem: '同步数据',
      operateTime: '2019-02-02 12:12',
      status: 2
    }, {
      operateItem: '网关重启',
      operateTime: '2019-02-02 12:12',
      status: 3
    }, {
      operateItem: '物解析配置',
      operateTime: '2019-02-02 12:12',
      status: 4
    }, {
      operateItem: '程序升级',
      operateTime: '2019-02-02 12:12',
      status: 0
    }, {
      operateItem: '配置下发',
      operateTime: '2019-02-02 12:12',
      status: 1
    }, {
      operateItem: '同步数据',
      operateTime: '2019-02-02 12:12',
      status: 2
    }, {
      operateItem: '网关重启',
      operateTime: '2019-02-02 12:12',
      status: 3
    }, {
      operateItem: '物解析配置',
      operateTime: '2019-02-02 12:12',
      status: 4
    }]

  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 删除网关
export function deleteGate(gateInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 200)
  })
}

// 网关升级
export function gateUpgrade(gateInfo) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      Math.random() > 0.5 ? resolve('OK') : reject('Fail')
    }, 3000)
  })
}

// 配置下发
export function dispatchConfig(deviceInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 1000)
  })
}

// 同步离线数据
export function syncConfig(deviceInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 1000)
  })
}

// 网关重启
export function gateRestart(deviceInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('ok')
    }, 1000)
  })
}
