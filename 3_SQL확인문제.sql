# Date: 2021/08/03
# Name: 김예은
# Content : SQL 확인문제

#실습하기 3-1
CREATE TABLE tbl_member (
	memberID VARCHAR(8) PRIMARY KEY,
	memberName VARCHAR(5) NOT NULL,
	memberAddress VARCHAR(20)
);

CREATE TABLE tbl_product (
	productName VARCHAR(4) PRIMARY KEY,
	cost INT NOT NULL,
	`makeDate` DATE,
	company VARCHAR(5),
	amount INT NOT NULL	
);

#실습하기 3-2
INSERT INTO `tbl_member` VALUES ('jang','장보고','완도군');
INSERT INTO `tbl_member` VALUES ('kang','강감찬','서울시');
INSERT INTO `tbl_member` VALUES ('kim','김유신',(NULL));
INSERT INTO `tbl_member` VALUES ('lee','이순신','서울시');

INSERT INTO `tbl_product` VALUES ('냉장고',80,20210517,'LG',1);
INSERT INTO `tbl_product` VALUES ('노트북',1500,20210517,'삼성',5);
INSERT INTO `tbl_product` VALUES ('컴퓨터',1000,20210517,'LG',10);

#실습하기 3-3
SELECT *FROM `tbl_member` WHERE memberAddress='서울시';