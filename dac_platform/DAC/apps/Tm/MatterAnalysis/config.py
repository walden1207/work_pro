#!/usr/bin/python
# coding:utf-8

plc_protocol = {
    "FINS_UDP": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["D", "DB", "WW", "WB", "CIOB"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayIP', "name": "设备IP", "value": "", "items": [], "selectedItem": "", "required": 9},
        ]
    ],
    "MODBUS_TCP": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["int", "long", "float"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["1", "2", "3", "4"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayIP', "name": "设备IP", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "ISO_TCP": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["daveFlags", "daveOutputs", "daveDB", "daveInputs"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayIP', "name": "设备IP", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "NET_S7": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["cmd_Q", "cmd_I", "cmd_VD", "cmd_VB", "cmd_VW", "cmd_M"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayIP', "name": "设备IP", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "FINS": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["D", "DB", "WW", "WB", "CIOB", "CIOW"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "MODBUS_FX": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["D", "DB", "X", "Y"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9},
        ]
    ],
    "MODBUS_RTU": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["int", "long", "float"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["1", "2", "3", "4"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "PPI": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["cmd_Q", "cmd_I", "cmd_VD", "cmd_VB", "cmd_VW"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "FATEK": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["X", "Y", "M", "S", "R", "D", "F", "DR", "DD", "DF"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "MODBUS_ASCII": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["int", "long", "float"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["1", "2", "3", "4"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "MT_PPI": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "byte", "int", "long", "float"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["daveFlags", "daveOutputs"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "OMRON_CMODE": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["bit", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["RB", "RD", "RL", "RH", "RJ"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ],
    "SCALES": [
        [
            {"param": "name", "name": "变量名", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'type', "name": "变量类型", "value": "", "items": ["float", "int", "long"], "selectedItem": "", "required": 9},
            {"param": 'functionCode', "name": "功能码", "value": "", "items": ["R"], "selectedItem": "", "required": 9},
            {"param": 'startAddress', "name": "起始地址", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'len', "name": "寄存器个数", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'delayMs', "name": "延时时间(ms)", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'operationUnit', "name": "单位", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'serial_num', "name": "串口号", "value": "", "items": [], "selectedItem": "", "required": 9},
            {"param": 'gateWayID', "name": "设备ID", "value": "", "items": [], "selectedItem": "", "required": 9}
        ]
    ]
}

# protocol_plc_list中存的是有设备IP的协议，这个只针对PLC
protocol_plc_list = ["FINS_UDP", "MODBUS_TCP", "ISO_TCP", "NET_S7"]

# 有deviceIP的协议，指令文件的表字段
instruct_field_list_for_deviceIP = [
                        ("deviceType", "varchar", 50),
                        ("IP", "varchar", 50),
                        ("functionCode", "varchar", 50),
                        ("startAddress", "varchar", 50),
                        ("len", "varchar", 50),
                        ("operationFlag", "int", None),
                        ("delayMs", "int", None),
                        ("updateTime", "datetime", 6),
                        ("des", "text", None)
                    ]

# 有deviceID的协议，指令文件的表字段
instruct_field_list_for_deviceID = [
                        ("deviceType", "varchar", 50),
                        ("SerialNum", "varchar", 50),
                        ("deviceID", "varchar", 50),
                        ("functionCode", "varchar", 50),
                        ("startAddress", "varchar", 50),
                        ("operationFlag", "int", None),
                        ("delayMs", "int", None),
                        ("updateTime", "datetime", 6),
                        ("des", "text", None)
                    ]

# parse.db表字段，所有PLC协议通用
parse_field_list = [
                        ("DeviceType", "varchar", 50),
                        ("SeriaNum", "varchar", 50),
                        ("IP", "varchar", 50),
                        ("deviceID", "varchar", 50),
                        ("Address", "varchar", 50),
                        ("FunctionCode", "varchar", 50),
                        ("DataType", "varchar", 50),
                        ("Name", "varchar", 50),
                        ("Multiple", "varchar", 50),
                        ("OFFSET", "varchar", 50),
                        ("MaxValue", "varchar", 50),
                        ("MinValue", "varchar", 50),
                        ("OperationFlag", "int", None),
                        ("UpdateTime", "datetime", 6),
                        ("Des", "text", None)
                    ]