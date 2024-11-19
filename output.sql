  /*
  Navicat Premium Data Transfer

  Source Server         : localhost
  Source Server Type    : MySQL
  Source Server Version : 50717
  Source Host           : localhost:3306
  Source Schema         : no89_hosoneu

  Target Server Type    : MySQL
  Target Server Version : 50717
  File Encoding         : 65001

  Date: 30/12/2023 21:12:50
  */

  SET NAMES utf8mb4;
  SET FOREIGN_KEY_CHECKS = 0;

  -- ----------------------------
  -- Table structure for calculation_type
  -- ----------------------------
  DROP TABLE IF EXISTS `calculation_type`;
  CREATE TABLE `calculation_type`  (
    `Calculation_Type_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算类别ID',
    `Calculation_Type_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算类别',
    PRIMARY KEY (`Calculation_Type_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of calculation_type
  -- ----------------------------

  -- ----------------------------
  -- Table structure for commonly_used_diagnosis
  -- ----------------------------
  DROP TABLE IF EXISTS `commonly_used_diagnosis`;
  CREATE TABLE `commonly_used_diagnosis`  (
    `Commonly_Used_Diagnosis_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '常用诊断ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Disease_ID` int(11) NULL DEFAULT NULL COMMENT '疾病ID',
    PRIMARY KEY (`Commonly_Used_Diagnosis_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of commonly_used_diagnosis
  -- ----------------------------

  -- ----------------------------
  -- Table structure for commonly_used_drugs
  -- ----------------------------
  DROP TABLE IF EXISTS `commonly_used_drugs`;
  CREATE TABLE `commonly_used_drugs`  (
    `Commonly_Used_Drugs` int(11) NOT NULL AUTO_INCREMENT COMMENT '常用药品ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Drugs_ID` int(11) NULL DEFAULT NULL COMMENT '药品ID',
    PRIMARY KEY (`Commonly_Used_Drugs`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of commonly_used_drugs
  -- ----------------------------

  -- ----------------------------
  -- Table structure for commonly_used_fmedical
  -- ----------------------------
  DROP TABLE IF EXISTS `commonly_used_fmedical`;
  CREATE TABLE `commonly_used_fmedical`  (
    `Commonly_Used_Fmedical_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '常用非药品项目ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '非药品收费项目ID',
    PRIMARY KEY (`Commonly_Used_Fmedical_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of commonly_used_fmedical
  -- ----------------------------

  -- ----------------------------
  -- Table structure for constant_items
  -- ----------------------------
  DROP TABLE IF EXISTS `constant_items`;
  CREATE TABLE `constant_items`  (
    `Constant_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '常数项ID',
    `Constant_Type_ID` int(11) NOT NULL COMMENT '常数项类别ID',
    `Constant_Items_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常数项编码',
    `Constant_Items_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常数项名称',
    PRIMARY KEY (`Constant_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of constant_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for constant_type
  -- ----------------------------
  DROP TABLE IF EXISTS `constant_type`;
  CREATE TABLE `constant_type`  (
    `Constant_Type_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '常数项类别ID',
    `Constant_Type_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常数项类别编码',
    `Constant_Type_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常数项类别名称 科室分类、收费方式、性别类型、医生职称、药品类型、药品剂型',
    PRIMARY KEY (`Constant_Type_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of constant_type
  -- ----------------------------

  -- ----------------------------
  -- Table structure for day_cal
  -- ----------------------------
  DROP TABLE IF EXISTS `day_cal`;
  CREATE TABLE `day_cal`  (
    `Day_Cal_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '日结ID',
    `User_ID` int(11) NOT NULL COMMENT '用户ID',
    `Day_Cal_Date` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '日结日期',
    `YF_Total` DECIMAL(11, 2) NOT NULL COMMENT '药费',
    `GH_Total` DECIMAL(11, 2) NOT NULL COMMENT '挂号费',
    `Day_Cal_Total` DECIMAL(11, 2) NOT NULL COMMENT '日结总额',
    `CL_Total` DECIMAL(11, 2) NOT NULL COMMENT '材料费',
    `JC_Total` DECIMAL(11, 2) NOT NULL COMMENT '检查费',
    `CZ_Total` DECIMAL(11, 2) NOT NULL COMMENT '处置+麻醉费',
    `QT_Total` DECIMAL(11, 2) NOT NULL COMMENT '其他费用',
    PRIMARY KEY (`Day_Cal_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of day_cal
  -- ----------------------------

  -- ----------------------------
  -- Table structure for department
  -- ----------------------------
  DROP TABLE IF EXISTS `department`;
  CREATE TABLE `department`  (
    `Department_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室ID',
    `Department_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室编码',
    `Department_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名称',
    `Department_Category_ID` int(11) NULL DEFAULT NULL COMMENT '科室分类（参考常数项表 内科、外科等）',
    `Department_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室类型（1 临床 2 医技 3 财务 4 行政 5 其他 ）',
    PRIMARY KEY (`Department_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 141 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of department
  -- ----------------------------

  -- ----------------------------
  -- Table structure for diagnosis
  -- ----------------------------
  DROP TABLE IF EXISTS `diagnosis`;
  CREATE TABLE `diagnosis`  (
    `Diagnosis_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '诊断ID',
    `Disease_ID` int(11) NULL DEFAULT NULL COMMENT '疾病ID',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历ID',
    `Main_Diagnosis_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诊标志 1 非主诊 2 主诊',
    `Suspect_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疑似标志 1 确认 2 疑似',
    `Onset_Date` date NULL DEFAULT NULL COMMENT '发病日期（患者发病的日期）',
    `Diagnosis_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断标志 1初诊 2终诊',
    PRIMARY KEY (`Diagnosis_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of diagnosis
  -- ----------------------------

  -- ----------------------------
  -- Table structure for diagnosis_template
  -- ----------------------------
  DROP TABLE IF EXISTS `diagnosis_template`;
  CREATE TABLE `diagnosis_template`  (
    `Diagnosis_Template_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '诊断模板ID',
    `Medical_Record_Home_Page_Template_ID` int(11) NULL DEFAULT NULL COMMENT '病历首页模板ID',
    `Disease_ID` int(11) NULL DEFAULT NULL COMMENT '疾病ID',
    `Main_Diagnosis_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诊标志 1 非主诊 2 主诊',
    `Suspect_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疑似标志 1 非疑似 2 疑似',
    PRIMARY KEY (`Diagnosis_Template_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of diagnosis_template
  -- ----------------------------

  -- ----------------------------
  -- Table structure for disease
  -- ----------------------------
  DROP TABLE IF EXISTS `disease`;
  CREATE TABLE `disease`  (
    `Disease_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
    `Disease_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
    `Disease_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
    `Disease_ICD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病ICD编码',
    `Disease_Type_ID` int(11) NOT NULL COMMENT '疾病分类ID（参考疾病分类表）',
    `Disease_Customize_Name1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病自定义名称1',
    `Disease_Customize_Name2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病自定义名称2',
    PRIMARY KEY (`Disease_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 29396 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of disease
  -- ----------------------------

  -- ----------------------------
  -- Table structure for disease_type
  -- ----------------------------
  DROP TABLE IF EXISTS `disease_type`;
  CREATE TABLE `disease_type`  (
    `Disease_Type_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '疾病分类ID',
    `Disease_Type_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病分类编码',
    `Disease_Type_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '疾病分类名称',
    `Disease_Type_Sequence` int(11) NULL DEFAULT NULL,
    `Disease_Type_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病类别：1 西医疾病 2 中医疾病',
    `Disease_Folder_ID` int(11) NULL DEFAULT NULL COMMENT '疾病文件夹ID',
    PRIMARY KEY (`Disease_Type_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 483 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of disease_type
  -- ----------------------------

  -- ----------------------------
  -- Table structure for drugs
  -- ----------------------------
  DROP TABLE IF EXISTS `drugs`;
  CREATE TABLE `drugs`  (
    `Drugs_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '药品ID',
    `Drugs_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品编码',
    `Drugs_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品名称',
    `Drugs_Format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品规格（如100g/盒）',
    `Drugs_Unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装单位（盒、瓶等）',
    `Drugs_Manufacturer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
    `Drugs_Dosage_ID` int(11) NULL DEFAULT NULL COMMENT '药品剂型ID （参照常数项表 冲剂等）',
    `Drugs_Type_ID` int(11) NULL DEFAULT NULL COMMENT '药品类型ID（参照常数项表 西药 中成药 中草药）',
    `Drugs_Price` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '药品单价',
    `Drugs_MnemonicCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音助记码',
    `Create_Time` date NULL DEFAULT NULL,
    `Reverse1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Reverse2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `Reverse3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`Drugs_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 2967 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of drugs
  -- ----------------------------

  -- ----------------------------
  -- Table structure for examination
  -- ----------------------------
  DROP TABLE IF EXISTS `examination`;
  CREATE TABLE `examination`  (
    `Examination_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查检验ID',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID(开设检查检验项的医生ID)',
    `Examination_Mark` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查检验标志：1 检查 2 检验',
    `Doctor_Advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生嘱托',
    `Submit_Time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
    PRIMARY KEY (`Examination_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of examination
  -- ----------------------------

  -- ----------------------------
  -- Table structure for examination_drugs_items
  -- ----------------------------
  DROP TABLE IF EXISTS `examination_drugs_items`;
  CREATE TABLE `examination_drugs_items`  (
    `Examination_Drugs_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `Examination_Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验 非药品明细ID',
    `Drugs_ID` int(11) NULL DEFAULT NULL COMMENT '药品id',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '开立药物的医技医生ID（默认为空 当为医技医生开立时存储医技医生的ID）',
    `Drugs_Usage` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法：1 静脉滴注 2 静脉可注 3 肌肉注射 4 口服 5 皮试 6 皮下注射',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '开立数量',
    `Actual_Quantity` int(11) NULL DEFAULT NULL COMMENT '实际数量（开立数量-退药数量）',
    `Drugs_Dispensing_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发药状态 ：1 未发药 2 已发药',
    `Expense_Items_ID` int(11) NULL DEFAULT NULL COMMENT '收费明细ID',
    `Times` int(11) NULL DEFAULT NULL COMMENT '次数',
    `Days` int(11) NULL DEFAULT NULL COMMENT '天数 （与Times联合使用 *天*次）',
    `Dosage` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '用量',
    PRIMARY KEY (`Examination_Drugs_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of examination_drugs_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for examination_fmedical_items
  -- ----------------------------
  DROP TABLE IF EXISTS `examination_fmedical_items`;
  CREATE TABLE `examination_fmedical_items`  (
    `Examination_Fmedical_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '非药品检查检验明细ID',
    `Examination_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验ID',
    `Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '非药品ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '登记该非药品收费项目的医技医生ID',
    `Registration_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记状态：1 未登记 2 已登记',
    `Purpose_Requirements` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的和要求',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '开立数量',
    `Actual_Quantity` int(11) NULL DEFAULT NULL COMMENT '实际数量（开立数量-退的数量）',
    `Examination_Result_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验结果ID',
    `Expense_Items_ID` int(11) NULL DEFAULT NULL COMMENT '收费ID',
    `Valid_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效状态：1 有效 2 无效（针对未登记的项目可以作废）',
    PRIMARY KEY (`Examination_Fmedical_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of examination_fmedical_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for examination_result
  -- ----------------------------
  DROP TABLE IF EXISTS `examination_result`;
  CREATE TABLE `examination_result`  (
    `Examination_Result_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查检验结果ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医技医生ID',
    `Findings` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查\\检验所见',
    `Diagnostic_Suggestion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断意见',
    `Submit_Time` datetime(0) NULL DEFAULT NULL COMMENT '诊断录入时间',
    PRIMARY KEY (`Examination_Result_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of examination_result
  -- ----------------------------

  -- ----------------------------
  -- Table structure for examination_result_image
  -- ----------------------------
  DROP TABLE IF EXISTS `examination_result_image`;
  CREATE TABLE `examination_result_image`  (
    `Examination_Result_Image_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查检验图片ID',
    `Examination_Result_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验结果ID',
    `Image_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片url',
    `Image_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
    PRIMARY KEY (`Examination_Result_Image_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of examination_result_image
  -- ----------------------------

  -- ----------------------------
  -- Table structure for expense_items
  -- ----------------------------
  DROP TABLE IF EXISTS `expense_items`;
  CREATE TABLE `expense_items`  (
    `Expense_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '费用明细ID',
    `Medical_Record_ID` int(11) NOT NULL COMMENT '病历ID',
    `Total_Cost` DECIMAL(11, 2) NOT NULL COMMENT '总费用',
    `Pay_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收费状态:1 已缴费 2 退费',
    `Invoice_ID` int(11) NULL DEFAULT NULL COMMENT '交费后，打印发票并生成发票号。退费时根据发票号确定退费项目是什么。\r\n发票上项目全部退掉，重打剩余部分。\r\n或者退掉部分。',
    `Expense_Type_ID` int(11) NULL DEFAULT NULL COMMENT '每个收费项目对应一个收费条目 Expense_Type_ID记录该项目的收费类型',
    PRIMARY KEY (`Expense_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of expense_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for expense_type
  -- ----------------------------
  DROP TABLE IF EXISTS `expense_type`;
  CREATE TABLE `expense_type`  (
    `Expense_Type_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '费用科目ID',
    `Expense_Type_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用科目编码',
    `Expense_Type_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用科目名称',
    PRIMARY KEY (`Expense_Type_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of expense_type
  -- ----------------------------

  -- ----------------------------
  -- Table structure for fmedical_items
  -- ----------------------------
  DROP TABLE IF EXISTS `fmedical_items`;
  CREATE TABLE `fmedical_items`  (
    `Fmedical_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '非药品项目ID',
    `Fmedical_Items_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '非药品项目编码',
    `Fmedical_Items_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '非药品项目名称',
    `Fmedical_Items_Format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '非药品项目规格',
    `Fmedical_Items_Price` DECIMAL(11, 2) NOT NULL COMMENT '非药品项目单价',
    `Expense_Type_ID` int(11) NOT NULL COMMENT '所属费用科目ID',
    `Department_ID` int(11) NOT NULL COMMENT '执行科室ID',
    `Fmedical_Items_MnemonicCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼音助记码',
    `Fmedical_Items_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '非药品项目类别（1检查 2检验 3处置）',
    `Create_Time` date NULL DEFAULT NULL COMMENT '创建时间',
    `Reverse1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留1：创建人',
    `Reverse2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留2：最近修改时间',
    `Reverse3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留3：修改人',
    PRIMARY KEY (`Fmedical_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of fmedical_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for function
  -- ----------------------------
  DROP TABLE IF EXISTS `function`;
  CREATE TABLE `function`  (
    `Function_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '功能ID',
    `Role_ID` int(11) NOT NULL COMMENT '角色ID',
    `Function_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能URL',
    `Function_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能名',
    `Reverse1` int(11) NULL DEFAULT NULL COMMENT '预留 子菜单指向父菜单，无需指向Role',
    PRIMARY KEY (`Function_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Table structure for group_examination
  -- ----------------------------
  DROP TABLE IF EXISTS `group_examination`;
  CREATE TABLE `group_examination`  (
    `Group_Examination_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查检验组套ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '创建医生ID',
    `Group_Examination_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组套编码',
    `Group_Examination_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组套ID',
    `Group_Examination_Scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用范围 ：1 个人 2 科室 3 全院',
    `Create_Time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `Group_Examination_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组套检查检验类型：1检查2检验',
    PRIMARY KEY (`Group_Examination_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_examination
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_examination_drugs_items
  -- ----------------------------
  DROP TABLE IF EXISTS `group_examination_drugs_items`;
  CREATE TABLE `group_examination_drugs_items`  (
    `Group_Examination_Drugs_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `Group_Examination_Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验组套 非药品明细ID',
    `Drugs_ID` int(11) NULL DEFAULT NULL COMMENT '药品id',
    `Drugs_Usage` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法：1 静脉滴注 2 静脉可注 3 肌肉注射 4 口服 5 皮试 6 皮下注射',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '开立数量',
    `Times` int(11) NULL DEFAULT NULL COMMENT '次数',
    `Days` int(11) NULL DEFAULT NULL COMMENT '天数 （与Times联合使用 *天*次）',
    `Dosage` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '用量',
    PRIMARY KEY (`Group_Examination_Drugs_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_examination_drugs_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_examination_fmedical_items
  -- ----------------------------
  DROP TABLE IF EXISTS `group_examination_fmedical_items`;
  CREATE TABLE `group_examination_fmedical_items`  (
    `Group_Examination_Fmedical_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '非药品检查检验组套明细ID',
    `Group_Examination_ID` int(11) NULL DEFAULT NULL COMMENT '检查检验组套ID',
    `Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '非药品ID',
    `Purpose_Requirements` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的和要求',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
    PRIMARY KEY (`Group_Examination_Fmedical_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_examination_fmedical_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_prescription
  -- ----------------------------
  DROP TABLE IF EXISTS `group_prescription`;
  CREATE TABLE `group_prescription`  (
    `Group_Prescription_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处方组套ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Group_Prescription_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合编码',
    `Group_Prescription_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合名称',
    `Group_Prescription_Scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用范围：1 个人 2 科室 3 全院',
    `Create_Time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `Prescription_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方类型：1 成药处方 2 草药处方',
    PRIMARY KEY (`Group_Prescription_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_prescription
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_prescription_items
  -- ----------------------------
  DROP TABLE IF EXISTS `group_prescription_items`;
  CREATE TABLE `group_prescription_items`  (
    `Group_Prescription_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处方条目ID',
    `Group_Prescription_ID` int(11) NULL DEFAULT NULL COMMENT '成药处方组套ID',
    `Drugs_ID` int(11) NULL DEFAULT NULL COMMENT '药品ID',
    `Drugs_Usage` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法：1 静脉滴注 2 静脉可注 3 肌肉注射 4 口服 5 皮试 6 皮下注射',
    `Dosage` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '用量',
    `Times` int(11) NULL DEFAULT NULL COMMENT '频次',
    `Days` int(11) NULL DEFAULT NULL COMMENT '天数 （与频次组合 得到*天*次 如1天3次）',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
    `Drugs_Advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药嘱托',
    PRIMARY KEY (`Group_Prescription_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_prescription_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_treatment
  -- ----------------------------
  DROP TABLE IF EXISTS `group_treatment`;
  CREATE TABLE `group_treatment`  (
    `Group_Treatment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '创建医生',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '创建医生ID',
    `Group_Treatment_Code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合代码',
    `Group_Treatment_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组合名称',
    `Group_Treatment_Scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用范围 ：1 个人 2 科室 3 全院',
    `Create_Time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`Group_Treatment_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_treatment
  -- ----------------------------

  -- ----------------------------
  -- Table structure for group_treatment_items
  -- ----------------------------
  DROP TABLE IF EXISTS `group_treatment_items`;
  CREATE TABLE `group_treatment_items`  (
    `Group_Treatment_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处置组套明细ID',
    `Group_Treatment_ID` int(11) NULL DEFAULT NULL COMMENT '处置组套ID',
    `Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '非药品项目ID',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '开立数量',
    `Group_Treatment_Scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用范围 1 个人 2 科室 3 全院',
    PRIMARY KEY (`Group_Treatment_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of group_treatment_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for invoice
  -- ----------------------------
  DROP TABLE IF EXISTS `invoice`;
  CREATE TABLE `invoice`  (
    `Invoice_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票ID',
    `Invoice_NO` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票号',
    `Total_Cost` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '总计',
    `Is_Day_Cal` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否日结 1 未日结 2 已日结',
    `Pay_Time` datetime(0) NULL DEFAULT NULL COMMENT '收费时间',
    `User_ID` int(11) NULL DEFAULT NULL COMMENT '收费员',
    `Pay_Mode_ID` int(11) NULL DEFAULT NULL COMMENT '支付方式ID（参考常数项表 现金、医保卡、银行卡、信用卡等）',
    PRIMARY KEY (`Invoice_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of invoice
  -- ----------------------------

  -- ----------------------------
  -- Table structure for medical_record
  -- ----------------------------
  DROP TABLE IF EXISTS `medical_record`;
  CREATE TABLE `medical_record`  (
    `Medical_Record_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '病历ID',
    `Is_Treament_Over` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否诊毕 1:未诊毕 2:已诊毕',
    `First_Diagnosis_Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '初诊医生ID',
    `Final_Diagnosis_Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '确诊医生ID',
    `First_Diagnosis_Time` datetime(0) NULL DEFAULT NULL COMMENT '初诊时间',
    `Final_Diagnosis_Time` datetime(0) NULL DEFAULT NULL COMMENT '确诊时间',
    `Doctor_ID` int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`Medical_Record_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of medical_record
  -- ----------------------------

  -- ----------------------------
  -- Table structure for medical_record_home_page
  -- ----------------------------
  DROP TABLE IF EXISTS `medical_record_home_page`;
  CREATE TABLE `medical_record_home_page`  (
    `Medical_Record_Home_Page_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '病历首页',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Chief_Complaint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诉：病人对自我感觉最痛苦的病情的简要叙述',
    `Present_History` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现病史',
    `Present_Treatment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现病治疗情况',
    `Past_History` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '既往史',
    `Allergic_History` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过敏史',
    `Physical_Examination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体格检查',
    `Assistant_Examination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅助检查结果（根据检查检验结果）',
    PRIMARY KEY (`Medical_Record_Home_Page_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of medical_record_home_page
  -- ----------------------------

  -- ----------------------------
  -- Table structure for medical_record_home_page_template
  -- ----------------------------
  DROP TABLE IF EXISTS `medical_record_home_page_template`;
  CREATE TABLE `medical_record_home_page_template`  (
    `Medical_Record_Home_Page_Template_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '病历首页模板ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL,
    `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
    `Scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用范围：1 个人 2 科室 3 全院',
    `Chief_Complaint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主诉',
    `Present_History` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现病史',
    `Physical_Examination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体格检查',
    PRIMARY KEY (`Medical_Record_Home_Page_Template_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of medical_record_home_page_template
  -- ----------------------------

  -- ----------------------------
  -- Table structure for patient
  -- ----------------------------
  DROP TABLE IF EXISTS `patient`;
  CREATE TABLE `patient`  (
    `Patient_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '患者ID',
    `Patient_Name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '患者名称',
    `Patient_Gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '患者性别 1男 2 女',
    `Patient_Birth` date NOT NULL COMMENT '患者生日',
    `Patient_Age` int(3) NULL DEFAULT NULL COMMENT '患者年龄',
    `Patient_IDentity` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '患者身份证号',
    `Patient_Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '患者地址',
    PRIMARY KEY (`Patient_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of patient
  -- ----------------------------

  -- ----------------------------
  -- Table structure for prescription
  -- ----------------------------
  DROP TABLE IF EXISTS `prescription`;
  CREATE TABLE `prescription`  (
    `Prescription_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处方ID',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历id',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生id',
    `Submit_Time` datetime(0) NULL DEFAULT NULL COMMENT '开立时间（暂存情况下不设置开立时间）',
    `Prescription_Type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处方类型：1 成药 2 草药',
    `Valid_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效状态：1 有效 2 无效（针对全部未收款的处方可以作废）',
    PRIMARY KEY (`Prescription_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of prescription
  -- ----------------------------

  -- ----------------------------
  -- Table structure for prescription_items
  -- ----------------------------
  DROP TABLE IF EXISTS `prescription_items`;
  CREATE TABLE `prescription_items`  (
    `Prescription_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处方条目ID',
    `Prescription_ID` int(11) NULL DEFAULT NULL COMMENT '成药处方id',
    `Drags_ID` int(11) NULL DEFAULT NULL COMMENT '药品id',
    `Expense_Items_ID` int(11) NULL DEFAULT NULL COMMENT '收费ID',
    `Drugs_Usage` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法：1 静脉滴注 2 静脉可注 3 肌肉注射 4 口服 5 皮试 6 皮下注射',
    `Dosage` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '用量',
    `Times` int(11) NULL DEFAULT NULL COMMENT '频次',
    `Days` int(11) NULL DEFAULT NULL COMMENT '天数 （与频次组合 得到*天*次 如1天3次）',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
    `Drugs_Advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用药嘱托',
    `Drugs_Dispensing_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发药状态：1 未发药 2 已发药',
    `Actual_Quantity` int(11) NULL DEFAULT NULL COMMENT '实际数量（开立数量-退药数量）',
    PRIMARY KEY (`Prescription_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of prescription_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for registration
  -- ----------------------------
  DROP TABLE IF EXISTS `registration`;
  CREATE TABLE `registration`  (
    `Registration_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '挂号ID',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历ID',
    `Registration_Level_ID` int(11) NULL DEFAULT NULL COMMENT '挂号级别ID',
    `Patient_ID` int(11) NULL DEFAULT NULL COMMENT '患者ID',
    `Department_ID` int(11) NULL DEFAULT NULL COMMENT '科室ID',
    `Calculation_Type_ID` int(11) NULL DEFAULT NULL COMMENT '结算类别ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Registration_Date` datetime(0) NULL DEFAULT NULL COMMENT '挂号日期',
    `Buy_Medical_Record` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否购买病历本 0:没有 1:有 购买病历本需要加1元',
    `Registration_Total_Cost` DECIMAL(11, 2) NULL DEFAULT NULL COMMENT '挂号总费用',
    `Expense_Type_ID` int(11) NULL DEFAULT NULL COMMENT '费用科目ID',
    `Expense_Items_ID` int(11) NULL DEFAULT NULL COMMENT '费用项目ID',
    `Registration_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂号状态 1 未看诊 2 已看诊 3 诊毕 4 退号',
    PRIMARY KEY (`Registration_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of registration
  -- ----------------------------

  -- ----------------------------
  -- Table structure for registration_level
  -- ----------------------------
  DROP TABLE IF EXISTS `registration_level`;
  CREATE TABLE `registration_level`  (
    `Registration_Level_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '挂号等级ID',
    `Registration_Level_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '挂号等级名称',
    `Is_Default` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否默认 1 不是 2 是',
    `Registration_Sequence` int(11) NULL DEFAULT NULL COMMENT '显示顺序号',
    `Registration_Cost` DECIMAL(11, 2) NOT NULL COMMENT '挂号费用',
    PRIMARY KEY (`Registration_Level_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of registration_level
  -- ----------------------------

  -- ----------------------------
  -- Table structure for role
  -- ----------------------------
  DROP TABLE IF EXISTS `role`;
  CREATE TABLE `role`  (
    `Role_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `Function_id` int(11) NOT NULL COMMENT '功能ID',
    `Role_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
    PRIMARY KEY (`Role_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of role
  -- ----------------------------

  -- ----------------------------
  -- Table structure for scheduling_info
  -- ----------------------------
  DROP TABLE IF EXISTS `scheduling_info`;
  CREATE TABLE `scheduling_info`  (
    `Scheduling_Info_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '排班信息ID',
    `Doctor_ID` int(11) NOT NULL COMMENT '医生ID',
    `Scheduling_NoonBreak` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班午别（1 上午 2 下午 3 晚上 4 全天）',
    `Scheduling_StartTime` datetime(0) NULL DEFAULT NULL COMMENT '排班开始时间',
    `Scheduling_EndTime` datetime(0) NULL DEFAULT NULL COMMENT '排班结束时间',
    `Scheduling_Weekday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班日',
    `Scheduling_LimitCount` int(3) NULL DEFAULT NULL COMMENT '排班限额',
    `Scheduling_RestCount` int(3) NULL DEFAULT NULL COMMENT '剩余号数',
    PRIMARY KEY (`Scheduling_Info_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of scheduling_info
  -- ----------------------------

  -- ----------------------------
  -- Table structure for scheduling_rule
  -- ----------------------------
  DROP TABLE IF EXISTS `scheduling_rule`;
  CREATE TABLE `scheduling_rule`  (
    `Scheduling_Rule_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '排版规则ID',
    `Doctor_ID` int(11) NOT NULL COMMENT '医生ID',
    `Scheduling_Rule_NoonBreak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排班午别',
    `Scheduling_Rule_StartTime` date NULL DEFAULT NULL COMMENT '排班开始日期',
    `Scheduling_Rule_EndTime` date NULL DEFAULT NULL COMMENT '排版结束日期',
    `Scheduling_Rule_Weekday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排版日',
    `Scheduling_Rule_LimitCount` int(3) NULL DEFAULT NULL COMMENT '排班限额',
    PRIMARY KEY (`Scheduling_Rule_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Table structure for treatment
  -- ----------------------------
  DROP TABLE IF EXISTS `treatment`;
  CREATE TABLE `treatment`  (
    `Treatment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '处置ID',
    `Medical_Record_ID` int(11) NULL DEFAULT NULL COMMENT '病历号ID',
    `Doctor_ID` int(11) NULL DEFAULT NULL COMMENT '医生ID',
    `Submit_Time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
    PRIMARY KEY (`Treatment_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of treatment
  -- ----------------------------

  -- ----------------------------
  -- Table structure for treatment_items
  -- ----------------------------
  DROP TABLE IF EXISTS `treatment_items`;
  CREATE TABLE `treatment_items`  (
    `Treatment_Items_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `Treatment_ID` int(11) NULL DEFAULT NULL COMMENT '处置id',
    `Fmedical_Items_ID` int(11) NULL DEFAULT NULL COMMENT '非药品目录id',
    `Quantity` int(11) NULL DEFAULT NULL COMMENT '数量',
    `Actual_Quantity` int(11) NULL DEFAULT NULL COMMENT '实际数量（开立数量-实际数量）',
    `Expense_Items_ID` int(11) NULL DEFAULT NULL COMMENT '费用明细ID',
    `Valid_Status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效状态：1 有效 2 无效（针对未收费的项目可以作废）',
    PRIMARY KEY (`Treatment_Items_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of treatment_items
  -- ----------------------------

  -- ----------------------------
  -- Table structure for user
  -- ----------------------------
  DROP TABLE IF EXISTS `user`;
  CREATE TABLE `user`  (
    `User_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `User_loginName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登录名',
    `User_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
    `Role_ID` int(11) NOT NULL COMMENT '角色ID',
    `User_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
    `Department_ID` int(11) NOT NULL COMMENT '科室ID',
    `User_Title_ID` int(11) NOT NULL COMMENT '医生职称ID（常数项表中 主任医师 副主任医师 主治医师 住院医师）',
    `User_Gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 1男 2女',
    `User_Status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作状态：是否在线',
    `User_Scheduling_LimitCount` int(10) NULL DEFAULT NULL,
    PRIMARY KEY (`User_ID`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  -- ----------------------------
  -- Records of user
  -- ----------------------------

  SET FOREIGN_KEY_CHECKS = 1;
