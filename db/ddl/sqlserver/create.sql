CREATE TABLE BATCH_REQUEST (
  BATCH_REQUEST_ID VARCHAR(100) NOT NULL ,
  BATCH_REQUEST_NAME VARCHAR(100) NOT NULL ,
  PROCESS_HALT_FLG CHAR(1) NOT NULL ,
  PROCESS_ACTIVE_FLG CHAR(1) NOT NULL ,
  SERVICE_AVAILABLE CHAR(1) NOT NULL ,
  RESUME_POINT BIGINT NOT NULL
);
CREATE TABLE BUSINESS_DATE (
  SEGMENT_ID CHAR(2) NOT NULL ,
  BIZ_DATE CHAR(8) NOT NULL
);
CREATE TABLE CODE_NAME (
  CODE_ID CHAR(8) NOT NULL ,
  CODE_VALUE VARCHAR(2) NOT NULL ,
  LANG CHAR(2) NOT NULL ,
  SORT_ORDER INT NOT NULL ,
  CODE_NAME VARCHAR(50) NOT NULL ,
  SHORT_NAME VARCHAR(50) NULL ,
  OPTION01 VARCHAR(50) NULL ,
  OPTION02 VARCHAR(50) NULL ,
  OPTION03 VARCHAR(50) NULL ,
  OPTION04 VARCHAR(50) NULL ,
  OPTION05 VARCHAR(50) NULL ,
  OPTION06 VARCHAR(50) NULL ,
  OPTION07 VARCHAR(50) NULL ,
  OPTION08 VARCHAR(50) NULL ,
  OPTION09 VARCHAR(50) NULL ,
  OPTION10 VARCHAR(50) NULL
);
CREATE TABLE CODE_PATTERN (
  CODE_ID CHAR(8) NOT NULL ,
  CODE_VALUE VARCHAR(2) NOT NULL ,
  PATTERN01 CHAR(1) NOT NULL ,
  PATTERN02 CHAR(1) NULL ,
  PATTERN03 CHAR(1) NULL ,
  PATTERN04 CHAR(1) NULL ,
  PATTERN05 CHAR(1) NULL ,
  PATTERN06 CHAR(1) NULL ,
  PATTERN07 CHAR(1) NULL ,
  PATTERN08 CHAR(1) NULL ,
  PATTERN09 CHAR(1) NULL ,
  PATTERN10 CHAR(1) NULL ,
  PATTERN11 CHAR(1) NULL ,
  PATTERN12 CHAR(1) NULL ,
  PATTERN13 CHAR(1) NULL ,
  PATTERN14 CHAR(1) NULL ,
  PATTERN15 CHAR(1) NULL ,
  PATTERN16 CHAR(1) NULL ,
  PATTERN17 CHAR(1) NULL ,
  PATTERN18 CHAR(1) NULL ,
  PATTERN19 CHAR(1) NULL ,
  PATTERN20 CHAR(1) NULL
);
CREATE TABLE MAIL_ATTACHED_FILE (
  MAIL_REQUEST_ID VARCHAR(20) NOT NULL ,
  SERIAL_NUMBER NUMERIC(10) NOT NULL ,
  FILE_NAME VARCHAR(150) NOT NULL ,
  CONTENT_TYPE VARCHAR(50) NOT NULL ,
  ATTACHED_FILE VARBINARY(MAX) NOT NULL
);
CREATE TABLE MAIL_RECIPIENT (
  MAIL_REQUEST_ID VARCHAR(20) NOT NULL ,
  SERIAL_NUMBER BIGINT NOT NULL ,
  RECIPIENT_TYPE CHAR(1) NOT NULL ,
  MAIL_ADDRESS VARCHAR(254) NOT NULL
);
CREATE TABLE MAIL_REQUEST (
  MAIL_REQUEST_ID VARCHAR(20) NOT NULL ,
  MAIL_SEND_PATTERN_ID VARCHAR(2) NULL ,
  SUBJECT VARCHAR(150) NOT NULL ,
  MAIL_BODY VARCHAR(4000) NOT NULL ,
  MAIL_FROM VARCHAR(254) NOT NULL ,
  REPLY_TO VARCHAR(254) NOT NULL ,
  RETURN_PATH VARCHAR(254) NOT NULL ,
  CHARSET VARCHAR(50) NOT NULL ,
  STATUS CHAR(1) NOT NULL ,
  REQUEST_DATETIME DATETIME2 NULL ,
  SEND_DATETIME DATETIME2 NULL,
  PROCESS_ID CHAR(36) NULL
);
CREATE TABLE MAIL_TEMPLATE (
  MAIL_TEMPLATE_ID VARCHAR(10) NOT NULL ,
  LANG CHAR(2) NOT NULL ,
  SUBJECT VARCHAR(150) NOT NULL ,
  MAIL_BODY NTEXT NOT NULL ,
  CHARSET VARCHAR(50) NOT NULL
);
CREATE TABLE SAMPLE_USER (
  USER_INFO_ID CHAR(20) NOT NULL ,
  LOGIN_ID VARCHAR(20) NOT NULL ,
  KANJI_NAME NVARCHAR(50) NOT NULL ,
  KANA_NAME NVARCHAR(50) NOT NULL ,
  STATUS CHAR(1) NOT NULL
);
ALTER TABLE BUSINESS_DATE
ADD CONSTRAINT PK_BUSINESS_DATE PRIMARY KEY
(
  SEGMENT_ID
);
ALTER TABLE SAMPLE_USER
ADD CONSTRAINT PK_SAMPLE_USER_INFO PRIMARY KEY
(
  USER_INFO_ID
);
ALTER TABLE MAIL_TEMPLATE
ADD CONSTRAINT PK_MAIL_MAIL_TEMPLATE PRIMARY KEY
(
  MAIL_TEMPLATE_ID,
  LANG
);
ALTER TABLE MAIL_ATTACHED_FILE
ADD CONSTRAINT PK_MAIL_ATTACHED_FILE PRIMARY KEY
(
  MAIL_REQUEST_ID,
  SERIAL_NUMBER
);
ALTER TABLE MAIL_RECIPIENT
ADD CONSTRAINT PK_MAIL_RECIPIENT PRIMARY KEY
(
  MAIL_REQUEST_ID,
  SERIAL_NUMBER
);
ALTER TABLE MAIL_REQUEST
ADD CONSTRAINT PK_MAIL_REQUEST PRIMARY KEY
(
  MAIL_REQUEST_ID
);
ALTER TABLE CODE_PATTERN
ADD CONSTRAINT SYS_C0058550 PRIMARY KEY
(
  CODE_ID,
  CODE_VALUE
);
ALTER TABLE CODE_NAME
ADD CONSTRAINT SYS_C0058560 PRIMARY KEY
(
  CODE_ID,
  CODE_VALUE,
  LANG
);
ALTER TABLE BATCH_REQUEST
ADD CONSTRAINT SYS_C0058579 PRIMARY KEY
(
  BATCH_REQUEST_ID
);
ALTER TABLE CODE_NAME
ADD
FOREIGN KEY (
  CODE_ID,
  CODE_VALUE
) REFERENCES CODE_PATTERN (
  CODE_ID,
  CODE_VALUE
);
ALTER TABLE MAIL_ATTACHED_FILE
ADD
FOREIGN KEY (
  MAIL_REQUEST_ID
) REFERENCES MAIL_REQUEST (
  MAIL_REQUEST_ID
);
ALTER TABLE MAIL_RECIPIENT
ADD
FOREIGN KEY (
  MAIL_REQUEST_ID
) REFERENCES MAIL_REQUEST (
  MAIL_REQUEST_ID
);