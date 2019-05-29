export function fetchAmList() {
  const data = {
    '数学统计方法和分析_am3': [
      {
        'icon': 'random_forest',
        'synopsis': '随机森林由多棵分类或回归树组成，为集成学习的一种经典算法。以决策树为基本单元，对每棵树的结果进行平均，得到更强大的回归模型。',
        'id': 11,
        'name': '随机森林',
        'contents': '随机森林由多棵分类或回归树组成，为集成学习的一种经典算法。以决策树为基本单元，对每棵树的结果进行平均，得到更强大的回归模型。'
      },
      {
        'icon': 'linear_regression',
        'synopsis': '线性回归是众多回归方法中的一种，作为一种普遍应用的数学分析方法，来定量地定义两个或多个变量之间的线性关系。当变量之间的关系并性关系时，模型的性能将不尽人意。',
        'id': 12,
        'name': '线性回归',
        'contents': '线性回归是众多回归方法中的一种，作为一种普遍应用的数学分析方法，来定量地定义两个或多个变量之间的线性关系。当变量之间的关系并性关系时，模型的性能将不尽人意。'
      }
    ],
    '时间序列_am2': [
      {
        'icon': 'lstm',
        'synopsis': '长短期记忆网络-通常叫做\'LSTM\'-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......',
        'id': 2,
        'name': 'LSTM训练模型',
        'contents': '长短期记忆网络-通常叫做\'LSTM\'-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......'
      },
      {
        'icon': 'lstm',
        'synopsis': '长短期记忆网络-通常叫做\'LSTM\'-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......',
        'id': 3,
        'name': 'LSTM预测',
        'contents': '长短期记忆网络-通常叫做\'LSTM\'-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......'
      },
      {
        'icon': 'mlp',
        'synopsis': 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。',
        'id': 4,
        'name': '多层感知器训练模型',
        'contents': 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。'
      },
      {
        'icon': 'mlp',
        'synopsis': 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。',
        'id': 5,
        'name': '多层感知器预测',
        'contents': 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。'
      },
      {
        'icon': 'arima',
        'synopsis': 'ARIMA模型全称为自回归积分滑动平均(Autoregressive Integrated Moving Average Model,简称ARIMA)，是一种广泛应用的时间序列预测方法。',
        'id': 6,
        'name': '自回归积分滑动平均',
        'contents': 'ARIMA模型全称为自回归积分滑动平均(Autoregressive Integrated Moving Average Model,简称ARIMA)，是一种广泛应用的时间序列预测方法。'
      },
      {
        'icon': 'simple_exp_smoothing',
        'synopsis': '一次指数平滑又叫简单指数平滑（simple exponential smoothing， SES），适合用来预测没有明显趋势和季节性的时间序列。',
        'id': 7,
        'name': '简单指数平滑',
        'contents': '一次指数平滑又叫简单指数平滑（simple exponential smoothing， SES），适合用来预测没有明显趋势和季节性的时间序列。'
      },
      {
        'icon': 'holt_winters',
        'synopsis': '三次指数平滑在二次指数平滑的基础上保留了季节性的信息，使得其可以预测带有季节性的时间序列。三次指数平滑添加了一个新的参数p来表示平滑后的趋势。',
        'id': 8,
        'name': '三次指数平滑法',
        'contents': '三次指数平滑在二次指数平滑的基础上保留了季节性的信息，使得其可以预测带有季节性的时间序列。三次指数平滑添加了一个新的参数p来表示平滑后的趋势。'
      },
      {
        'icon': 'cnn',
        'synopsis': '卷积神经网络-训练模型',
        'id': 9,
        'name': '卷积神经网络-训练模型',
        'contents': '卷积神经网络-训练模型'
      },
      {
        'icon': 'cnn',
        'synopsis': '卷积神经网络-预测',
        'id': 10,
        'name': '卷积神经网络-预测',
        'contents': '卷积神经网络-预测'
      }
    ],
    '数据预处理_am1': [
      {
        'icon': 'dp_for_lstm',
        'synopsis': '数据预处理模块旨在帮助用户得到适合对应时间序列算法的时间序列及模型参数的数据输入。',
        'id': 1,
        'name': '数据预处理',
        'contents': '数据预处理模块旨在帮助用户得到适合对应时间序列算法的时间序列及模型参数的数据输入。'
      }
    ],
    '场景化算法_am4': [
      {
        'icon': 'welding',
        'synopsis': '焊接轨迹异常监测',
        'id': 13,
        'name': '焊接轨迹异常监测',
        'contents': '焊接轨迹异常监测'
      },
      {
        'icon': 'tool_monitoring',
        'synopsis': '加工刀具监控',
        'id': 14,
        'name': '加工刀具监控',
        'contents': '加工刀具监控'
      }
    ]
  }
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 20)
  })
}

