create database shopSystem;

drop  database shopSystem;

--1.用户表users
create table users(
	user_id  int primary key auto_increment,   
	user_name varchar(100),
	user_pwd varchar(100),
	user_sex varchar(100),
	user_tel varchar(100),
	user_email varchar(100),
	user_idcard varchar(100),
	user_level varchar(100),
	user_head varchar(50)
)

drop table  users
--2.地址Address
create table Address(
   address_id int primary key auto_increment,
   address_name varchar(1000),
   address_code varchar(100),
   address_status int,
   user_id int
)

--3.商品分类表 category（1级表）
create table firsttype(
	firsttype_id int primary key auto_increment,
	firsttype_name varchar(100)
 )
 --4.商品类型表type （2级表）
create table secondtype(
	secondtype_id int primary key auto_increment,
	secondtype_name varchar(100),
	firsttype_id int
 )
 --5.(3级表)
 create table thirdtype(
	thirdtype_id int primary key auto_increment,
	thirdtype_name varchar(100),
	secondtype_id int
 )
--6.商品表goods
drop table goods
create table goods(
	goods_id int primary key auto_increment,
	goods_name varchar(100),
	goods_desc varchar(200),
	goods_pubtime date,
	goods_isnew int,
	goods_sale int,
	thirdtype_id int
)
--7
create table goodsdetail(
	goodsdetail_id int primary key auto_increment,
	goodsdetail_price double,
	goods_count int,
	goods_id int,
)


--8.图片表image
create table image(
	image_id  int primary key auto_increment,
	image_path varchar(100),
	goodsdetail_id int
)

--9.评论表review
create table review(
	review_id int primary key auto_increment,
	review_level int,
	review_content varchar(5000),
	review_image varchar(100),
	review_date date,
	orderdetail_id int,
	user_id int
)


--10.商品属性表attribute
create table attribute(
	attribute_id int primary key auto_increment,
	attribute_name varchar(100),
	pid int,
	secondtype_id int
)

create table contact(
	contact_id int primary key auto_increment,
	attribute_id int,
	goodsdetail_id int
)


--11.购物车表cart
drop table cart
create table cart(
	cart_id int primary key auto_increment,
	user_id int
)
select * from cart
--12.购物车详情表cartdetail
drop table cartdetail
create table cartdetail(
   cartdetail_id int primary key auto_increment,
   goods_count int,
   goods_money double,
   cartdetail_status int,
   goodsdetail_id int,
   cart_id int
)
--13.订单表order  订单号  下单用户  收货人  收货地址  联系电话  创建时间  下单状态
create table orders(
 	order_id varchar(50) primary key,
 	to_userName  varchar(100),
 	to_addr varchar(500),
 	to_tel varchar(100),
	order_time date,
	order_status int,
 	order_totalmoney double,
	user_id int
)
--14.订单详情表detail   
create table orderdetail(
	orderdetail_id int primary key auto_increment,
	goods_count int,
	goods_buyprice double,
	goodsdetail_id int,
	Order_id varchar(50)
)



















--13.商品收藏表collect
create table collect(
	Collect_id int primary key auto_increment,
	collect_time date,
	collect_goodsprice double,
	User_id int,
	Goods_id int
)
--14.用户搜索历史history
create table history(
	History_id int primary key auto_increment,
	History_name varchar(500),
	User_id int
)
--15.热卖表hot
create table hot(
	Hot_id int primary key auto_increment,
	Goods_id int
)

