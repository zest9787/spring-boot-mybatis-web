CREATE TABLE USERS
(
  USER_ID varchar(15) PRIMARY KEY,
  USER_NAME varchar NOT NULL
);

COMMENT ON COLUMN USERS.USER_ID IS '사용자아이디';
COMMENT ON COLUMN USERS.USER_NAME IS '사용여부';
COMMENT ON TABLE USERS IS '사용자';



CREATE TABLE MENUS
(
  MENU_ID varchar(12) PRIMARY KEY,
  MENU_NM varchar(30),
  MENU_URL varchar(200),
  USE_YN boolean DEFAULT false NOT NULL
);
COMMENT ON COLUMN MENUS.MENU_ID IS '메뉴아이디';
COMMENT ON COLUMN MENUS.MENU_NM IS '메뉴명';
COMMENT ON COLUMN MENUS.MENU_URL IS '메뉴URL';
COMMENT ON COLUMN MENUS.USE_YN IS '사용여부';
COMMENT ON TABLE MENUS IS '메뉴';



CREATE TABLE USER_GROUP
(
  GROUP_ID varchar(12) PRIMARY KEY,
  GROUP_NAME varchar(30),
  USE_YN boolean DEFAULT false
);
COMMENT ON COLUMN USER_GROUP.GROUP_ID IS '사용자그룹 아이디';
COMMENT ON COLUMN USER_GROUP.GROUP_NAME IS '사용자그룹명';
COMMENT ON COLUMN USER_GROUP.USE_YN IS '사용여부';
COMMENT ON TABLE USER_GROUP IS '사용자그룹';


CREATE TABLE USER_GROUP_MAPPING
(
  USER_ID varchar(15) ,
  GROUP_ID varchar(12) ,
  REG_DATE date not null,
  REG_USER varchar(15),
  PRIMARY KEY (USER_ID, GROUP_ID),
  foreign key (USER_ID) references USERS(USER_ID),
  foreign key (GROUP_ID) references USER_GROUP(GROUP_ID)
);
COMMENT ON COLUMN USER_GROUP_MAPPING.USER_ID IS '사용자아이디';
COMMENT ON COLUMN USER_GROUP_MAPPING.GROUP_ID IS '사용자그룹 아이디';
COMMENT ON COLUMN USER_GROUP_MAPPING.REG_DATE IS '등록일시';
COMMENT ON COLUMN USER_GROUP_MAPPING.REG_USER IS '등록자아이디';
COMMENT ON TABLE USER_GROUP_MAPPING IS '사용자그룹-사용자매핑';

CREATE TABLE ROLES
(
  ROLE_ID varchar(10) PRIMARY KEY,
  ROLE_NAME VARCHAR(30) NOT NULL,
  USE_YN boolean DEFAULT false
);
COMMENT ON TABLE ROLES IS 'ROLE 마스터';
COMMENT ON COLUMN ROLES.ROLE_ID IS 'ROLE 아이디';
COMMENT ON COLUMN ROLES.ROLE_NAME IS 'ROLE 명';
COMMENT ON COLUMN ROLES.USE_YN IS '사용여부';


CREATE TABLE ROLE_MENUS
(
  ROLE_ID varchar(10) ,
  MENU_ID varchar(12),
  REG_DATE date not null,
  REG_USER varchar(15),
  PRIMARY KEY (ROLE_ID, MENU_ID),
  foreign key (ROLE_ID) references ROLES(ROLE_ID),
  foreign key (MENU_ID) references MENUS(MENU_ID)
);
COMMENT ON TABLE ROLE_MENUS IS 'ROLE별 메뉴';
COMMENT ON COLUMN ROLE_MENUS.ROLE_ID IS 'ROLE 아이디';
COMMENT ON COLUMN ROLE_MENUS.MENU_ID IS '메뉴아이디';
COMMENT ON COLUMN ROLE_MENUS.REG_DATE IS '등록일시';
COMMENT ON COLUMN ROLE_MENUS.REG_USER IS '등록자아이디';



CREATE TABLE USER_GROUP_ROLE
(
  GROUP_ID varchar(12),
  ROLE_ID varchar(10),
  REG_DATE date not null,
  REG_USER varchar(15),
  PRIMARY KEY (GROUP_ID, ROLE_ID),
  foreign key (GROUP_ID) references USER_GROUP(GROUP_ID),
  foreign key (ROLE_ID) references ROLES(ROLE_ID)
);
COMMENT ON TABLE USER_GROUP_ROLE IS 'ROLE별 메뉴';
COMMENT ON COLUMN USER_GROUP_ROLE.GROUP_ID IS '사용자그룹 아이디';
COMMENT ON COLUMN USER_GROUP_ROLE.ROLE_ID IS 'ROLE 아이디';
COMMENT ON COLUMN USER_GROUP_ROLE.REG_DATE IS '등록일시';
COMMENT ON COLUMN USER_GROUP_ROLE.REG_USER IS '등록자아이디';
