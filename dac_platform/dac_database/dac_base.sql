/*
Navicat MySQL Data Transfer

Source Server         : mytest
Source Server Version : 50642
Source Host           : 192.168.6.111:3306
Source Database       : dac777

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2019-05-08 15:00:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for algorithm_details
-- ----------------------------
DROP TABLE IF EXISTS `algorithm_details`;
CREATE TABLE `algorithm_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `synopsis` longtext,
  `contents` longtext NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nameEn` varchar(255) DEFAULT NULL,
  `inputFormat` longtext NOT NULL,
  `inputJson` longtext NOT NULL,
  `outputJson` longtext NOT NULL,
  `outputContent` longtext NOT NULL,
  `api` longtext NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `algorithm_details_type_id_d197d36d_fk_algorithm_type_id` (`type_id`),
  CONSTRAINT `algorithm_details_type_id_d197d36d_fk_algorithm_type_id` FOREIGN KEY (`type_id`) REFERENCES `algorithm_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of algorithm_details
-- ----------------------------
INSERT INTO `algorithm_details` VALUES ('1', '数据预处理', '数据预处理模块旨在帮助用户得到适合对应时间序列算法的时间序列及模型参数的数据输入。', '数据预处理模块旨在帮助用户得到适合对应时间序列算法的时间序列及模型参数的数据输入。', 'dp_for_lstm', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '1');
INSERT INTO `algorithm_details` VALUES ('2', 'LSTM训练模型', '长短期记忆网络-通常叫做\"LSTM\"-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......', '长短期记忆网络-通常叫做\"LSTM\"-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......', 'lstm', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('3', 'LSTM预测', '长短期记忆网络-通常叫做\"LSTM\"-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......', '长短期记忆网络-通常叫做\"LSTM\"-是一种特殊的RNN(循环神经网络)，主要用于NLP技术。然而也一样可以用在时间序列的场景上......', 'lstm', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('4', '多层感知器训练模型', 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。', 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。', 'mlp', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('5', '多层感知器预测', 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。', 'MLP（Multi-Layer Perceptron），即多层感知器，是一种前向结构的人工神经网络，映射一组输入向量到一组输出向量。', 'mlp', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('6', '自回归积分滑动平均', 'ARIMA模型全称为自回归积分滑动平均(Autoregressive Integrated Moving Average Model,简称ARIMA)，是一种广泛应用的时间序列预测方法。', 'ARIMA模型全称为自回归积分滑动平均(Autoregressive Integrated Moving Average Model,简称ARIMA)，是一种广泛应用的时间序列预测方法。', 'arima', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('7', '简单指数平滑', '一次指数平滑又叫简单指数平滑（simple exponential smoothing， SES），适合用来预测没有明显趋势和季节性的时间序列。', '一次指数平滑又叫简单指数平滑（simple exponential smoothing， SES），适合用来预测没有明显趋势和季节性的时间序列。', 'simple_exp_smoothing', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('8', '三次指数平滑法', '三次指数平滑在二次指数平滑的基础上保留了季节性的信息，使得其可以预测带有季节性的时间序列。三次指数平滑添加了一个新的参数p来表示平滑后的趋势。', '三次指数平滑在二次指数平滑的基础上保留了季节性的信息，使得其可以预测带有季节性的时间序列。三次指数平滑添加了一个新的参数p来表示平滑后的趋势。', 'holt_winters', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('9', '卷积神经网络-训练模型', '卷积神经网络-训练模型', '卷积神经网络-训练模型', 'cnn', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('10', '卷积神经网络-预测', '卷积神经网络-预测', '卷积神经网络-预测', 'cnn', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '2');
INSERT INTO `algorithm_details` VALUES ('11', '随机森林', '随机森林由多棵分类或回归树组成，为集成学习的一种经典算法。以决策树为基本单元，对每棵树的结果进行平均，得到更强大的回归模型。', '随机森林由多棵分类或回归树组成，为集成学习的一种经典算法。以决策树为基本单元，对每棵树的结果进行平均，得到更强大的回归模型。', 'random_forest', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '3');
INSERT INTO `algorithm_details` VALUES ('12', '线性回归', '线性回归是众多回归方法中的一种，作为一种普遍应用的数学分析方法，来定量地定义两个或多个变量之间的线性关系。当变量之间的关系并性关系时，模型的性能将不尽人意。', '线性回归是众多回归方法中的一种，作为一种普遍应用的数学分析方法，来定量地定义两个或多个变量之间的线性关系。当变量之间的关系并性关系时，模型的性能将不尽人意。', 'linear_regression', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '3');
INSERT INTO `algorithm_details` VALUES ('13', '焊接轨迹异常监测', '焊接轨迹异常监测', '<p>&nbsp; &nbsp; 焊接轨迹异常监测</p>', 'welding', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '4');
INSERT INTO `algorithm_details` VALUES ('14', '加工刀具监控', '加工刀具监控', '<p>&nbsp; &nbsp; 加工刀具监控</p>', 'tool_monitoring', 'Monitoring of Machining Tools', '<p>&nbsp;&nbsp;&nbsp;&nbsp;输入应包括两个参数&quot;db, info&quot;为包含用户数据库信息词典，用于连接&quot;model &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info&quot;, 为描述用户想要将其时间序列化的数据的数据， 用于指定进行时间序列化的数据集合。</p><p>&nbsp; &nbsp; <strong>数据：</strong><br/></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>&nbsp;db,info：</strong>数据库信息，包含以下属性</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.host：数据库主机</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.user：用户</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.database：数据库</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.password：密码</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>model,info</strong>：选取的数据属性的信息，用于指定需要转化的数据属性，包含以下属性：</p></li></ul><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.compID：用户公司id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.machID：机器id</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.operationValue：提取属性的类型</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.startTime：开始时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.endTime：结束时间</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.algorithm_selection：选择的算法</p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p><strong>params</strong>：可选，不同算法对应不同的参数设置，用户可以进行设置，也可以在输入中不添加参数设置，不进行参数设置的输入进入数据处理模块后&nbsp;会根据用户所选择的算法进行缺省设置的添加&nbsp; &nbsp;<strong>&nbsp;&nbsp;&nbsp;</strong></p></li></ul></ul><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/></strong></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p>', '<p style=\"white-space: normal;\">&nbsp; &nbsp; {</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;db_info&quot;:</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;host&quot;: &quot;rm-uf6cakdt1g7myc94dco.mysql.rds.aliyuncs.com&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;database&quot;: &quot;dac&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;user&quot;: &quot;test&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;password&quot;: &quot;test&quot;</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;model_info&quot;:<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;compID&quot;: &quot;0000&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;machID&quot;: &quot;228&quot;,<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;operationValue&quot;: &quot;计数值&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;algorithm_selection&quot;: &quot;Istm&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;startTime&quot;: &quot;2018-11-19 14:02:07&quot;,</p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;endTime&quot;: &quot;2018-11-19 15:32:07&quot;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;<br/></p><p style=\"white-space: normal;\">&nbsp;&nbsp;&nbsp;&nbsp;}</p><p><br/></p>', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>success 请求是否响应成功，为布尔值</p></li><li><p>values 请求处理的结果，为每一个预测时间段的属性预测值，95%置信空间</p></li><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p>1.mean：预测平均值</p></li><li><p>2.upper：预测最大值</p></li><li><p>3.lower：预测最低值<br/></p></li></ul></ul>', '<p>http://127.0.0.1/api/v1/getinfo<br/></p>', '4');

-- ----------------------------
-- Table structure for algorithm_type
-- ----------------------------
DROP TABLE IF EXISTS `algorithm_type`;
CREATE TABLE `algorithm_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of algorithm_type
-- ----------------------------
INSERT INTO `algorithm_type` VALUES ('1', '数据预处理');
INSERT INTO `algorithm_type` VALUES ('2', '时间序列');
INSERT INTO `algorithm_type` VALUES ('3', '数学统计方法和分析');
INSERT INTO `algorithm_type` VALUES ('4', '场景化算法');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息', '6', 'add_usermodel');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息', '6', 'change_usermodel');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息', '6', 'delete_usermodel');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 用户信息', '6', 'view_usermodel');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 算法详情', '7', 'add_algorithmdetailsmodel');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 算法详情', '7', 'change_algorithmdetailsmodel');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 算法详情', '7', 'delete_algorithmdetailsmodel');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 算法详情', '7', 'view_algorithmdetailsmodel');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 算法类型', '8', 'add_algorithmtypemodel');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 算法类型', '8', 'change_algorithmtypemodel');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 算法类型', '8', 'delete_algorithmtypemodel');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 算法类型', '8', 'view_algorithmtypemodel');
INSERT INTO `auth_permission` VALUES ('33', 'Can add gate info model', '9', 'add_gateinfomodel');
INSERT INTO `auth_permission` VALUES ('34', 'Can change gate info model', '9', 'change_gateinfomodel');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete gate info model', '9', 'delete_gateinfomodel');
INSERT INTO `auth_permission` VALUES ('36', 'Can view gate info model', '9', 'view_gateinfomodel');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 协议类型', '10', 'add_protocoltype');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 协议类型', '10', 'change_protocoltype');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 协议类型', '10', 'delete_protocoltype');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 协议类型', '10', 'view_protocoltype');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 变量表', '11', 'add_variables');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 变量表', '11', 'change_variables');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 变量表', '11', 'delete_variables');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 变量表', '11', 'view_variables');
INSERT INTO `auth_permission` VALUES ('45', 'Can add DNC采集项', '12', 'add_protocoldnc');
INSERT INTO `auth_permission` VALUES ('46', 'Can change DNC采集项', '12', 'change_protocoldnc');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete DNC采集项', '12', 'delete_protocoldnc');
INSERT INTO `auth_permission` VALUES ('48', 'Can view DNC采集项', '12', 'view_protocoldnc');
INSERT INTO `auth_permission` VALUES ('49', 'Can add PLC采集项', '13', 'add_protocolplc');
INSERT INTO `auth_permission` VALUES ('50', 'Can change PLC采集项', '13', 'change_protocolplc');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete PLC采集项', '13', 'delete_protocolplc');
INSERT INTO `auth_permission` VALUES ('52', 'Can view PLC采集项', '13', 'view_protocolplc');
INSERT INTO `auth_permission` VALUES ('53', 'Can add DNC协议采集项模板', '14', 'add_protocolparamsdnc');
INSERT INTO `auth_permission` VALUES ('54', 'Can change DNC协议采集项模板', '14', 'change_protocolparamsdnc');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete DNC协议采集项模板', '14', 'delete_protocolparamsdnc');
INSERT INTO `auth_permission` VALUES ('56', 'Can view DNC协议采集项模板', '14', 'view_protocolparamsdnc');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 采集项模板', '15', 'add_devicetemplates');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 采集项模板', '15', 'change_devicetemplates');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 采集项模板', '15', 'delete_devicetemplates');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 采集项模板', '15', 'view_devicetemplates');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 物影子', '16', 'add_devicemodal');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 物影子', '16', 'change_devicemodal');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 物影子', '16', 'delete_devicemodal');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 物影子', '16', 'view_devicemodal');
INSERT INTO `auth_permission` VALUES ('65', 'Can add django job execution', '17', 'add_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('66', 'Can change django job execution', '17', 'change_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete django job execution', '17', 'delete_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('68', 'Can view django job execution', '17', 'view_djangojobexecution');
INSERT INTO `auth_permission` VALUES ('69', 'Can add django job', '18', 'add_djangojob');
INSERT INTO `auth_permission` VALUES ('70', 'Can change django job', '18', 'change_djangojob');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete django job', '18', 'delete_djangojob');
INSERT INTO `auth_permission` VALUES ('72', 'Can view django job', '18', 'view_djangojob');
INSERT INTO `auth_permission` VALUES ('73', 'Can add User Widget', '19', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('74', 'Can change User Widget', '19', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete User Widget', '19', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('76', 'Can view User Widget', '19', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('77', 'Can add Bookmark', '20', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('78', 'Can change Bookmark', '20', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete Bookmark', '20', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('80', 'Can view Bookmark', '20', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('81', 'Can add log entry', '21', 'add_log');
INSERT INTO `auth_permission` VALUES ('82', 'Can change log entry', '21', 'change_log');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete log entry', '21', 'delete_log');
INSERT INTO `auth_permission` VALUES ('84', 'Can view log entry', '21', 'view_log');
INSERT INTO `auth_permission` VALUES ('85', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('89', 'Can add revision', '23', 'add_revision');
INSERT INTO `auth_permission` VALUES ('90', 'Can change revision', '23', 'change_revision');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete revision', '23', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('92', 'Can view revision', '23', 'view_revision');
INSERT INTO `auth_permission` VALUES ('93', 'Can add version', '24', 'add_version');
INSERT INTO `auth_permission` VALUES ('94', 'Can change version', '24', 'change_version');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete version', '24', 'delete_version');
INSERT INTO `auth_permission` VALUES ('96', 'Can view version', '24', 'view_version');

-- ----------------------------
-- Table structure for dac_variables
-- ----------------------------
DROP TABLE IF EXISTS `dac_variables`;
CREATE TABLE `dac_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compID` varchar(20) DEFAULT NULL,
  `machCode` varchar(100) DEFAULT NULL,
  `gateMac` varchar(100) DEFAULT NULL,
  `Protocol` varchar(20) DEFAULT NULL,
  `gateWayIP` varchar(50) DEFAULT NULL,
  `serial_num` varchar(20) DEFAULT NULL,
  `gateWayID` varchar(50) DEFAULT NULL,
  `dataType` varchar(50) DEFAULT NULL,
  `operationValue` varchar(50) DEFAULT NULL,
  `operationData` varchar(50) DEFAULT NULL,
  `operationUnit` varchar(50) DEFAULT NULL,
  `gatherTime` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `cpu_usage` varchar(50) DEFAULT NULL,
  `mem_usage` varchar(50) DEFAULT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `machID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dac_variables_machCode_operationValue_Protocol_37be9b9b_uniq` (`machCode`,`operationValue`,`Protocol`),
  KEY `dac_variables_machID_cd1ec473_fk_edge_devicemodal_id` (`machID`),
  CONSTRAINT `dac_variables_machID_cd1ec473_fk_edge_devicemodal_id` FOREIGN KEY (`machID`) REFERENCES `edge_devicemodal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dac_variables
-- ----------------------------

-- ----------------------------
-- Table structure for device_templates
-- ----------------------------
DROP TABLE IF EXISTS `device_templates`;
CREATE TABLE `device_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(50) DEFAULT NULL,
  `TypeList` varchar(255) DEFAULT NULL,
  `proType` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TemplateName` (`TemplateName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_templates
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_edge_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_apscheduler_djangojob
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojob`;
CREATE TABLE `django_apscheduler_djangojob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `next_run_time` datetime(6) DEFAULT NULL,
  `job_state` longblob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_apscheduler_djangojob_next_run_time_2f022619` (`next_run_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_apscheduler_djangojob
-- ----------------------------
INSERT INTO `django_apscheduler_djangojob` VALUES ('1', 'apps.Public.views.judge_gate_status', '2019-05-08 15:01:10.118368', 0x80049517020000000000007D94288C086578656375746F72948C0764656661756C74948C0D6D61785F696E7374616E636573944B018C126D6973666972655F67726163655F74696D65944B018C0774726967676572948C1D61707363686564756C65722E74726967676572732E696E74657276616C948C0F496E74657276616C547269676765729493942981947D94288C08696E74657276616C948C086461746574696D65948C0974696D6564656C74619493944B004B1E4B00879452948C0776657273696F6E944B028C08656E645F64617465944E8C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C066A6974746572944E8C0A73746172745F64617465948C086461746574696D65948C086461746574696D65949394430A07E305080E3B2801CE609468162868174D80704B008C0343535494749452948694529475628C026964948C23617070732E5075626C69632E76696577732E6A756467655F676174655F737461747573948C0466756E63948C23617070732E5075626C69632E76696577733A6A756467655F676174655F737461747573948C066B7761726773947D9468114B018C046172677394298C0D6E6578745F72756E5F74696D6594681F430A07E305080F010A01CE60946823869452948C046E616D65948C116A756467655F676174655F737461747573948C08636F616C657363659488752E);
INSERT INTO `django_apscheduler_djangojob` VALUES ('2', 'apps.Public.views.del_gate_for_not_register', '2019-05-08 15:02:10.118368', 0x8004952F020000000000007D94288C086578656375746F72948C0764656661756C74948C0D6D61785F696E7374616E636573944B018C126D6973666972655F67726163655F74696D65944B018C0774726967676572948C1D61707363686564756C65722E74726967676572732E696E74657276616C948C0F496E74657276616C547269676765729493942981947D94288C08696E74657276616C948C086461746574696D65948C0974696D6564656C74619493944B004BB44B00879452948C0776657273696F6E944B028C08656E645F64617465944E8C0874696D657A6F6E65948C047079747A948C025F70949394288C0D417369612F5368616E67686169944DE8714B008C034C4D5494749452948C066A6974746572944E8C0A73746172745F64617465948C086461746574696D65948C086461746574696D65949394430A07E305080F020A01CE609468162868174D80704B008C0343535494749452948694529475628C026964948C2B617070732E5075626C69632E76696577732E64656C5F676174655F666F725F6E6F745F7265676973746572948C0466756E63948C2B617070732E5075626C69632E76696577733A64656C5F676174655F666F725F6E6F745F7265676973746572948C066B7761726773947D9468114B018C046172677394298C0D6E6578745F72756E5F74696D6594681F430A07E305080F020A01CE60946823869452948C046E616D65948C1964656C5F676174655F666F725F6E6F745F7265676973746572948C08636F616C657363659488752E);

-- ----------------------------
-- Table structure for django_apscheduler_djangojobexecution
-- ----------------------------
DROP TABLE IF EXISTS `django_apscheduler_djangojobexecution`;
CREATE TABLE `django_apscheduler_djangojobexecution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `run_time` datetime(6) NOT NULL,
  `duration` decimal(15,2) DEFAULT NULL,
  `started` decimal(15,2) DEFAULT NULL,
  `finished` decimal(15,2) DEFAULT NULL,
  `exception` varchar(1000) DEFAULT NULL,
  `traceback` longtext,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_apscheduler_d_job_id_daf5090a_fk_django_ap` (`job_id`),
  KEY `django_apscheduler_djangojobexecution_run_time_16edd96b` (`run_time`),
  CONSTRAINT `django_apscheduler_d_job_id_daf5090a_fk_django_ap` FOREIGN KEY (`job_id`) REFERENCES `django_apscheduler_djangojob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_apscheduler_djangojobexecution
-- ----------------------------
INSERT INTO `django_apscheduler_djangojobexecution` VALUES ('1', 'Started execution', '2019-05-08 14:59:40.118368', null, '1557298780.16', null, null, null, '1');
INSERT INTO `django_apscheduler_djangojobexecution` VALUES ('2', 'Executed', '2019-05-08 14:59:40.118368', '0.00', null, '1557298780.20', null, null, '1');
INSERT INTO `django_apscheduler_djangojobexecution` VALUES ('3', 'Executed', '2019-05-08 15:00:10.118368', '-0.04', '1557298810.25', '1557298810.21', null, null, '1');
INSERT INTO `django_apscheduler_djangojobexecution` VALUES ('4', 'Executed', '2019-05-08 15:00:40.118368', '0.00', null, '1557298840.24', null, null, '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('7', 'Am', 'algorithmdetailsmodel');
INSERT INTO `django_content_type` VALUES ('8', 'Am', 'algorithmtypemodel');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('18', 'django_apscheduler', 'djangojob');
INSERT INTO `django_content_type` VALUES ('17', 'django_apscheduler', 'djangojobexecution');
INSERT INTO `django_content_type` VALUES ('9', 'GateAccess', 'gateinfomodel');
INSERT INTO `django_content_type` VALUES ('16', 'MatterAnalysis', 'devicemodal');
INSERT INTO `django_content_type` VALUES ('15', 'MatterAnalysis', 'devicetemplates');
INSERT INTO `django_content_type` VALUES ('12', 'MatterAnalysis', 'protocoldnc');
INSERT INTO `django_content_type` VALUES ('14', 'MatterAnalysis', 'protocolparamsdnc');
INSERT INTO `django_content_type` VALUES ('13', 'MatterAnalysis', 'protocolplc');
INSERT INTO `django_content_type` VALUES ('10', 'MatterAnalysis', 'protocoltype');
INSERT INTO `django_content_type` VALUES ('11', 'MatterAnalysis', 'variables');
INSERT INTO `django_content_type` VALUES ('23', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('24', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'User', 'usermodel');
INSERT INTO `django_content_type` VALUES ('20', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('19', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'Am', '0001_initial', '2019-05-08 14:50:00.721298');
INSERT INTO `django_migrations` VALUES ('2', 'GateAccess', '0001_initial', '2019-05-08 14:50:00.882865');
INSERT INTO `django_migrations` VALUES ('3', 'MatterAnalysis', '0001_initial', '2019-05-08 14:50:02.036741');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0001_initial', '2019-05-08 14:50:02.178878');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2019-05-08 14:50:02.234762');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0001_initial', '2019-05-08 14:50:02.710807');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2019-05-08 14:50:02.760194');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2019-05-08 14:50:02.774180');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2019-05-08 14:50:02.787117');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2019-05-08 14:50:02.806066');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2019-05-08 14:50:02.814057');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2019-05-08 14:50:02.828007');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2019-05-08 14:50:02.844962');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2019-05-08 14:50:02.861917');
INSERT INTO `django_migrations` VALUES ('15', 'User', '0001_initial', '2019-05-08 14:50:03.279800');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0001_initial', '2019-05-08 14:50:03.563052');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0002_logentry_remove_auto_add', '2019-05-08 14:50:03.580995');
INSERT INTO `django_migrations` VALUES ('18', 'admin', '0003_logentry_add_action_flag_choices', '2019-05-08 14:50:03.598947');
INSERT INTO `django_migrations` VALUES ('19', 'django_apscheduler', '0001_initial', '2019-05-08 14:50:03.851428');
INSERT INTO `django_migrations` VALUES ('20', 'django_apscheduler', '0002_auto_20180412_0758', '2019-05-08 14:50:03.904286');
INSERT INTO `django_migrations` VALUES ('21', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2019-05-08 14:50:04.101925');
INSERT INTO `django_migrations` VALUES ('22', 'sessions', '0001_initial', '2019-05-08 14:50:04.272441');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0001_initial', '2019-05-08 14:50:04.542759');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0002_log', '2019-05-08 14:50:04.664950');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0003_auto_20160715_0100', '2019-05-08 14:50:04.713819');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('jjxsqvk07hxaydwx8hp3kk5vqaf25xmh', 'NTc1NTU3OTI3YzUyZWQ1YjAzYWY2NTI3NWIyZjdhNDViMjBhNTRlYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjM4YjE1MGQ2NzUyZDkxYjExYzg2ODVmZjJjY2MzYmQ5MjZjMjI3YzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIkxJU1RfUVVFUlkiOltbIkFtIiwiYWxnb3JpdGhtZGV0YWlsc21vZGVsIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoiMSJ9', '2019-05-22 15:00:43.343099');

-- ----------------------------
-- Table structure for edge_devicemodal
-- ----------------------------
DROP TABLE IF EXISTS `edge_devicemodal`;
CREATE TABLE `edge_devicemodal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compID` varchar(50) DEFAULT NULL,
  `modalName` varchar(50) DEFAULT NULL,
  `machCode` varchar(50) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `gateMac` varchar(50) DEFAULT NULL,
  `protocol` varchar(100) DEFAULT NULL,
  `serialPort` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `machCode` (`machCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edge_devicemodal
-- ----------------------------

-- ----------------------------
-- Table structure for edge_gateinfo
-- ----------------------------
DROP TABLE IF EXISTS `edge_gateinfo`;
CREATE TABLE `edge_gateinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compID` varchar(50) DEFAULT NULL,
  `gateMac` varchar(255) DEFAULT NULL,
  `machID` varchar(50) DEFAULT NULL,
  `gateName` varchar(255) DEFAULT NULL,
  `cpuUsg` varchar(255) DEFAULT NULL,
  `memUsg` varchar(255) DEFAULT NULL,
  `gateType` varchar(50) DEFAULT NULL,
  `ifregister` int(11) NOT NULL,
  `gatherTime` datetime(6) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ServerIP` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `lastoperationType` varchar(255) DEFAULT NULL,
  `lastBuildTime` datetime(6) NOT NULL,
  `parse_version` varchar(255) DEFAULT NULL,
  `instruct_version` varchar(255) DEFAULT NULL,
  `config_version` varchar(255) DEFAULT NULL,
  `system_version` varchar(255) DEFAULT NULL,
  `software_version` varchar(255) DEFAULT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `instructProtocol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edge_gateinfo_gateMac_94fbc85b_uniq` (`gateMac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edge_gateinfo
-- ----------------------------

-- ----------------------------
-- Table structure for edge_users
-- ----------------------------
DROP TABLE IF EXISTS `edge_users`;
CREATE TABLE `edge_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `compID` int(11) DEFAULT NULL,
  `compName` varchar(255) DEFAULT NULL,
  `telephone` varchar(11) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `data_joined` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edge_users
-- ----------------------------
INSERT INTO `edge_users` VALUES ('1', 'pbkdf2_sha256$120000$eRZKtPsI0sja$tD7VmfZRRDW622bt3cSTJBLpOoImSzGAil21ATtT3Po=', '2019-05-08 14:59:47.147789', '1', '-1', '超级管理员', '18986205506', null, 'admin', '', '', '1', '1', '2019-05-08 14:54:56.685584', 'a5dac5a1-6333-4277-96ea-1f6b67ca121f');

-- ----------------------------
-- Table structure for edge_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `edge_users_groups`;
CREATE TABLE `edge_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usermodel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edge_users_groups_usermodel_id_group_id_fdd6273d_uniq` (`usermodel_id`,`group_id`),
  KEY `edge_users_groups_group_id_e3e2db13_fk_auth_group_id` (`group_id`),
  CONSTRAINT `edge_users_groups_group_id_e3e2db13_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `edge_users_groups_usermodel_id_887ceda6_fk_edge_users_id` FOREIGN KEY (`usermodel_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edge_users_groups
-- ----------------------------

-- ----------------------------
-- Table structure for edge_users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `edge_users_user_permissions`;
CREATE TABLE `edge_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usermodel_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `edge_users_user_permissi_usermodel_id_permission__d28068ce_uniq` (`usermodel_id`,`permission_id`),
  KEY `edge_users_user_perm_permission_id_80e39c67_fk_auth_perm` (`permission_id`),
  CONSTRAINT `edge_users_user_perm_permission_id_80e39c67_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `edge_users_user_perm_usermodel_id_5b864b82_fk_edge_user` FOREIGN KEY (`usermodel_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edge_users_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for protocol_dnc
-- ----------------------------
DROP TABLE IF EXISTS `protocol_dnc`;
CREATE TABLE `protocol_dnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateMac` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `operationValue` varchar(50) DEFAULT NULL,
  `operationUnit` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `deviceIP` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `upload` int(11) NOT NULL,
  `configValue` varchar(50) DEFAULT NULL,
  `machCode` varchar(50) DEFAULT NULL,
  `template` int(11) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `deviceType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `protocol_dnc_gateMac_operationValue_m_d5760cdf_uniq` (`gateMac`,`operationValue`,`machCode`,`template`,`deviceType_id`),
  KEY `protocol_dnc_deviceType_id_239682ff_fk_protocol_type_id` (`deviceType_id`),
  CONSTRAINT `protocol_dnc_deviceType_id_239682ff_fk_protocol_type_id` FOREIGN KEY (`deviceType_id`) REFERENCES `protocol_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protocol_dnc
-- ----------------------------

-- ----------------------------
-- Table structure for protocol_params_dnc
-- ----------------------------
DROP TABLE IF EXISTS `protocol_params_dnc`;
CREATE TABLE `protocol_params_dnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProType` varchar(50) DEFAULT NULL,
  `operationValue` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `configValue` varchar(50) DEFAULT NULL,
  `operationUnit` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `upload` int(11) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `protocol_params_dnc_ProType_operationValue_40048ac5_uniq` (`ProType`,`operationValue`)
) ENGINE=InnoDB AUTO_INCREMENT=2234 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protocol_params_dnc
-- ----------------------------
INSERT INTO `protocol_params_dnc` VALUES ('2177', 'Focas', '主轴转速', '主轴转速', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2178', 'Focas', '运行状态', '运行状态', 'string', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2179', 'Focas', '报警状态', '报警状态', 'string', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2180', 'Focas', '自动运行信号', '自动运行信号', 'string', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2181', 'Focas', '主轴名称', '主轴名称', 'string', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2182', 'Focas', '进给速度', '进给速度', 'number', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2183', 'Focas', '报警履历', '报警履历', 'string', '', '-', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2184', 'Focas', '相对坐标X', '相对坐标X', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2185', 'Focas', '相对坐标Y', '相对坐标Y', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2186', 'Focas', '相对坐标Z', '相对坐标Z', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2187', 'Focas', '相对坐标4', '相对坐标4', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2188', 'Focas', '相对坐标5', '相对坐标5', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2189', 'Focas', '绝对坐标X', '绝对坐标X', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2190', 'Focas', '绝对坐标Y', '绝对坐标Y', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:38.000000', '2019-05-07 11:50:38.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2191', 'Focas', '绝对坐标Z', '绝对坐标Z', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2192', 'Focas', '绝对坐标4', '绝对坐标4', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2193', 'Focas', '绝对坐标5', '绝对坐标5', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2194', 'Focas', '机械坐标X', '机械坐标X', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2195', 'Focas', '机械坐标Y', '机械坐标Y', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2196', 'Focas', '机械坐标Z', '机械坐标Z', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2197', 'Focas', '机械坐标4', '机械坐标4', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2198', 'Focas', '机械坐标5', '机械坐标5', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2199', 'Focas', '剩余移动量X', '剩余移动量X', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2200', 'Focas', '剩余移动量Y', '剩余移动量Y', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2201', 'Focas', '剩余移动量Z', '剩余移动量Z', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2202', 'Focas', '剩余移动量4', '剩余移动量4', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2203', 'Focas', '剩余移动量5', '剩余移动量5', 'number', '', 'mm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2204', 'Focas', '主轴负载', '主轴负载', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2205', 'Focas', '伺服轴负载1', '伺服轴负载1', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2206', 'Focas', '伺服轴电流1', '伺服轴电流1', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2207', 'Focas', '伺服轴转速1', '伺服轴转速1', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2208', 'Focas', '伺服轴负载2', '伺服轴负载2', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2209', 'Focas', '伺服轴电流2', '伺服轴电流2', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2210', 'Focas', '伺服轴转速2', '伺服轴转速2', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2211', 'Focas', '伺服轴负载3', '伺服轴负载3', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2212', 'Focas', '伺服轴电流3', '伺服轴电流3', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2213', 'Focas', '伺服轴转速3', '伺服轴转速3', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2214', 'Focas', '伺服轴负载4', '伺服轴负载4', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2215', 'Focas', '伺服轴电流4', '伺服轴电流4', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2216', 'Focas', '伺服轴转速4', '伺服轴转速4', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2217', 'Focas', '伺服轴负载5', '伺服轴负载5', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2218', 'Focas', '伺服轴电流5', '伺服轴电流5', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2219', 'Focas', '伺服轴转速5', '伺服轴转速5', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2220', 'Focas', '伺服轴负载6', '伺服轴负载6', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2221', 'Focas', '伺服轴电流6', '伺服轴电流6', 'number', '', 'A ', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2222', 'Focas', '伺服轴转速6', '伺服轴转速6', 'number', '', 'rpm', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2223', 'Focas', 'NC运行时间', 'NC运行时间', 'number', '', 's', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2224', 'Focas', '循环时间', '循环时间', 'number', '', 's', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2225', 'Focas', '切削时间', '切削时间', 'number', '', 's', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2226', 'Focas', '开机时间', '开机时间', 'number', '', 's', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2227', 'Focas', '进给F倍率值', '进给F倍率值', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2228', 'Focas', '转速S倍率值', '转速S倍率值', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2229', 'Focas', '加工部件数', '加工部件数', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2230', 'Focas', '加工部件总数', '加工部件总数', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2231', 'Focas', '当前程序全路径名', '当前程序全路径名', 'string', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2232', 'Focas', '主程序编号', '主程序编号', 'number', '', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');
INSERT INTO `protocol_params_dnc` VALUES ('2233', 'Focas', '刀具信息', '刀具信息', 'number', '需要ConfigValue    eg:100      说明：采集刀具数据的地址（short）', '-', '9', '0', '2019-05-07 11:50:39.000000', '2019-05-07 11:50:39.000000');

-- ----------------------------
-- Table structure for protocol_plc
-- ----------------------------
DROP TABLE IF EXISTS `protocol_plc`;
CREATE TABLE `protocol_plc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateMac` varchar(50) DEFAULT NULL,
  `deviceType` varchar(50) DEFAULT NULL,
  `serialNum` varchar(50) DEFAULT NULL,
  `deviceID` varchar(50) DEFAULT NULL,
  `deviceIP` varchar(50) DEFAULT NULL,
  `functionCode` varchar(50) DEFAULT NULL,
  `startAddress` varchar(50) DEFAULT NULL,
  `len` varchar(20) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `delayMs` varchar(50) DEFAULT NULL,
  `machCode` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `Multiple` varchar(50) DEFAULT NULL,
  `offset` varchar(50) DEFAULT NULL,
  `maxValue` varchar(50) DEFAULT NULL,
  `minValue` varchar(50) DEFAULT NULL,
  `des` varchar(100) DEFAULT NULL,
  `operationUnit` varchar(50) DEFAULT NULL,
  `template` int(11) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  `dataType_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `protocol_plc_name_gateMac_template_ma_46e19a9a_uniq` (`name`,`gateMac`,`template`,`machCode`,`deviceType`),
  KEY `protocol_plc_dataType_id_964de2d9_fk_protocol_type_id` (`dataType_id`),
  CONSTRAINT `protocol_plc_dataType_id_964de2d9_fk_protocol_type_id` FOREIGN KEY (`dataType_id`) REFERENCES `protocol_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protocol_plc
-- ----------------------------

-- ----------------------------
-- Table structure for protocol_type
-- ----------------------------
DROP TABLE IF EXISTS `protocol_type`;
CREATE TABLE `protocol_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceType` varchar(50) DEFAULT NULL,
  `TypeList` varchar(50) DEFAULT NULL,
  `operationFlag` int(11) NOT NULL,
  `createTime` datetime(6) NOT NULL,
  `updateTime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of protocol_type
-- ----------------------------
INSERT INTO `protocol_type` VALUES ('1', 'GW_DNC', 'Focas', '9', '2019-04-24 10:55:05.000000', '2019-04-24 10:55:08.000000');
INSERT INTO `protocol_type` VALUES ('2', 'GW_DNC', 'OPCDA_Version 6.05', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('3', 'GW_DNC', 'OPCDA_Version 7.03', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('4', 'GW_DNC', 'OPCDA_Version 8.06', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('5', 'GW_DNC', 'ABB', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('6', 'GW_DNC', 'KUKA', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('8', 'GW_DNC', 'OPCUA', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('9', 'GW_PLC', 'FINS_UDP', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('10', 'GW_PLC', 'MODBUS_TCP', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('11', 'GW_PLC', 'ISO_TCP', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('12', 'GW_PLC', 'NET_S7', '9', '2019-04-24 10:56:54.000000', '2019-04-24 10:56:58.000000');
INSERT INTO `protocol_type` VALUES ('13', 'GW_PLC', 'FINS', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('14', 'GW_PLC', 'MODBUS_FX', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('15', 'GW_PLC', 'MODBUS_RTU', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('16', 'GW_PLC', 'PPI', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('17', 'GW_PLC', 'FATEK', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('18', 'GW_PLC', 'MODBUS_ASCII', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('19', 'GW_PLC', 'MT_PPI', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('20', 'GW_PLC', 'OMRON_CMODE', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');
INSERT INTO `protocol_type` VALUES ('21', 'GW_PLC', 'SCALES', '9', '2019-05-08 14:52:14.000000', '2019-05-08 14:52:20.000000');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_edge_users_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_edge_users_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_edge_users_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_edge_users_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_edge_users_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_edge_users_id` FOREIGN KEY (`user_id`) REFERENCES `edge_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
