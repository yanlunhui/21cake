#设置编码
SET NAMES UTF8;
#丢弃如果存在的数据库
DROP DATABASE IF EXISTS cake;
#创建数据库 cake 并设置编码
CREATE DATABASE cake CHARSET=UTF8;
#进入数据库 cake
USE cake;
#创建用户表
CREATE TABLE user(
	uid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  #编号  数据库自动生成
	upwd VARCHAR(32), #密码
  phone VARCHAR(16) NOT NULL UNIQUE,  #电话
	user_name VARCHAR(32), #真实姓名
	birthday VARCHAR(32)    #生日
);
#创建用户地址表
CREATE TABLE use_add(
	aid INT AUTO_INCREMENT PRIMARY KEY,  #自动生成在数据库中的编号,方便查找数据
	user_id INT,		#用户编号 为用户自动生成的uid
	receiver VARCHAR(16),   #接收人姓名
	province VARCHAR(16),  #省
	city VARCHAR(16),  #市
	county VARCHAR(16),#县
	address VARCHAR(128),   #详细地址
	is_default BOOLEAN  #是否为当前用户的默认地址

);
#创建用户购物车表
CREATE TABLE shop(
	sid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的购物车编号  
  user_id INT,  #用户编号 为用户自动生成的uid
	product_id INT, #商品编号
	count INT  #数量
	
);
/**商品标签**/
CREATE TABLE label(
  lid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号
  lname VARCHAR(32)
);
/*所属分类*/ 
CREATE TABLE family(
	fid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号
  fname VARCHAR(32)
);
/*口味*/ 
CREATE TABLE taste(
	tid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号
  tname VARCHAR(32)
);
/*大标题*/ 
CREATE TABLE dt(
	dtid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号
  dname VARCHAR(32)
);
/*重量及其价格*/ 
CREATE TABLE Weight(
	wid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号
  weight VARCHAR(32)
);

/**商品详情**/

CREATE TABLE pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  cid INT,                   #商品唯一编号
	wdid  INT,									#重量编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128),             #大图片路径
	w_img VARCHAR(128)
);
/**数据导入**/
INSERT INTO user VALUES
	(NULL,'a.12345678',13556465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13656465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13756465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13856465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13566465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13576465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13586465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13596465826,'tom',"2018-12-15"),
	(NULL,'a.12345678',13555465826,'tom',"2018-12-15");
INSERT INTO use_add VALUES
	(null,1,'tom','四川省','宜宾市','长宁县',null,1),
	(null,2,'tom','四川省','宜宾市','长宁县',null,1),
	(null,3,'tom','四川省','宜宾市','长宁县',null,1),
	(null,4,'tom','四川省','宜宾市','长宁县',null,1);
INSERT INTO shop VALUES
	(null,1,1,1),
	(null,2,2,1),
	(null,3,3,1),
	(null,4,1,1);
	/*关键字*/
INSERT INTO label VALUES
	(null,'新品'),
	(null,'生日'),
	(null,'儿童'),
	(null,'聚会'),
	(null,'时令'),
	(null,'优惠款'),
	(null,'情侣'),
	(null,'长辈'),
	(null,'生日'),
	(null,'力建单品');
	/*类型*/
INSERT INTO family VALUES
	(null,'蛋糕'),
	(null,'冰淇淋'),
	(null,'咖啡'),
	(null,'下午茶'),
	(null,'常温蛋糕'),
	(null,'设计师礼品'),
	(null,'面包');
	/*口味*/
INSERT INTO taste VALUES
	(null,'乳脂奶油'),
	(null,'慕斯'),
	(null,'巧克力'),
	(null,'乳酪'),
	(null,'坚果'),
	(null,'水果'),
	(null,'冰淇淋'),
	(null,'含酒咖啡');
	/*重量及其价格*/	
