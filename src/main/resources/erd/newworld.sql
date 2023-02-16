SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS BOARD_FNA;
DROP TABLE IF EXISTS BOARD_NOTE;
DROP TABLE IF EXISTS BOARD_QNA;
DROP TABLE IF EXISTS NEW_TABLE;
DROP TABLE IF EXISTS RESERV_INFO;
DROP TABLE IF EXISTS FOREIGN_GOODS_INFO;
DROP TABLE IF EXISTS HOME_GOODS_INFO;
DROP TABLE IF EXISTS FLIGHT_INFO;
DROP TABLE IF EXISTS USER_INFO;




/* Create Tables */

CREATE TABLE BOARD_FNA
(
	BF_NUM int NOT NULL,
	BF_TITLE varchar(200),
	BF_CATEGORY varchar(50),
	BF_CONTENT text,
	BF_CREDAT varchar(20),
	PRIMARY KEY (BF_NUM)
);


CREATE TABLE BOARD_NOTE
(
	BN_NUM int NOT NULL AUTO_INCREMENT,
	BN_TITLE varchar(200),
	BN_WRITER varchar(100),
	BN_CONTENT text,
	BN_CATEGORY varchar(50),
	BN_CREDAT varchar(50),
	PRIMARY KEY (BN_NUM)
);


CREATE TABLE BOARD_QNA
(
	BQ_NUM int NOT NULL AUTO_INCREMENT,
	BQ_TITLE varchar(50),
	BQ_CONTENT text,
	BQ_CREDAT varchar(20),
	BQ_CATEGORY varchar(20),
	UI_NUM int NOT NULL,
	PRIMARY KEY (BQ_NUM)
);


CREATE TABLE FLIGHT_INFO
(
	FI_NUM int NOT NULL AUTO_INCREMENT,
	FI_CODE varchar(100) NOT NULL,
	FI_PLANE varchar(200),
	FI_START varchar(200),
	FI_ARR varchar(200),
	FI_DEPARTURE varchar(200),
	FI_DESTINATION varchar(200),
	PRIMARY KEY (FI_NUM),
	UNIQUE (FI_CODE)
);


CREATE TABLE FOREIGN_GOODS_INFO
(
	FO_GI_NUM int NOT NULL AUTO_INCREMENT,
	FO_GI_NAME varchar(20),
	FO_GI_CODE varchar(20),
	FO_GI_PERIOD varchar(10),
	FO_GI_PRICE_AUDLT varchar(50),
	FO_GI_PRICE_KID varchar(50),
	FO_GI_PRICE_BABY varchar(50),
	FO_GI_IMAGE varchar(200),
	FI_NUM int NOT NULL,
	FI_CODE varchar(50),
	PRIMARY KEY (FO_GI_NUM)
);


CREATE TABLE HOME_GOODS_INFO
(
	HO_GI_NUM int NOT NULL AUTO_INCREMENT,
	HO_GI_NAME varchar(20),
	HO_GI_CODE varchar(20),
	HO_GI_PERIOD varchar(10),
	HO_GI_PRICE_ADULT varchar(50),
	HO_GI_PRICE_KID varchar(50),
	HO_GI_PRICE_BABY varchar(50),
	HO_GI_IMAGE varchar(200),
	FI_CODE varchar(50),
	FI_NUM int NOT NULL,
	PRIMARY KEY (HO_GI_NUM)
);


CREATE TABLE NEW_TABLE
(
	RI_NUM int NOT NULL
);


CREATE TABLE RESERV_INFO
(
	RI_NUM int NOT NULL AUTO_INCREMENT,
	RI_CODE varchar(100),
	RI_PURCHASE_DATE varchar(20),
	RI_A_NAME varchar(50),
	RI_A_BIRTH varchar(8),
	RI_A_PHONE varchar(11),
	RI_A_EMAIL varchar(100),
	RI_ADULT_COUNT int,
	RI_KIDS_COUNT int,
	RI_BABY_COUNT int,
	FO_GI_NUM int NOT NULL,
	UI_NUM int NOT NULL,
	PRIMARY KEY (RI_NUM)
);


CREATE TABLE USER_INFO
(
	UI_NUM int NOT NULL AUTO_INCREMENT,
	UI_ID varchar(10) NOT NULL,
	UI_PWD varchar(50) NOT NULL,
	UI_NAME varchar(50) NOT NULL,
	UI_EMAIL varchar(50),
	UI_ZIP char(5),
	UI_ADDR1 varchar(200),
	UI_ADDR2 varchar(200),
	UI_PHONE char(11),
	PRIMARY KEY (UI_NUM),
	UNIQUE (UI_ID)
);



/* Create Foreign Keys */

ALTER TABLE FOREIGN_GOODS_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FLIGHT_INFO (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE HOME_GOODS_INFO
	ADD FOREIGN KEY (FI_NUM)
	REFERENCES FLIGHT_INFO (FI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESERV_INFO
	ADD FOREIGN KEY (FO_GI_NUM)
	REFERENCES FOREIGN_GOODS_INFO (FO_GI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (RI_NUM)
	REFERENCES RESERV_INFO (RI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE BOARD_QNA
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE RESERV_INFO
	ADD FOREIGN KEY (UI_NUM)
	REFERENCES USER_INFO (UI_NUM)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



