-- 부서
CREATE TABLE "DEPT" (
	"DEPTNO" NUMBER(2)    NOT NULL, -- 부서번호
	"DNAME"  VARCHAR2(14) NULL,     -- 부서이름
	"LOC"    VARCHAR2(13) NULL      -- 지역
);

-- 부서 기본키
CREATE UNIQUE INDEX "PK_DEPT"
	ON "DEPT" ( -- 부서
		"DEPTNO" ASC -- 부서번호
	);

-- 부서
ALTER TABLE "DEPT"
	ADD
		CONSTRAINT "PK_DEPT" -- 부서 기본키
		PRIMARY KEY (
			"DEPTNO" -- 부서번호
		);

-- 사원
CREATE TABLE "EMP" (
	"EMPNO"    NUMBER(4)    NOT NULL, -- 사원번호
	"ENAME"    VARCHAR2(10) NULL,     -- 사원이름
	"JOB"      VARCHAR2(9)  NULL,     -- 직업
	"MGR"      NUMBER(4)    NULL,     -- 관리자
	"HIREDATE" DATE         NULL,     -- 입사일
	"SAL"      NUMBER(7,2)  NULL,     -- 급여
	"COMM"     NUMBER(7,2)  NULL,     -- 커미션
	"DEPTNO"   NUMBER(2)    NULL      -- 부서번호
);

-- 사원 기본키
CREATE UNIQUE INDEX "PK_EMP"
	ON "EMP" ( -- 사원
		"EMPNO" ASC -- 사원번호
	);

-- 사원
ALTER TABLE "EMP"
	ADD
		CONSTRAINT "PK_EMP" -- 사원 기본키
		PRIMARY KEY (
			"EMPNO" -- 사원번호
		);

-- 사원
ALTER TABLE "EMP"
	ADD
		CONSTRAINT "FK_DEPT_TO_EMP" -- 부서 -> 사원
		FOREIGN KEY (
			"DEPTNO" -- 부서번호
		)
		REFERENCES "DEPT" ( -- 부서
			"DEPTNO" -- 부서번호
		);