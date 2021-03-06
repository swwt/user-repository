<<<<<<< HEAD
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/16 15:00:08                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists adminoperatelogs;

drop table if exists collection;

drop table if exists coupon_sellor;

drop table if exists coupon_user;

drop table if exists goods;

drop table if exists goods_catagory_1;

drop table if exists goods_catagory_2;

drop table if exists goods_comment;

drop table if exists goods_comment_image;

drop table if exists goods_coupon;

drop table if exists goods_detail;

drop table if exists goods_detail_image;

drop table if exists goods_image;

drop table if exists goods_order;

drop table if exists goods_price;

drop table if exists goods_sellor_feedback;

drop table if exists image_explanation;

drop table if exists message_center_assets;

drop table if exists message_center_help_sell;

drop table if exists message_center_server_customer;

drop table if exists news;

drop table if exists news_comment;

drop table if exists offer_promotion_discount;

drop table if exists offer_promotion_fullcutproducts;

drop table if exists offer_promotion_fullsendproducts;

drop table if exists offer_promotion_type;

drop table if exists promotion_gifs;

drop table if exists recommend_catagory;

drop table if exists sellor;

drop table if exists selloroperatelogs;

drop table if exists service_feedback;

drop table if exists shopping_cart;

drop table if exists user;

drop table if exists user_address;

drop table if exists user_goods_history;

drop table if exists useroperatelogs;

drop table if exists word_explanation;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   varchar(50) not null comment '编号',
   admin_name           varchar(50) comment '用户名',
   admin_real_name      varchar(50) comment '真实名字',
   admin_login_name     varchar(50) comment '登录名',
   admin_password       varchar(50) comment '密码',
   admin_sex            int comment '性别',
   admin_phone          varchar(20) comment '联系电话',
   admin_email          varchar(30) comment '邮箱',
   admin_address        varchar(50) comment '地址',
   admin_degree         int comment '管理员级别',
   admin_time           varchar(20) comment '管理员信息最后修改时间',
   admin_head           varchar(50) comment '头像',
   primary key (id)
);

/*==============================================================*/
/* Table: adminoperatelogs                                      */
/*==============================================================*/
create table adminoperatelogs
(
   id                   int comment '编号',
   admin_id             varchar(50) comment '管理员编号',
   adminoperatelogs_operation text comment '操作行为',
   adminoperatelogs_description text comment '操作描述',
   adminoperatelogs_ip  varchar(30) comment 'IP地址',
   adminoperatelogs_time text comment '操作时间'
);

alter table adminoperatelogs comment '后台管理员操作日志表';