export function fetchAmDetail(queryParams) {
  const data = {
    type: '时间序列',
    name: '自回归积分滑动平均',
    nameEn: 'arima',
    content: '加工刀具监控', // 算法简介
    inputFormat: 'inputFormat',
    inputJson: '',
    outputJson: 11,
    outputContent: '',
    api: ''
  }
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 20)
  })
}

/** *************************************************************************************************
 * 算法应用
 *****************************************************************************************************/
// 获取算法列表
export function fetchAmListApply() {
  const data = [
    {
      'type': '场景化算法',
      'icon': 'welding',
      'synopsis': '焊接轨迹异常监测',
      'id': 13,
      'name': '焊接轨迹异常监测',
      'contents': '焊接轨迹异常监测'
    }, {
      'type': '场景化算法',
      'icon': 'tool_monitoring',
      'synopsis': '加工刀具监控',
      'id': 14,
      'name': '加工刀具监控',
      'contents': '加工刀具监控'
    }, {
      'type': '场景化算法',
      'icon': 'welding',
      'synopsis': '焊接轨迹异常监测',
      'id': 15,
      'name': '焊接轨迹异常监测',
      'contents': '焊接轨迹异常监测'
    }, {
      'type': '场景化算法',
      'icon': 'tool_monitoring',
      'synopsis': '加工刀具监控',
      'id': 16,
      'name': '加工刀具监控',
      'contents': '加工刀具监控'
    }
  ]
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取算法详情
export function fetchAmDetailApply(queryParams) {
  const data = {
    type: '场景化算法',
    name: '焊接轨迹异常监测 ',
    nameEn: 'Data Preprocess (for LSTM)',
    introduction: '数据预处理介绍',
    useMethod: '使用方法'
  }
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 获取算法模型列表
export function fetchAmModelList(queryParams) {
  const {page, limit} = queryParams
  const totalList = [
    {
      gateName: '345-223',
      modelName: 'XXXX',
      status: '训练完成',
      accuracy: '30%',
      time: '2019-10-10 12:12'
    }, {
      gateName: '345-223',
      modelName: 'XXXX',
      status: '训练完成',
      accuracy: '50%',
      time: '2019-10-10 12:12'
    }, {
      gateName: '345-223',
      modelName: 'XXXX',
      status: '70',
      accuracy: '30%',
      time: '2019-10-10 12:12'
    }, {
      gateName: '345-223',
      modelName: 'XXXX',
      status: '10',
      accuracy: '30%',
      time: '2019-10-10 12:12'
    }, {
      gateName: '345-223',
      modelName: 'XXXX',
      status: '配置未完成',
      accuracy: '30%',
      time: '2019-10-10 12:12'
    }
  ]

  const data = {
    items: totalList.slice((page - 1) * limit, page * limit),
    totalCount: 5
  }
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(data)
    }, 200)
  })
}

// 模型下发
export function modelDispatch(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 新建模型
export function createModel(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 获取模型信息详情
export function getModelInfo(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 删除模型
export function deleteModel(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 查看模型 3D 图
export function getModel3D(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}

// 编辑之后，保存模型
export function saveModel(modelInfo) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve('OK')
    }, 200)
  })
}
