BEGIN;

-- 创建表client
CREATE TABLE client
(
    c_id INT PRIMARY KEY,
    c_name VARCHAR(100) NOT NULL,
    c_mail CHAR(30) UNIQUE,
    c_id_card CHAR(20) UNIQUE NOT NULL,
    c_phone CHAR(20) UNIQUE NOT NULL,
    c_password CHAR(20) NOT NULL
);

-- 创建表bank_card
CREATE TABLE bank_card
(
    b_number CHAR(30) PRIMARY KEY,
    b_type CHAR(20),
    b_c_id INT NOT NULL
);
-- 给表bank_card添加外键约束
ALTER TABLE bank_card ADD CONSTRAINT fk_c_id FOREIGN KEY (b_c_id) REFERENCES client(c_id) ON DELETE CASCADE;

-- 创建表finances_product
CREATE TABLE finances_product
(
    p_name VARCHAR(100) NOT NULL,
    p_id INT PRIMARY KEY,
    p_description CLOB,
    p_amount INT,
    p_year INT
);

-- 创建表insurance
CREATE TABLE insurance
(
    i_name VARCHAR(100) NOT NULL,
    i_id INT PRIMARY KEY,
    i_amount INT,
    i_person CHAR(20),
    i_year INT,
    i_project VARCHAR(200)
);

-- 创建表fund
CREATE TABLE fund
(
    f_name VARCHAR(100) NOT NULL,
    f_id INT PRIMARY KEY,
    f_type CHAR(20),
    f_amount INT,
    risk_level CHAR(20) NOT NULL,
    f_manager INT NOT NULL
);

-- 创建表property
CREATE TABLE property
(
    pro_c_id INT NOT NULL,
    pro_id INT PRIMARY KEY,
    pro_status CHAR(20),
    pro_quantity INT,
    pro_income INT,
    pro_purchase_time DATE
);
-- 给表property添加外键约束
ALTER TABLE property ADD CONSTRAINT fk_pro_c_id FOREIGN KEY (pro_c_id) REFERENCES client(c_id) ON DELETE CASCADE;

-- 插入数据
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (1,'张一','zhangyi@opengauss.org','340211190001010001','17515650001','gaussdb_001');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (2,'张二','zhanger@opengauss.org','340211190001010002','17515650002','gaussdb_002');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (3,'张三','zhangsan@opengauss.org','340211190001010003','17515650003','gaussdb_003');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (4,'张四','zhangsi@opengauss.org','340211190001010004','17515650004','gaussdb_004');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (5,'张五','zhangwu@opengauss.org','340211190001010005','17515650005','gaussdb_005');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (6,'张六','zhangliu@opengauss.org','340211190001010006','17515650006','gaussdb_006');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (7,'张七','zhangqi@opengauss.org','340211190001010007','17515650007','gaussdb_007');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (8,'张八','zhangba@opengauss.org','340211190001010008','17515650008','gaussdb_008');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (9,'张九','zhangjiu@opengauss.org','340211190001010009','17515650009','gaussdb_009');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (10,'李一','liyi@opengauss.org','340211190001010010','17515650010','gaussdb_010');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (11,'李二','lier@opengauss.org','340211190001010011','17515650011','gaussdb_011');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (12,'李三','lisan@opengauss.org','340211190001010012','17515650012','gaussdb_012');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (13,'李四','lisi@opengauss.org','340211190001010013','17515650013','gaussdb_013');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (14,'李五','liwu@opengauss.org','340211190001010014','17515650014','gaussdb_014');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (15,'李六','liliu@opengauss.org','340211190001010015','17515650015','gaussdb_015');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (16,'李七','liqi@opengauss.org','340211190001010016','17515650016','gaussdb_016');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (17,'李八','liba@opengauss.org','340211190001010017','17515650017','gaussdb_017');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (18,'李九','lijiu@opengauss.org','340211190001010018','17515650018','gaussdb_018');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (19,'王一','wangyi@opengauss.org','340211190001010019','17515650019','gaussdb_019');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (20,'王二','wanger@opengauss.org','340211190001010020','17515650020','gaussdb_020');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (21,'王三','wangsan@opengauss.org','340211190001010021','17515650021','gaussdb_021');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (22,'王四','wangsi@opengauss.org','340211190001010022','17515650022','gaussdb_022');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (23,'王五','wangwu@opengauss.org','340211190001010023','17515650023','gaussdb_023');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (24,'王六','wangliu@opengauss.org','340211190001010024','17515650024','gaussdb_024');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (25,'王七','wangqi@opengauss.org','340211190001010025','17515650025','gaussdb_025');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (26,'王八','wangba@opengauss.org','340211190001010026','17515650026','gaussdb_026');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (27,'王九','wangjiu@opengauss.org','340211190001010027','17515650027','gaussdb_027');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (28,'钱一','qianyi@opengauss.org','340211190001010028','17515650028','gaussdb_028');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (29,'钱二','qianer@opengauss.org','340211190001010029','17515650029','gaussdb_029');
INSERT INTO client(c_id,c_name,c_mail,c_id_card,c_phone,c_password) VALUES (30,'钱三','qiansan@opengauss.org','340211190001010030','17515650030','gaussdb_030');

INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000001','信用卡',1);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000002','信用卡',3);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000003','信用卡',5);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000004','信用卡',7);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000005','信用卡',9);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000006','信用卡',10);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000007','信用卡',12);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000008','信用卡',14);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000009','信用卡',16);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000010','信用卡',18);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000011','储蓄卡',19);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000012','储蓄卡',21);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000013','储蓄卡',7);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000014','储蓄卡',23);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000015','储蓄卡',24);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000016','储蓄卡',3);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000017','储蓄卡',26);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000018','储蓄卡',27);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000019','储蓄卡',12);
INSERT INTO bank_card(b_number,b_type,b_c_id) VALUES ('6222021302020000020','储蓄卡',29);

INSERT INTO finances_product(p_name,p_id,p_description,p_amount,p_year) VALUES ('债券',1,'以国债、金融债、央行票据、企业债为主要投资方向的银行理财产品。',50000,6);
INSERT INTO finances_product(p_name,p_id,p_description,p_amount,p_year) VALUES ('信贷资产',2,'一般指银行作为委托人将通过发行理财产品募集资金委托给信托公司，信托公司作为受托人成立信托计>划，将信托资产购买理财产品发售银行或第三方信贷资产。',50000,6);
INSERT INTO finances_product(p_name,p_id,p_description,p_amount,p_year) VALUES ('股票',3,'与股票挂钩的理财产品。目前市场上主要以港股挂钩居多',50000,6);
INSERT INTO finances_product(p_name,p_id,p_description,p_amount,p_year) VALUES ('大宗商品',4,'与大宗商品期货挂钩的理财产品。目前市场上主要以挂钩黄金、石油、农产品的理财产品居多。',50000,6);

INSERT INTO insurance(i_name,i_id,i_amount,i_person,i_year,i_project) VALUES ('健康保险',1,2000,'老人',30,'平安保险');
INSERT INTO insurance(i_name,i_id,i_amount,i_person,i_year,i_project) VALUES ('人寿保险',2,3000,'老人',30,'平安保险');
INSERT INTO insurance(i_name,i_id,i_amount,i_person,i_year,i_project) VALUES ('意外保险',3,5000,'所有人',30,'平安保险');
INSERT INTO insurance(i_name,i_id,i_amount,i_person,i_year,i_project) VALUES ('医疗保险',4,2000,'所有人',30,'平安保险');
INSERT INTO insurance(i_name,i_id,i_amount,i_person,i_year,i_project) VALUES ('财产损失保险',5,1500,'中年人',30,'平安保险');

INSERT INTO fund(f_name,f_id,f_type,f_amount,risk_level,f_manager) VALUES ('股票',1,'股票型',10000,'高',1);
INSERT INTO fund(f_name,f_id,f_type,f_amount,risk_level,f_manager) VALUES ('投资',2,'债券型',10000,'中',2);
INSERT INTO fund(f_name,f_id,f_type,f_amount,risk_level,f_manager) VALUES ('国债',3,'货币型',10000,'低',3);
INSERT INTO fund(f_name,f_id,f_type,f_amount,risk_level,f_manager) VALUES ('沪深300指数',4,'指数型',10000,'中',4);

INSERT INTO property(pro_c_id,pro_id,pro_status,pro_quantity,pro_income,pro_purchase_time) VALUES (5,1,'可用',4,8000,'2018-07-01');
INSERT INTO property(pro_c_id,pro_id,pro_status,pro_quantity,pro_income,pro_purchase_time) VALUES (10,2,'可用',4,8000,'2018-07-01');
INSERT INTO property(pro_c_id,pro_id,pro_status,pro_quantity,pro_income,pro_purchase_time) VALUES (15,3,'可用',4,8000,'2018-07-01');
INSERT INTO property(pro_c_id,pro_id,pro_status,pro_quantity,pro_income,pro_purchase_time) VALUES (20,4,'冻结',4,8000,'2018-07-01');

COMMIT;



