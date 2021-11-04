DROP DATABASE IF EXISTS xiaomissm;
CREATE DATABASE xiaomissm DEFAULT CHARSET utf8;

/*打开DB*/
USE xiaomissm;
DROP TABLE IF EXISTS `orderdetail`;
DROP TABLE IF EXISTS `xmorder`;
DROP TABLE IF EXISTS `carshop`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `users`;
drop table if exists product_info;
drop table if exists product_type;
drop table if exists admin;


#DROP TABLE xiaomi_admin;
#################################管理员表
CREATE TABLE admin(
a_id INT AUTO_INCREMENT PRIMARY KEY,
a_name VARCHAR(20),
a_pass VARCHAR(20)
);
INSERT INTO admin(a_id,a_name,a_pass) VALUES(1,'admin','000000');

##########################商品类型表
CREATE TABLE product_type
(
type_id int auto_increment PRIMARY KEY,
type_name varchar(20)
);

####################添加数据
insert into product_type(type_name) values('手机');
insert into product_type(type_name) values('电脑');
insert into product_type(type_name) values('电视');


#############################商品表
create table product_info
(
p_id int auto_increment primary key,
p_name varchar(20),
p_content varchar(200), ##############33商品规格/简介
p_price int, ###############价格
p_image varchar(200), #############图片
p_number int, ########数量
type_id int,
p_date date,
FOREIGN KEY(type_id) REFERENCES product_type(type_id)
);
##添加
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米Note2','双曲面 黑色 6GB内存 64GB闪存',2899,'xmNote2.jpg',500,1,'2018-01-04');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('红米Note5A','5.5英寸 粉色 2GB内存 16GB闪存',699,'hmNote5A.jpg',500,1,'2018-01-05');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('红米Note4X','5.5英寸 绿色 4GB内存 64GB闪存',1299,'hmNote4X.jpg',500,1,'2018-01-06');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('红米4','5英寸 金色 3GB内存 32GB闪存',999,'hm4.jpg',500,1,'2018-01-07');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('红米4X','5英寸 黑色 3GB内存 32GB闪存',899,'hm4X.jpg',500,1,'2018-01-08');

insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米平板3','7.9英寸 金色 4GB内存 64GB闪存',1499,'xmPad3.jpg',500,2,'2018-01-09');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米Air12','12.5英寸 银色 4GB内存 128GB闪存',3599,'xmAir12.jpg',500,2,'2018-01-18');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米Air13','13.3英寸 银色 8GB内存 256GB闪存',4999,'xmAir13.jpg',500,2,'2018-01-17');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米Pro','15.6英寸 灰色 16GB内存 256GB闪存',6999,'xmPro.jpg',500,2,'2018-01-16');

insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米电视4','49英寸 原装LG屏 3840×2160 真4K',3299,'xmTV4-49.jpg',500,3,'2018-01-15');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米电视4','55英寸 原装三星屏 3840×2160 真4K',3999,'xmTV4-55.jpg',500,3,'2018-01-13');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米电视4','65英寸 原装三星屏 3840×2160 真4K',8999,'xmTV4-65.jpg',500,3,'2018-01-22');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米电视4A','43英寸 FHD全高清屏 1920*1080',1999,'xmTV4A-43.jpg',500,3,'2018-01-11');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米电视4A','49英寸 FHD全高清屏 1920*1080',2299,'xmTV4A-49.jpg',500,3,'2018-01-21');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米MIX2','全陶瓷 黑色 8GB内存 128GB闪存',4699,'xmMIX2.jpg',500,1,'2018-04-01');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米Note3','全网通 蓝色 6GB内存 64GB闪存',2499,'xmNote3.jpg',500,1,'2018-03-01');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米6','玻璃金属 白色 6GB内存 128GB闪存',2899,'xm6.jpg',500,1,'2018-02-01');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米MAX2','全金属 金色 4GB内存 64GB闪存',1599,'xmMAX2.jpg',500,1,'2018-01-02');
insert into product_info(p_name,p_content,p_price,p_image,p_number,type_id,p_date) values('小米5X','全金属 金色 4GB内存 64GB闪存',1499,'xm5X.jpg',500,1,'2018-01-03');

