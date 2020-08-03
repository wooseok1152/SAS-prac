libname choi_sas "C:\Users\my\Desktop\Documents\choi_sas"; 
proc freq data=Choi_sas.Hn15_all;
/*table Ű����� ������ ������ �����ϴ� ���̴�.*/
table sex;
run;

proc means data=Choi_sas.Hn15_all;
/*var Ű����� ������ ������ �����ϴ� ���̴�.*/
var wt_hs;
run;

DATA Work.RESULT;
	/*	������ ������ �� ������ �ڿ� �ٴ� '$'�� �ش� ������ type�� ���ڿ��̶�� ���� ��Ÿ���� ���̴�.*/
	INPUT CLASS$ NAME$ SCORE;
	CARDS;
	A�� ȫ�浿 100
	A�� �赵ġ 99
	B�� ���� 70
	B�� �ű��� 80
	;
	RUN;

PROC PRINT DATA=WORK.RESULT;
RUN;

PROC MEANS DATA=WORK.RESULT;
	VAR SCORE;
	CLASS CLASS;
RUN;

PROC EXPORT DATA= WORK.exercise_1
OUTFILE= "C:\Users\my\Desktop\sas_proc_import_test.xlsx"
DBMS=XLSX;
SHEET="Sheet1";
RUN;

DATA Work.MATH1;
	INPUT NAME$ SCORE_MATH@@;
	CARDS;
	KO 100
	KIM 80
	NOH 99
	UM 20
	OH 40
	PO 90
	;
RUN;
DATA Work.MATH2;
	INPUT NAME$ SCORE_MATH@@;
	CARDS;
	PARK 100
	LEE 65
	ROH 59
	MU 70
	HO 20
	YANG 98
	;
RUN;

DATA ENG1;
	INPUT NAME$ SCORE_ENG;
	CARDS;
	KIM 40
	KO 50
	UM 80
	PO 30
	NOH 29
	OH 20
	;
	RUN;

DATA TOTAL_SET;
	/*	������ ���� ������ ������ �� ������ ���� ��ĥ ���� SET Ű���带 �����*/
	SET MATH1 MATH2;
RUN;

/*MERGE�� �ǽ��ϱ� ����, �� ������ �� ���� ������ ���� �����ϰ� ������� ��*/
/*SORT�� �� ������ ���� ���� ������ ���� �����ָ� ��*/
PROC SORT DATA=MATH1;
	BY NAME;
RUN;
PROC SORT DATE=ENG1;
	BY NAME;
RUN;

DATA TOTAL_MERGE;
	/*	������ ���� ���� ������ �� ������ ���� ��ĥ ���� MERGE Ű���带 ����ؾ���.*/
	/*� ������ ��������(� ���� �����ٰ�) �� ������ ���� ���η� ��ĥ ������ ��������ϱ� ������, BY��� Ű����� �����̵Ǵ� ������ ��������� ��*/
	MERGE MATH1 ENG1;
	BY NAME;
RUN;

PROC PRINT DATA=TOTAL;
RUN;

PROC PRINT DATA=TOTAL_MERGE;
RUN;

