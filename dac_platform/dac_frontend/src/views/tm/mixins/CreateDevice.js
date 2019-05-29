import {getToken} from '@/utils/auth'
import {
  fetchDeviceList,
  fetchTemplateList,
  fetchTemplateDetail,
  fetchCollectItems,
  deleteDevice,
  saveConfig,
  saveMultiConfig
} from '@/api/tm'
// import {
//   fetchDeviceList,
//   fetchTemplateList,
//   fetchTemplateDetail,
//   fetchCollectItems,
//   deleteDevice,
//   saveConfig,
//   saveMultiConfig
// } from '@/mock/tm'

const CreateDevice = {
  data() {
    return {
      listLoading: true,
      token: '',
      gateType: '',
      gateMac: '',
      deviceNameEditStatus: [], // 设备名称编辑状态
      deviceDescEditStatus: [], // 设备描述编辑状态
      deviceCodeEditStatus: [], // 设备编码编辑状态
      configLoadingShowStatus: [], // 配置采集项显示加载状态
      deviceList: [],
      tableMaxHeight: 200,
      deviceCodeList: [],
      deviceNameList: [],
      unSaveDeviceNameList: [], // 修改但还没保存的设备名称
      deviceInitData: {
        deviceName: '',
        deviceCode: '',
        deviceDesc: ''
      },
      latestIndex: 0, // 正在配置的物影子的 index
      latestDevice: {}, // 正在配置的物影子
      selectedProtocol: null, // 选择的协议，用来初始化 选择页面
      configParams: null, // 选择的协议的配置参数，用来初始化 配置页面
      templateList: null, // 所有模板
      templateNameList: [], // 所有模板名称
      dialogShow: false,
      choiceShow: false,
      configShow: false,
      slidePanel: false,
      panelTransitionName: 'slide-left',
      configShowPrevious: false,
      completing: false,
      nextLoading: false
    }
  },
  created() {
    this.token = getToken()
    this.gateType = this.$route.params['type']
    this.gateMac = this.$route.params['mac']
    this.$nextTick(() => {
      this.tableMaxHeight = this.$refs['createContainer'].getBoundingClientRect().height - 161
    })
    this.getDeviceList()
    this.fetchProtocolList()
    this.fetchTemplateList()
  },
  methods: {
    getDeviceList() {
      const queryParam = {
        gateMac: this.gateMac,
        gateType: this.gateType
      }
      this.listLoading = true
      fetchDeviceList(queryParam)
        .then(res => {
          this.deviceList = res
          const deviceCount = res.length
          this.deviceNameEditStatus = new Array(deviceCount).fill(false)
          this.deviceCodeEditStatus = new Array(deviceCount).fill(0) // 现有的物影子不能修改设备编码
          this.deviceDescEditStatus = new Array(deviceCount).fill(false)
          this.configLoadingShowStatus = new Array(deviceCount).fill(false)
          this.updateDeviceCodeNameList()
          this.appendNewRow()
          this.listLoading = false
        })
        .catch(msg => {})
    },
    fetchTemplateList() {
      const queryParam = {
        gateMac: this.gateMac,
        gateType: this.gateType
      }
      fetchTemplateList(queryParam)
        .then(res => {
          this.templateList = res
          this.templateNameList = res.map(template => template.name)
        })
        .catch(msg => {})
    },
    handleDeviceNameFocus(index) {
      this.updateLatest(index) // 更新 latest
    },
    handleDeviceNameBlur(index, value) {
      // value = value.replace(/\s+/g, '')
      value = value.trim()
      if (value) {
        if (this.checkDeviceNameDuplicate(value)) {
          this.latestDevice = Object.assign({}, this.latestDevice, {deviceName: ''})
          this.updateDeviceList() // 更新 deviceList
          return
        }
        this.deviceNameEditStatus.splice(index, 1, false) // 隐藏输入框
      }
      this.latestDevice = Object.assign({}, this.latestDevice, {deviceName: value})
      this.updateDeviceList() // 更新 deviceList
      if (index === this.deviceList.length - 1) {
        this.unSaveDeviceNameList[index] = value
      }
    },
    handleDeviceCodeFocus(index) {
      this.updateLatest(index) // 更新 latest
    },
    handleDeviceCodeBlur(index, value) {
      // value = value.replace(/\s+/g, '')
      value = value.trim()
      if (value) {
        if (this.checkDeviceCodeDuplicate(value)) {
          this.latestDevice = Object.assign({}, this.latestDevice, {deviceCode: ''})
          this.updateDeviceList() // 更新 deviceList
          return
        }
        this.deviceCodeEditStatus.splice(index, 1, false)
      }
      this.latestDevice = Object.assign({}, this.latestDevice, {deviceCode: value})
      this.updateDeviceList() // 更新 deviceList
    },
    handleDeviceDescFocus(index) {
      this.updateLatest(index) // 更新 latest
    },
    handleDeviceDescBlur(index, value) {
      // 设备描述不是必需的
      this.deviceDescEditStatus.splice(index, 1, false)
      this.latestDevice = Object.assign({}, this.latestDevice, {deviceDesc: value.trim()})
      this.updateDeviceList() // 更新 deviceList
    },
    checkDeviceCodeDuplicate (value) {
      const codeList = this.deviceCodeList.slice(0)
      codeList.splice(this.latestIndex, 1)
      if (codeList.includes(value)) {
        this.$messageTips({
          type: 'error',
          message: '设备编码重复，请重新设置'
        });
        return true
      }
    },
    checkDeviceNameDuplicate (value) {
      const nameList = this.deviceNameList.slice(0)
      nameList.splice(this.latestIndex, 1)
      const unSaveNameList = this.unSaveDeviceNameList.slice(0)
      unSaveNameList.splice(this.latestIndex, 1)
      const allNameList = [...nameList, ...unSaveNameList]
      if (allNameList.includes(value)) {
        this.$messageTips({
          type: 'error',
          message: '设备名称重复，请重新设置'
        });
        return true
      } else {
        this.unSaveDeviceNameList[this.latestIndex] = value
        return false
      }
    },
    handleNewClick() {
      // const deviceInfo = this.deviceList[this.deviceList.length - 1]
      // if (deviceInfo.isSaved) {
      //   this.appendNewRow()
      // } else {
      //   this.$messageTips({
      //     type: 'error',
      //     message: '请先配置完当前物影子'
      //   });
      // }
      this.appendNewRow()
    },
    appendNewRow() {
      this.deviceList.push(this.deviceInitData); // 新增一条空数据
      this.deviceNameEditStatus.push(true)
      this.deviceCodeEditStatus.push(true)
      this.deviceDescEditStatus.push(true)
      this.configLoadingShowStatus.push(false)
      this.$nextTick(() => {
        this.$refs['deviceName' + (this.deviceList.length - 1)].focus()
        this.deviceList[this.deviceList.length - 1].deviceName = ''
      })
    },
    deleteRow(index) {
      this.deviceList.splice(index, 1)
      this.deviceNameEditStatus.splice(index, 1)
      this.deviceDescEditStatus.splice(index, 1)
      this.deviceCodeEditStatus.splice(index, 1)
      this.configLoadingShowStatus.splice(index, 1)
      this.deviceCodeList.splice(index, 1)
      this.deviceNameList.splice(index, 1)
      this.unSaveDeviceNameList.splice(index, 1)
    },
    handleRowEdit(index) {
      this.deviceNameEditStatus.splice(index, 1, true)
      this.deviceDescEditStatus.splice(index, 1, true)
      // 已经保存的设备，设备编码不能修改
      if (this.deviceCodeEditStatus[index] !== 0) {
        this.deviceCodeEditStatus.splice(index, 1, true)
      }
      this.$nextTick(() => {
        this.$refs['deviceName' + index].focus()
      })
    },
    handleRowDelete(index) {
      this.$confirm('确认删除该条物影子吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          const deviceInfo = {
            deviceCode: this.deviceList[index]['deviceCode'],
            gateType: this.gateType,
            gateMac: this.gateMac
          }
          deleteDevice(deviceInfo)
            .then(() => {
              this.$messageTips({
                message: '删除物影子成功'
              });
              this.deleteRow(index)
            })
            .catch(msg => {})
        })
        .catch(() => {
        });
    },
    doChoiceClick(index) {
      this.updateLatest(index) // 更新 latest
      const {protocols: selectedProtocol, deviceName, deviceCode} = this.latestDevice
      if (!this.verifyNameAndCode(deviceName, deviceCode)) {
        return
      }
      this.selectedProtocol = selectedProtocol || []
      // 该条物影子已经配置过，之前已经选择了协议
      if (this.selectedProtocol.length) {
        this.latestDevice = Object.assign({}, this.latestDevice, {
          oldProtocols: this.selectedProtocol, // 取消、上一步时用来恢复协议的初始选择状态
          originalType: 'protocol'
        })
        this.updateDeviceList()
      }
      this.adjustPanelShowStatue({choice: true})
    },
    handleChoiceComplete(choiceResult) {
      this.panelTransitionName = 'slide-left'
      const {type, value} = choiceResult
      if (type === 'protocol') {
        const oldProtocols = this.selectedProtocol.slice()
        const newProtocols = value.filter(protocol => !oldProtocols.includes(protocol))
        const oldRemain = value.filter(protocol => oldProtocols.includes(protocol))
        const deleteProtocols = oldProtocols.filter(protocol => !oldRemain.includes(protocol))
        this.latestDevice = Object.assign({}, this.latestDevice, {
          protocols: value,
          oldProtocols,
          deleteProtocols,
          newProtocols,
          selectedTemplate: '' // 选择协议，需要将模板清空
        })
      }
      if (type === 'template') {
        const {name: templateName, protocol: protocols} = this.templateList[value]
        this.latestDevice = Object.assign({}, this.latestDevice, {
          selectedTemplate: templateName,
          protocols
        })
      }
      this.updateDeviceList() // 更新 deviceList
      this.handleNextClick()
    },
    verifyNameAndCode (deviceName, deviceCode) {
      if (!deviceName) {
        this.$messageTips({
          type: 'error',
          message: '请先设置设备名称'
        })
        return false
      }
      if (!deviceCode) {
        this.$messageTips({
          type: 'error',
          message: '请先设置设备编码'
        })
        return false
      }
      return true
    },
    verifyTemplateAndProtocol (selectedTemplate, selectedProtocol) {
      // 没有选择模板，也没有选择协议
      if (!selectedTemplate && (!selectedProtocol || (selectedProtocol && selectedProtocol.length === 0))) {
        this.$messageTips({
          type: 'error',
          message: '请先选择协议或模板'
        });
        return false
      }
      return true
    },
    adjustPanelShowStatue(clickStatus) {
      if (clickStatus['next']) {
        this.choiceShow = false
        this.configShow = true
      }
      if (clickStatus['previous']) {
        this.choiceShow = true
        this.configShow = false
      }
      if (clickStatus['config']) {
        this.dialogShow = true
        this.choiceShow = false
        this.configShow = true
      }
      if (clickStatus['choice']) {
        this.dialogShow = true
        this.choiceShow = true
        this.configShow = false
      }
    },
    openConfigPanelByConfig() {
      const {selectedTemplate, protocols: selectedProtocol, deviceName, deviceCode} = this.latestDevice
      if (!this.verifyNameAndCode(deviceName, deviceCode)) {
        return
      }
      if (!this.verifyTemplateAndProtocol(selectedTemplate, selectedProtocol)) {
        return
      }
      this.configLoadingShowStatus.splice(this.latestIndex, 1, true) // 显示加载状态
      // 直接点击 配置采集项按钮，并且验证通过，说明该条物影子是已经配置好的，获取采集项的方式一定是 'protocol' ，
      // 而且一定没有重新选择协议
      this.latestDevice = Object.assign({}, this.latestDevice, {
        oldProtocols: selectedProtocol, // 取消、上一步时用来恢复协议的初始选择状态
        originalType: 'protocol'
      })
      this.updateDeviceList()
      const queryParam = {
        token: this.token,
        gateMac: this.gateMac,
        gateType: this.gateType,
        deviceCode,
        oldProtocols: JSON.stringify(selectedProtocol), // 原来的
        deleteProtocols: JSON.stringify([]), // 原来中删除的
        newProtocols: JSON.stringify([]), // 新选的
        type: 'protocol'
      }
      fetchCollectItems(queryParam)
        .then(res => {
          this.configParams = res
          this.adjustPanelShowStatue({config: true})
          this.hideConfigLoading()
        })
        .catch(() => {
          this.hideConfigLoading()
        })
    },
    openConfigPanelByNext() {
      // 点击下一步按钮，执行到这，说明一定选择了协议或者模板，不需要再进行判断
      const {selectedTemplate, deviceCode} = this.latestDevice
      const basicQueryParam = {
        token: this.token,
        gateMac: this.gateMac,
        gateType: this.gateType,
        deviceCode
      }
      // 选择了模板
      if (selectedTemplate) {
        const queryParam = {...basicQueryParam, ...{
          name: selectedTemplate,
          type: 'template'
        }}
        fetchTemplateDetail(queryParam)
          .then(res => {
            this.configParams = res
            this.adjustPanelShowStatue({next: true})
            this.nextLoading = false
          })
          .catch(() => {
            this.nextLoading = false
          })
      } else {
        // 点击下一步按钮，下面这几个值已经设置好了
        const {oldProtocols, deleteProtocols, newProtocols} = this.latestDevice
        const queryParam = { ... basicQueryParam, ...{
          oldProtocols: JSON.stringify(oldProtocols), // 原来的
          deleteProtocols: JSON.stringify(deleteProtocols), // 原来中删除的
          newProtocols: JSON.stringify(newProtocols), // 新选的
          type: 'protocol'
        }}
        fetchCollectItems(queryParam)
          .then(res => {
            this.configParams = res
            this.adjustPanelShowStatue({next: true})
            this.nextLoading = false
          })
          .catch((error) => {
            console.log(error)
            this.nextLoading = false
          })
      }
    },
    resetProtocol() {
      // 取消配置（ 取消或回到上一步 ），需要将协议或模板恢复
      const {oldProtocols, originalType} = this.latestDevice
      if (originalType === 'protocol') {
        this.latestDevice = Object.assign({}, this.latestDevice, {
          protocols: oldProtocols
        })
      } else {
        this.latestDevice = Object.assign({}, this.latestDevice, {
          protocols: []
        })
      }
      this.updateDeviceList()
    },
    handlePreviousClick() {
      this.resetProtocol()
      this.panelTransitionName = 'slide-right'
      this.selectedProtocol = this.latestDevice.protocols
      this.adjustPanelShowStatue({previous: true})
    },
    handleNextClick() {
      this.configShowPrevious = true // 通过下一步按钮进入，配置页面显示 上一步按钮
      this.openConfigPanelByNext()
    },
    handleConfigClick(index) {
      this.configShowPrevious = false // 直接点配置采集项按钮，配置页面不显示 上一步按钮
      this.updateLatest(index) // 更新 latest
      this.openConfigPanelByConfig()
    },
    handleConfigComplete(configResult) {
      this.completing = true
      const {protocols: selectedProtocol, deviceName, deviceCode, deviceDesc} = this.latestDevice
      const deviceInfo = Object.assign({}, {
        token: this.token,
        gateMac: this.gateMac,
        gateType: this.gateType,
        deviceName,
        deviceCode,
        deviceDesc,
        selectedProtocol: JSON.stringify(selectedProtocol),
        config: JSON.stringify(configResult)
      })
      saveConfig(deviceInfo)
        .then(() => {
          this.dialogClose()
          this.$messageTips({
            message: '采集项配置已完成！'
          });
          this.deviceCodeEditStatus.splice(this.latestIndex, 1, 0) // 设置该条数据不能再修改设备编码
          const {protocols} = this.latestDevice
          this.latestDevice = Object.assign({}, this.latestDevice, {
            isSaved: true,
            oldProtocols: protocols,
            deleteProtocols: [],
            newProtocols: [],
            originalType: 'protocol',
            selectedTemplate: '' // 配置完成，需要将模板清空
          })
          this.updateDeviceList() // 更新 deviceList
          this.fetchTemplateList() // 更新模板列表
          this.deviceCodeList.splice(this.latestIndex, 1, deviceCode) // 更新 deviceCodeList
          this.deviceNameList.splice(this.latestIndex, 1, deviceName) // 更新 deviceNameList
          this.completing = false
          if (this.deviceList[this.deviceList.length - 1].isSaved) {
            this.appendNewRow()
          }
        })
        .catch(() => {
          this.completing = false
        })
    },
    handleConfigCancelClick() {
      this.resetProtocol()
    },
    handleSaveTemplate() {
      this.fetchTemplateList() // 更新模板列表
    },
    hideConfigLoading() {
      this.configLoadingShowStatus.splice(this.latestIndex, 1, false)
    },
    handleCancelClick() {
      this.$router.push('/tm/dnc-resolve')
    },
    handleSaveClick () {
      // const deviceInfoList = this.deviceList.map(deviceInfo => ({
      //   gateMac: this.gateMac,
      //   deviceCode: deviceInfo.deviceCode,
      //   deviceName: deviceInfo.deviceName,
      //   deviceDesc: deviceInfo.deviceDesc
      // }))
      //
      // // 最新配置的物影子，只要设备编码和设备名称设置了，就可以保存
      // // 检查设备名称和设备编码是否都有值
      // if (!deviceInfoList.every(deviceInfo => this.verifyNameAndCode(deviceInfo.deviceName, deviceInfo.deviceCode))) {
      //   return
      // }

      const deviceInfoList = this.deviceList.map(deviceInfo => {
        if (deviceInfo.deviceCode && deviceInfo.deviceName) {
          return {
            gateMac: this.gateMac,
            deviceCode: deviceInfo.deviceCode,
            deviceName: deviceInfo.deviceName,
            deviceDesc: deviceInfo.deviceDesc
          }
        }
      })
        .filter(deviceInfo => deviceInfo)

      const deviceInfo = {
        deviceInfo: JSON.stringify(deviceInfoList)
      }

      saveMultiConfig(deviceInfo)
        .then(() => {
          this.$messageTips({
            message: '保存成功!'
          });
          setTimeout(() => {
            this.$router.push('/tm/dnc-resolve')
          }, 800)
        })
        .catch(msg => {})
    },
    updateDeviceCodeNameList () {
      this.deviceCodeList = []
      this.deviceNameList = []
      this.unSaveDeviceNameList = []
      this.deviceList.forEach(device => {
        this.deviceCodeList.push(device.deviceCode)
        this.deviceNameList.push(device.deviceName)
      })
    },
    updateLatest(index) {
      this.latestIndex = index
      this.latestDevice = this.deviceList[this.latestIndex]
    },
    updateDeviceList() {
      this.deviceList.splice(this.latestIndex, 1, this.latestDevice)
    },
    dialogClose() {
      this.dialogShow = false
      this.choiceShow = false
      this.configShow = false
      this.panelTransitionName = 'slide-left'
    },
    handleDialogClose() {
      this.$confirm('确认取消更改吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          this.dialogClose()
        })
        .catch(() => {
        });
    }
  }
}

export default CreateDevice