INSERT INTO	Weight VALUES
	(null,'1'),
	(null,'1.5'),
	(null,'2'),
	(null,'3'),
	(null,'5'),
	(null,'更多');
	CREATE TABLE weight_details(
	wdid INT PRIMARY KEY AUTO_INCREMENT,  #自动生成的类型编号	
	cid INT,							#	商品唯一编号
	wid INT,              #重量 id				
	price INT,	          #价格
	sixe VARCHAR(32),			#大小
	unumber VARCHAR(32),  #适合人数
	laid VARCHAR(32),			#餐具
	time 	VARCHAR(32)			#送餐时间
);
INSERT INTO weight_details VALUES
	#一号商品
	(null,1,1,298,'约13cmx13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,1,3,398,'约17cmx17cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	#二号商品
	(null,2,1,198,'约12x12cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,2,2,258,'约15x15cm','适合4-5人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,2,3,298,'约16x16cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,2,4,458,'约22x22cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,2,5,750,'约28x28cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,2,6,null,null,null,null,null),
	#三号商品
	(null,3,1,268,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,3,3,398,'约17x17cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,3,4,598,'约23x23cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,3,5,958,'约30x30cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,3,6,null,null,null,null,null),
	#四号商品
	(null,4,1,198,'约13.5x13.5cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,4,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,4,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,4,5,750,'约31x31cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	#五号商品
	(null,5,1,198,'约13.5x13.5cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,5,2,258,'约15.5x15.5cm','适合4-5人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,5,3,298,'约17.5x17.5cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,5,4,458,'约22.5x22.5cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,5,5,750,'约30x30cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,3,6,null,null,null,null,null),
	#六号商品
	(null,6,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,6,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,6,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,6,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	#七号商品
	(null,7,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,7,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,7,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,7,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #八号商品
	(null,8,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,8,3,298,'约17x17cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,8,4,458,'约23x23cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,8,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	#九号商品
	(null,9,1,198,'约12x12cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,9,3,298,'约16x16cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,9,4,458,'约22x22cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,9,5,750,'约28x28cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	#十号商品
	(null,10,1,298,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,10,3,398,'约17x17cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #十一号商品
	(null,11,3,198,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,11,4,268,'约23x23cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,11,5,398,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #12号商品
	(null,12,1,198,'约12.5x12.5cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,12,3,298,'约16.5x16.5cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #13号商品
	(null,13,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,13,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,13,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,13,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #14号商品
	(null,14,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,14,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,14,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,14,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #15号商品
	(null,15,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,15,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,15,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,15,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
  #16号商品
	(null,16,1,198,'约13x13cm','适合3-4人分享','含5套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,16,3,298,'约18x18cm','适合7-8人分享','含10套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,16,4,458,'约24x24cm','适合11-12人分享','含15套餐具（蜡烛需单独订购)','最早明天 13:30配送'),
	(null,16,5,750,'约29x29cm','适合15-20人分享','含20套餐具（蜡烛需单独订购)','最早明天 13:30配送');
	CREATE TABLE commodity_details(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  #所属  商品标签 分类 口味 大标题 重量
  lid INT,                #商品标签
	fid  INT, 							#商品分类
	tid	INT,							  #商品口味
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题	
	exist VARCHAR(32),					#保鲜条件
	sweet INT,									#甜度
  details VARCHAR(1024)      #详细说明	
);
INSERT INTO commodity_details VALUES
  #商品标签 1新品2.生日3.儿童4.聚会5.时令6.优惠款7.情侣8.长辈9.生日10.力建单品
	#商品分类 1.蛋糕2.冰淇淋3.咖啡4.下午茶5.常温蛋糕6.设计师礼品7.面包
	#商品口味1.乳脂奶油2.慕斯3.巧克力4.乳酪5.坚果6.水果7.冰淇淋8.含酒咖啡	
		(null,1,1,1,'米道','天真、天然，是这款蛋糕唯一的出发点','0－4℃保藏12小时，5℃食用为佳',5,'一款专门为儿童设计，以天然植物为基础的蛋糕，非高脂、非高糖。天真、天然是我们做这款蛋糕唯一的出发点'),
		(null,1,1,1,'（新）杰瑞','谁动了我的奶酪？！……','0－4℃保藏12小时，5℃食用为佳',5,null),
		(null,1,1,1,'黑森林','樱桃酒味从巧克力卷的缝隙飘出','0－4℃保藏12小时，5℃食用为佳',4,'樱桃酒味从巧克力卷的缝隙飘出-向往极北的黑森林，纷飞的雪花里有精灵的歌咏'),
		(null,1,1,2,'浅草','浅草才能没马蹄','0－4℃保藏12小时，5℃食用为佳',3,'浅草才能没马蹄-切着吃的雨前西湖龙井，中国绿茶与爽脆果实-工笔勾勒一杯好茶，复杂而纯粹的深浅绿意-本款为季节性产品，夹心层5月10日起为梨'),
		(null,2,1,2,'百利甜情人','新切的水果与刚折的玫瑰，甜美、渐浓','0－4℃保藏12小时，5℃食用为佳',5,'爱尔兰百利甜酒-新西兰奶油-云南玫瑰甘露'),
		(null,2,1,2,'榴莲飘飘','丰厚乳脂奶油，打入足量榴莲果肉','0－4℃保藏12小时，5℃食用为佳',6,'自然成熟的泰国榴莲-在曼谷，官兵后代庭院中，生长着一百年至一百五十年的榴莲树'),
		(null,2,1,3,' 黑白巧克力慕斯 彼尔德（HBD）',' 卡通定制撒粉，简单、柔软','0－4℃保藏12小时，5℃食用为佳',5,'彼尔德联名款--猪年限定版'),
		(null,2,1,3,'枣儿','红枣奶油戚风，与姜撞奶慕斯','0－4℃保藏12小时，5℃食用为佳',4,'红枣奶油戚风，与姜撞奶慕斯-温暖、绵延，日常题材的一闪灵感'),
		(null,3,1,3,'黑白巧克力慕斯 彼尔德（Party）','孩子的世界，简单到非黑即白。','0－4℃保藏12小时，5℃食用为佳',5,' 孩子的世界，简单到非黑即白。-去除原有酒精成分-小孩子也可以放心塞进嘴里'),
		(null,3,1,4,'米道','一款专为孩子设计的蛋糕','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明'),
		(null,3,1,4,'芒果奶油蛋糕','cake配方芒果百香果慕斯夹心','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明'),
		(null,3,1,5,'百香果酸乳酪慕斯（木糖醇）','冰淇淋口感，不同层次的酸与冰凉','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明'),
		(null,4,1,5,' 6口味切块','多口味，精装小份','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明'),
		(null,4,1,6,'黑白巧克力慕斯','白巧克力慕斯的甜，与黑巧克力酱的苦','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明'),
		(null,4,1,6,'朗姆芝士','清香柠檬与乳酪夹心，微苦、微醺','0－4℃保藏12小时，5℃食用为佳',2,'产品详细说明'),
		(null,4,1,7,'冻慕斯与焗芝士','马斯卡彭慕斯，叠加法国软芝士','0－4℃保藏12小时，5℃食用为佳',5,'产品详细说明');
INSERT INTO pic VALUES	
#1
(null,1,1,'1-1-sm.png','1-1-md.png','1-1-lg.png','1-1-w.png'),
(null,1,2,'1-2-sm.png','1-1-md.png','1-2-lg.png','1-1-w.png'),
(null,1,3,'1-3-sm.png','1-1-md.png','1-3-lg.png','1-1-w.png'),
(null,1,4,'1-4-sm.png','1-1-md.png','1-4-lg.png','1-1-w.png'),
(null,1,5,null,'1-1-md.png',null,'1-1-w.png'),
(null,1,6,null,'1-1-md.png',null,'1-1-w.png'),
#2
(null,2,1,'2-1-sm.png','2-1-md.png','2-1-lg.png','2-1-w.png'),
(null,2,2,'2-2-sm.png','2-1-md.png','2-2-lg.png','2-2-w.png'),
(null,2,3,'2-3-sm.png','2-1-md.png','2-3-lg.png','2-3-w.png'),
(null,2,4,'2-4-sm.png','2-1-md.png','2-4-lg.png','2-4-w.png'),
(null,2,5,null,'1-1-md.png',null,'2-5-w.png'),
(null,2,6,null,'1-1-md.png',null,'2-6-w.png'),
#3
(null,3,1,'3-1-sm.png','3-1-md.png','3-1-lg.png','3-1-w.png'),
(null,3,2,'3-2-sm.png','3-1-md.png','3-2-lg.png','3-1-w.png'),
(null,3,3,'3-3-sm.png','3-1-md.png','3-3-lg.png','3-1-w.png'),
(null,3,4,'3-4-sm.png','3-1-md.png','3-4-lg.png','3-1-w.png'),
(null,3,5,null,'3-1-md.png',null,'3-1-w.png'),
(null,3,6,null,'3-1-md.png',null,'3-1-w.png'),
#4
(null,4,1,'4-1-sm.png','4-1-md.png','4-1-lg.png','4-1-w.png'),
(null,4,2,'4-2-sm.png','4-1-md.png','4-2-lg.png','4-2-w.png'),
(null,4,3,'4-3-sm.png','4-1-md.png','4-3-lg.png','4-3-w.png'),
(null,4,4,'4-4-sm.png','4-1-md.png','4-4-lg.png','4-4-w.png'),
(null,4,5,null,'4-1-md.png',null,null),
(null,4,6,null,'4-1-md.png',null,null),
#5
(null,5,1,'5-1-sm.png','5-1-md.png','5-1-lg.png','5-1-w.png'),
(null,5,2,'5-2-sm.png','5-1-md.png','5-2-lg.png','5-2-w.png'),
(null,3,3,'5-3-sm.png','5-1-md.png','5-3-lg.png','5-3-w.png'),
(null,3,4,'5-4-sm.png','5-1-md.png','5-4-lg.png','5-4-w.png'),
(null,3,5,null,'5-1-md.png',null,'5-5-w.png'),
(null,3,6,null,'5-1-md.png',null,'5-6-w.png'),
#6
(null,3,1,'6-1-sm.png','6-1-md.png','3-1-lg.png','6-1-w.png'),
(null,3,2,'6-2-sm.png','6-1-md.png','3-2-lg.png','6-2-w.png'),
(null,3,3,'6-3-sm.png','6-1-md.png','3-3-lg.png','6-3-w.png'),
(null,3,4,'6-4-sm.png','6-1-md.png','3-4-lg.png','6-4-w.png'),
(null,3,5,null,'6-1-md.png',null,'6-5-w.png'),
(null,3,6,null,'6-1-md.png',null,'6-6-w.png'),
#7
(null,3,1,'7-1-sm.png','7-1-md.png','7-1-lg.png','7-1-w.png'),
(null,3,2,'7-2-sm.png','7-1-md.png','7-2-lg.png','7-2-w.png'),
(null,3,3,'7-3-sm.png','7-1-md.png','7-3-lg.png','7-3-w.png'),
(null,3,4,'7-4-sm.png','7-1-md.png','7-4-lg.png','7-4-w.png'),
(null,3,5,null,'7-1-md.png',null,'7-5-w.png'),
(null,3,6,null,'7-1-md.png',null,'7-6-w.png'),
#8
(null,3,1,'8-1-sm.png','8-1-md.png','8-1-lg.png','8-1-w.png'),
(null,3,2,'8-2-sm.png','8-1-md.png','8-2-lg.png','8-2-w.png'),
(null,3,3,'8-3-sm.png','8-1-md.png','8-3-lg.png','8-3-w.png'),
(null,3,4,'8-4-sm.png','8-1-md.png','8-4-lg.png','8-4-w.png'),
(null,3,5,null,'8-1-md.png',null,'8-5-w.png'),
(null,3,6,null,'8-1-md.png',null,'8-6-w.png'),

#9
(null,3,1,'9-1-sm.png','9-1-md.png','9-1-lg.png','9-1-w.png'),
(null,3,2,'9-2-sm.png','9-1-md.png','9-2-lg.png','9-2-w.png'),
(null,3,3,'9-3-sm.png','9-1-md.png','9-3-lg.png','9-3-w.png'),
(null,3,4,'9-4-sm.png','9-1-md.png','9-4-lg.png','9-4-w.png'),
(null,3,5,null,'9-1-md.png',null,'9-5-w.png'),
(null,3,6,null,'9-1-md.png',null,'9-6-w.png'),
#10
(null,3,1,'10-1-sm.png','10-1-md.png','10-1-lg.png','10-1-w.png'),
(null,3,2,'10-2-sm.png','10-1-md.png','10-2-lg.png','10-2-w.png'),
(null,3,3,'10-3-sm.png','10-1-md.png','10-3-lg.png','10-3-w.png'),
(null,3,4,'10-4-sm.png','10-1-md.png','10-4-lg.png','10-4-w.png'),
(null,3,5,null,'10-1-md.png',null,'10-5-w.png'),
(null,3,6,null,'10-1-md.png',null,'10-6-w.png'),
#11
(null,3,1,'11-1-sm.png','11-1-md.png','11-1-lg.png','11-1-w.png'),
(null,3,2,'11-2-sm.png','11-1-md.png','11-2-lg.png','11-2-w.png'),
(null,3,3,'11-3-sm.png','11-1-md.png','11-3-lg.png','11-3-w.png'),
(null,3,4,'11-4-sm.png','11-1-md.png','11-4-lg.png','11-4-w.png'),
(null,3,5,null,'11-1-md.png',null,'11-5-w.png'),
(null,3,6,null,'11-1-md.png',null,'11-6-w.png'),
#12
(null,3,1,'12-1-sm.png','12-1-md.png','12-1-lg.png','12-1-w.png'),
(null,3,2,'12-2-sm.png','12-1-md.png','12-2-lg.png','12-2-w.png'),
(null,3,3,'12-3-sm.png','12-1-md.png','12-3-lg.png','12-3-w.png'),
(null,3,4,'12-4-sm.png','12-1-md.png','12-4-lg.png','12-4-w.png'),
(null,3,5,null,'12-1-md.png',null,'12-5-w.png'),
(null,3,6,null,'12-1-md.png',null,'12-6-w.png'),
#13
(null,3,1,'13-1-sm.png','13-1-md.png','13-1-lg.png','13-1-w.png'),
(null,3,2,'13-2-sm.png','13-1-md.png','13-2-lg.png','13-2-w.png'),
(null,3,3,'13-3-sm.png','13-1-md.png','13-3-lg.png','13-3-w.png'),
(null,3,4,'13-4-sm.png','13-1-md.png','13-4-lg.png','13-4-w.png'),
(null,3,5,null,'13-1-md.png',null,'3-5-w.png'),
(null,3,6,null,'13-1-md.png',null,'3-6-w.png'),
#14
(null,3,1,'14-1-sm.png','14-1-md.png','14-1-lg.png','14-1-w.png'),
(null,3,2,'14-2-sm.png','14-1-md.png','14-2-lg.png','14-2-w.png'),
(null,3,3,'14-3-sm.png','14-1-md.png','14-3-lg.png','14-3-w.png'),
(null,3,4,'14-4-sm.png','14-1-md.png','14-4-lg.png','14-4-w.png'),
(null,3,5,null,'14-1-md.png',null,'14-5-w.png'),
(null,3,6,null,'14-1-md.png',null,'14-6-w.png'),
#15
(null,3,1,'15-1-sm.png','15-1-md.png','15-1-lg.png','15-1-w.png'),
(null,3,2,'15-2-sm.png','15-1-md.png','15-2-lg.png','15-2-w.png'),
(null,3,3,'15-3-sm.png','15-1-md.png','15-3-lg.png','15-3-w.png'),
(null,3,4,'15-4-sm.png','15-1-md.png','15-4-lg.png','15-4-w.png'),
(null,3,5,null,'15-1-md.png',null,'15-5-w.png'),
(null,3,6,null,'15-1-md.png',null,'15-6-w.png'),
#16
(null,3,1,'16-1-sm.png','16-1-md.png','16-1-lg.png','16-1-w.png'),
(null,3,2,'16-2-sm.png','16-1-md.png','16-2-lg.png','16-2-w.png'),
(null,3,3,'16-3-sm.png','16-1-md.png','16-3-lg.png','16-3-w.png'),
(null,3,4,'16-4-sm.png','16-1-md.png','16-4-lg.png','16-4-w.png'),
(null,3,5,null,'16-1-md.png',null,'16-5-w.png'),
(null,3,6,null,'16-1-md.png',null,'16-6-w.png');
CREATE TABLE limg(
  lgid INT PRIMARY KEY AUTO_INCREMENT,
  lid INT,                #商品标签
	img1 VARCHAR(32),
	img2 VARCHAR(32)
);
INSERT into limg VALUES
(null,1,"1-1-md.png","label-1-lg.png"),
(null,1,"2-1-md.png","label-1-lg.png"),
(null,1,"3-1-md.png","label-1-lg.png"),
(null,1,"4-1-md.png","label-1-lg.png"),
(null,2,"5-1-md.png","label-2-lg.png"),
(null,2,"6-1-md.png","label-2-lg.png"),
(null,2,"7-1-md.png","label-2-lg.png"),
(null,2,"8-1-md.png","label-2-lg.png"),


(null,3,"9-1-md.png","label-3-lg.png"),
(null,3,"10-1-md.png","label-3-lg.png"),
(null,3,"11-1-md.png","label-3-lg.png"),
(null,3,"12-1-md.png","label-3-lg.png"),

(null,4,"13-1-md.png","label-4-lg.png"),
(null,4,"14-1-md.png","label-4-lg.png"),
(null,4,"15-1-md.png","label-4-lg.png"),
(null,4,"16-1-md.png","label-4-lg.png");
