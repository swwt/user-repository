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
   id                   varchar(50) not null comment '±àºÅ',
   admin_name           varchar(50) comment 'ÓÃ»§Ãû',
   admin_real_name      varchar(50) comment 'ÕæÊµÃû×Ö',
   admin_login_name     varchar(50) comment 'µÇÂ¼Ãû',
   admin_password       varchar(50) comment 'ÃÜÂë',
   admin_sex            int comment 'ÐÔ±ð',
   admin_phone          varchar(20) comment 'ÁªÏµµç»°',
   admin_email          varchar(30) comment 'ÓÊÏä',
   admin_address        varchar(50) comment 'µØÖ·',
   admin_degree         int comment '¹ÜÀíÔ±¼¶±ð',
   admin_time           varchar(20) comment '¹ÜÀíÔ±ÐÅÏ¢×îºóÐÞ¸ÄÊ±¼ä',
   admin_head           varchar(50) comment 'Í·Ïñ',
   primary key (id)
);

/*==============================================================*/
/* Table: adminoperatelogs                                      */
/*==============================================================*/
create table adminoperatelogs
(
   id                   int comment '±àºÅ',
   admin_id             varchar(50) comment '¹ÜÀíÔ±±àºÅ',
   adminoperatelogs_operation text comment '²Ù×÷ÐÐÎª',
   adminoperatelogs_description text comment '²Ù×÷ÃèÊö',
   adminoperatelogs_ip  varchar(30) comment 'IPµØÖ·',
   adminoperatelogs_time text comment '²Ù×÷Ê±¼ä'
);

alter table adminoperatelogs comment 'ºóÌ¨¹ÜÀíÔ±²Ù×÷ÈÕÖ¾±í';

