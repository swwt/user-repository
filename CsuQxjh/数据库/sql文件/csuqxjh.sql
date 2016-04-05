/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/5 10:36:41                            */
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

drop table if exists goods_coupon;

drop table if exists goods_detail;

drop table if exists goods_detail_image;

drop table if exists goods_image;

drop table if exists goods_order;

drop table if exists goods_sellor_feedback;

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

drop table if exists sellor;

drop table if exists selloroperatelogs;

drop table if exists service_feedback;

drop table if exists shopping_cart;

drop table if exists user;

drop table if exists user_address;

drop table if exists user_goods_history;

drop table if exists useroperatelogs;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   varchar(50) not null comment '���',
   admin_name           varchar(50) comment '�û���',
   admin_real_name      varchar(50) comment '��ʵ����',
   admin_login_name     varchar(50) comment '��¼��',
   admin_password       varchar(50) comment '����',
   admin_sex            int comment '�Ա�',
   admin_phone          varchar(20) comment '��ϵ�绰',
   admin_email          varchar(30) comment '����',
   admin_address        varchar(50) comment '��ַ',
   admin_degree         int comment '����Ա����',
   admin_time           varchar(20) comment '����Ա��Ϣ����޸�ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: adminoperatelogs                                      */
/*==============================================================*/
create table adminoperatelogs
(
   id                   int comment '���',
   admin_id             varchar(50) comment '����Ա���',
   adminoperatelogs_operation text comment '������Ϊ',
   adminoperatelogs_description text comment '��������',
   adminoperatelogs_ip  varchar(30) comment 'IP��ַ',
   adminoperatelogs_time text comment '����ʱ��'
);

alter table adminoperatelogs comment '��̨����Ա������־��';