/*==============================================================*/
/* Table: collection                                            */
/*==============================================================*/
create table collection
(
   id                   int not null comment '编号',
   user_id              varchar(50) comment '用户编号',
   sellor_id            varchar(50) comment '店铺编号',
   collection_time      varchar(20) comment '收藏时间',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_sellor                                         */
/*==============================================================*/
create table coupon_sellor
(
   id                   int not null comment '编号',
   sellor_id            varchar(50) comment '卖家编号',
   coupon_sellor_remark text comment '优惠券备注',
   coupon_sellor_time_begin varchar(20) comment '优惠券开始时期',
   coupon_sellor_icon   varchar(50) comment '优惠券标志性图片',
   coupon_sellor_money  decimal(10,3) comment '优惠券面额',
   coupon_sellor_money_expend decimal(10,3) comment '优惠券满多少可用',
   coupon_sellor_number_limit int comment '优惠券领取人数限制',
   coupon_sellor_number_get int comment '优惠券已领人数',
   coupon_sellor_time_end varchar(20) comment '优惠券结束时间',
   coupon_sellor_limit_type int comment '优惠券是否有限制商品（若有限制，再使用goods_coupon表以指定使用商品范围）',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_user                                           */
/*==============================================================*/
create table coupon_user
(
   id                   int not null comment '编号',
   user_id              varchar(50) comment '用户编号',
   coupon_sellor_id     int comment '优惠券编号',
   coupon_user_use_status int comment '是否使用过',
   coupon_user_time_get varchar(20) comment '用户领取优惠券时间',
   coupon_user_time_use varchar(20) comment '用户优惠券使用时间',
   primary key (id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   id                   int not null comment '编号',
   goods_catagory_2_id  int comment '商品类型编号',
   sellor_id            varchar(50) comment '卖家编号',
   goods_name           varchar(50) comment '商品名称',
   goods_introduction   text comment '商品简介',
   goods_remark         text comment '备注',
   goods_time_last_update varchar(20) comment '商品最后修改时间',
   goods_number         int comment '商品库存',
   goods_promotion_type int comment '该商品是否有促销活动，且促销活动是什么类型',
   goods_check_status   int comment '该商品审核状态',
   goods_on_sale_status int comment '商品上架状态',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_1                                      */
/*==============================================================*/
create table goods_catagory_1
(
   id                   int not null comment '商品分类一级编号',
   goods_catagory1_name varchar(50) comment '分类名',
   goods_catagory1_remark text comment '备注',
   goods_catagory1_time_last_update varchar(20) comment '商品类别最后修改时间',
   goods_catagory_1_icon varchar(50) comment '商品类别标识图片',
   admin_id             varchar(50) comment '最后修改管理员编号',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_2                                      */
/*==============================================================*/
create table goods_catagory_2
(
   id                   int not null comment '商品二级分类编号',
   goods_catagory_1     int comment '商品一级分类编号（外键）',
   goods_catagory_2_name varchar(50) comment '商品分类名称',
   goods_catagory_2_icon varchar(50) comment '商品分类图片标识',
   goods_catagory_2_time_last_update varchar(20) comment '最后修改时间',
   admin_id             varchar(50) comment '最后修改管理员编号',
   goods_catagory_2_remark text comment '备注',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment                                         */
/*==============================================================*/
create table goods_comment
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   goods_order_id       varchar(50) comment '订单编号',
   user_id              varchar(50) comment '用户编号',
   goods_comment_content text comment '评价内容',
   goods_comment_time   varchar(30) comment '评价时间',
   goods_comment_grade  int comment '评价等级（五颗星）',
   goods_comment_view_status int comment '查看状态',
   goods_comment_anonymous int comment '是否匿名',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment_image                                   */
/*==============================================================*/
create table goods_comment_image
(
   id                   int not null,
   goods_comment_id     int comment '评价的id',
   goods_comment_image_src varchar(100) comment '图片路径',
   goods_comment_time   varchar(30) comment '上传时间',
   primary key (id)
);

alter table goods_comment_image comment '评价表对应的图片';

/*==============================================================*/
/* Table: goods_coupon                                          */
/*==============================================================*/
create table goods_coupon
(
   id                   int not null comment '优惠券和商品关系编号',
   coupon_sellor_id     int comment '优惠券编号',
   goods_id             int comment '商品编号',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail                                          */
/*==============================================================*/
create table goods_detail
(
   id                   int not null comment '编号',
   goods_id             char(10) comment '商品编号',
   goods_detail_inital_price decimal(10,3) comment '商品原价',
   goods_detail_now_price decimal(10,3) comment '商品现价',
   goods_detail_package_sale text comment '包装售后',
   goods_detail_color   varchar(10) comment '商品颜色',
   goods_detail_shipping_costs decimal(10,3) comment '运费',
   goods_detail_producttion_place varchar(100) comment '产地',
   goods_detail_shelf_life varchar(20) comment '保质期',
   goods_detail_net_weight varchar(20) comment '净含量',
   goods_detail_production_date varchar(20) comment '生产日期',
   goods_detail_remark  text comment '备注',
   goods_detail_quantity varchar(20) comment '数量',
   goods_detail_units   varchar(20) comment '单位',
   goods_detail_packing varchar(20) comment '包装方式',
   goods_detail_taste   varchar(20) comment '口味',
   goods_detail_category varchar(20) comment '类别',
   goods_detail_time_last_update varchar(20) comment '商品详情最后修改时间',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail_image                                    */
/*==============================================================*/
create table goods_detail_image
(
   id                   int not null comment '编号',
   goods_detail_id      int comment '商品详情编号',
   goods_detail_image_src varchar(50) comment '图片路径',
   goods_detail_image_time varchar(20) comment '图片上传时间',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_image                                           */
/*==============================================================*/
create table goods_image
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   goods_image_src      varchar(100) comment '图片路径',
   goods_image_time     varchar(20) comment '图片上传时间',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_order                                           */
/*==============================================================*/
create table goods_order
(
   id                   varchar(50) not null comment '编号',
   goods_id             int comment '商品编号',
   user_id              varchar(50) comment '用户编号',
   goods_order_amount   int comment '商品数量',
   goods_order_unit     varchar(50) comment '商品单位',
   goods_order_shipping_costs decimal(10,3) comment '运费',
   goods_order_price    decimal(10,3) comment '商品总价',
   user_address_id      int comment '收获地址编号',
   goods_order_create_time varchar(30) comment '下单时间',
   goods_order_deliver_status int comment '发货状态',
   goods_order_gain_status int comment '收获状态',
   goods_order_remark   text comment '备注',
   goods_order_evaluate_status int comment '是否评价',
   goods_order_payment_status int comment '是否付款',
   goods_order_gift_type int comment '是否有赠品',
   promotion_gifs_id    int comment '赠品编号',
   promotion_gifs_amount int comment '赠品数量',
   promotion_name       varchar(100) comment '促销类型内容（对应的是offer_promotion_type中的优惠促销的中文表格名）',
   goods_order_pay_way  varchar(50) comment '支付方式',
   goods_order_send_way varchar(50) comment '送货方式',
   goods_order_user_use int comment '用户是否还保留记录',
   goods_order_price_description varchar(50) comment '商品价格对应的描述',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_price                                           */
/*==============================================================*/
create table goods_price
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   goods_price_specific decimal(10,3) comment '此时具体商品价格',
   goods_price_description text comment '对应的描述',
   goods_price_time     varchar(30) comment '最后修改时间',
   primary key (id)
);

alter table goods_price comment '商品对应有多种价格形式';

/*==============================================================*/
/* Table: goods_sellor_feedback                                 */
/*==============================================================*/
create table goods_sellor_feedback
(
   id                   int comment '编号',
   user_id              varchar(50) comment '反馈用户编号',
   sellor_id            varchar(50) comment '被反馈商家编号',
   goods_order_id       varchar(50) comment '被反馈订单编号',
   goods_sellor_feedback_content text comment '反馈内容',
   goods_sellor_feedback_time varchar(20) comment '反馈时间'
);

alter table goods_sellor_feedback comment '用户对商家商品的反馈';

/*==============================================================*/
/* Table: image_explanation                                     */
/*==============================================================*/
create table image_explanation
(
   id                   int not null comment '编号',
   image_explanation_object text comment '说明的对象（一般是表格名+字段名）',
   image_explanation_height int comment '图片高要求',
   image_explanation_size int comment '图片大小要求',
   image_explanation_width int comment '图片宽要求',
   image_explanation_remark text comment '备注',
   primary key (id)
);

alter table image_explanation comment '图片规格说明';

/*==============================================================*/
/* Table: message_center_assets                                 */
/*==============================================================*/
create table message_center_assets
(
   id                   int not null comment '编号',
   coupon_user_id       varchar(50) comment '用户优惠券id',
   message_center_assets_time_last int comment '优惠券剩余多少天过期',
   user_id              varchar(50) comment '用户编号',
   primary key (id)
);

alter table message_center_assets comment '我的资产';

/*==============================================================*/
/* Table: message_center_help_sell                              */
/*==============================================================*/
create table message_center_help_sell
(
   id                   int not null comment '编号',
   message_center_server_sell_content text comment '内容',
   message_center_server_sell_time_last_update varchar(20) comment '最后修改时间',
   admin_id             varchar(50) comment '最后修改管理员编号',
   message_center_server_sell_icon varchar(50) comment '图标',
   primary key (id)
);

alter table message_center_help_sell comment '售后帮助';

/*==============================================================*/
/* Table: message_center_server_customer                        */
/*==============================================================*/
create table message_center_server_customer
(
   id                   int not null comment '编号',
   message_center_icon  varchar(100) comment '图标',
   message_center_content text comment '消息中心内容',
   message_center_time_last_update varchar(20) comment '最后修改时间',
   message_center_admin varchar(50) comment '最后修改管理员编号',
   primary key (id)
);

alter table message_center_server_customer comment '客服';

/*==============================================================*/
/* Table: news                                                  */
/*==============================================================*/
create table news
(
   id                   int not null comment '编号',
   news_title           varchar(50) comment '项目主题',
   news_introduction    text comment '项目简介',
   news_time            varchar(50) comment '项目发起时间',
   news_time_end        varchar(20) comment '项目截止时间',
   news_content         text comment '项目内容',
   news_people          varchar(50) comment '发起人',
   news_phone           varchar(20) comment '联系电话',
   news_image           varchar(50) comment '项目图片标识',
   news_organization    varchar(50) comment '发起组织or所属机构',
   news_check_type      int comment '审核状态',
   news_check_person    varchar(50) comment '审核人',
   news_check_time      varchar(50) comment '审核时间',
   news_read_number     int comment '阅读量',
   news_praise          int comment '赞数量',
   news_money           decimal(10,3) comment '已筹钱数',
   news_money_goal      decimal(10,3) comment '目标金额',
   news_money_people_number int comment '已捐人数',
   news_time_last_update varchar(20) comment '项目最后修改时间',
   admin_id             varchar(50) comment '项目最后修改管理员编号',
   primary key (id)
);

/*==============================================================*/
/* Table: news_comment                                          */
/*==============================================================*/
create table news_comment
(
   id                   int not null comment '编号',
   news_id              int comment '公益项目编号',
   news_comment_content text comment '评价内容',
   news_comment_time    varchar(20) comment '评价时间',
   news_comment_user    varchar(50) comment '用户编号',
   news_comment_tyoe    int comment '是否匿名',
   primary key (id)
);

/*==============================================================*/
/* Table: offer_promotion_discount                              */
/*==============================================================*/
create table offer_promotion_discount
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   offer_promotion_discount_time_start varchar(20) comment '开始时间',
   offer_promotion_discount_time_end varchar(20) comment '结束时间',
   offer_promotion_discount_time_publish varchar(20) comment '发布时间',
   offer_promotion_discount_amount decimal(10,3) comment '折扣是多少',
   primary key (id)
);

alter table offer_promotion_discount comment '折扣促销活动';

/*==============================================================*/
/* Table: offer_promotion_fullcutproducts                       */
/*==============================================================*/
create table offer_promotion_fullcutproducts
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   offer_promotion_fullcutproducts_name varchar(100) comment '优惠促销名称',
   offer_promotion_fullcutproducts_remark text comment '优惠促销备注',
   offer_promotion_fullcutproducts_time_start varchar(30) comment '优惠促销开始时间',
   offer_promotion_fullcutproducts_time_end varchar(30) comment '优惠促销截止时间',
   offer_promotion_fullcutproducts_time_publish varchar(20) comment '发布时间',
   offer_promotion_fullcutproducts_money_full decimal(10,3) comment '满金额',
   offer_promotion_fullcutproducts_money_reduce decimal(10,3) comment '减金额',
   primary key (id)
);

alter table offer_promotion_fullcutproducts comment '满减促销商品表';

/*==============================================================*/
/* Table: offer_promotion_fullsendproducts                      */
/*==============================================================*/
create table offer_promotion_fullsendproducts
(
   id                   int not null comment '编号',
   goods_id             int comment '商品编号',
   offer_promotion_fullsendproducts_time_start varchar(20) comment '活动开始时间',
   offer_promotion_fullsendproducts_time_end varchar(20) comment '活动截止时间',
   offer_promotion_fullsendproducts_remark text comment '活动备注',
   offer_promotion_fullsendproducts_time_publish varchar(20) comment '发布时间',
   offer_promotion_fullsendproducts_amount int comment '赠品数量',
   primary key (id)
);

alter table offer_promotion_fullsendproducts comment '满赠促销活动表';

/*==============================================================*/
/* Table: offer_promotion_type                                  */
/*==============================================================*/
create table offer_promotion_type
(
   id                   int comment '编号',
   offer_promotion_type_table_name varchar(50) comment '优惠促销表格名字(实际的表格名字，英文名)',
   offer_promotion_type_table_name_chinese varchar(50) comment '优惠促销名字（中文）',
   offer_promotion_type_remark varchar(50) comment '备注（详情内容）'
);

/*==============================================================*/
/* Table: promotion_gifs                                        */
/*==============================================================*/
create table promotion_gifs
(
   id                   int not null comment '编号',
   offer_promotion_fullsendproducts_id int comment '满赠活动编号',
   promotion_gifs_name  varchar(50) comment '赠品名称',
   promotion_gifs_remark text comment '赠品备注',
   promotion_gifs_icon  varchar(50) comment '赠品图标',
   primary key (id)
);

alter table promotion_gifs comment '赠品表';

/*==============================================================*/
/* Table: recommend_catagory                                    */
/*==============================================================*/
create table recommend_catagory
(
   id                   int not null comment '编号',
   recommend_catagory_image varchar(50) comment '图片路径',
   primary key (id)
);

alter table recommend_catagory comment '推荐分类对应的图片';

/*==============================================================*/
/* Table: sellor                                                */
/*==============================================================*/
create table sellor
(
   id                   varchar(50) not null comment '编号',
   sellor_name          varchar(50) comment '用户名',
   sellor_real_name     varchar(50) comment '真实姓名',
   sellor_login_name    varchar(50) comment '登录名',
   sellor_nickname      varchar(50) comment '昵称',
   sellor_sex           int comment '性别',
   sellor_main          varchar(50) comment '卖家主营人',
   sellor_address       varchar(50) comment '联系地址',
   sellor_phone         varchar(20) comment '电话',
   sellor_email         varchar(50) comment '邮箱',
   sellor_head_image    varchar(50) comment '卖家头像',
   sellor_store_id      varchar(50) comment '店铺编号',
   sellor_password      varchar(50) comment '密码',
   sellor_services_index int comment '店铺服务指数',
   sellor_evaluation_index int comment '商品评价指数',
   sellor_logistic_index int comment '物流速度',
   sellor_qr_code       varchar(50) comment '店铺二维码',
   sellor_introduction  text comment '店铺简介',
   sellor_company       varchar(50) comment '公司名称',
   sellor_company_address varchar(50) comment '所在地区',
   sellor_store_time    varchar(20) comment '开店时间',
   primary key (id)
);

/*==============================================================*/
/* Table: selloroperatelogs                                     */
/*==============================================================*/
create table selloroperatelogs
(
   id                   int comment '编号',
   sellor_id            varchar(50) comment '卖家编号',
   selloroperatelogs_operattion text comment '操作行为',
   selloroperatelogs_description text comment '操作描述',
   selloroperatelogs_time varchar(50) comment '操作时间',
   selloroperatelogs_ip varchar(30) comment 'IP地址'
);

alter table selloroperatelogs comment '卖家日志表';

/*==============================================================*/
/* Table: service_feedback                                      */
/*==============================================================*/
create table service_feedback
(
   id                   int not null comment '编号',
   service_feedback_content text comment '反馈内容',
   service_feedback_user varchar(50) comment '用户编号',
   service_feedback_time varchar(20) comment '反馈时间',
   primary key (id)
);

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   id                   int not null comment '编号',
   user_id              varchar(50) comment '用户编号',
   goods_id             int comment '商品编号',
   shopping_cart_amount int comment '数量',
   shopping_cart_time   varchar(20) comment '添加时间',
   shopping_cart_price  decimal(10,3) comment '价格',
   shopping_cart_price_description varchar(50) comment '价格描述',
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(50) not null comment '编号',
   user_name            varchar(50) comment '用户名',
   user_login_name      varchar(50) comment '登录名',
   user_real_name       varchar(50) comment '真实姓名',
   user_nickname        varchar(50) comment '昵称',
   user_home_address    varchar(100) comment '联系地址',
   user_phone           varchar(20) comment '联系电话',
   user_sex             int comment '性别',
   user_password        varchar(50) comment '密码',
   user_birthday        varchar(50) comment '出生年月',
   user_head_image      varchar(50) comment '头像',
   user_email           varchar(50) comment '邮箱',
   user_type            int comment '老师or学生',
   user_number          varchar(50) comment '学工号',
   user_college         varchar(50) comment '学院',
   primary key (id)
);

/*==============================================================*/
/* Table: user_address                                          */
/*==============================================================*/
create table user_address
(
   id                   int not null comment '编号',
   user_id              varchar(50) comment '用户编号',
   user_address_province varchar(20) comment '省份',
   user_address_city    varchar(20) comment '市',
   user_address_county  varchar(20) comment '区/县',
   user_address_street  varchar(50) comment '街道地址',
   user_address_remark  text comment '备注',
   user_address_change_time varchar(20) comment '修改时间',
   user_address_type    int comment '是否默认',
   user_address_name    varchar(50) comment '收货人姓名',
   user_address_phone   varchar(50) comment '收货人电话',
   primary key (id)
);

/*==============================================================*/
/* Table: user_goods_history                                    */
/*==============================================================*/
create table user_goods_history
(
   id                   int not null comment '编号',
   user_id              varchar(50) comment '用户编号',
   goods_id             int comment '商品编号',
   user_goods_history_time varchar(20) comment '最近浏览时间',
   primary key (id)
);

/*==============================================================*/
/* Table: useroperatelogs                                       */
/*==============================================================*/
create table useroperatelogs
(
   id                   int comment '编号',
   user_id              varchar(50) comment '用户编号',
   useroperatelogs_operation text comment '操作行为',
   useroperatelogs_description text comment '操作描述',
   useroperatelogs_ip   varchar(30) comment 'IP地址',
   useroperatelogs_time varchar(50) comment '操作时间'
);

alter table useroperatelogs comment '用户日志表';

/*==============================================================*/
/* Table: word_explanation                                      */
/*==============================================================*/
create table word_explanation
(
   id                   int not null comment '编号',
   word_explanation_object varchar(50) comment '说明对象（一般是表名加字段名）',
   word_explanation_down int comment '字数下限',
   word_explanation_up  int comment '字数上限',
   primary key (id)
);

alter table word_explanation comment '字数大小限制表';

=======
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
  `id` varchar(50) NOT NULL COMMENT '锟斤拷锟�',
  `admin_name` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷',
  `admin_real_name` varchar(50) default NULL COMMENT '锟斤拷实锟斤拷锟斤拷',
  `admin_login_name` varchar(50) default NULL COMMENT '锟斤拷录锟斤拷',
  `admin_password` varchar(50) default NULL COMMENT '锟斤拷锟斤拷',
  `admin_sex` int(11) default NULL COMMENT '锟皆憋拷',
  `admin_phone` varchar(20) default NULL COMMENT '锟斤拷系锟界话',
  `admin_email` varchar(30) default NULL COMMENT '锟斤拷锟斤拷',
  `admin_address` varchar(50) default NULL COMMENT '锟斤拷址',
  `admin_degree` int(11) default NULL COMMENT '锟斤拷锟斤拷员锟斤拷锟斤拷',
  `admin_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷员锟斤拷息锟斤拷锟斤拷薷锟绞憋拷锟�',
  `admin_head` varchar(50) default NULL COMMENT '头锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adminoperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `adminoperatelogs`;
CREATE TABLE `adminoperatelogs` (
  `id` int(11) default NULL COMMENT '锟斤拷锟�',
  `admin_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷员锟斤拷锟�',
  `adminoperatelogs_operation` text COMMENT '锟斤拷锟斤拷锟斤拷为',
  `adminoperatelogs_description` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `adminoperatelogs_ip` varchar(30) default NULL COMMENT 'IP锟斤拷址',
  `adminoperatelogs_time` text COMMENT '锟斤拷锟斤拷时锟斤拷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷台锟斤拷锟斤拷员锟斤拷锟斤拷锟斤拷志锟斤拷';

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `sellor_id` varchar(50) default NULL COMMENT '锟斤拷锟教憋拷锟�',
  `collection_time` varchar(20) default NULL COMMENT '锟秸诧拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collection_goods
-- ----------------------------
DROP TABLE IF EXISTS `collection_goods`;
CREATE TABLE `collection_goods` (
  `collection_id` int(11) NOT NULL COMMENT 'collection锟斤拷锟斤拷锟�',
  `goods_id` int(11) NOT NULL COMMENT 'goods锟斤拷锟斤拷锟�',
  PRIMARY KEY  (`collection_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟秸诧拷锟斤拷锟斤拷品锟斤拷远锟侥癸拷锟斤拷锟斤拷系';

-- ----------------------------
-- Table structure for collection_store
-- ----------------------------
DROP TABLE IF EXISTS `collection_store`;
CREATE TABLE `collection_store` (
  `collection_id` int(11) NOT NULL COMMENT '锟秸藏憋拷锟斤拷锟�',
  `sellor_id` int(11) NOT NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  PRIMARY KEY  (`collection_id`,`sellor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟秸藏和碉拷锟教讹拷远锟斤拷锟斤拷锟斤拷';

-- ----------------------------
-- Table structure for coupon_sellor
-- ----------------------------
DROP TABLE IF EXISTS `coupon_sellor`;
CREATE TABLE `coupon_sellor` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `sellor_id` varchar(50) default NULL COMMENT '锟斤拷冶锟斤拷',
  `coupon_sellor_remark` text COMMENT '锟脚伙拷券锟斤拷注',
  `coupon_sellor_time_begin` varchar(20) default NULL COMMENT '锟脚伙拷券锟斤拷始时锟斤拷',
  `coupon_sellor_icon` varchar(50) default NULL COMMENT '锟脚伙拷券锟斤拷志锟斤拷图片',
  `coupon_sellor_money` decimal(10,3) default NULL COMMENT '锟脚伙拷券锟斤拷锟�',
  `coupon_sellor_money_expend` decimal(10,3) default NULL COMMENT '锟脚伙拷券锟斤拷锟斤拷锟劫匡拷锟斤拷',
  `coupon_sellor_number_limit` int(11) default NULL COMMENT '锟脚伙拷券锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷',
  `coupon_sellor_number_get` int(11) default NULL COMMENT '锟脚伙拷券锟斤拷锟斤拷锟斤拷锟斤拷',
  `coupon_sellor_time_end` varchar(20) default NULL COMMENT '锟脚伙拷券锟斤拷锟斤拷时锟斤拷',
  `coupon_sellor_limit_type` int(11) default NULL COMMENT '锟脚伙拷券锟角凤拷锟斤拷锟斤拷锟斤拷锟斤拷品锟斤拷锟斤拷锟斤拷锟斤拷锟狡ｏ拷锟斤拷使锟斤拷goods_coupon锟斤拷锟斤拷指锟斤拷使锟斤拷锟斤拷品锟斤拷围锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `coupon_sellor_id` int(11) default NULL COMMENT '锟脚伙拷券锟斤拷锟�',
  `coupon_user_use_status` int(11) default NULL COMMENT '锟角凤拷使锟矫癸拷',
  `coupon_user_time_get` varchar(20) default NULL COMMENT '锟矫伙拷锟斤拷取锟脚伙拷券时锟斤拷',
  `coupon_user_time_use` varchar(20) default NULL COMMENT '锟矫伙拷锟脚伙拷券使锟斤拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_catagory_2_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟酵憋拷锟�',
  `sellor_id` varchar(50) default NULL COMMENT '锟斤拷冶锟斤拷',
  `goods_name` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷',
  `goods_introduction` text COMMENT '锟斤拷品锟斤拷锟�',
  `goods_remark` text COMMENT '锟斤拷注',
  `goods_time_last_update` varchar(20) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷薷锟绞憋拷锟�',
  `goods_number` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `goods_promotion_type` int(11) default NULL COMMENT '锟斤拷锟斤拷品锟角凤拷锟叫达拷锟斤拷锟筋动锟斤拷锟揭达拷锟斤拷锟筋动锟斤拷什么锟斤拷锟斤拷',
  `goods_check_status` int(11) default NULL COMMENT '锟斤拷锟斤拷品锟斤拷锟阶刺�',
  `goods_on_sale_status` int(11) default NULL COMMENT '锟斤拷品锟较硷拷状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_1
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_1`;
CREATE TABLE `goods_catagory_1` (
  `id` int(11) NOT NULL COMMENT '锟斤拷品锟斤拷锟斤拷一锟斤拷锟斤拷锟�',
  `goods_catagory1_name` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  `goods_catagory1_remark` text COMMENT '锟斤拷注',
  `goods_catagory1_time_last_update` varchar(20) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷锟斤拷锟睫革拷时锟斤拷',
  `goods_catagory_1_icon` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷识图片',
  `admin_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷薷墓锟斤拷锟皆憋拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_2
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_2`;
CREATE TABLE `goods_catagory_2` (
  `id` int(11) NOT NULL COMMENT '锟斤拷品锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷',
  `goods_catagory_1` int(11) default NULL COMMENT '锟斤拷品一锟斤拷锟斤拷锟斤拷锟脚ｏ拷锟斤拷锟斤拷锟�',
  `goods_catagory_2_name` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷锟斤拷锟斤拷',
  `goods_catagory_2_icon` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷图片锟斤拷识',
  `goods_catagory_2_time_last_update` varchar(20) default NULL COMMENT '锟斤拷锟斤拷薷锟绞憋拷锟�',
  `admin_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷薷墓锟斤拷锟皆憋拷锟斤拷',
  `goods_catagory_2_remark` text COMMENT '锟斤拷注',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `goods_order_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `goods_comment_content` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `goods_comment_time` varchar(30) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `goods_comment_grade` int(11) default NULL COMMENT '锟斤拷锟桔等硷拷锟斤拷锟斤拷锟斤拷牵锟�',
  `goods_comment_view_status` int(11) default NULL COMMENT '锟介看状态',
  `goods_comment_anonymous` int(11) default NULL COMMENT '锟角凤拷锟斤拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment_image`;
CREATE TABLE `goods_comment_image` (
  `id` int(11) NOT NULL,
  `goods_comment_id` int(11) default NULL COMMENT '锟斤拷锟桔碉拷id',
  `goods_comment_image_src` varchar(100) default NULL COMMENT '图片路锟斤拷',
  `goods_comment_time` varchar(30) default NULL COMMENT '锟较达拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷锟桔憋拷锟接︼拷锟酵计�';

-- ----------------------------
-- Table structure for goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `goods_coupon`;
CREATE TABLE `goods_coupon` (
  `id` int(11) NOT NULL COMMENT '锟脚伙拷券锟斤拷锟斤拷品锟斤拷系锟斤拷锟�',
  `coupon_sellor_id` int(11) default NULL COMMENT '锟脚伙拷券锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` char(10) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `goods_detail_inital_price` decimal(10,3) default NULL COMMENT '锟斤拷品原锟斤拷',
  `goods_detail_now_price` decimal(10,3) default NULL COMMENT '锟斤拷品锟街硷拷',
  `goods_detail_package_sale` text COMMENT '锟斤拷装锟桔猴拷',
  `goods_detail_color` varchar(10) default NULL COMMENT '锟斤拷品锟斤拷色',
  `goods_detail_shipping_costs` decimal(10,3) default NULL COMMENT '锟剿凤拷',
  `goods_detail_producttion_place` varchar(100) default NULL COMMENT '锟斤拷锟斤拷',
  `goods_detail_shelf_life` varchar(20) default NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  `goods_detail_net_weight` varchar(20) default NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  `goods_detail_production_date` varchar(20) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `goods_detail_remark` text COMMENT '锟斤拷注',
  `goods_detail_quantity` varchar(20) default NULL COMMENT '锟斤拷锟斤拷',
  `goods_detail_units` varchar(20) default NULL COMMENT '锟斤拷位',
  `goods_detail_packing` varchar(20) default NULL COMMENT '锟斤拷装锟斤拷式',
  `goods_detail_taste` varchar(20) default NULL COMMENT '锟斤拷味',
  `goods_detail_category` varchar(20) default NULL COMMENT '锟斤拷锟�',
  `goods_detail_time_last_update` varchar(20) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷锟斤拷锟斤拷薷锟绞憋拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail_image`;
CREATE TABLE `goods_detail_image` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_detail_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷锟斤拷',
  `goods_detail_image_src` varchar(50) default NULL COMMENT '图片路锟斤拷',
  `goods_detail_image_time` varchar(20) default NULL COMMENT '图片锟较达拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `goods_image_src` varchar(100) default NULL COMMENT '图片路锟斤拷',
  `goods_image_time` varchar(20) default NULL COMMENT '图片锟较达拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `id` varchar(50) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `sellor_id` varchar(50) default NULL,
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `goods_order_amount` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷',
  `goods_order_unit` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷位',
  `goods_order_shipping_costs` decimal(10,3) default NULL COMMENT '锟剿凤拷',
  `goods_order_price` decimal(10,3) default NULL COMMENT '锟斤拷品锟杰硷拷',
  `user_address_id` int(11) default NULL COMMENT '锟秸伙拷锟街凤拷锟斤拷',
  `goods_order_create_time` varchar(30) default NULL COMMENT '锟铰碉拷时锟斤拷',
  `goods_order_deliver_status` int(11) default NULL COMMENT '锟斤拷锟斤拷状态',
  `goods_order_gain_status` int(11) default NULL COMMENT '锟秸伙拷状态',
  `goods_order_remark` text COMMENT '锟斤拷注',
  `goods_order_evaluate_status` int(11) default NULL COMMENT '锟角凤拷锟斤拷锟斤拷',
  `goods_order_payment_status` int(11) default NULL COMMENT '锟角否付匡拷',
  `goods_order_gift_type` int(11) default NULL COMMENT '锟角凤拷锟斤拷锟斤拷品',
  `promotion_gifs_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `promotion_gifs_amount` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷',
  `promotion_name` varchar(100) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟捷ｏ拷锟斤拷应锟斤拷锟斤拷offer_promotion_type锟叫碉拷锟脚惠达拷锟斤拷锟斤拷锟斤拷锟侥憋拷锟斤拷锟斤拷锟�',
  `goods_order_pay_way` varchar(50) default NULL COMMENT '支锟斤拷锟斤拷式',
  `goods_order_send_way` varchar(50) default NULL COMMENT '锟酵伙拷锟斤拷式',
  `goods_order_user_use` int(11) default NULL COMMENT '锟矫伙拷锟角否还憋拷锟斤拷锟铰�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_price
-- ----------------------------
DROP TABLE IF EXISTS `goods_price`;
CREATE TABLE `goods_price` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `goods_price_specific` decimal(10,3) default NULL COMMENT '锟斤拷时锟斤拷锟斤拷锟斤拷品锟桔革拷',
  `goods_price_description` text COMMENT '锟斤拷应锟斤拷锟斤拷锟斤拷',
  `goods_price_time` varchar(30) default NULL COMMENT '锟斤拷锟斤拷薷锟绞憋拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷品锟斤拷应锟叫讹拷锟街价革拷锟斤拷式';

-- ----------------------------
-- Table structure for goods_sellor_feedback
-- ----------------------------
DROP TABLE IF EXISTS `goods_sellor_feedback`;
CREATE TABLE `goods_sellor_feedback` (
  `id` int(11) default NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟矫伙拷锟斤拷锟�',
  `sellor_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟教家憋拷锟�',
  `goods_order_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�',
  `goods_sellor_feedback_content` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `goods_sellor_feedback_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟矫伙拷锟斤拷锟教硷拷锟斤拷品锟侥凤拷锟斤拷';

-- ----------------------------
-- Table structure for image_explanation
-- ----------------------------
DROP TABLE IF EXISTS `image_explanation`;
CREATE TABLE `image_explanation` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `image_explanation_object` text COMMENT '说锟斤拷锟侥讹拷锟斤拷一锟斤拷锟角憋拷锟斤拷锟�+锟街讹拷锟斤拷锟斤拷',
  `image_explanation_height` int(11) default NULL COMMENT '图片锟斤拷要锟斤拷',
  `image_explanation_size` int(11) default NULL COMMENT '图片锟斤拷小要锟斤拷',
  `image_explanation_width` int(11) default NULL COMMENT '图片锟斤拷要锟斤拷',
  `image_explanation_remark` text COMMENT '锟斤拷注',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片锟斤拷锟剿碉拷锟�';

-- ----------------------------
-- Table structure for message_center_assets
-- ----------------------------
DROP TABLE IF EXISTS `message_center_assets`;
CREATE TABLE `message_center_assets` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `coupon_user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟脚伙拷券id',
  `message_center_assets_time_last` int(11) default NULL COMMENT '锟脚伙拷券剩锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟揭碉拷锟绞诧拷';

-- ----------------------------
-- Table structure for message_center_help_sell
-- ----------------------------
DROP TABLE IF EXISTS `message_center_help_sell`;
CREATE TABLE `message_center_help_sell` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `message_center_server_sell_content` text COMMENT '锟斤拷锟斤拷',
  `message_center_server_sell_time_last_update` varchar(20) default NULL COMMENT '锟斤拷锟斤拷薷锟绞憋拷锟�',
  `admin_id` varchar(50) default NULL COMMENT '锟斤拷锟斤拷薷墓锟斤拷锟皆憋拷锟斤拷',
  `message_center_server_sell_icon` varchar(50) default NULL COMMENT '图锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟桔猴拷锟斤拷锟�';

-- ----------------------------
-- Table structure for message_center_server_customer
-- ----------------------------
DROP TABLE IF EXISTS `message_center_server_customer`;
CREATE TABLE `message_center_server_customer` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `message_center_icon` varchar(100) default NULL COMMENT '图锟斤拷',
  `message_center_content` text COMMENT '锟斤拷息锟斤拷锟斤拷锟斤拷锟斤拷',
  `message_center_time_last_update` varchar(20) default NULL COMMENT '锟斤拷锟斤拷薷锟绞憋拷锟�',
  `message_center_admin` varchar(50) default NULL COMMENT '锟斤拷锟斤拷薷墓锟斤拷锟皆憋拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟酵凤拷';

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `news_title` varchar(50) default NULL COMMENT '锟斤拷目锟斤拷锟斤拷',
  `news_introduction` text COMMENT '锟斤拷目锟斤拷锟�',
  `news_time` varchar(50) default NULL COMMENT '锟斤拷目锟斤拷锟斤拷时锟斤拷',
  `news_time_end` varchar(20) default NULL COMMENT '锟斤拷目锟斤拷止时锟斤拷',
  `news_content` text COMMENT '锟斤拷目锟斤拷锟斤拷',
  `news_people` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  `news_phone` varchar(20) default NULL COMMENT '锟斤拷系锟界话',
  `news_image` varchar(50) default NULL COMMENT '锟斤拷目图片锟斤拷识',
  `news_organization` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷织or锟斤拷锟斤拷锟斤拷锟�',
  `news_check_type` int(11) default NULL COMMENT '锟斤拷锟阶刺�',
  `news_check_person` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟�',
  `news_check_time` varchar(50) default NULL COMMENT '锟斤拷锟绞憋拷锟�',
  `news_read_number` int(11) default NULL COMMENT '锟侥讹拷锟斤拷',
  `news_praise` int(11) default NULL COMMENT '锟斤拷锟斤拷锟斤拷',
  `news_money` decimal(10,3) default NULL COMMENT '锟窖筹拷钱锟斤拷',
  `news_money_goal` decimal(10,3) default NULL COMMENT '目锟斤拷锟斤拷',
  `news_money_people_number` int(11) default NULL COMMENT '锟窖撅拷锟斤拷锟斤拷',
  `news_time_last_update` varchar(20) default NULL COMMENT '锟斤拷目锟斤拷锟斤拷薷锟绞憋拷锟�',
  `admin_id` varchar(50) default NULL COMMENT '锟斤拷目锟斤拷锟斤拷薷墓锟斤拷锟皆憋拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `news_id` int(11) default NULL COMMENT '锟斤拷锟斤拷锟斤拷目锟斤拷锟�',
  `news_comment_content` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `news_comment_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `news_comment_user` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `news_comment_tyoe` int(11) default NULL COMMENT '锟角凤拷锟斤拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for offer_promotion_discount
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_discount`;
CREATE TABLE `offer_promotion_discount` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `offer_promotion_discount_time_start` varchar(20) default NULL COMMENT '锟斤拷始时锟斤拷',
  `offer_promotion_discount_time_end` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `offer_promotion_discount_time_publish` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `offer_promotion_discount_amount` decimal(10,3) default NULL COMMENT '锟桔匡拷锟角讹拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟桔扣达拷锟斤拷锟筋动';

-- ----------------------------
-- Table structure for offer_promotion_fullcutproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullcutproducts`;
CREATE TABLE `offer_promotion_fullcutproducts` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `offer_promotion_fullcutproducts_name` varchar(100) default NULL COMMENT '锟脚惠达拷锟斤拷锟斤拷锟斤拷',
  `offer_promotion_fullcutproducts_remark` text COMMENT '锟脚惠达拷锟斤拷锟斤拷注',
  `offer_promotion_fullcutproducts_time_start` varchar(30) default NULL COMMENT '锟脚惠达拷锟斤拷锟斤拷始时锟斤拷',
  `offer_promotion_fullcutproducts_time_end` varchar(30) default NULL COMMENT '锟脚惠达拷锟斤拷锟斤拷止时锟斤拷',
  `offer_promotion_fullcutproducts_time_publish` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `offer_promotion_fullcutproducts_money_full` decimal(10,3) default NULL COMMENT '锟斤拷锟斤拷锟�',
  `offer_promotion_fullcutproducts_money_reduce` decimal(10,3) default NULL COMMENT '锟斤拷锟斤拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷品锟斤拷';

-- ----------------------------
-- Table structure for offer_promotion_fullsendproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullsendproducts`;
CREATE TABLE `offer_promotion_fullsendproducts` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `offer_promotion_fullsendproducts_time_start` varchar(20) default NULL COMMENT '锟筋动锟斤拷始时锟斤拷',
  `offer_promotion_fullsendproducts_time_end` varchar(20) default NULL COMMENT '锟筋动锟斤拷止时锟斤拷',
  `offer_promotion_fullsendproducts_remark` text COMMENT '锟筋动锟斤拷注',
  `offer_promotion_fullsendproducts_time_publish` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `offer_promotion_fullsendproducts_amount` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷锟斤拷锟斤拷锟斤拷锟筋动锟斤拷';

-- ----------------------------
-- Table structure for offer_promotion_type
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_type`;
CREATE TABLE `offer_promotion_type` (
  `id` int(11) default NULL COMMENT '锟斤拷锟�',
  `offer_promotion_type_table_name` varchar(50) default NULL COMMENT '锟脚惠达拷锟斤拷锟斤拷锟斤拷锟斤拷锟�(实锟绞的憋拷锟斤拷锟斤拷郑锟接拷锟斤拷锟�)',
  `offer_promotion_type_table_name_chinese` varchar(50) default NULL COMMENT '锟脚惠达拷锟斤拷锟斤拷锟街ｏ拷锟斤拷锟侥ｏ拷',
  `offer_promotion_type_remark` varchar(50) default NULL COMMENT '锟斤拷注锟斤拷锟斤拷锟斤拷锟斤拷锟捷ｏ拷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_gifs
-- ----------------------------
DROP TABLE IF EXISTS `promotion_gifs`;
CREATE TABLE `promotion_gifs` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `offer_promotion_fullsendproducts_id` int(11) default NULL COMMENT '锟斤拷锟斤拷锟筋动锟斤拷锟�',
  `promotion_gifs_name` varchar(50) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷',
  `promotion_gifs_remark` text COMMENT '锟斤拷品锟斤拷注',
  `promotion_gifs_icon` varchar(50) default NULL COMMENT '锟斤拷品图锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷品锟斤拷';

-- ----------------------------
-- Table structure for recommend_catagory
-- ----------------------------
DROP TABLE IF EXISTS `recommend_catagory`;
CREATE TABLE `recommend_catagory` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `recommend_catagory_image` varchar(50) default NULL COMMENT '图片路锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟狡硷拷锟斤拷锟斤拷锟接︼拷锟酵计�';

-- ----------------------------
-- Table structure for sellor
-- ----------------------------
DROP TABLE IF EXISTS `sellor`;
CREATE TABLE `sellor` (
  `id` varchar(50) NOT NULL COMMENT '锟斤拷锟�',
  `sellor_name` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷',
  `sellor_real_name` varchar(50) default NULL COMMENT '锟斤拷实锟斤拷锟斤拷',
  `sellor_login_name` varchar(50) default NULL COMMENT '锟斤拷录锟斤拷',
  `sellor_nickname` varchar(50) default NULL COMMENT '锟角筹拷',
  `sellor_sex` int(11) default NULL COMMENT '锟皆憋拷',
  `sellor_main` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟接拷锟�',
  `sellor_address` varchar(50) default NULL COMMENT '锟斤拷系锟斤拷址',
  `sellor_phone` varchar(20) default NULL COMMENT '锟界话',
  `sellor_email` varchar(50) default NULL COMMENT '锟斤拷锟斤拷',
  `sellor_head_image` varchar(50) default NULL COMMENT '锟斤拷锟酵凤拷锟�',
  `sellor_store_id` varchar(50) default NULL COMMENT '锟斤拷锟教憋拷锟�',
  `sellor_password` varchar(50) default NULL COMMENT '锟斤拷锟斤拷',
  `sellor_services_index` int(11) default NULL COMMENT '锟斤拷锟教凤拷锟斤拷指锟斤拷',
  `sellor_evaluation_index` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟斤拷指锟斤拷',
  `sellor_logistic_index` int(11) default NULL COMMENT '锟斤拷锟斤拷锟劫讹拷',
  `sellor_qr_code` varchar(50) default NULL COMMENT '锟斤拷锟教讹拷维锟斤拷',
  `sellor_introduction` text COMMENT '锟斤拷锟教硷拷锟�',
  `sellor_company` varchar(50) default NULL COMMENT '锟斤拷司锟斤拷锟斤拷',
  `sellor_company_address` varchar(50) default NULL COMMENT '锟斤拷锟节碉拷锟斤拷',
  `sellor_store_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for selloroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `selloroperatelogs`;
CREATE TABLE `selloroperatelogs` (
  `id` int(11) default NULL COMMENT '锟斤拷锟�',
  `sellor_id` varchar(50) default NULL COMMENT '锟斤拷冶锟斤拷',
  `selloroperatelogs_operattion` text COMMENT '锟斤拷锟斤拷锟斤拷为',
  `selloroperatelogs_description` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `selloroperatelogs_time` varchar(50) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  `selloroperatelogs_ip` varchar(30) default NULL COMMENT 'IP锟斤拷址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷锟斤拷锟街撅拷锟�';

-- ----------------------------
-- Table structure for service_feedback
-- ----------------------------
DROP TABLE IF EXISTS `service_feedback`;
CREATE TABLE `service_feedback` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `service_feedback_content` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `service_feedback_user` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `service_feedback_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `shopping_cart_amount` int(11) default NULL COMMENT '锟斤拷锟斤拷',
  `shopping_cart_time` varchar(20) default NULL COMMENT '锟斤拷锟绞憋拷锟�',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL COMMENT '锟斤拷锟�',
  `user_name` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷',
  `user_login_name` varchar(50) default NULL COMMENT '锟斤拷录锟斤拷',
  `user_real_name` varchar(50) default NULL COMMENT '锟斤拷实锟斤拷锟斤拷',
  `user_nickname` varchar(50) default NULL COMMENT '锟角筹拷',
  `user_home_address` varchar(100) default NULL COMMENT '锟斤拷系锟斤拷址',
  `user_phone` varchar(20) default NULL COMMENT '锟斤拷系锟界话',
  `user_sex` int(11) default NULL COMMENT '锟皆憋拷',
  `user_password` varchar(50) default NULL COMMENT '锟斤拷锟斤拷',
  `user_birthday` varchar(50) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `user_head_image` varchar(50) default NULL COMMENT '头锟斤拷',
  `user_email` varchar(50) default NULL COMMENT '锟斤拷锟斤拷',
  `user_type` int(11) default NULL COMMENT '锟斤拷师or学锟斤拷',
  `user_number` varchar(50) default NULL COMMENT '学锟斤拷锟斤拷',
  `user_college` varchar(50) default NULL COMMENT '学院',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for useroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `useroperatelogs`;
CREATE TABLE `useroperatelogs` (
  `id` int(11) default NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `useroperatelogs_operation` text COMMENT '锟斤拷锟斤拷锟斤拷为',
  `useroperatelogs_description` text COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `useroperatelogs_ip` varchar(30) default NULL COMMENT 'IP锟斤拷址',
  `useroperatelogs_time` varchar(50) default NULL COMMENT '锟斤拷锟斤拷时锟斤拷'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟矫伙拷锟斤拷志锟斤拷';

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `user_address_province` varchar(20) default NULL COMMENT '省锟斤拷',
  `user_address_city` varchar(20) default NULL COMMENT '锟斤拷',
  `user_address_county` varchar(20) default NULL COMMENT '锟斤拷/锟斤拷',
  `user_address_street` varchar(50) default NULL COMMENT '锟街碉拷锟斤拷址',
  `user_address_remark` text COMMENT '锟斤拷注',
  `user_address_change_time` varchar(20) default NULL COMMENT '锟睫革拷时锟斤拷',
  `user_address_type` int(11) default NULL COMMENT '锟角凤拷默锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `user_goods_history`;
CREATE TABLE `user_goods_history` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `user_id` varchar(50) default NULL COMMENT '锟矫伙拷锟斤拷锟�',
  `goods_id` int(11) default NULL COMMENT '锟斤拷品锟斤拷锟�',
  `user_goods_history_time` varchar(20) default NULL COMMENT '锟斤拷锟斤拷锟斤拷时锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for word_explanation
-- ----------------------------
DROP TABLE IF EXISTS `word_explanation`;
CREATE TABLE `word_explanation` (
  `id` int(11) NOT NULL COMMENT '锟斤拷锟�',
  `word_explanation_object` varchar(50) default NULL COMMENT '说锟斤拷锟斤拷锟斤拷一锟斤拷锟角憋拷锟斤拷锟斤拷锟街讹拷锟斤拷锟斤拷',
  `word_explanation_down` int(11) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  `word_explanation_up` int(11) default NULL COMMENT '锟斤拷锟斤拷锟斤拷锟斤拷',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='锟斤拷锟斤拷锟斤拷小锟斤拷锟狡憋拷';
>>>>>>> branch 'master' of git@github.com:swwt/user-repository
