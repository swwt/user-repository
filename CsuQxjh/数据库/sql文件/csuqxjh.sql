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
   admin_head           varchar(50) comment 'ͷ��',
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
   sellor_id            varchar(50) comment '���̱��',
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
   goods_catagory_2_id  int comment '��Ʒ���ͱ��',
   sellor_id            varchar(50) comment '���ұ��',
   goods_name           varchar(50) comment '��Ʒ����',
   goods_introduction   text comment '��Ʒ���',
   goods_remark         text comment '��ע',
   goods_time_last_update varchar(20) comment '��Ʒ����޸�ʱ��',
   goods_number         int comment '��Ʒ���',
   goods_promotion_type int comment '����Ʒ�Ƿ��д�������Ҵ������ʲô����',
   goods_check_status   int comment '����Ʒ���״̬',
   goods_on_sale_status int comment '��Ʒ�ϼ�״̬',
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
   goods_comment_grade  int comment '���۵ȼ�������ǣ�',
   goods_comment_view_status int comment '�鿴״̬',
   goods_comment_anonymous int comment '�Ƿ�����',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_comment_image                                   */
/*==============================================================*/
create table goods_comment_image
(
   id                   int not null,
   goods_comment_id     int comment '���۵�id',
   goods_comment_image_src varchar(100) comment 'ͼƬ·��',
   goods_comment_time   varchar(30) comment '�ϴ�ʱ��',
   primary key (id)
);

alter table goods_comment_image comment '���۱��Ӧ��ͼƬ';

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
   goods_order_send_way varchar(50) comment '�ͻ���ʽ',
   goods_order_user_use int comment '�û��Ƿ񻹱�����¼',
   goods_order_price_description varchar(50) comment '��Ʒ�۸��Ӧ������',
   primary key (id)
);

/*==============================================================*/
/* Table: goods_price                                           */
/*==============================================================*/
create table goods_price
(
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   goods_price_specific decimal(10,3) comment '��ʱ������Ʒ�۸�',
   goods_price_description text comment '��Ӧ������',
   goods_price_time     varchar(30) comment '����޸�ʱ��',
   primary key (id)
);

alter table goods_price comment '��Ʒ��Ӧ�ж��ּ۸���ʽ';

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
/* Table: image_explanation                                     */
/*==============================================================*/
create table image_explanation
(
   id                   int not null comment '���',
   image_explanation_object text comment '˵���Ķ���һ���Ǳ����+�ֶ�����',
   image_explanation_height int comment 'ͼƬ��Ҫ��',
   image_explanation_size int comment 'ͼƬ��СҪ��',
   image_explanation_width int comment 'ͼƬ��Ҫ��',
   image_explanation_remark text comment '��ע',
   primary key (id)
);

alter table image_explanation comment 'ͼƬ���˵��';

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
   id                   int not null comment '���',
   goods_id             int comment '��Ʒ���',
   offer_promotion_discount_time_start varchar(20) comment '��ʼʱ��',
   offer_promotion_discount_time_end varchar(20) comment '����ʱ��',
   offer_promotion_discount_time_publish varchar(20) comment '����ʱ��',
   offer_promotion_discount_amount decimal(10,3) comment '�ۿ��Ƕ���',
   primary key (id)
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
/* Table: recommend_catagory                                    */
/*==============================================================*/
create table recommend_catagory
(
   id                   int not null comment '���',
   recommend_catagory_image varchar(50) comment 'ͼƬ·��',
   primary key (id)
);

alter table recommend_catagory comment '�Ƽ������Ӧ��ͼƬ';

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
   shopping_cart_price  decimal(10,3) comment '�۸�',
   shopping_cart_price_description varchar(50) comment '�۸�����',
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
   user_address_name    varchar(50) comment '�ջ�������',
   user_address_phone   varchar(50) comment '�ջ��˵绰',
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

/*==============================================================*/
/* Table: word_explanation                                      */
/*==============================================================*/
create table word_explanation
(
   id                   int not null comment '���',
   word_explanation_object varchar(50) comment '˵������һ���Ǳ������ֶ�����',
   word_explanation_down int comment '��������',
   word_explanation_up  int comment '��������',
   primary key (id)
);

alter table word_explanation comment '������С���Ʊ�';

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
>>>>>>> branch 'master' of git@github.com:swwt/user-repository
