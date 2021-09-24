CREATE SEQUENCE INSA_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE INSA_COM_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE INSA_INPUT_INFO_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE INSA_ACAD_ABILITY_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;
CREATE SEQUENCE INSA_CARRIER_SEQ
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE
NOCACHE;

CREATE TABLE INSA(
    SABUN NUMBER PRIMARY KEY, -- 사번
	JOIN_DAY DATE, -- 입사일
	RETIRE_DAY DATE, -- 퇴사일
	PUT_YN VARCHAR2(50), -- 투입여부
	NAME VARCHAR2(50), -- 이름
	REG_NO VARCHAR2(50), -- 주민등록번호
	ENG_NAME VARCHAR2(50), -- 영어이름
	PHONE VARCHAR2(20), -- 전화번호
	HP VARCHAR2(20), -- 핸드폰번호
	CARRIER VARCHAR2(50), -- 이력서
	POS_GBN_CODE VARCHAR2(50), -- 직위구분코드
	CMP_REG_NO VARCHAR2(50), -- 사업자등록번호
	CMP_REG_IMAGE VARCHAR2(50), -- 사업자등록증
	SEX VARCHAR2(20), -- 성별
	YEARS NUMBER, -- 나이
	EMAIL VARCHAR2(100), -- 이메일
	ZIP NUMBER, -- 우편번호
	ADDR1 VARCHAR2(100), -- 주소1(도-리 주소)
	ADDR2 VARCHAR2(100), -- 주소2(세부주소)
	DEPT_CODE VARCHAR2(50), -- 부서코드
	JOIN_GBN_CODE VARCHAR2(50), -- 직종
	ID VARCHAR2(50), -- 아이디
	PWD VARCHAR2(64), -- 패스워드
	SALARY NUMBER, -- 연봉
	KOSA_REG_YN VARCHAR2(50), -- KOSA등록
	KOSA_CLASS_CODE VARCHAR2(50), -- KOSA등급
	MIL_YN VARCHAR2(20), -- 입대여부
	MIL_TYPE VARCHAR2(20), -- 군별
	MIL_LEVEL VARCHAR2(20), -- 계급
	MIL_STARTDATE VARCHAR2(20), -- 입영일자
	MIL_ENDDATE VARCHAR2(20), -- 전역일자
	JOIN_TYPE VARCHAR2(20), -- 입사여부
	GART_LEVEL VARCHAR2(20), -- 등급
	SELF_INTRO VARCHAR2(500), -- 자기소개
	CRM_NAME VARCHAR2(100), -- 업체
	PROFILE_IMAGE VARCHAR2(50), -- 프로필 이미지
	CARRIER_IMAGE VARCHAR2(50) -- 이력서 이미지
);

CREATE TABLE INSA_COM(
	GUBUN VARCHAR2(50), -- 구분
	CODE VARCHAR2(50), -- 코드
	NAME VARCHAR2(50), -- 이름
	NOTE VARCHAR2(500), -- 비고
	CONSTRAINT INSA_COM_PK PRIMARY KEY (GUBUN, CODE)
);

CREATE TABLE INSA_INPUT_INFO(
	SABUN NUMBER, -- 사번
	SEQ NUMBER PRIMARY KEY, -- 일련번호
	WRK_POSB_DAY DATE, -- 근무가능일
	SUGST_MONEY NUMBER, -- 월제시금액
	PJT_GBN_CODE VARCHAR2(50), -- PJ형태구분코드
	EQM_YN VARCHAR2(20), -- 장비유무
	CURRENT_SALARY NUMBER, -- 현재연봉
	WORK_AREA VARCHAR2(50), -- 근무지
	FOREIGN KEY (SABUN) REFERENCES INSA (SABUN) ON DELETE CASCADE
);

CREATE TABLE INSA_ACAD_ABILITY(
	SABUN NUMBER, -- 사번
	SEQ NUMBER PRIMARY KEY, -- 일련번호
	MAJOR_STUD_GBN VARCHAR2(50), -- 전공구분
	GART_LEVEL VARCHAR2(50), -- 졸업여부
	GART_YEAR NUMBER, -- 졸업년
	GART_MONTH NUMBER, -- 졸업월
	SCHOOL_NAME VARCHAR2(50), -- 학교명
	FOREIGN KEY (SABUN) REFERENCES INSA (SABUN) ON DELETE CASCADE
);

CREATE TABLE INSA_CARRIER(
	SABUN NUMBER, -- 사번
	SEQ NUMBER PRIMARY KEY, -- 일련번호
	CMP_NAME_CARRIER VARCHAR2(50), -- 회사명
	WORK_START_DAY DATE, -- 근무시작일
	WORK_END_DAY DATE, -- 근무종료일
	POS_GBN_CODE VARCHAR2(50), -- 직위
	RESPON_DEPT VARCHAR2(50), -- 담당업무
	WORK_CONTENTS VARCHAR2(500), -- 근무내용
	FOREIGN KEY (SABUN) REFERENCES INSA (SABUN) ON DELETE CASCADE
);