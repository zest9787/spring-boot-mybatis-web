
/* 사용자등록 */
insert into USERS (USER_ID, USER_NAME) values ('test1', '테스터1');
insert into USERS (USER_ID, USER_NAME) values ('test2', '테스터2');
insert into USERS (USER_ID, USER_NAME) values ('test3', '테스터3');


/* 사용자그룹 등록 */
insert into USER_GROUP (GROUP_ID, GROUP_NAME) values ('G01', '관리자');
insert into USER_GROUP (GROUP_ID, GROUP_NAME) values ('U01', '사용자');

/* 사용자그룹의 사용자 등록 */
insert into USER_GROUP_MAPPING(USER_ID, GROUP_ID, REG_DATE, REG_USER) values ('test1', 'G01', CURRENT_DATE(), 'test1');
insert into USER_GROUP_MAPPING(USER_ID, GROUP_ID, REG_DATE, REG_USER) values ('test2', 'U01', CURRENT_DATE(), 'test1');
insert into USER_GROUP_MAPPING(USER_ID, GROUP_ID, REG_DATE, REG_USER) values ('test3', 'U01', CURRENT_DATE(), 'test1');

/* 메뉴등록 */
insert into MENUS (MENU_ID, MENU_NM, MENU_URL) values ('M0000000', '사용자관리', '/users');
insert into MENUS (MENU_ID, MENU_NM, MENU_URL) values ('M0000001', '권한관리', '/authority');
insert into MENUS (MENU_ID, MENU_NM, MENU_URL) values ('M0000002', '초기페이지', '/home');


/* 메뉴ROLE 등록 */
insert into ROLES (ROLE_ID, ROLE_NAME, USE_YN) values ('R00001', '관리자메뉴', 'Y');
insert into ROLES (ROLE_ID, ROLE_NAME, USE_YN) values ('R00002', '사용자메뉴', 'Y');


/* 메뉴롤별 메뉴등록 */
insert into ROLE_MENUS (ROLE_ID, MENU_ID, REG_DATE, REG_USER) values ('R00001', 'M0000000', CURRENT_DATE(), 'test1');
insert into ROLE_MENUS (ROLE_ID, MENU_ID, REG_DATE, REG_USER) values ('R00001', 'M0000001', CURRENT_DATE(), 'test1');
insert into ROLE_MENUS (ROLE_ID, MENU_ID, REG_DATE, REG_USER) values ('R00002', 'M0000000', CURRENT_DATE(), 'test1');


/* 사용작룹별 메뉴롤 정의 */
insert into USER_GROUP_ROLE (GROUP_ID, ROLE_ID, REG_DATE, REG_USER) values ('G01', 'R00001', CURRENT_DATE(), 'test1');
insert into USER_GROUP_ROLE (GROUP_ID, ROLE_ID, REG_DATE, REG_USER) values ('G01', 'R00002', CURRENT_DATE(), 'test1');
insert into USER_GROUP_ROLE (GROUP_ID, ROLE_ID, REG_DATE, REG_USER) values ('U01', 'R00002', CURRENT_DATE(), 'test1');
