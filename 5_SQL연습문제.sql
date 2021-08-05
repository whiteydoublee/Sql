# 날짜: 2021/08/05
# 이름: 김예은
# 내용: SQL 연습문제 

#실습1
CREATE TABLE `BOOK`(
	bookid INT AUTO_INCREMENT PRIMARY KEY,
	bookname VARCHAR(30), 
	publisher VARCHAR(10),
	price INT 
);

INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('축구의 역사','굿스포츠',7000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('축구 아는 여자','나무수',13000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('축구의 이해','대한미디어',22000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('골프 바이블','대한미디어',35000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('피겨 교본','굿스포츠',8000);

INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('역도 단계별기술','굿스포츠',6000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('야구의 추억','이상미디어',20000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('야구를 부탁해','이상미디어',13000);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('올림픽 이야기','삼성당',7500);
INSERT INTO `BOOK`(`bookname`,`publisher`,`price`) VALUES ('Olympic Champions','Pearson',13000);

#실습2
CREATE TABLE `CUSTOMER`(
	custid INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone VARCHAR(13)
);

INSERT INTO `CUSTOMER`(`name`,address,phone) VALUES('박지성','영국 맨체슽터','000-5000-0001');
INSERT INTO `CUSTOMER`(`name`,address,phone) VALUES('김연아','대한민국 서울','000-6000-0001');
INSERT INTO `CUSTOMER`(`name`,address,phone) VALUES('장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `CUSTOMER`(`name`,address,phone) VALUES('추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `CUSTOMER`(`name`,address,phone) VALUES('박세리','대한민국 대전',(NULL));

#실습3
CREATE TABLE `Orders` (
	orderid INT AUTO_INCREMENT PRIMARY KEY,
	custid TINYINT,
	bookid TINYINT,
	saleprice INT,
	orderdate DATE
);

INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (1,1,6000,'2014-07-01');
yeeunkim0701INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (1,3,21000,'2014-07-03');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (2,5,8000,'2014-07-03');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (3,6,6000,'2014-07-04');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (4,7,20000,'2014-07-05');

INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (1,2,12000,'2014-07-07');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (4,8,13000,'2014-07-07');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Orders`(custid, bookid, saleprice,orderdate) VALUES (3,8,13000,'2014-07-10');

#실습4
SELECT custid, `name`,`address` FROM `CUSTOMER`;

#실습5
SELECT * FROM `BOOK`;

#실습6
SELECT DISTINCT `publisher` FROM `BOOK`;

#실습7
SELECT * FROM `BOOK` WHERE `price`<20000;

#실습8
SELECT * FROM `BOOK` WHERE `price` >=10000 AND `price`<=20000;
SELECT * FROM `BOOK` WHERE `price` BETWEEN 10000 AND 20000;

#실습9
SELECT * FROM `BOOK` WHERE `publisher`='굿스포츠' OR `publisher`='대한미디어';
SELECT* FROM `BOOK` WHERE `publisher` IN('굿스포츠','대한미디어');


#실습10
SELECT `publisher` FROM `BOOK` WHERE `bookname`='축구의 역사';


#실습11
SELECT `publisher` FROM `BOOK` WHERE `bookname` LIKE '%축구%';

#실습12

SELECT * FROM `BOOK` WHERE `bookname` LIKE '_구%';

#실습 13
SELECT * FROM `BOOK` WHERE `price`>=20000 AND `bookname` LIKE '%축구%';

#실습 14
SELECT * FROM `BOOK` ORDER BY `bookname` ASC ;

#실습 15
SELECT * FROM `BOOK` 
GROUP BY `bookname`
ORDER BY `price` ASC;

SELECT * FROM `BOOK` 
ORDER BY `price` ASC, `bookname` ASC;

#실습 16
SELECT * FROM `BOOK` 
GROUP BY `publisher`,`price` ASC
ORDER BY `price` DESC;

SELECT * FROM `BOOK` ORDER BY `price` DESC, publisher ASC;

#실습 17
SELECT SUM(saleprice) AS '총판매액' FROM `Orders`;

#실습 18
SELECT SUM(saleprice) AS '총판매액'
FROM `Orders`
JOIN `CUSTOMER` USING(custid)
WHERE `custid`=2;

SELECT SUM(`saleprice`) AS `총매출` FROM `Orders` WHERE `custid`=2;


#실습 19
SELECT SUM(saleprice) AS '총판매액',
AVG(saleprice) AS '평균값',
MIN(saleprice) AS '최저가', MAX(saleprice) AS '최고가'
FROM `Orders`;

#실습 20
SELECT count(orderid) AS '판매건수'
FROM `Orders`;

SELECT count(*) AS '판매건수'
FROM `Orders`;

#실습21
SELECT a.custid, COUNT(bookid)
FROM `Orders` AS a

SELECT custid, COUNT(*) AS `수량` 
FROM `Orders` WHERE `saleprice`>=8000
GROUP BY `custid`
HAVING `수량`>=2; 

#실습 22
SELECT * FROM `Orders`
RIGHT JOIN `CUSTOMER` USING (`custid`);

SELECT * FROM `CUSTOMER` AS a
JOIN `Orders` AS b
ON a.custid=b.custid;

SELECT * FROM `CUSTOMER`,`Orders` 
WHERE `Customer`.custid=`Orders`.custid;

#실습 23
SELECT * FROM `Orders`
RIGHT JOIN `CUSTOMER` USING (`custid`)
ORDER BY `custid` ASC;

SELECT * FROM `CUSTOMER` AS a
JOIN `Orders` AS b
ON a.custid=b.custid
ORDER BY a.custid;

#실습24
SELECT b.`name`, a.saleprice 
FROM `Orders` AS a
JOIN `CUSTOMER` AS b USING (`custid`);

SELECT a.`name`,b.saleprice FROM `CUSTOMER` AS a
JOIN `Orders` AS b ON a.custid=b.custid;

#실습 25
SELECT b.`name`, SUM(saleprice) 
FROM `Orders` AS a
JOIN `CUSTOMER` AS b 
USING (`custid`)
GROUP BY b.`name`;

SELECT a.`name`,SUM(saleprice) FROM `CUSTOMER` AS a
JOIN `Orders` AS b
ON a.custid=b.custid
GROUP BY a.`custid`
ORDER BY `name`;

#실습26
SELECT a.`name`, c.bookname
FROM `CUSTOMER` AS a
JOIN `Orders` AS b
USING (`custid`)
JOIN `BOOK` AS c ON b.bookid = c.bookid;

SELECT a.`name`, bookname FROM `CUSTOMER` AS a
JOIN `Orders` AS b ON a.custid=b.custid
JOIN `BOOK` AS c ON b.bookid=c.bookid;

#실습 27
SELECT a.`name`, c.bookname
FROM `CUSTOMER` AS a
JOIN `Orders` AS b
USING (`custid`)
JOIN `BOOK` AS c ON b.bookid = c.bookid
WHERE saleprice =20000;

SELECT a.`name`, bookname FROM `CUSTOMER` AS a
JOIN `Orders` AS b ON a.custid=b.custid
JOIN `BOOK` AS c ON b.bookid=c.bookid
WHERE saleprice =20000;

#실습 28
SELECT `bookname`,MAX(price) 
FROM `BOOK`;

SELECT `bookname` FROM `BOOK` WHERE `price`=(SELECT MAX(price) FROM `BOOK`);

#실습 29
INSERT INTO`BOOK`(bookname, publisher,price)  VALUE('스포츠의학','한솔의학서적',90000);

#실습30
INSERT INTO `BOOK`(bookname, publisher,price) VALUE('스포츠의학','한솔의학서적',(NULL));
INSERT INTO `BOOK` (bookname, publisher) VALUE ('스포츠의학','한솔의학서적');

#실습 31
UPDATE `CUSTOMER`SET `address`='대한민국 부산' WHERE custid=5;

#실습32
DELETE FROM `CUSTOMER` WHERE custid=5;


