-- �μ�
CREATE TABLE "DEPT" (
	"DEPTNO" NUMBER(2)    NOT NULL, -- �μ���ȣ
	"DNAME"  VARCHAR2(14) NULL,     -- �μ��̸�
	"LOC"    VARCHAR2(13) NULL      -- ����
);

-- �μ� �⺻Ű
CREATE UNIQUE INDEX "PK_DEPT"
	ON "DEPT" ( -- �μ�
		"DEPTNO" ASC -- �μ���ȣ
	);

-- �μ�
ALTER TABLE "DEPT"
	ADD
		CONSTRAINT "PK_DEPT" -- �μ� �⺻Ű
		PRIMARY KEY (
			"DEPTNO" -- �μ���ȣ
		);

-- ���
CREATE TABLE "EMP" (
	"EMPNO"    NUMBER(4)    NOT NULL, -- �����ȣ
	"ENAME"    VARCHAR2(10) NULL,     -- ����̸�
	"JOB"      VARCHAR2(9)  NULL,     -- ����
	"MGR"      NUMBER(4)    NULL,     -- ������
	"HIREDATE" DATE         NULL,     -- �Ի���
	"SAL"      NUMBER(7,2)  NULL,     -- �޿�
	"COMM"     NUMBER(7,2)  NULL,     -- Ŀ�̼�
	"DEPTNO"   NUMBER(2)    NULL      -- �μ���ȣ
);

-- ��� �⺻Ű
CREATE UNIQUE INDEX "PK_EMP"
	ON "EMP" ( -- ���
		"EMPNO" ASC -- �����ȣ
	);

-- ���
ALTER TABLE "EMP"
	ADD
		CONSTRAINT "PK_EMP" -- ��� �⺻Ű
		PRIMARY KEY (
			"EMPNO" -- �����ȣ
		);

-- ���
ALTER TABLE "EMP"
	ADD
		CONSTRAINT "FK_DEPT_TO_EMP" -- �μ� -> ���
		FOREIGN KEY (
			"DEPTNO" -- �μ���ȣ
		)
		REFERENCES "DEPT" ( -- �μ�
			"DEPTNO" -- �μ���ȣ
		);