#创建前台用户表

CREATE TABLE `users` (
                       `uid` int(11) NOT NULL auto_increment,
                       `uname` varchar(50) default NULL,
                       `upass` varbinary(50) default NULL,
                       `ustatus` int(11) default NULL,
                       `ulevel` int(11) default NULL,
                       `score` int(11) default NULL,
                       PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#增加用户数据
INSERT INTO `users` VALUES ('1', 'zar', 0x313233343536, '0', '0', '0');
INSERT INTO `users` VALUES ('2', 'zhangsan', 0x313233343536, '1', '0', '0');
#创建地址表

CREATE TABLE `address` (
                         `addressId` int(11) NOT NULL auto_increment,
                         `uid` int(11) default NULL,
                         `cnee` varchar(50) default NULL,
                         `phone` varchar(11) default NULL,
                         `address` varchar(100) default NULL,
                         PRIMARY KEY  (`addressId`),
                         KEY `FK_Reference_1` (`uid`),
                         CONSTRAINT `FK_Reference_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#增加地址表数据
INSERT INTO `address` VALUES ('1', '1', 'zar', '15266676667', '北京海淀甲骨文');
INSERT INTO `address` VALUES ('2', '1', 'oracle', '15266678888', '北京朝阳科技文化一条街');
INSERT INTO `address` VALUES ('3', '2', '张三', '15290888162', '北京大兴西红门');

#创建购物车表
CREATE TABLE `carshop` (
                         `cid` int(11) NOT NULL auto_increment,
                         `uid` int(11) default NULL,
                         `pid` int(11) default NULL,
                         `numbers` int(11) default NULL,
                         PRIMARY KEY  (`cid`),
                         KEY `FK_Reference_3` (`uid`),
                         KEY `FK_Reference_4` (`pid`),
                         CONSTRAINT `FK_Reference_4` FOREIGN KEY (`pid`) REFERENCES `product_info` (`p_id`),
                         CONSTRAINT `FK_Reference_3` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#增加购物车数据
insert into carshop (uid,pid,numbers) values (1,1,2);
#创建订单表
CREATE TABLE `xmorder` (
                         `oid` char(32) NOT NULL ,
                         `uid` int(11) default NULL,
                         `addressId` int(11) default NULL,
                         `totalprice` double(10,2) default NULL,
                         `remarks` varchar(200) default NULL,
                         `status` varchar(6) default NULL,
                         `odate` TIMESTAMP  DEFAULT CURRENT_TIMESTAMP ,
                         PRIMARY KEY  (`oid`),
                         KEY `FK_Reference_5` (`uid`),
                         KEY `FK_Reference_6` (`addressId`),
                         CONSTRAINT `FK_Reference_6` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`),
                         CONSTRAINT `FK_Reference_5` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#订单表增加数据
insert into xmorder(oid,uid,addressid,totalprice,remarks,status,odate) values('abcd111222333444777888999000wwww',1,1,9996,'尽快送到','待发货',default);
#创建订单明细表

CREATE TABLE `orderdetail` (
                             `odid` int(11) NOT NULL auto_increment,
                             `oid` char(32) default NULL,
                             `pid` int(11) default NULL,
                             `pnumber` int(11) default NULL,
                             `ptotal` double(10,2) default NULL,
                             PRIMARY KEY  (`odid`),
                             KEY `FK_Reference_7` (`oid`),
                             KEY `FK_Reference_8` (`pid`),
                             CONSTRAINT `FK_Reference_8` FOREIGN KEY (`pid`) REFERENCES `product_info` (`p_id`),
                             CONSTRAINT `FK_Reference_9` FOREIGN KEY (`oid`) REFERENCES `xmorder` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into orderdetail(oid,pid,pnumber,ptotal) values ('abcd111222333444777888999000wwww',1,2,9996);


select * from admin;
select * from users;
select * from product_type;
select * from product_info ;
select * from orderdetail;
select * from xmorder;
select * from carshop;
select * from address;