/*==============================================================*/
/* Table: collection                                            */
/*==============================================================*/
create table collection
(
   id                   int not null comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   sellor_id            varchar(50) comment 'µêÆÌ±àºÅ',
   collection_time      varchar(20) comment 'ÊÕ²ØÊ±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_sellor                                         */
/*==============================================================*/
create table coupon_sellor
(
   id                   int not null comment '±àºÅ',
   sellor_id            varchar(50) comment 'Âô¼Ò±àºÅ',
   coupon_sellor_remark text comment 'ÓÅ»ÝÈ¯±¸×¢',
   coupon_sellor_time_begin varchar(20) comment 'ÓÅ»ÝÈ¯¿ªÊ¼Ê±ÆÚ',
   coupon_sellor_icon   varchar(50) comment 'ÓÅ»ÝÈ¯±êÖ¾ÐÔÍ¼Æ¬',
   coupon_sellor_money  decimal(10,3) comment 'ÓÅ»ÝÈ¯Ãæ¶î',
   coupon_sellor_money_expend decimal(10,3) comment 'ÓÅ»ÝÈ¯Âú¶àÉÙ¿ÉÓÃ',
   coupon_sellor_number_limit int comment 'ÓÅ»ÝÈ¯ÁìÈ¡ÈËÊýÏÞÖÆ',
   coupon_sellor_number_get int comment 'ÓÅ»ÝÈ¯ÒÑÁìÈËÊý',
   coupon_sellor_time_end varchar(20) comment 'ÓÅ»ÝÈ¯½áÊøÊ±¼ä',
   coupon_sellor_limit_type int comment 'ÓÅ»ÝÈ¯ÊÇ·ñÓÐÏÞÖÆÉÌÆ·£¨ÈôÓÐÏÞÖÆ£¬ÔÙÊ¹ÓÃgoods_coupon±íÒÔÖ¸¶¨Ê¹ÓÃÉÌÆ··¶Î§£©',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_user                                           */
/*==============================================================*/
create table coupon_user
(
   id                   int not null comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   coupon_sellor_id     int comment 'ÓÅ»ÝÈ¯±àºÅ',
   coupon_user_use_status int comment 'ÊÇ·ñÊ¹ÓÃ¹ý',
   coupon_user_time_get varchar(20) comment 'ÓÃ»§ÁìÈ¡ÓÅ»ÝÈ¯Ê±¼ä',
   coupon_user_time_use varchar(20) comment 'ÓÃ»§ÓÅ»ÝÈ¯Ê¹ÓÃÊ±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   id                   int not null comment '±àºÅ',
   goods_catagory_2_id  int comment 'ÉÌÆ·ÀàÐÍ±àºÅ',
   sellor_id            varchar(50) comment 'Âô¼Ò±àºÅ',
   goods_name           varchar(50) comment 'ÉÌÆ·Ãû³Æ',
   goods_introduction   text comment 'ÉÌÆ·¼ò½é',
   goods_remark         text comment '±¸×¢',
   goods_time_last_update varchar(20) comment 'ÉÌÆ·×îºóÐÞ¸ÄÊ±¼ä',
   goods_number         int comment 'ÉÌÆ·¿â´æ',
   goods_promotion_type int comment '¸ÃÉÌÆ·ÊÇ·ñÓÐ´ÙÏú»î¶¯£¬ÇÒ´ÙÏú»î¶¯ÊÇÊ²Ã´ÀàÐÍ',
   goods_check_status   int comment '¸ÃÉÌÆ·ÉóºË×´Ì¬',
   goods_on_sale_status int comment 'ÉÌÆ·ÉÏ¼Ü×´Ì¬',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_1                                      */
/*==============================================================*/
create table goods_catagory_1
(
   id                   int not null comment 'ÉÌÆ··ÖÀàÒ»¼¶±àºÅ',
   goods_catagory1_name varchar(50) comment '·ÖÀàÃû',
   goods_catagory1_remark text comment '±¸×¢',
   goods_catagory1_time_last_update varchar(20) comment 'ÉÌÆ·Àà±ð×îºóÐÞ¸ÄÊ±¼ä',
   goods_catagory_1_icon varchar(50) comment 'ÉÌÆ·Àà±ð±êÊ¶Í¼Æ¬',
   admin_id             varchar(50) comment '×îºóÐÞ¸Ä¹ÜÀíÔ±±àºÅ',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_2                                      */
/*==============================================================*/
create table goods_catagory_2
(
   id                   int not null comment 'ÉÌÆ·¶þ¼¶·ÖÀà±àºÅ',
   goods_catagory_1     int comment 'ÉÌÆ·Ò»¼¶·ÖÀà±àºÅ£¨Íâ¼ü£©',
   goods_catagory_2_name varchar(50) comment 'ÉÌÆ··ÖÀàÃû³Æ',
   goods_catagory_2_icon varchar(50) comment 'ÉÌÆ··ÖÀàÍ¼Æ¬±êÊ¶',
   goods_catagory_2_time_last_update varchar(20) comment '×îºóÐÞ¸ÄÊ±¼ä',
   admin_id             varchar(50) comment '×îºóÐÞ¸Ä¹ÜÀíÔ±±àºÅ',
   goods_catagory_2_remark text comment '±¸×¢',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment                                         */
/*==============================================================*/
create table goods_comment
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   goods_order_id       varchar(50) comment '¶©µ¥±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   goods_comment_content text comment 'ÆÀ¼ÛÄÚÈÝ',
   goods_comment_time   varchar(30) comment 'ÆÀ¼ÛÊ±¼ä',
   goods_comment_grade  int comment 'ÆÀ¼ÛµÈ¼¶£¨Îå¿ÅÐÇ£©',
   goods_comment_view_status int comment '²é¿´×´Ì¬',
   goods_comment_anonymous int comment 'ÊÇ·ñÄäÃû',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment_image                                   */
/*==============================================================*/
create table goods_comment_image
(
   id                   int not null,
   goods_comment_id     int comment 'ÆÀ¼ÛµÄid',
   goods_comment_image_src varchar(100) comment 'Í¼Æ¬Â·¾¶',
   goods_comment_time   varchar(30) comment 'ÉÏ´«Ê±¼ä',
   primary key (id)
);

alter table goods_comment_image comment 'ÆÀ¼Û±í¶ÔÓ¦µÄÍ¼Æ¬';

/*==============================================================*/
/* Table: goods_coupon                                          */
/*==============================================================*/
create table goods_coupon
(
   id                   int not null comment 'ÓÅ»ÝÈ¯ºÍÉÌÆ·¹ØÏµ±àºÅ',
   coupon_sellor_id     int comment 'ÓÅ»ÝÈ¯±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail                                          */
/*==============================================================*/
create table goods_detail
(
   id                   int not null comment '±àºÅ',
   goods_id             char(10) comment 'ÉÌÆ·±àºÅ',
   goods_detail_inital_price decimal(10,3) comment 'ÉÌÆ·Ô­¼Û',
   goods_detail_now_price decimal(10,3) comment 'ÉÌÆ·ÏÖ¼Û',
   goods_detail_package_sale text comment '°ü×°ÊÛºó',
   goods_detail_color   varchar(10) comment 'ÉÌÆ·ÑÕÉ«',
   goods_detail_shipping_costs decimal(10,3) comment 'ÔË·Ñ',
   goods_detail_producttion_place varchar(100) comment '²úµØ',
   goods_detail_shelf_life varchar(20) comment '±£ÖÊÆÚ',
   goods_detail_net_weight varchar(20) comment '¾»º¬Á¿',
   goods_detail_production_date varchar(20) comment 'Éú²úÈÕÆÚ',
   goods_detail_remark  text comment '±¸×¢',
   goods_detail_quantity varchar(20) comment 'ÊýÁ¿',
   goods_detail_units   varchar(20) comment 'µ¥Î»',
   goods_detail_packing varchar(20) comment '°ü×°·½Ê½',
   goods_detail_taste   varchar(20) comment '¿ÚÎ¶',
   goods_detail_category varchar(20) comment 'Àà±ð',
   goods_detail_time_last_update varchar(20) comment 'ÉÌÆ·ÏêÇé×îºóÐÞ¸ÄÊ±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail_image                                    */
/*==============================================================*/
create table goods_detail_image
(
   id                   int not null comment '±àºÅ',
   goods_detail_id      int comment 'ÉÌÆ·ÏêÇé±àºÅ',
   goods_detail_image_src varchar(50) comment 'Í¼Æ¬Â·¾¶',
   goods_detail_image_time varchar(20) comment 'Í¼Æ¬ÉÏ´«Ê±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_image                                           */
/*==============================================================*/
create table goods_image
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   goods_image_src      varchar(100) comment 'Í¼Æ¬Â·¾¶',
   goods_image_time     varchar(20) comment 'Í¼Æ¬ÉÏ´«Ê±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_order                                           */
/*==============================================================*/
create table goods_order
(
   id                   varchar(50) not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   goods_order_amount   int comment 'ÉÌÆ·ÊýÁ¿',
   goods_order_unit     varchar(50) comment 'ÉÌÆ·µ¥Î»',
   goods_order_shipping_costs decimal(10,3) comment 'ÔË·Ñ',
   goods_order_price    decimal(10,3) comment 'ÉÌÆ·×Ü¼Û',
   user_address_id      int comment 'ÊÕ»ñµØÖ·±àºÅ',
   goods_order_create_time varchar(30) comment 'ÏÂµ¥Ê±¼ä',
   goods_order_deliver_status int comment '·¢»õ×´Ì¬',
   goods_order_gain_status int comment 'ÊÕ»ñ×´Ì¬',
   goods_order_remark   text comment '±¸×¢',
   goods_order_evaluate_status int comment 'ÊÇ·ñÆÀ¼Û',
   goods_order_payment_status int comment 'ÊÇ·ñ¸¶¿î',
   goods_order_gift_type int comment 'ÊÇ·ñÓÐÔùÆ·',
   promotion_gifs_id    int comment 'ÔùÆ·±àºÅ',
   promotion_gifs_amount int comment 'ÔùÆ·ÊýÁ¿',
   promotion_name       varchar(100) comment '´ÙÏúÀàÐÍÄÚÈÝ£¨¶ÔÓ¦µÄÊÇoffer_promotion_typeÖÐµÄÓÅ»Ý´ÙÏúµÄÖÐÎÄ±í¸ñÃû£©',
   goods_order_pay_way  varchar(50) comment 'Ö§¸¶·½Ê½',
   goods_order_send_way varchar(50) comment 'ËÍ»õ·½Ê½',
   goods_order_user_use int comment 'ÓÃ»§ÊÇ·ñ»¹±£Áô¼ÇÂ¼',
   goods_order_price_description varchar(50) comment 'ÉÌÆ·¼Û¸ñ¶ÔÓ¦µÄÃèÊö',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_price                                           */
/*==============================================================*/
create table goods_price
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   goods_price_specific decimal(10,3) comment '´ËÊ±¾ßÌåÉÌÆ·¼Û¸ñ',
   goods_price_description text comment '¶ÔÓ¦µÄÃèÊö',
   goods_price_time     varchar(30) comment '×îºóÐÞ¸ÄÊ±¼ä',
   primary key (id)
);

alter table goods_price comment 'ÉÌÆ·¶ÔÓ¦ÓÐ¶àÖÖ¼Û¸ñÐÎÊ½';

/*==============================================================*/
/* Table: goods_sellor_feedback                                 */
/*==============================================================*/
create table goods_sellor_feedback
(
   id                   int comment '±àºÅ',
   user_id              varchar(50) comment '·´À¡ÓÃ»§±àºÅ',
   sellor_id            varchar(50) comment '±»·´À¡ÉÌ¼Ò±àºÅ',
   goods_order_id       varchar(50) comment '±»·´À¡¶©µ¥±àºÅ',
   goods_sellor_feedback_content text comment '·´À¡ÄÚÈÝ',
   goods_sellor_feedback_time varchar(20) comment '·´À¡Ê±¼ä'
);

alter table goods_sellor_feedback comment 'ÓÃ»§¶ÔÉÌ¼ÒÉÌÆ·µÄ·´À¡';

/*==============================================================*/
/* Table: image_explanation                                     */
/*==============================================================*/
create table image_explanation
(
   id                   int not null comment '±àºÅ',
   image_explanation_object text comment 'ËµÃ÷µÄ¶ÔÏó£¨Ò»°ãÊÇ±í¸ñÃû+×Ö¶ÎÃû£©',
   image_explanation_height int comment 'Í¼Æ¬¸ßÒªÇó',
   image_explanation_size int comment 'Í¼Æ¬´óÐ¡ÒªÇó',
   image_explanation_width int comment 'Í¼Æ¬¿íÒªÇó',
   image_explanation_remark text comment '±¸×¢',
   primary key (id)
);

alter table image_explanation comment 'Í¼Æ¬¹æ¸ñËµÃ÷';

/*==============================================================*/
/* Table: message_center_assets                                 */
/*==============================================================*/
create table message_center_assets
(
   id                   int not null comment '±àºÅ',
   coupon_user_id       varchar(50) comment 'ÓÃ»§ÓÅ»ÝÈ¯id',
   message_center_assets_time_last int comment 'ÓÅ»ÝÈ¯Ê£Óà¶àÉÙÌì¹ýÆÚ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   primary key (id)
);

alter table message_center_assets comment 'ÎÒµÄ×Ê²ú';

/*==============================================================*/
/* Table: message_center_help_sell                              */
/*==============================================================*/
create table message_center_help_sell
(
   id                   int not null comment '±àºÅ',
   message_center_server_sell_content text comment 'ÄÚÈÝ',
   message_center_server_sell_time_last_update varchar(20) comment '×îºóÐÞ¸ÄÊ±¼ä',
   admin_id             varchar(50) comment '×îºóÐÞ¸Ä¹ÜÀíÔ±±àºÅ',
   message_center_server_sell_icon varchar(50) comment 'Í¼±ê',
   primary key (id)
);

alter table message_center_help_sell comment 'ÊÛºó°ïÖú';

/*==============================================================*/
/* Table: message_center_server_customer                        */
/*==============================================================*/
create table message_center_server_customer
(
   id                   int not null comment '±àºÅ',
   message_center_icon  varchar(100) comment 'Í¼±ê',
   message_center_content text comment 'ÏûÏ¢ÖÐÐÄÄÚÈÝ',
   message_center_time_last_update varchar(20) comment '×îºóÐÞ¸ÄÊ±¼ä',
   message_center_admin varchar(50) comment '×îºóÐÞ¸Ä¹ÜÀíÔ±±àºÅ',
   primary key (id)
);

alter table message_center_server_customer comment '¿Í·þ';

/*==============================================================*/
/* Table: news                                                  */
/*==============================================================*/
create table news
(
   id                   int not null comment '±àºÅ',
   news_title           varchar(50) comment 'ÏîÄ¿Ö÷Ìâ',
   news_introduction    text comment 'ÏîÄ¿¼ò½é',
   news_time            varchar(50) comment 'ÏîÄ¿·¢ÆðÊ±¼ä',
   news_time_end        varchar(20) comment 'ÏîÄ¿½ØÖ¹Ê±¼ä',
   news_content         text comment 'ÏîÄ¿ÄÚÈÝ',
   news_people          varchar(50) comment '·¢ÆðÈË',
   news_phone           varchar(20) comment 'ÁªÏµµç»°',
   news_image           varchar(50) comment 'ÏîÄ¿Í¼Æ¬±êÊ¶',
   news_organization    varchar(50) comment '·¢Æð×éÖ¯orËùÊô»ú¹¹',
   news_check_type      int comment 'ÉóºË×´Ì¬',
   news_check_person    varchar(50) comment 'ÉóºËÈË',
   news_check_time      varchar(50) comment 'ÉóºËÊ±¼ä',
   news_read_number     int comment 'ÔÄ¶ÁÁ¿',
   news_praise          int comment 'ÔÞÊýÁ¿',
   news_money           decimal(10,3) comment 'ÒÑ³ïÇ®Êý',
   news_money_goal      decimal(10,3) comment 'Ä¿±ê½ð¶î',
   news_money_people_number int comment 'ÒÑ¾èÈËÊý',
   news_time_last_update varchar(20) comment 'ÏîÄ¿×îºóÐÞ¸ÄÊ±¼ä',
   admin_id             varchar(50) comment 'ÏîÄ¿×îºóÐÞ¸Ä¹ÜÀíÔ±±àºÅ',
   primary key (id)
);

/*==============================================================*/
/* Table: news_comment                                          */
/*==============================================================*/
create table news_comment
(
   id                   int not null comment '±àºÅ',
   news_id              int comment '¹«ÒæÏîÄ¿±àºÅ',
   news_comment_content text comment 'ÆÀ¼ÛÄÚÈÝ',
   news_comment_time    varchar(20) comment 'ÆÀ¼ÛÊ±¼ä',
   news_comment_user    varchar(50) comment 'ÓÃ»§±àºÅ',
   news_comment_tyoe    int comment 'ÊÇ·ñÄäÃû',
   primary key (id)
);

/*==============================================================*/
/* Table: offer_promotion_discount                              */
/*==============================================================*/
create table offer_promotion_discount
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   offer_promotion_discount_time_start varchar(20) comment '¿ªÊ¼Ê±¼ä',
   offer_promotion_discount_time_end varchar(20) comment '½áÊøÊ±¼ä',
   offer_promotion_discount_time_publish varchar(20) comment '·¢²¼Ê±¼ä',
   offer_promotion_discount_amount decimal(10,3) comment 'ÕÛ¿ÛÊÇ¶àÉÙ',
   primary key (id)
);

alter table offer_promotion_discount comment 'ÕÛ¿Û´ÙÏú»î¶¯';

/*==============================================================*/
/* Table: offer_promotion_fullcutproducts                       */
/*==============================================================*/
create table offer_promotion_fullcutproducts
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   offer_promotion_fullcutproducts_name varchar(100) comment 'ÓÅ»Ý´ÙÏúÃû³Æ',
   offer_promotion_fullcutproducts_remark text comment 'ÓÅ»Ý´ÙÏú±¸×¢',
   offer_promotion_fullcutproducts_time_start varchar(30) comment 'ÓÅ»Ý´ÙÏú¿ªÊ¼Ê±¼ä',
   offer_promotion_fullcutproducts_time_end varchar(30) comment 'ÓÅ»Ý´ÙÏú½ØÖ¹Ê±¼ä',
   offer_promotion_fullcutproducts_time_publish varchar(20) comment '·¢²¼Ê±¼ä',
   offer_promotion_fullcutproducts_money_full decimal(10,3) comment 'Âú½ð¶î',
   offer_promotion_fullcutproducts_money_reduce decimal(10,3) comment '¼õ½ð¶î',
   primary key (id)
);

alter table offer_promotion_fullcutproducts comment 'Âú¼õ´ÙÏúÉÌÆ·±í';

/*==============================================================*/
/* Table: offer_promotion_fullsendproducts                      */
/*==============================================================*/
create table offer_promotion_fullsendproducts
(
   id                   int not null comment '±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   offer_promotion_fullsendproducts_time_start varchar(20) comment '»î¶¯¿ªÊ¼Ê±¼ä',
   offer_promotion_fullsendproducts_time_end varchar(20) comment '»î¶¯½ØÖ¹Ê±¼ä',
   offer_promotion_fullsendproducts_remark text comment '»î¶¯±¸×¢',
   offer_promotion_fullsendproducts_time_publish varchar(20) comment '·¢²¼Ê±¼ä',
   offer_promotion_fullsendproducts_amount int comment 'ÔùÆ·ÊýÁ¿',
   primary key (id)
);

alter table offer_promotion_fullsendproducts comment 'ÂúÔù´ÙÏú»î¶¯±í';

/*==============================================================*/
/* Table: offer_promotion_type                                  */
/*==============================================================*/
create table offer_promotion_type
(
   id                   int comment '±àºÅ',
   offer_promotion_type_table_name varchar(50) comment 'ÓÅ»Ý´ÙÏú±í¸ñÃû×Ö(Êµ¼ÊµÄ±í¸ñÃû×Ö£¬Ó¢ÎÄÃû)',
   offer_promotion_type_table_name_chinese varchar(50) comment 'ÓÅ»Ý´ÙÏúÃû×Ö£¨ÖÐÎÄ£©',
   offer_promotion_type_remark varchar(50) comment '±¸×¢£¨ÏêÇéÄÚÈÝ£©'
);

/*==============================================================*/
/* Table: promotion_gifs                                        */
/*==============================================================*/
create table promotion_gifs
(
   id                   int not null comment '±àºÅ',
   offer_promotion_fullsendproducts_id int comment 'ÂúÔù»î¶¯±àºÅ',
   promotion_gifs_name  varchar(50) comment 'ÔùÆ·Ãû³Æ',
   promotion_gifs_remark text comment 'ÔùÆ·±¸×¢',
   promotion_gifs_icon  varchar(50) comment 'ÔùÆ·Í¼±ê',
   primary key (id)
);

alter table promotion_gifs comment 'ÔùÆ·±í';

/*==============================================================*/
/* Table: recommend_catagory                                    */
/*==============================================================*/
create table recommend_catagory
(
   id                   int not null comment '±àºÅ',
   recommend_catagory_image varchar(50) comment 'Í¼Æ¬Â·¾¶',
   primary key (id)
);

alter table recommend_catagory comment 'ÍÆ¼ö·ÖÀà¶ÔÓ¦µÄÍ¼Æ¬';

/*==============================================================*/
/* Table: sellor                                                */
/*==============================================================*/
create table sellor
(
   id                   varchar(50) not null comment '±àºÅ',
   sellor_name          varchar(50) comment 'ÓÃ»§Ãû',
   sellor_real_name     varchar(50) comment 'ÕæÊµÐÕÃû',
   sellor_login_name    varchar(50) comment 'µÇÂ¼Ãû',
   sellor_nickname      varchar(50) comment 'êÇ³Æ',
   sellor_sex           int comment 'ÐÔ±ð',
   sellor_main          varchar(50) comment 'Âô¼ÒÖ÷ÓªÈË',
   sellor_address       varchar(50) comment 'ÁªÏµµØÖ·',
   sellor_phone         varchar(20) comment 'µç»°',
   sellor_email         varchar(50) comment 'ÓÊÏä',
   sellor_head_image    varchar(50) comment 'Âô¼ÒÍ·Ïñ',
   sellor_store_id      varchar(50) comment 'µêÆÌ±àºÅ',
   sellor_password      varchar(50) comment 'ÃÜÂë',
   sellor_services_index int comment 'µêÆÌ·þÎñÖ¸Êý',
   sellor_evaluation_index int comment 'ÉÌÆ·ÆÀ¼ÛÖ¸Êý',
   sellor_logistic_index int comment 'ÎïÁ÷ËÙ¶È',
   sellor_qr_code       varchar(50) comment 'µêÆÌ¶þÎ¬Âë',
   sellor_introduction  text comment 'µêÆÌ¼ò½é',
   sellor_company       varchar(50) comment '¹«Ë¾Ãû³Æ',
   sellor_company_address varchar(50) comment 'ËùÔÚµØÇø',
   sellor_store_time    varchar(20) comment '¿ªµêÊ±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: selloroperatelogs                                     */
/*==============================================================*/
create table selloroperatelogs
(
   id                   int comment '±àºÅ',
   sellor_id            varchar(50) comment 'Âô¼Ò±àºÅ',
   selloroperatelogs_operattion text comment '²Ù×÷ÐÐÎª',
   selloroperatelogs_description text comment '²Ù×÷ÃèÊö',
   selloroperatelogs_time varchar(50) comment '²Ù×÷Ê±¼ä',
   selloroperatelogs_ip varchar(30) comment 'IPµØÖ·'
);

alter table selloroperatelogs comment 'Âô¼ÒÈÕÖ¾±í';

/*==============================================================*/
/* Table: service_feedback                                      */
/*==============================================================*/
create table service_feedback
(
   id                   int not null comment '±àºÅ',
   service_feedback_content text comment '·´À¡ÄÚÈÝ',
   service_feedback_user varchar(50) comment 'ÓÃ»§±àºÅ',
   service_feedback_time varchar(20) comment '·´À¡Ê±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   id                   int not null comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   shopping_cart_amount int comment 'ÊýÁ¿',
   shopping_cart_time   varchar(20) comment 'Ìí¼ÓÊ±¼ä',
   shopping_cart_price  decimal(10,3) comment '¼Û¸ñ',
   shopping_cart_price_description varchar(50) comment '¼Û¸ñÃèÊö',
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(50) not null comment '±àºÅ',
   user_name            varchar(50) comment 'ÓÃ»§Ãû',
   user_login_name      varchar(50) comment 'µÇÂ¼Ãû',
   user_real_name       varchar(50) comment 'ÕæÊµÐÕÃû',
   user_nickname        varchar(50) comment 'êÇ³Æ',
   user_home_address    varchar(100) comment 'ÁªÏµµØÖ·',
   user_phone           varchar(20) comment 'ÁªÏµµç»°',
   user_sex             int comment 'ÐÔ±ð',
   user_password        varchar(50) comment 'ÃÜÂë',
   user_birthday        varchar(50) comment '³öÉúÄêÔÂ',
   user_head_image      varchar(50) comment 'Í·Ïñ',
   user_email           varchar(50) comment 'ÓÊÏä',
   user_type            int comment 'ÀÏÊ¦orÑ§Éú',
   user_number          varchar(50) comment 'Ñ§¹¤ºÅ',
   user_college         varchar(50) comment 'Ñ§Ôº',
   primary key (id)
);

/*==============================================================*/
/* Table: user_address                                          */
/*==============================================================*/
create table user_address
(
   id                   int not null comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   user_address_province varchar(20) comment 'Ê¡·Ý',
   user_address_city    varchar(20) comment 'ÊÐ',
   user_address_county  varchar(20) comment 'Çø/ÏØ',
   user_address_street  varchar(50) comment '½ÖµÀµØÖ·',
   user_address_remark  text comment '±¸×¢',
   user_address_change_time varchar(20) comment 'ÐÞ¸ÄÊ±¼ä',
   user_address_type    int comment 'ÊÇ·ñÄ¬ÈÏ',
   user_address_name    varchar(50) comment 'ÊÕ»õÈËÐÕÃû',
   user_address_phone   varchar(50) comment 'ÊÕ»õÈËµç»°',
   primary key (id)
);

/*==============================================================*/
/* Table: user_goods_history                                    */
/*==============================================================*/
create table user_goods_history
(
   id                   int not null comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   goods_id             int comment 'ÉÌÆ·±àºÅ',
   user_goods_history_time varchar(20) comment '×î½üä¯ÀÀÊ±¼ä',
   primary key (id)
);

/*==============================================================*/
/* Table: useroperatelogs                                       */
/*==============================================================*/
create table useroperatelogs
(
   id                   int comment '±àºÅ',
   user_id              varchar(50) comment 'ÓÃ»§±àºÅ',
   useroperatelogs_operation text comment '²Ù×÷ÐÐÎª',
   useroperatelogs_description text comment '²Ù×÷ÃèÊö',
   useroperatelogs_ip   varchar(30) comment 'IPµØÖ·',
   useroperatelogs_time varchar(50) comment '²Ù×÷Ê±¼ä'
);

alter table useroperatelogs comment 'ÓÃ»§ÈÕÖ¾±í';

/*==============================================================*/
/* Table: word_explanation                                      */
/*==============================================================*/
create table word_explanation
(
   id                   int not null comment '±àºÅ',
   word_explanation_object varchar(50) comment 'ËµÃ÷¶ÔÏó£¨Ò»°ãÊÇ±íÃû¼Ó×Ö¶ÎÃû£©',
   word_explanation_down int comment '×ÖÊýÏÂÏÞ',
   word_explanation_up  int comment '×ÖÊýÉÏÏÞ',
   primary key (id)
);

alter table word_explanation comment '×ÖÊý´óÐ¡ÏÞÖÆ±í';

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
  `id` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `admin_name` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½',
  `admin_real_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Êµï¿½ï¿½ï¿½ï¿½',
  `admin_login_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Â¼ï¿½ï¿½',
  `admin_password` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `admin_sex` int(11) default NULL COMMENT 'ï¿½Ô±ï¿½',
  `admin_phone` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ïµï¿½ç»°',
  `admin_email` varchar(30) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `admin_address` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ö·',
  `admin_degree` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½ï¿½',
  `admin_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `admin_head` varchar(50) default NULL COMMENT 'Í·ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for adminoperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `adminoperatelogs`;
CREATE TABLE `adminoperatelogs` (
  `id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `admin_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  `adminoperatelogs_operation` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îª',
  `adminoperatelogs_description` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `adminoperatelogs_ip` varchar(30) default NULL COMMENT 'IPï¿½ï¿½Ö·',
  `adminoperatelogs_time` text COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½Ì¨ï¿½ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¾ï¿½ï¿½';

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Ì±ï¿½ï¿½',
  `collection_time` varchar(20) default NULL COMMENT 'ï¿½Õ²ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collection_goods
-- ----------------------------
DROP TABLE IF EXISTS `collection_goods`;
CREATE TABLE `collection_goods` (
  `collection_id` int(11) NOT NULL COMMENT 'collectionï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_id` int(11) NOT NULL COMMENT 'goodsï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`collection_id`,`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Õ²ï¿½ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½Ô¶ï¿½Ä¹ï¿½ï¿½ï¿½ï¿½ï¿½Ïµ';

-- ----------------------------
-- Table structure for collection_store
-- ----------------------------
DROP TABLE IF EXISTS `collection_store`;
CREATE TABLE `collection_store` (
  `collection_id` int(11) NOT NULL COMMENT 'ï¿½Õ²Ø±ï¿½ï¿½ï¿½ï¿½',
  `sellor_id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`collection_id`,`sellor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Õ²ØºÍµï¿½ï¿½Ì¶ï¿½Ô¶ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½';

-- ----------------------------
-- Table structure for coupon_sellor
-- ----------------------------
DROP TABLE IF EXISTS `coupon_sellor`;
CREATE TABLE `coupon_sellor` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ò±ï¿½ï¿½',
  `coupon_sellor_remark` text COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½×¢',
  `coupon_sellor_time_begin` varchar(20) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
  `coupon_sellor_icon` varchar(50) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½Ö¾ï¿½ï¿½Í¼Æ¬',
  `coupon_sellor_money` decimal(10,3) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½',
  `coupon_sellor_money_expend` decimal(10,3) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½ï¿½ï¿½Ù¿ï¿½ï¿½ï¿½',
  `coupon_sellor_number_limit` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½È¡ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `coupon_sellor_number_get` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `coupon_sellor_time_end` varchar(20) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `coupon_sellor_limit_type` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ£ï¿½ï¿½ï¿½Ê¹ï¿½ï¿½goods_couponï¿½ï¿½ï¿½ï¿½Ö¸ï¿½ï¿½Ê¹ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½Î§ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `coupon_user`;
CREATE TABLE `coupon_user` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `coupon_sellor_id` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½',
  `coupon_user_use_status` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½Ê¹ï¿½Ã¹ï¿½',
  `coupon_user_time_get` varchar(20) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½È¡ï¿½Å»ï¿½È¯Ê±ï¿½ï¿½',
  `coupon_user_time_use` varchar(20) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½Å»ï¿½È¯Ê¹ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_catagory_2_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½Í±ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ò±ï¿½ï¿½',
  `goods_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½',
  `goods_introduction` text COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_remark` text COMMENT 'ï¿½ï¿½×¢',
  `goods_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `goods_number` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_promotion_type` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Æ·ï¿½Ç·ï¿½ï¿½Ð´ï¿½ï¿½ï¿½ï¿½î¶¯ï¿½ï¿½ï¿½Ò´ï¿½ï¿½ï¿½ï¿½î¶¯ï¿½ï¿½Ê²Ã´ï¿½ï¿½ï¿½ï¿½',
  `goods_check_status` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½ï¿½×´Ì¬',
  `goods_on_sale_status` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½Ï¼ï¿½×´Ì¬',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_1
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_1`;
CREATE TABLE `goods_catagory_1` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½Ò»ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_catagory1_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_catagory1_remark` text COMMENT 'ï¿½ï¿½×¢',
  `goods_catagory1_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `goods_catagory_1_icon` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½Ê¶Í¼Æ¬',
  `admin_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸Ä¹ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_catagory_2
-- ----------------------------
DROP TABLE IF EXISTS `goods_catagory_2`;
CREATE TABLE `goods_catagory_2` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_catagory_1` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·Ò»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Å£ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_catagory_2_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_catagory_2_icon` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½Í¼Æ¬ï¿½ï¿½Ê¶',
  `goods_catagory_2_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `admin_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸Ä¹ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  `goods_catagory_2_remark` text COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment`;
CREATE TABLE `goods_comment` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_order_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `goods_comment_content` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_comment_time` varchar(30) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `goods_comment_grade` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ÛµÈ¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ç£ï¿½',
  `goods_comment_view_status` int(11) default NULL COMMENT 'ï¿½é¿´×´Ì¬',
  `goods_comment_anonymous` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_comment_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_comment_image`;
CREATE TABLE `goods_comment_image` (
  `id` int(11) NOT NULL,
  `goods_comment_id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½Ûµï¿½id',
  `goods_comment_image_src` varchar(100) default NULL COMMENT 'Í¼Æ¬Â·ï¿½ï¿½',
  `goods_comment_time` varchar(30) default NULL COMMENT 'ï¿½Ï´ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½Û±ï¿½ï¿½Ó¦ï¿½ï¿½Í¼Æ¬';

-- ----------------------------
-- Table structure for goods_coupon
-- ----------------------------
DROP TABLE IF EXISTS `goods_coupon`;
CREATE TABLE `goods_coupon` (
  `id` int(11) NOT NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½Ïµï¿½ï¿½ï¿½',
  `coupon_sellor_id` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` char(10) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_detail_inital_price` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½Æ·Ô­ï¿½ï¿½',
  `goods_detail_now_price` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½Ö¼ï¿½',
  `goods_detail_package_sale` text COMMENT 'ï¿½ï¿½×°ï¿½Ûºï¿½',
  `goods_detail_color` varchar(10) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½É«',
  `goods_detail_shipping_costs` decimal(10,3) default NULL COMMENT 'ï¿½Ë·ï¿½',
  `goods_detail_producttion_place` varchar(100) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_shelf_life` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_net_weight` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_production_date` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_remark` text COMMENT 'ï¿½ï¿½×¢',
  `goods_detail_quantity` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_units` varchar(20) default NULL COMMENT 'ï¿½ï¿½Î»',
  `goods_detail_packing` varchar(20) default NULL COMMENT 'ï¿½ï¿½×°ï¿½ï¿½Ê½',
  `goods_detail_taste` varchar(20) default NULL COMMENT 'ï¿½ï¿½Î¶',
  `goods_detail_category` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_detail_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_detail_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail_image`;
CREATE TABLE `goods_detail_image` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_detail_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_detail_image_src` varchar(50) default NULL COMMENT 'Í¼Æ¬Â·ï¿½ï¿½',
  `goods_detail_image_time` varchar(20) default NULL COMMENT 'Í¼Æ¬ï¿½Ï´ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_image
-- ----------------------------
DROP TABLE IF EXISTS `goods_image`;
CREATE TABLE `goods_image` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_image_src` varchar(100) default NULL COMMENT 'Í¼Æ¬Â·ï¿½ï¿½',
  `goods_image_time` varchar(20) default NULL COMMENT 'Í¼Æ¬ï¿½Ï´ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `id` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL,
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `goods_order_amount` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½',
  `goods_order_unit` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½Î»',
  `goods_order_shipping_costs` decimal(10,3) default NULL COMMENT 'ï¿½Ë·ï¿½',
  `goods_order_price` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½Ü¼ï¿½',
  `user_address_id` int(11) default NULL COMMENT 'ï¿½Õ»ï¿½ï¿½Ö·ï¿½ï¿½ï¿½',
  `goods_order_create_time` varchar(30) default NULL COMMENT 'ï¿½Âµï¿½Ê±ï¿½ï¿½',
  `goods_order_deliver_status` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½×´Ì¬',
  `goods_order_gain_status` int(11) default NULL COMMENT 'ï¿½Õ»ï¿½×´Ì¬',
  `goods_order_remark` text COMMENT 'ï¿½ï¿½×¢',
  `goods_order_evaluate_status` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_order_payment_status` int(11) default NULL COMMENT 'ï¿½Ç·ñ¸¶¿ï¿½',
  `goods_order_gift_type` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½Æ·',
  `promotion_gifs_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `promotion_gifs_amount` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½',
  `promotion_name` varchar(100) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý£ï¿½ï¿½ï¿½Ó¦ï¿½ï¿½ï¿½ï¿½offer_promotion_typeï¿½Ðµï¿½ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_order_pay_way` varchar(50) default NULL COMMENT 'Ö§ï¿½ï¿½ï¿½ï¿½Ê½',
  `goods_order_send_way` varchar(50) default NULL COMMENT 'ï¿½Í»ï¿½ï¿½ï¿½Ê½',
  `goods_order_user_use` int(11) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½Ç·ñ»¹±ï¿½ï¿½ï¿½ï¿½Â¼',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods_price
-- ----------------------------
DROP TABLE IF EXISTS `goods_price`;
CREATE TABLE `goods_price` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `goods_price_specific` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½Ê±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·ï¿½Û¸ï¿½',
  `goods_price_description` text COMMENT 'ï¿½ï¿½Ó¦ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_price_time` varchar(30) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½Æ·ï¿½ï¿½Ó¦ï¿½Ð¶ï¿½ï¿½Ö¼Û¸ï¿½ï¿½ï¿½Ê½';

-- ----------------------------
-- Table structure for goods_sellor_feedback
-- ----------------------------
DROP TABLE IF EXISTS `goods_sellor_feedback`;
CREATE TABLE `goods_sellor_feedback` (
  `id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ì¼Ò±ï¿½ï¿½',
  `goods_order_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_sellor_feedback_content` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `goods_sellor_feedback_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Ã»ï¿½ï¿½ï¿½ï¿½Ì¼ï¿½ï¿½ï¿½Æ·ï¿½Ä·ï¿½ï¿½ï¿½';

-- ----------------------------
-- Table structure for image_explanation
-- ----------------------------
DROP TABLE IF EXISTS `image_explanation`;
CREATE TABLE `image_explanation` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `image_explanation_object` text COMMENT 'Ëµï¿½ï¿½ï¿½Ä¶ï¿½ï¿½ï¿½Ò»ï¿½ï¿½ï¿½Ç±ï¿½ï¿½ï¿½ï¿½+ï¿½Ö¶ï¿½ï¿½ï¿½ï¿½ï¿½',
  `image_explanation_height` int(11) default NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Òªï¿½ï¿½',
  `image_explanation_size` int(11) default NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Ð¡Òªï¿½ï¿½',
  `image_explanation_width` int(11) default NULL COMMENT 'Í¼Æ¬ï¿½ï¿½Òªï¿½ï¿½',
  `image_explanation_remark` text COMMENT 'ï¿½ï¿½×¢',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Í¼Æ¬ï¿½ï¿½ï¿½Ëµï¿½ï¿½';

-- ----------------------------
-- Table structure for message_center_assets
-- ----------------------------
DROP TABLE IF EXISTS `message_center_assets`;
CREATE TABLE `message_center_assets` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `coupon_user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½Å»ï¿½È¯id',
  `message_center_assets_time_last` int(11) default NULL COMMENT 'ï¿½Å»ï¿½È¯Ê£ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Òµï¿½ï¿½Ê²ï¿½';

-- ----------------------------
-- Table structure for message_center_help_sell
-- ----------------------------
DROP TABLE IF EXISTS `message_center_help_sell`;
CREATE TABLE `message_center_help_sell` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `message_center_server_sell_content` text COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `message_center_server_sell_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `admin_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸Ä¹ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  `message_center_server_sell_icon` varchar(50) default NULL COMMENT 'Í¼ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Ûºï¿½ï¿½ï¿½ï¿½';

-- ----------------------------
-- Table structure for message_center_server_customer
-- ----------------------------
DROP TABLE IF EXISTS `message_center_server_customer`;
CREATE TABLE `message_center_server_customer` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `message_center_icon` varchar(100) default NULL COMMENT 'Í¼ï¿½ï¿½',
  `message_center_content` text COMMENT 'ï¿½ï¿½Ï¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `message_center_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `message_center_admin` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Þ¸Ä¹ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Í·ï¿½';

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `news_title` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½',
  `news_introduction` text COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½',
  `news_time` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `news_time_end` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½Ö¹Ê±ï¿½ï¿½',
  `news_content` text COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½',
  `news_people` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_phone` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ïµï¿½ç»°',
  `news_image` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ä¿Í¼Æ¬ï¿½ï¿½Ê¶',
  `news_organization` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¯orï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_check_type` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½×´Ì¬',
  `news_check_person` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_check_time` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `news_read_number` int(11) default NULL COMMENT 'ï¿½Ä¶ï¿½ï¿½ï¿½',
  `news_praise` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_money` decimal(10,3) default NULL COMMENT 'ï¿½Ñ³ï¿½Ç®ï¿½ï¿½',
  `news_money_goal` decimal(10,3) default NULL COMMENT 'Ä¿ï¿½ï¿½ï¿½ï¿½',
  `news_money_people_number` int(11) default NULL COMMENT 'ï¿½Ñ¾ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_time_last_update` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `admin_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½ï¿½Þ¸Ä¹ï¿½ï¿½ï¿½Ô±ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `news_id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä¿ï¿½ï¿½ï¿½',
  `news_comment_content` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `news_comment_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `news_comment_user` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `news_comment_tyoe` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for offer_promotion_discount
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_discount`;
CREATE TABLE `offer_promotion_discount` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `offer_promotion_discount_time_start` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
  `offer_promotion_discount_time_end` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `offer_promotion_discount_time_publish` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `offer_promotion_discount_amount` decimal(10,3) default NULL COMMENT 'ï¿½Û¿ï¿½ï¿½Ç¶ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Û¿Û´ï¿½ï¿½ï¿½ï¿½î¶¯';

-- ----------------------------
-- Table structure for offer_promotion_fullcutproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullcutproducts`;
CREATE TABLE `offer_promotion_fullcutproducts` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `offer_promotion_fullcutproducts_name` varchar(100) default NULL COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `offer_promotion_fullcutproducts_remark` text COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½×¢',
  `offer_promotion_fullcutproducts_time_start` varchar(30) default NULL COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
  `offer_promotion_fullcutproducts_time_end` varchar(30) default NULL COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½Ö¹Ê±ï¿½ï¿½',
  `offer_promotion_fullcutproducts_time_publish` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `offer_promotion_fullcutproducts_money_full` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½',
  `offer_promotion_fullcutproducts_money_reduce` decimal(10,3) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Æ·ï¿½ï¿½';

-- ----------------------------
-- Table structure for offer_promotion_fullsendproducts
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_fullsendproducts`;
CREATE TABLE `offer_promotion_fullsendproducts` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `offer_promotion_fullsendproducts_time_start` varchar(20) default NULL COMMENT 'ï¿½î¶¯ï¿½ï¿½Ê¼Ê±ï¿½ï¿½',
  `offer_promotion_fullsendproducts_time_end` varchar(20) default NULL COMMENT 'ï¿½î¶¯ï¿½ï¿½Ö¹Ê±ï¿½ï¿½',
  `offer_promotion_fullsendproducts_remark` text COMMENT 'ï¿½î¶¯ï¿½ï¿½×¢',
  `offer_promotion_fullsendproducts_time_publish` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `offer_promotion_fullsendproducts_amount` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½î¶¯ï¿½ï¿½';

-- ----------------------------
-- Table structure for offer_promotion_type
-- ----------------------------
DROP TABLE IF EXISTS `offer_promotion_type`;
CREATE TABLE `offer_promotion_type` (
  `id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `offer_promotion_type_table_name` varchar(50) default NULL COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½(Êµï¿½ÊµÄ±ï¿½ï¿½ï¿½ï¿½ï¿½Ö£ï¿½Ó¢ï¿½ï¿½ï¿½ï¿½)',
  `offer_promotion_type_table_name_chinese` varchar(50) default NULL COMMENT 'ï¿½Å»Ý´ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö£ï¿½ï¿½ï¿½ï¿½Ä£ï¿½',
  `offer_promotion_type_remark` varchar(50) default NULL COMMENT 'ï¿½ï¿½×¢ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ý£ï¿½'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for promotion_gifs
-- ----------------------------
DROP TABLE IF EXISTS `promotion_gifs`;
CREATE TABLE `promotion_gifs` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `offer_promotion_fullsendproducts_id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½î¶¯ï¿½ï¿½ï¿½',
  `promotion_gifs_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½',
  `promotion_gifs_remark` text COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½×¢',
  `promotion_gifs_icon` varchar(50) default NULL COMMENT 'ï¿½ï¿½Æ·Í¼ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½Æ·ï¿½ï¿½';

-- ----------------------------
-- Table structure for recommend_catagory
-- ----------------------------
DROP TABLE IF EXISTS `recommend_catagory`;
CREATE TABLE `recommend_catagory` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `recommend_catagory_image` varchar(50) default NULL COMMENT 'Í¼Æ¬Â·ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Æ¼ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ó¦ï¿½ï¿½Í¼Æ¬';

-- ----------------------------
-- Table structure for sellor
-- ----------------------------
DROP TABLE IF EXISTS `sellor`;
CREATE TABLE `sellor` (
  `id` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `sellor_name` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½',
  `sellor_real_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Êµï¿½ï¿½ï¿½ï¿½',
  `sellor_login_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Â¼ï¿½ï¿½',
  `sellor_nickname` varchar(50) default NULL COMMENT 'ï¿½Ç³ï¿½',
  `sellor_sex` int(11) default NULL COMMENT 'ï¿½Ô±ï¿½',
  `sellor_main` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Óªï¿½ï¿½',
  `sellor_address` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ïµï¿½ï¿½Ö·',
  `sellor_phone` varchar(20) default NULL COMMENT 'ï¿½ç»°',
  `sellor_email` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `sellor_head_image` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Í·ï¿½ï¿½',
  `sellor_store_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Ì±ï¿½ï¿½',
  `sellor_password` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `sellor_services_index` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½Ì·ï¿½ï¿½ï¿½Ö¸ï¿½ï¿½',
  `sellor_evaluation_index` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½ï¿½Ö¸ï¿½ï¿½',
  `sellor_logistic_index` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½Ù¶ï¿½',
  `sellor_qr_code` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Ì¶ï¿½Î¬ï¿½ï¿½',
  `sellor_introduction` text COMMENT 'ï¿½ï¿½ï¿½Ì¼ï¿½ï¿½',
  `sellor_company` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ë¾ï¿½ï¿½ï¿½ï¿½',
  `sellor_company_address` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½Úµï¿½ï¿½ï¿½',
  `sellor_store_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for selloroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `selloroperatelogs`;
CREATE TABLE `selloroperatelogs` (
  `id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `sellor_id` varchar(50) default NULL COMMENT 'ï¿½ï¿½Ò±ï¿½ï¿½',
  `selloroperatelogs_operattion` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îª',
  `selloroperatelogs_description` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `selloroperatelogs_time` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  `selloroperatelogs_ip` varchar(30) default NULL COMMENT 'IPï¿½ï¿½Ö·'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½Ö¾ï¿½ï¿½';

-- ----------------------------
-- Table structure for service_feedback
-- ----------------------------
DROP TABLE IF EXISTS `service_feedback`;
CREATE TABLE `service_feedback` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `service_feedback_content` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `service_feedback_user` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `service_feedback_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `shopping_cart_amount` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `shopping_cart_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_name` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½',
  `user_login_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Â¼ï¿½ï¿½',
  `user_real_name` varchar(50) default NULL COMMENT 'ï¿½ï¿½Êµï¿½ï¿½ï¿½ï¿½',
  `user_nickname` varchar(50) default NULL COMMENT 'ï¿½Ç³ï¿½',
  `user_home_address` varchar(100) default NULL COMMENT 'ï¿½ï¿½Ïµï¿½ï¿½Ö·',
  `user_phone` varchar(20) default NULL COMMENT 'ï¿½ï¿½Ïµï¿½ç»°',
  `user_sex` int(11) default NULL COMMENT 'ï¿½Ô±ï¿½',
  `user_password` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `user_birthday` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `user_head_image` varchar(50) default NULL COMMENT 'Í·ï¿½ï¿½',
  `user_email` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½',
  `user_type` int(11) default NULL COMMENT 'ï¿½ï¿½Ê¦orÑ§ï¿½ï¿½',
  `user_number` varchar(50) default NULL COMMENT 'Ñ§ï¿½ï¿½ï¿½ï¿½',
  `user_college` varchar(50) default NULL COMMENT 'Ñ§Ôº',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for useroperatelogs
-- ----------------------------
DROP TABLE IF EXISTS `useroperatelogs`;
CREATE TABLE `useroperatelogs` (
  `id` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `useroperatelogs_operation` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Îª',
  `useroperatelogs_description` text COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `useroperatelogs_ip` varchar(30) default NULL COMMENT 'IPï¿½ï¿½Ö·',
  `useroperatelogs_time` varchar(50) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½Ã»ï¿½ï¿½ï¿½Ö¾ï¿½ï¿½';

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `user_address_province` varchar(20) default NULL COMMENT 'Ê¡ï¿½ï¿½',
  `user_address_city` varchar(20) default NULL COMMENT 'ï¿½ï¿½',
  `user_address_county` varchar(20) default NULL COMMENT 'ï¿½ï¿½/ï¿½ï¿½',
  `user_address_street` varchar(50) default NULL COMMENT 'ï¿½Öµï¿½ï¿½ï¿½Ö·',
  `user_address_remark` text COMMENT 'ï¿½ï¿½×¢',
  `user_address_change_time` varchar(20) default NULL COMMENT 'ï¿½Þ¸ï¿½Ê±ï¿½ï¿½',
  `user_address_type` int(11) default NULL COMMENT 'ï¿½Ç·ï¿½Ä¬ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_goods_history
-- ----------------------------
DROP TABLE IF EXISTS `user_goods_history`;
CREATE TABLE `user_goods_history` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `user_id` varchar(50) default NULL COMMENT 'ï¿½Ã»ï¿½ï¿½ï¿½ï¿½',
  `goods_id` int(11) default NULL COMMENT 'ï¿½ï¿½Æ·ï¿½ï¿½ï¿½',
  `user_goods_history_time` varchar(20) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ê±ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for word_explanation
-- ----------------------------
DROP TABLE IF EXISTS `word_explanation`;
CREATE TABLE `word_explanation` (
  `id` int(11) NOT NULL COMMENT 'ï¿½ï¿½ï¿½',
  `word_explanation_object` varchar(50) default NULL COMMENT 'Ëµï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ò»ï¿½ï¿½ï¿½Ç±ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ö¶ï¿½ï¿½ï¿½ï¿½ï¿½',
  `word_explanation_down` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  `word_explanation_up` int(11) default NULL COMMENT 'ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ð¡ï¿½ï¿½ï¿½Æ±ï¿½';
>>>>>>> branch 'master' of git@github.com:swwt/user-repository
