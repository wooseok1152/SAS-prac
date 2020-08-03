libname choi_sas "C:\Users\my\Desktop\Documents\choi_sas"; 
proc freq data=Choi_sas.Hn15_all;
/*table 키워드는 범주형 변수를 지정하는 것이다.*/
table sex;
run;

proc means data=Choi_sas.Hn15_all;
/*var 키워드는 연속형 변수를 지정하는 것이다.*/
var wt_hs;
run;

DATA Work.RESULT;
	/*	변수를 선언할 때 변수명 뒤에 붙는 '$'는 해당 변수의 type이 문자열이라는 것을 나타내는 것이다.*/
	INPUT CLASS$ NAME$ SCORE;
	CARDS;
	A반 홍길동 100
	A반 김도치 99
	B반 고영순 70
	B반 신길자 80
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
	/*	데이터 셋의 변수가 동일한 두 데이터 셋을 합칠 때는 SET 키워드를 사용함*/
	SET MATH1 MATH2;
RUN;

/*MERGE를 실시하기 전에, 두 데이터 셋 행의 순서를 서로 동일하게 맞춰줘야 함*/
/*SORT로 두 데이터 셋의 행의 순서를 서로 맞춰주면 됨*/
PROC SORT DATA=MATH1;
	BY NAME;
RUN;
PROC SORT DATE=ENG1;
	BY NAME;
RUN;

DATA TOTAL_MERGE;
	/*	데이터 셋의 행이 동일한 두 데이터 셋을 합칠 때는 MERGE 키워드를 사용해야함.*/
	/*어떤 변수를 기준으로(어떤 변수 옆에다가) 두 데이터 셋을 가로로 합칠 것인지 정해줘야하기 때문에, BY라는 키워드로 기준이되는 변수를 설정해줘야 함*/
	MERGE MATH1 ENG1;
	BY NAME;
RUN;

PROC PRINT DATA=TOTAL;
RUN;

PROC PRINT DATA=TOTAL_MERGE;
RUN;

