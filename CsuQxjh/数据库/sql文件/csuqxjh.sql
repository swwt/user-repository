/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : csuqxjh

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-04-15 09:10:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(50) NOT NULL COMMENT '���',
  `admin_name` varchar(50) default NULL COMMENT '�û���',
  `admin_real_name` varchar(50) default NULL COMMENT '��ʵ����',
  `admin_login_name` varchar(50) default NULL COMMENT '��¼��',
  `admin_password` varchar(50) default NULL COMMENT '����',
  `admin_sex` int(11) default NULL COMMENT '�Ա�',
  `admin_phone` varchar(20) default NULL COMMENT '��ϵ�绰',
  `admin_email` varchar(30) default NULL COMMENT '����',
  `admin_address` varchar(50) default NULL COMMENT '��ַ',
  `admin_degree` int(11) default NULL COMMENT '����Ա����',
  `admin_time` varchar(20) default NULL COMMENT '����Ա��Ϣ����޸�ʱ��',
  `admin_head` varchar(50) default NULL COMMENT 'ͷ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adminoperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `adminoperatelogs`;
CREATE TABLE `adminoperatelogs` (
  `id` int(11) default NULL COMMENT '���',
  `admin_id` varchar(50) default NULL COMMENT '����Ա���',
  `adminoperatelogs_operation` text COMMENT '������Ϊ',
  `adminoperatelogs_description` text COMMENT '��������',
  `adminoperatelogs_ip` varchar(30) default NULL COMMENT 'IP��ַ',
  `adminoperatelogs_time` text COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��̨����Ա������־��';

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `sellor_id` varchar(50) default NULL COMMENT '���̱��',
  `collection_time` varchar(20) default NULL COMMENT '�ղ�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collection_goods
-- ----------------------------
DROP TABLE IF EXISTS `collection_goods`;
CREATE TABLE `collection_goods` (
  `collection_id` int(11) NOT NULL COMMENT 'collection�����',
  `goods_id` int(11) NOT NULL COMMENT 'goods�����',
  PRIMARY KEY  (`collection_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ղ�����Ʒ��Զ�Ĺ�����ϵ';

-- ----------------------------
-- Table structure for collection_store
-- ----------------------------
DROP TABLE IF EXISTS `collection_store`;
CREATE TABLE `collection_store` (
  `collection_id` int(11) NOT NULL COMMENT '�ղر����',
  `sellor_id` int(11) NOT NULL COMMENT '������',
  PRIMARY KEY  (`collection_id`,`sellor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ղغ͵��̶�Զ������';

-- ----------------------------
-- Table structure for coupon_sellor
-- ----------------------------
DROP TABLE IF EXISTS `coupon_sellor`;
CREATE TABLE `coupon_sellor` (
  `id` int(11) NOT NULL COMMENT '���',
  `sellor_id` varchar(50) default NULL COMMENT '��ұ��',
  `coupon_sellor_remark` text COMMENT '�Ż�ȯ��ע',
  `coupon_sellor_time_begin` varchar(20) default NULL COMMENT '�Ż�ȯ��ʼʱ��',
  `coupon_sellor_icon` varchar(50) default NULL COMMENT '�Ż�ȯ��־��ͼƬ',
  `coupon_sellor_money` decimal(10,3) default NULL COMMENT '�Ż�ȯ���',
  `coupon_sellor_money_expend` decimal(10,3) default NULL COMMENT '�Ż�ȯ�����ٿ���',
  `coupon_sellor_number_limit` int(11) default NULL COMMENT '�Ż�ȯ��ȡ��������',
  `coupon_sellor_number_get` int(11) default NULL COMMENT '�Ż�ȯ��������',
  `coupon_sellor_time_end` varchar(20) default NULL COMMENT '�Ż�ȯ����ʱ��',
  `coupon_sellor_limit_type` int(11) default NULL COMMENT '�Ż�ȯ�Ƿ���������Ʒ���������ƣ���ʹ��goods_coupon����ָ��ʹ����Ʒ��Χ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user` (
  `id` int(11) NOT NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `coupon_sellor_id` int(11) default NULL COMMENT '�Ż�ȯ���',
  `coupon_user_use_status` int(11) default NULL COMMENT '�Ƿ�ʹ�ù�',
  `coupon_user_time_get` varchar(20) default NULL COMMENT '�û���ȡ�Ż�ȯʱ��',
  `coupon_user_time_use` varchar(20) default NULL COMMENT '�û��Ż�ȯʹ��ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_catagory_2_id` int(11) default NULL COMMENT '��Ʒ���ͱ��',
  `sellor_id` varchar(50) default NULL COMMENT '��ұ��',
  `goods_name` varchar(50) default NULL COMMENT '��Ʒ����',
  `goods_introduction` text COMMENT '��Ʒ���',
  `goods_remark` text COMMENT '��ע',
  `goods_time_last_update` varchar(20) default NULL COMMENT '��Ʒ����޸�ʱ��',
  `goods_number` int(11) default NULL COMMENT '��Ʒ���',
  `goods_promotion_type` int(11) default NULL COMMENT '����Ʒ�Ƿ��д�������Ҵ������ʲô����',
  `goods_check_status` int(11) default NULL COMMENT '����Ʒ���״̬',
  `goods_on_sale_status` int(11) default NULL COMMENT '��Ʒ�ϼ�״̬',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_1
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_1`;
CREATE TABLE `goods_catagory_1` (
  `id` int(11) NOT NULL COMMENT '��Ʒ����һ�����',
  `goods_catagory1_name` varchar(50) default NULL COMMENT '������',
  `goods_catagory1_remark` text COMMENT '��ע',
  `goods_catagory1_time_last_update` varchar(20) default NULL COMMENT '��Ʒ�������޸�ʱ��',
  `goods_catagory_1_icon` varchar(50) default NULL COMMENT '��Ʒ����ʶͼƬ',
  `admin_id` varchar(50) default NULL COMMENT '����޸Ĺ���Ա���',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_2
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_2`;
CREATE TABLE `goods_catagory_2` (
  `id` int(11) NOT NULL COMMENT '��Ʒ����������',
  `goods_catagory_1` int(11) default NULL COMMENT '��Ʒһ�������ţ������',
  `goods_catagory_2_name` varchar(50) default NULL COMMENT '��Ʒ��������',
  `goods_catagory_2_icon` varchar(50) default NULL COMMENT '��Ʒ����ͼƬ��ʶ',
  `goods_catagory_2_time_last_update` varchar(20) default NULL COMMENT '����޸�ʱ��',
  `admin_id` varchar(50) default NULL COMMENT '����޸Ĺ���Ա���',
  `goods_catagory_2_remark` text COMMENT '��ע',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `goods_order_id` varchar(50) default NULL COMMENT '�������',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `goods_comment_content` text COMMENT '��������',
  `goods_comment_time` varchar(30) default NULL COMMENT '����ʱ��',
  `goods_comment_grade` int(11) default NULL COMMENT '���۵ȼ�������ǣ�',
  `goods_comment_view_status` int(11) default NULL COMMENT '�鿴״̬',
  `goods_comment_anonymous` int(11) default NULL COMMENT '�Ƿ�����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment_image`;
CREATE TABLE `goods_comment_image` (
  `id` int(11) NOT NULL,
  `goods_comment_id` int(11) default NULL COMMENT '���۵�id',
  `goods_comment_image_src` varchar(100) default NULL COMMENT 'ͼƬ·��',
  `goods_comment_time` varchar(30) default NULL COMMENT '�ϴ�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���۱��Ӧ��ͼƬ';

-- ----------------------------
-- Table structure for goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `goods_coupon`;
CREATE TABLE `goods_coupon` (
  `id` int(11) NOT NULL COMMENT '�Ż�ȯ����Ʒ��ϵ���',
  `coupon_sellor_id` int(11) default NULL COMMENT '�Ż�ȯ���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` char(10) default NULL COMMENT '��Ʒ���',
  `goods_detail_inital_price` decimal(10,3) default NULL COMMENT '��Ʒԭ��',
  `goods_detail_now_price` decimal(10,3) default NULL COMMENT '��Ʒ�ּ�',
  `goods_detail_package_sale` text COMMENT '��װ�ۺ�',
  `goods_detail_color` varchar(10) default NULL COMMENT '��Ʒ��ɫ',
  `goods_detail_shipping_costs` decimal(10,3) default NULL COMMENT '�˷�',
  `goods_detail_producttion_place` varchar(100) default NULL COMMENT '����',
  `goods_detail_shelf_life` varchar(20) default NULL COMMENT '������',
  `goods_detail_net_weight` varchar(20) default NULL COMMENT '������',
  `goods_detail_production_date` varchar(20) default NULL COMMENT '��������',
  `goods_detail_remark` text COMMENT '��ע',
  `goods_detail_quantity` varchar(20) default NULL COMMENT '����',
  `goods_detail_units` varchar(20) default NULL COMMENT '��λ',
  `goods_detail_packing` varchar(20) default NULL COMMENT '��װ��ʽ',
  `goods_detail_taste` varchar(20) default NULL COMMENT '��ζ',
  `goods_detail_category` varchar(20) default NULL COMMENT '���',
  `goods_detail_time_last_update` varchar(20) default NULL COMMENT '��Ʒ��������޸�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail_image`;
CREATE TABLE `goods_detail_image` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_detail_id` int(11) default NULL COMMENT '��Ʒ������',
  `goods_detail_image_src` varchar(50) default NULL COMMENT 'ͼƬ·��',
  `goods_detail_image_time` varchar(20) default NULL COMMENT 'ͼƬ�ϴ�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `goods_image_src` varchar(100) default NULL COMMENT 'ͼƬ·��',
  `goods_image_time` varchar(20) default NULL COMMENT 'ͼƬ�ϴ�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `id` varchar(50) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `sellor_id` varchar(50) default NULL,
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `goods_order_amount` int(11) default NULL COMMENT '��Ʒ����',
  `goods_order_unit` varchar(50) default NULL COMMENT '��Ʒ��λ',
  `goods_order_shipping_costs` decimal(10,3) default NULL COMMENT '�˷�',
  `goods_order_price` decimal(10,3) default NULL COMMENT '��Ʒ�ܼ�',
  `user_address_id` int(11) default NULL COMMENT '�ջ��ַ���',
  `goods_order_create_time` varchar(30) default NULL COMMENT '�µ�ʱ��',
  `goods_order_deliver_status` int(11) default NULL COMMENT '����״̬',
  `goods_order_gain_status` int(11) default NULL COMMENT '�ջ�״̬',
  `goods_order_remark` text COMMENT '��ע',
  `goods_order_evaluate_status` int(11) default NULL COMMENT '�Ƿ�����',
  `goods_order_payment_status` int(11) default NULL COMMENT '�Ƿ񸶿�',
  `goods_order_gift_type` int(11) default NULL COMMENT '�Ƿ�����Ʒ',
  `promotion_gifs_id` int(11) default NULL COMMENT '��Ʒ���',
  `promotion_gifs_amount` int(11) default NULL COMMENT '��Ʒ����',
  `promotion_name` varchar(100) default NULL COMMENT '�����������ݣ���Ӧ����offer_promotion_type�е��Żݴ��������ı������',
  `goods_order_pay_way` varchar(50) default NULL COMMENT '֧����ʽ',
  `goods_order_send_way` varchar(50) default NULL COMMENT '�ͻ���ʽ',
  `goods_order_user_use` int(11) default NULL COMMENT '�û��Ƿ񻹱����¼',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_price
-- ----------------------------
DROP TABLE IF EXISTS `goods_price`;
CREATE TABLE `goods_price` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `goods_price_specific` decimal(10,3) default NULL COMMENT '��ʱ������Ʒ�۸�',
  `goods_price_description` text COMMENT '��Ӧ������',
  `goods_price_time` varchar(30) default NULL COMMENT '����޸�ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��Ӧ�ж��ּ۸���ʽ';

-- ----------------------------
-- Table structure for goods_sellor_feedback
-- ----------------------------
DROP TABLE IF EXISTS `goods_sellor_feedback`;
CREATE TABLE `goods_sellor_feedback` (
  `id` int(11) default NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�����û����',
  `sellor_id` varchar(50) default NULL COMMENT '�������̼ұ��',
  `goods_order_id` varchar(50) default NULL COMMENT '�������������',
  `goods_sellor_feedback_content` text COMMENT '��������',
  `goods_sellor_feedback_time` varchar(20) default NULL COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û����̼���Ʒ�ķ���';

-- ----------------------------
-- Table structure for image_explanation
-- ----------------------------
DROP TABLE IF EXISTS `image_explanation`;
CREATE TABLE `image_explanation` (
  `id` int(11) NOT NULL COMMENT '���',
  `image_explanation_object` text COMMENT '˵���Ķ���һ���Ǳ����+�ֶ�����',
  `image_explanation_height` int(11) default NULL COMMENT 'ͼƬ��Ҫ��',
  `image_explanation_size` int(11) default NULL COMMENT 'ͼƬ��СҪ��',
  `image_explanation_width` int(11) default NULL COMMENT 'ͼƬ��Ҫ��',
  `image_explanation_remark` text COMMENT '��ע',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ͼƬ���˵��';

-- ----------------------------
-- Table structure for message_center_assets
-- ----------------------------
DROP TABLE IF EXISTS `message_center_assets`;
CREATE TABLE `message_center_assets` (
  `id` int(11) NOT NULL COMMENT '���',
  `coupon_user_id` varchar(50) default NULL COMMENT '�û��Ż�ȯid',
  `message_center_assets_time_last` int(11) default NULL COMMENT '�Ż�ȯʣ����������',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ҵ��ʲ�';

-- ----------------------------
-- Table structure for message_center_help_sell
-- ----------------------------
DROP TABLE IF EXISTS `message_center_help_sell`;
CREATE TABLE `message_center_help_sell` (
  `id` int(11) NOT NULL COMMENT '���',
  `message_center_server_sell_content` text COMMENT '����',
  `message_center_server_sell_time_last_update` varchar(20) default NULL COMMENT '����޸�ʱ��',
  `admin_id` varchar(50) default NULL COMMENT '����޸Ĺ���Ա���',
  `message_center_server_sell_icon` varchar(50) default NULL COMMENT 'ͼ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ۺ����';

-- ----------------------------
-- Table structure for message_center_server_customer
-- ----------------------------
DROP TABLE IF EXISTS `message_center_server_customer`;
CREATE TABLE `message_center_server_customer` (
  `id` int(11) NOT NULL COMMENT '���',
  `message_center_icon` varchar(100) default NULL COMMENT 'ͼ��',
  `message_center_content` text COMMENT '��Ϣ��������',
  `message_center_time_last_update` varchar(20) default NULL COMMENT '����޸�ʱ��',
  `message_center_admin` varchar(50) default NULL COMMENT '����޸Ĺ���Ա���',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ͷ�';

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL COMMENT '���',
  `news_title` varchar(50) default NULL COMMENT '��Ŀ����',
  `news_introduction` text COMMENT '��Ŀ���',
  `news_time` varchar(50) default NULL COMMENT '��Ŀ����ʱ��',
  `news_time_end` varchar(20) default NULL COMMENT '��Ŀ��ֹʱ��',
  `news_content` text COMMENT '��Ŀ����',
  `news_people` varchar(50) default NULL COMMENT '������',
  `news_phone` varchar(20) default NULL COMMENT '��ϵ�绰',
  `news_image` varchar(50) default NULL COMMENT '��ĿͼƬ��ʶ',
  `news_organization` varchar(50) default NULL COMMENT '������֯or�������',
  `news_check_type` int(11) default NULL COMMENT '���״̬',
  `news_check_person` varchar(50) default NULL COMMENT '�����',
  `news_check_time` varchar(50) default NULL COMMENT '���ʱ��',
  `news_read_number` int(11) default NULL COMMENT '�Ķ���',
  `news_praise` int(11) default NULL COMMENT '������',
  `news_money` decimal(10,3) default NULL COMMENT '�ѳ�Ǯ��',
  `news_money_goal` decimal(10,3) default NULL COMMENT 'Ŀ����',
  `news_money_people_number` int(11) default NULL COMMENT '�Ѿ�����',
  `news_time_last_update` varchar(20) default NULL COMMENT '��Ŀ����޸�ʱ��',
  `admin_id` varchar(50) default NULL COMMENT '��Ŀ����޸Ĺ���Ա���',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL COMMENT '���',
  `news_id` int(11) default NULL COMMENT '������Ŀ���',
  `news_comment_content` text COMMENT '��������',
  `news_comment_time` varchar(20) default NULL COMMENT '����ʱ��',
  `news_comment_user` varchar(50) default NULL COMMENT '�û����',
  `news_comment_tyoe` int(11) default NULL COMMENT '�Ƿ�����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for offer_promotion_discount
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_discount`;
CREATE TABLE `offer_promotion_discount` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `offer_promotion_discount_time_start` varchar(20) default NULL COMMENT '��ʼʱ��',
  `offer_promotion_discount_time_end` varchar(20) default NULL COMMENT '����ʱ��',
  `offer_promotion_discount_time_publish` varchar(20) default NULL COMMENT '����ʱ��',
  `offer_promotion_discount_amount` decimal(10,3) default NULL COMMENT '�ۿ��Ƕ���',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ۿ۴����';

-- ----------------------------
-- Table structure for offer_promotion_fullcutproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullcutproducts`;
CREATE TABLE `offer_promotion_fullcutproducts` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `offer_promotion_fullcutproducts_name` varchar(100) default NULL COMMENT '�Żݴ�������',
  `offer_promotion_fullcutproducts_remark` text COMMENT '�Żݴ�����ע',
  `offer_promotion_fullcutproducts_time_start` varchar(30) default NULL COMMENT '�Żݴ�����ʼʱ��',
  `offer_promotion_fullcutproducts_time_end` varchar(30) default NULL COMMENT '�Żݴ�����ֹʱ��',
  `offer_promotion_fullcutproducts_time_publish` varchar(20) default NULL COMMENT '����ʱ��',
  `offer_promotion_fullcutproducts_money_full` decimal(10,3) default NULL COMMENT '�����',
  `offer_promotion_fullcutproducts_money_reduce` decimal(10,3) default NULL COMMENT '�����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����������Ʒ��';

-- ----------------------------
-- Table structure for offer_promotion_fullsendproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullsendproducts`;
CREATE TABLE `offer_promotion_fullsendproducts` (
  `id` int(11) NOT NULL COMMENT '���',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `offer_promotion_fullsendproducts_time_start` varchar(20) default NULL COMMENT '���ʼʱ��',
  `offer_promotion_fullsendproducts_time_end` varchar(20) default NULL COMMENT '���ֹʱ��',
  `offer_promotion_fullsendproducts_remark` text COMMENT '���ע',
  `offer_promotion_fullsendproducts_time_publish` varchar(20) default NULL COMMENT '����ʱ��',
  `offer_promotion_fullsendproducts_amount` int(11) default NULL COMMENT '��Ʒ����',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����������';

-- ----------------------------
-- Table structure for offer_promotion_type
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_type`;
CREATE TABLE `offer_promotion_type` (
  `id` int(11) default NULL COMMENT '���',
  `offer_promotion_type_table_name` varchar(50) default NULL COMMENT '�Żݴ����������(ʵ�ʵı�����֣�Ӣ����)',
  `offer_promotion_type_table_name_chinese` varchar(50) default NULL COMMENT '�Żݴ������֣����ģ�',
  `offer_promotion_type_remark` varchar(50) default NULL COMMENT '��ע���������ݣ�'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_gifs
-- ----------------------------
DROP TABLE IF EXISTS `promotion_gifs`;
CREATE TABLE `promotion_gifs` (
  `id` int(11) NOT NULL COMMENT '���',
  `offer_promotion_fullsendproducts_id` int(11) default NULL COMMENT '��������',
  `promotion_gifs_name` varchar(50) default NULL COMMENT '��Ʒ����',
  `promotion_gifs_remark` text COMMENT '��Ʒ��ע',
  `promotion_gifs_icon` varchar(50) default NULL COMMENT '��Ʒͼ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ʒ��';

-- ----------------------------
-- Table structure for recommend_catagory
-- ----------------------------
DROP TABLE IF EXISTS `recommend_catagory`;
CREATE TABLE `recommend_catagory` (
  `id` int(11) NOT NULL COMMENT '���',
  `recommend_catagory_image` varchar(50) default NULL COMMENT 'ͼƬ·��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ƽ������Ӧ��ͼƬ';

-- ----------------------------
-- Table structure for sellor
-- ----------------------------
DROP TABLE IF EXISTS `sellor`;
CREATE TABLE `sellor` (
  `id` varchar(50) NOT NULL COMMENT '���',
  `sellor_name` varchar(50) default NULL COMMENT '�û���',
  `sellor_real_name` varchar(50) default NULL COMMENT '��ʵ����',
  `sellor_login_name` varchar(50) default NULL COMMENT '��¼��',
  `sellor_nickname` varchar(50) default NULL COMMENT '�ǳ�',
  `sellor_sex` int(11) default NULL COMMENT '�Ա�',
  `sellor_main` varchar(50) default NULL COMMENT '�����Ӫ��',
  `sellor_address` varchar(50) default NULL COMMENT '��ϵ��ַ',
  `sellor_phone` varchar(20) default NULL COMMENT '�绰',
  `sellor_email` varchar(50) default NULL COMMENT '����',
  `sellor_head_image` varchar(50) default NULL COMMENT '���ͷ��',
  `sellor_store_id` varchar(50) default NULL COMMENT '���̱��',
  `sellor_password` varchar(50) default NULL COMMENT '����',
  `sellor_services_index` int(11) default NULL COMMENT '���̷���ָ��',
  `sellor_evaluation_index` int(11) default NULL COMMENT '��Ʒ����ָ��',
  `sellor_logistic_index` int(11) default NULL COMMENT '�����ٶ�',
  `sellor_qr_code` varchar(50) default NULL COMMENT '���̶�ά��',
  `sellor_introduction` text COMMENT '���̼��',
  `sellor_company` varchar(50) default NULL COMMENT '��˾����',
  `sellor_company_address` varchar(50) default NULL COMMENT '���ڵ���',
  `sellor_store_time` varchar(20) default NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for selloroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `selloroperatelogs`;
CREATE TABLE `selloroperatelogs` (
  `id` int(11) default NULL COMMENT '���',
  `sellor_id` varchar(50) default NULL COMMENT '��ұ��',
  `selloroperatelogs_operattion` text COMMENT '������Ϊ',
  `selloroperatelogs_description` text COMMENT '��������',
  `selloroperatelogs_time` varchar(50) default NULL COMMENT '����ʱ��',
  `selloroperatelogs_ip` varchar(30) default NULL COMMENT 'IP��ַ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����־��';

-- ----------------------------
-- Table structure for service_feedback
-- ----------------------------
DROP TABLE IF EXISTS `service_feedback`;
CREATE TABLE `service_feedback` (
  `id` int(11) NOT NULL COMMENT '���',
  `service_feedback_content` text COMMENT '��������',
  `service_feedback_user` varchar(50) default NULL COMMENT '�û����',
  `service_feedback_time` varchar(20) default NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `shopping_cart_amount` int(11) default NULL COMMENT '����',
  `shopping_cart_time` varchar(20) default NULL COMMENT '���ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL COMMENT '���',
  `user_name` varchar(50) default NULL COMMENT '�û���',
  `user_login_name` varchar(50) default NULL COMMENT '��¼��',
  `user_real_name` varchar(50) default NULL COMMENT '��ʵ����',
  `user_nickname` varchar(50) default NULL COMMENT '�ǳ�',
  `user_home_address` varchar(100) default NULL COMMENT '��ϵ��ַ',
  `user_phone` varchar(20) default NULL COMMENT '��ϵ�绰',
  `user_sex` int(11) default NULL COMMENT '�Ա�',
  `user_password` varchar(50) default NULL COMMENT '����',
  `user_birthday` varchar(50) default NULL COMMENT '��������',
  `user_head_image` varchar(50) default NULL COMMENT 'ͷ��',
  `user_email` varchar(50) default NULL COMMENT '����',
  `user_type` int(11) default NULL COMMENT '��ʦorѧ��',
  `user_number` varchar(50) default NULL COMMENT 'ѧ����',
  `user_college` varchar(50) default NULL COMMENT 'ѧԺ',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for useroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `useroperatelogs`;
CREATE TABLE `useroperatelogs` (
  `id` int(11) default NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `useroperatelogs_operation` text COMMENT '������Ϊ',
  `useroperatelogs_description` text COMMENT '��������',
  `useroperatelogs_ip` varchar(30) default NULL COMMENT 'IP��ַ',
  `useroperatelogs_time` varchar(50) default NULL COMMENT '����ʱ��'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û���־��';

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `user_address_province` varchar(20) default NULL COMMENT 'ʡ��',
  `user_address_city` varchar(20) default NULL COMMENT '��',
  `user_address_county` varchar(20) default NULL COMMENT '��/��',
  `user_address_street` varchar(50) default NULL COMMENT '�ֵ���ַ',
  `user_address_remark` text COMMENT '��ע',
  `user_address_change_time` varchar(20) default NULL COMMENT '�޸�ʱ��',
  `user_address_type` int(11) default NULL COMMENT '�Ƿ�Ĭ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `user_goods_history`;
CREATE TABLE `user_goods_history` (
  `id` int(11) NOT NULL COMMENT '���',
  `user_id` varchar(50) default NULL COMMENT '�û����',
  `goods_id` int(11) default NULL COMMENT '��Ʒ���',
  `user_goods_history_time` varchar(20) default NULL COMMENT '������ʱ��',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for word_explanation
-- ----------------------------
DROP TABLE IF EXISTS `word_explanation`;
CREATE TABLE `word_explanation` (
  `id` int(11) NOT NULL COMMENT '���',
  `word_explanation_object` varchar(50) default NULL COMMENT '˵������һ���Ǳ������ֶ�����',
  `word_explanation_down` int(11) default NULL COMMENT '��������',
  `word_explanation_up` int(11) default NULL COMMENT '��������',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������С���Ʊ�';