/*==============================================================*/
/* Table: collection                                            */
/*==============================================================*/
create table collection
(
   id                   int not null comment '���',
   user_id              varchar(50) comment '�û����',
   goods_id             int comment '��Ʒ���',
   store_id             varchar(50) comment '���̱��',
   collection_time      varchar(20) comment '�ղ�ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_sellor                                         */
/*==============================================================*/
create table coupon_sellor
(
   id                   int not null comment '���',
   sellor_id            varchar(50) comment '���ұ��',
   coupon_sellor_remark text comment '�Ż�ȯ��ע',
   coupon_sellor_time_begin varchar(20) comment '�Ż�ȯ��ʼʱ��',
   coupon_sellor_icon   varchar(50) comment '�Ż�ȯ��־��ͼƬ',
   coupon_sellor_money  decimal(10,3) comment '�Ż�ȯ���',
   coupon_sellor_money_expend decimal(10,3) comment '�Ż�ȯ�����ٿ���',
   coupon_sellor_number_limit int comment '�Ż�ȯ��ȡ��������',
   coupon_sellor_number_get int comment '�Ż�ȯ��������',
   coupon_sellor_time_end varchar(20) comment '�Ż�ȯ����ʱ��',
   coupon_sellor_limit_type int comment '�Ż�ȯ�Ƿ���������Ʒ���������ƣ���ʹ��goods_coupon����ָ��ʹ����Ʒ��Χ��',
   primary key (id)
);

/*==============================================================*/
/* Table: coupon_user                                           */
/*==============================================================*/
create table coupon_user
(
   id                   int not null comment '���',
   user_id              varchar(50) comment '�û����',
   coupon_sellor_id     int comment '�Ż�ȯ���',
   coupon_user_use_status int comment '�Ƿ�ʹ�ù�',
   coupon_user_time_get varchar(20) comment '�û���ȡ�Ż�ȯʱ��',
   coupon_user_time_use varchar(20) comment '�û��Ż�ȯʹ��ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   id                   int not null comment '���',
   goods_catagory_2     int comment '��Ʒ���ͱ��',
   sellor_id            varchar(50) comment '���ұ��',
   goods_name           varchar(50) comment '��Ʒ����',
   goods_introduction   text comment '��Ʒ���',
   goods_remark         text comment '��ע',
   goods_sales          int comment '����',
   goods_time_last_update varchar(20) comment '��Ʒ����޸�ʱ��',
   goods_number         int comment '��Ʒ���',
   goods_promotion_type int comment '����Ʒ�Ƿ��д�������Ҵ������ʲô����',
   offer_promotion_discount_id int comment '�Ż��ۿ۴�����ţ���û�У�Ϊ��',
   offer_promotion_fullcutproducts_id int comment '�Ż�����������ţ���û�У�Ϊ��',
   offer_promotion_fullsendproducts_id int comment '�Żݴ���������ţ���û�У�Ϊ��',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_1                                      */
/*==============================================================*/
create table goods_catagory_1
(
   id                   int not null comment '��Ʒ����һ�����',
   goods_catagory1_name varchar(50) comment '������',
   goods_catagory1_remark text comment '��ע',
   goods_catagory1_time_last_update varchar(20) comment '��Ʒ�������޸�ʱ��',
   goods_catagory_1_icon varchar(50) comment '��Ʒ����ʶͼƬ',
   admin_id             varchar(50) comment '����޸Ĺ���Ա���',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_catagory_2                                      */
/*==============================================================*/
create table goods_catagory_2
(
   id                   int not null comment '��Ʒ����������',
   goods_catagory_1     int comment '��Ʒһ�������ţ������',
   goods_catagory_2_name varchar(50) comment '��Ʒ��������',
   goods_catagory_2_icon varchar(50) comment '��Ʒ����ͼƬ��ʶ',
   goods_catagory_2_time_last_update varchar(20) comment '����޸�ʱ��',
   admin_id             varchar(50) comment '����޸Ĺ���Ա���',
   goods_catagory_2_remark text comment '��ע',
   goods_catagory_2_type int comment '��������ͣ�0����ר�����࣬1�������ŷ���',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment                                         */
/*==============================================================*/
create table goods_comment
(
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   goods_order_id       varchar(50) comment '�������',
   user_id              varchar(50) comment '�û����',
   goods_comment_content text comment '��������',
   goods_comment_time   varchar(30) comment '����ʱ��',
   goods_comment_description_match int comment '�������',
   goods_comment_service_attitude int comment '����̬��',
   goods_comment_logistics_speed int comment '�����ٶ�',
   goods_comment_grade  int comment '���۵ȼ���������������������',
   goods_comment_view_status int comment '�鿴״̬',
   goods_comment_anonymous int comment '�Ƿ�����',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_coupon                                          */
/*==============================================================*/
create table goods_coupon
(
   id                   int not null comment '�Ż�ȯ����Ʒ��ϵ���',
   coupon_sellor_id     int comment '�Ż�ȯ���',
   goods_id             int comment '��Ʒ���',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail                                          */
/*==============================================================*/
create table goods_detail
(
   id                   int not null comment '���',
   goods_id             char(10) comment '��Ʒ���',
   goods_detail_inital_price decimal(10,3) comment '��Ʒԭ��',
   goods_detail_now_price decimal(10,3) comment '��Ʒ�ּ�',
   goods_detail_package_sale text comment '��װ�ۺ�',
   goods_detail_color   varchar(10) comment '��Ʒ��ɫ',
   goods_detail_shipping_costs decimal(10,3) comment '�˷�',
   goods_detail_producttion_place varchar(100) comment '����',
   goods_detail_shelf_life varchar(20) comment '������',
   goods_detail_net_weight varchar(20) comment '������',
   goods_detail_production_date varchar(20) comment '��������',
   goods_detail_remark  text comment '��ע',
   goods_detail_quantity varchar(20) comment '����',
   goods_detail_units   varchar(20) comment '��λ',
   goods_detail_packing varchar(20) comment '��װ��ʽ',
   goods_detail_taste   varchar(20) comment '��ζ',
   goods_detail_category varchar(20) comment '���',
   goods_detail_time_last_update varchar(20) comment '��Ʒ��������޸�ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_detail_image                                    */
/*==============================================================*/
create table goods_detail_image
(
   id                   int not null comment '���',
   goods_detail_id      int comment '��Ʒ������',
   goods_detail_image_src varchar(50) comment 'ͼƬ·��',
   goods_detail_image_time varchar(20) comment 'ͼƬ�ϴ�ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_image                                           */
/*==============================================================*/
create table goods_image
(
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   goods_image_src      varchar(100) comment 'ͼƬ·��',
   goods_image_time     varchar(20) comment 'ͼƬ�ϴ�ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_order                                           */
/*==============================================================*/
create table goods_order
(
   id                   varchar(50) not null comment '���',
   goods_id             int comment '��Ʒ���',
   user_id              varchar(50) comment '�û����',
   goods_order_amount   int comment '��Ʒ����',
   goods_order_unit     varchar(50) comment '��Ʒ��λ',
   goods_order_shipping_costs decimal(10,3) comment '�˷�',
   goods_order_price    decimal(10,3) comment '��Ʒ�ܼ�',
   user_address_id      int comment '�ջ��ַ���',
   goods_order_create_time varchar(30) comment '�µ�ʱ��',
   goods_order_deliver_status int comment '����״̬',
   goods_order_gain_status int comment '�ջ�״̬',
   goods_order_remark   text comment '��ע',
   goods_order_evaluate_status int comment '�Ƿ�����',
   goods_order_payment_status int comment '�Ƿ񸶿�',
   goods_order_gift_type int comment '�Ƿ�����Ʒ',
   promotion_gifs_id    int comment '��Ʒ���',
   promotion_gifs_amount int comment '��Ʒ����',
   promotion_name       varchar(100) comment '�����������ݣ���Ӧ����offer_promotion_type�е��Żݴ��������ı������',
   goods_order_pay_way  varchar(50) comment '֧����ʽ',
   goods_order          char(10) comment '�ͻ���ʽ',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_sellor_feedback                                 */
/*==============================================================*/
create table goods_sellor_feedback
(
   id                   int comment '���',
   user_id              varchar(50) comment '�����û����',
   sellor_id            varchar(50) comment '�������̼ұ��',
   goods_order_id       varchar(50) comment '�������������',
   goods_sellor_feedback_content text comment '��������',
   goods_sellor_feedback_time varchar(20) comment '����ʱ��'
);

alter table goods_sellor_feedback comment '�û����̼���Ʒ�ķ���';

/*==============================================================*/
/* Table: message_center_assets                                 */
/*==============================================================*/
create table message_center_assets
(
   id                   int not null comment '���',
   coupon_user_id       varchar(50) comment '�û��Ż�ȯid',
   message_center_assets_time_last int comment '�Ż�ȯʣ����������',
   user_id              varchar(50) comment '�û����',
   primary key (id)
);

alter table message_center_assets comment '�ҵ��ʲ�';

/*==============================================================*/
/* Table: message_center_help_sell                              */
/*==============================================================*/
create table message_center_help_sell
(
   id                   int not null comment '���',
   message_center_server_sell_content text comment '����',
   message_center_server_sell_time_last_update varchar(20) comment '����޸�ʱ��',
   admin_id             varchar(50) comment '����޸Ĺ���Ա���',
   message_center_server_sell_icon varchar(50) comment 'ͼ��',
   primary key (id)
);

alter table message_center_help_sell comment '�ۺ����';

/*==============================================================*/
/* Table: message_center_server_customer                        */
/*==============================================================*/
create table message_center_server_customer
(
   id                   int not null comment '���',
   message_center_icon  varchar(100) comment 'ͼ��',
   message_center_content text comment '��Ϣ��������',
   message_center_time_last_update varchar(20) comment '����޸�ʱ��',
   message_center_admin varchar(50) comment '����޸Ĺ���Ա���',
   primary key (id)
);

alter table message_center_server_customer comment '�ͷ�';

/*==============================================================*/
/* Table: news                                                  */
/*==============================================================*/
create table news
(
   id                   int not null comment '���',
   news_title           varchar(50) comment '��Ŀ����',
   news_introduction    text comment '��Ŀ���',
   news_time            varchar(50) comment '��Ŀ����ʱ��',
   news_time_end        varchar(20) comment '��Ŀ��ֹʱ��',
   news_content         text comment '��Ŀ����',
   news_people          varchar(50) comment '������',
   news_phone           varchar(20) comment '��ϵ�绰',
   news_image           varchar(50) comment '��ĿͼƬ��ʶ',
   news_organization    varchar(50) comment '������֯or��������',
   news_check_type      int comment '���״̬',
   news_check_person    varchar(50) comment '�����',
   news_check_time      varchar(50) comment '���ʱ��',
   news_read_number     int comment '�Ķ���',
   news_praise          int comment '������',
   news_money           decimal(10,3) comment '�ѳ�Ǯ��',
   news_money_goal      decimal(10,3) comment 'Ŀ����',
   news_money_people_number int comment '�Ѿ�����',
   news_time_last_update varchar(20) comment '��Ŀ����޸�ʱ��',
   admin_id             varchar(50) comment '��Ŀ����޸Ĺ���Ա���',
   primary key (id)
);

/*==============================================================*/
/* Table: news_comment                                          */
/*==============================================================*/
create table news_comment
(
   id                   int not null comment '���',
   news_id              int comment '������Ŀ���',
   news_comment_content text comment '��������',
   news_comment_time    varchar(20) comment '����ʱ��',
   news_comment_user    varchar(50) comment '�û����',
   news_comment_tyoe    int comment '�Ƿ�����',
   primary key (id)
);

/*==============================================================*/
/* Table: offer_promotion_discount                              */
/*==============================================================*/
create table offer_promotion_discount
(
   id                   int comment '���',
   goods_id             int comment '��Ʒ���',
   offer_promotion_discount_time_start varchar(20) comment '��ʼʱ��',
   offer_promotion_discount_time_end varchar(20) comment '����ʱ��',
   offer_promotion_discount_time_publish varchar(20) comment '����ʱ��',
   offer_promotion_discount_amount decimal(10,3) comment '�ۿ��Ƕ���'
);

alter table offer_promotion_discount comment '�ۿ۴����';

/*==============================================================*/
/* Table: offer_promotion_fullcutproducts                       */
/*==============================================================*/
create table offer_promotion_fullcutproducts
(
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   offer_promotion_fullcutproducts_name varchar(100) comment '�Żݴ�������',
   offer_promotion_fullcutproducts_remark text comment '�Żݴ�����ע',
   offer_promotion_fullcutproducts_time_start varchar(30) comment '�Żݴ�����ʼʱ��',
   offer_promotion_fullcutproducts_time_end varchar(30) comment '�Żݴ�����ֹʱ��',
   offer_promotion_fullcutproducts_time_publish varchar(20) comment '����ʱ��',
   offer_promotion_fullcutproducts_money_full decimal(10,3) comment '�����',
   offer_promotion_fullcutproducts_money_reduce decimal(10,3) comment '�����',
   primary key (id)
);

alter table offer_promotion_fullcutproducts comment '����������Ʒ��';

/*==============================================================*/
/* Table: offer_promotion_fullsendproducts                      */
/*==============================================================*/
create table offer_promotion_fullsendproducts
(
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   offer_promotion_fullsendproducts_time_start varchar(20) comment '���ʼʱ��',
   offer_promotion_fullsendproducts_time_end varchar(20) comment '���ֹʱ��',
   offer_promotion_fullsendproducts_remark text comment '���ע',
   offer_promotion_fullsendproducts_time_publish varchar(20) comment '����ʱ��',
   offer_promotion_fullsendproducts_amount int comment '��Ʒ����',
   primary key (id)
);

alter table offer_promotion_fullsendproducts comment '�����������';

/*==============================================================*/
/* Table: offer_promotion_type                                  */
/*==============================================================*/
create table offer_promotion_type
(
   id                   int comment '���',
   offer_promotion_type_table_name varchar(50) comment '�Żݴ����������(ʵ�ʵı�����֣�Ӣ����)',
   offer_promotion_type_table_name_chinese varchar(50) comment '�Żݴ������֣����ģ�',
   offer_promotion_type_remark varchar(50) comment '��ע���������ݣ�'
);

/*==============================================================*/
/* Table: promotion_gifs                                        */
/*==============================================================*/
create table promotion_gifs
(
   id                   int not null comment '���',
   offer_promotion_fullsendproducts_id int comment '��������',
   promotion_gifs_name  varchar(50) comment '��Ʒ����',
   promotion_gifs_remark text comment '��Ʒ��ע',
   promotion_gifs_icon  varchar(50) comment '��Ʒͼ��',
   primary key (id)
);

alter table promotion_gifs comment '��Ʒ��';

/*==============================================================*/
/* Table: sellor                                                */
/*==============================================================*/
create table sellor
(
   id                   varchar(50) not null comment '���',
   sellor_name          varchar(50) comment '�û���',
   sellor_real_name     varchar(50) comment '��ʵ����',
   sellor_login_name    varchar(50) comment '��¼��',
   sellor_nickname      varchar(50) comment '�ǳ�',
   sellor_sex           int comment '�Ա�',
   sellor_main          varchar(50) comment '������Ӫ��',
   sellor_address       varchar(50) comment '��ϵ��ַ',
   sellor_phone         varchar(20) comment '�绰',
   sellor_email         varchar(50) comment '����',
   sellor_head_image    varchar(50) comment '����ͷ��',
   sellor_store_id      varchar(50) comment '���̱��',
   sellor_password      varchar(50) comment '����',
   sellor_services_index int comment '���̷���ָ��',
   sellor_evaluation_index int comment '��Ʒ����ָ��',
   sellor_logistic_index int comment '�����ٶ�',
   sellor_qr_code       varchar(50) comment '���̶�ά��',
   sellor_introduction  text comment '���̼��',
   sellor_company       varchar(50) comment '��˾����',
   sellor_company_address varchar(50) comment '���ڵ���',
   sellor_store_time    varchar(20) comment '����ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: selloroperatelogs                                     */
/*==============================================================*/
create table selloroperatelogs
(
   id                   int comment '���',
   sellor_id            varchar(50) comment '���ұ��',
   selloroperatelogs_operattion text comment '������Ϊ',
   selloroperatelogs_description text comment '��������',
   selloroperatelogs_time varchar(50) comment '����ʱ��',
   selloroperatelogs_ip varchar(30) comment 'IP��ַ'
);

alter table selloroperatelogs comment '������־��';

/*==============================================================*/
/* Table: service_feedback                                      */
/*==============================================================*/
create table service_feedback
(
   id                   int not null comment '���',
   service_feedback_content text comment '��������',
   service_feedback_user varchar(50) comment '�û����',
   service_feedback_time varchar(20) comment '����ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   id                   int not null comment '���',
   user_id              varchar(50) comment '�û����',
   goods_id             int comment '��Ʒ���',
   shopping_cart_amount int comment '����',
   shopping_cart_time   varchar(20) comment '���ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(50) not null comment '���',
   user_name            varchar(50) comment '�û���',
   user_login_name      varchar(50) comment '��¼��',
   user_real_name       varchar(50) comment '��ʵ����',
   user_nickname        varchar(50) comment '�ǳ�',
   user_home_address    varchar(100) comment '��ϵ��ַ',
   user_phone           varchar(20) comment '��ϵ�绰',
   user_sex             int comment '�Ա�',
   user_password        varchar(50) comment '����',
   user_birthday        varchar(50) comment '��������',
   user_head_image      varchar(50) comment 'ͷ��',
   user_email           varchar(50) comment '����',
   user_type            int comment '��ʦorѧ��',
   user_number          varchar(50) comment 'ѧ����',
   user_college         varchar(50) comment 'ѧԺ',
   primary key (id)
);

/*==============================================================*/
/* Table: user_address                                          */
/*==============================================================*/
create table user_address
(
   id                   int not null comment '���',
   user_id              varchar(50) comment '�û����',
   user_address_province varchar(20) comment 'ʡ��',
   user_address_city    varchar(20) comment '��',
   user_address_county  varchar(20) comment '��/��',
   user_address_street  varchar(50) comment '�ֵ���ַ',
   user_address_remark  text comment '��ע',
   user_address_change_time varchar(20) comment '�޸�ʱ��',
   user_address_type    int comment '�Ƿ�Ĭ��',
   primary key (id)
);

/*==============================================================*/
/* Table: user_goods_history                                    */
/*==============================================================*/
create table user_goods_history
(
   id                   int not null comment '���',
   user_id              varchar(50) comment '�û����',
   goods_id             int comment '��Ʒ���',
   user_goods_history_time varchar(20) comment '������ʱ��',
   primary key (id)
);

/*==============================================================*/
/* Table: useroperatelogs                                       */
/*==============================================================*/
create table useroperatelogs
(
   id                   int comment '���',
   user_id              varchar(50) comment '�û����',
   useroperatelogs_operation text comment '������Ϊ',
   useroperatelogs_description text comment '��������',
   useroperatelogs_ip   varchar(30) comment 'IP��ַ',
   useroperatelogs_time varchar(50) comment '����ʱ��'
);

alter table useroperatelogs comment '�û���־��';

