TITLE "문자형 자료의 입력";
DATA work.one;
INPUT name: $ 20. id gender $ age income 5.1;
/*CARDS문에는 OUTPUT문이 내재되어 있다. OUTPUT문이 CARDS문과 함께 존재한다면, CARDS문에 내재되어 있는 OUTPUT문은 동작하지 않는다. 명시되어 있는 OUTPUT문이 동작하는 것이다.*/
/*OUTPUT문이 데이터셋에 한 행을 기록하는 명령이다. 여태 기록되지 않은 데이터를 데이터셋의 한 행에 기록하는 것이다.*/
CARDS;
HONG_KILDONG 1 M 34 17.01
LEE_DORYUNG  17 M 40 14.41
SUNG_WON     33 F 45 16.31 
LEE_YOUNG    49 F 24 14.21
LEE_SUNSHIN 50 M 55 20.13
;
PROC PRINT data = work.one;
RUN;

DATA work.survey;
input id gender residence age q11-q14 q21-q24 q31-q34;
label gender = "성별";
label residence = "거주지";
label age = "나이";
cards;
1 1 1 3 5 4 4 4 5 5 3 4 3 4 1 4
2 2 1 3 5 4 4 3 4 4 3 5 4 4 2 4
3 1 1 2 4 4 2 2 4 5 4 4 4 4 1 4
4 2 1 3 5 3 3 3 5 4 2 3 2 2 2 4
5 1 1 3 5 3 3 3 3 4 2 3 2 2 1 4
6 2 1 3 5 3 3 3 4 3 2 3 2 2 2 4
7 1 1 2 4 2 2 3 3 5 2 2 2 3 1 4
8 2 1 2 4 5 2 1 1 3 4 4 3 2 1 4
9 1 1 3 5 3 4 4 3 2 1 2 1 2 2 4
10 2 1 2 4 5 3 2 2 5 2 2 2 5 1 3
11 1 1 3 5 3 3 2 3 4 4 5 3 3 1 3
12 2 1 3 5 4 4 4 4 5 3 4 3 3 1 3
13 1 1 3 5 4 4 3 5 5 3 4 3 4 1 3
14 2 1 2 4 4 3 2 3 5 4 5 2 5 2 3
15 1 1 2 4 3 2 4 2 4 3 3 3 4 1 3
16 2 1 3 5 3 2 3 2 4 3 3 2 2 2 3
17 1 1 2 4 3 4 3 3 3 4 3 4 3 1 3
18 2 1 3 5 3 3 4 4 5 2 4 2 3 2 3
19 1 1 1 3 4 2 4 3 4 1 3 3 3 2 3
20 2 1 2 4 3 2 3 2 3 2 2 2 2 2 3
21 1 1 3 5 3 4 4 5 5 3 3 3 3 1 3
22 2 1 2 4 4 4 3 3 5 3 5 2 3 2 3
23 1 1 2 4 3 4 4 5 5 2 5 2 2 2 3
24 2 1 2 4 5 2 1 1 3 4 3 4 2 1 3
25 1 1 3 5 4 2 4 4 5 2 3 2 2 2 3
26 2 1 3 5 4 2 1 2 3 4 3 4 2 2 3
27 1 1 2 4 4 4 3 4 4 4 3 3 2 1 3
28 2 1 1 5 2 4 4 3 4 2 3 2 3 2 3
29 1 1 3 5 3 3 2 4 4 2 3 2 2 1 3 
30 2 1 1 5 3 4 4 4 4 4 4 2 3 2 3
31 1 1 1 5 3 2 3 5 5 2 4 2 2 2 3
32 2 1 3 5 1 1 5 1 1 1 5 1 1 2 3
33 1 1 2 4 4 4 3 3 4 3 2 3 3 2 3
34 2 1 2 4 3 4 5 5 3 3 4 2 2 2 3
35 1 1 3 5 4 4 4 2 4 3 3 4 4 2 3
36 2 1 1 1 2 3 3 5 5 3 3 3 1 1 3
37 1 1 3 5 3 3 3 3 4 5 4 2 3 1 4
38 2 1 2 4 5 2 1 1 3 4 3 4 2 1 3
39 1 1 2 4 5 2 1 1 3 4 3 4 2 1 3
40 2 1 1 3 3 3 4 3 4 3 3 3 1 1 3
;
run;
proc print data =  work.survey;
run;

TITLE "SET 문을 이용한 새로운 DataSet의 생성";
DATA WORK.SURVEY1;
/*SET문은 기존 데이터셋의 행(데이터)을 한 개씩 복사하는 것이다. 그리고 SET문에는 OUTPUT문이 내재되어 있다. 만약 OUTPUT문이 SET문과 같이 존재한다면, SET문에 내재되어 있는 OUTPUT문은 실행되지 않는다. 명시되어 있는 OUTPUT문이 실행되는 것이다.*/
SET WORK.ONE;
INCOME2 = INCOME*2;
OUTPUT;
RUN;
PROC PRINT;
RUN;

TITLE "SET 문을 이용한 새로운 DataSet의 생성 : KEEP";
DATA ds3_1 (KEEP = NAME ID);
SET WORK.ONE;
RUN;
PROC PRINT;
RUN;

TITLE "부분집합화 IF문(SET으로 기존에 있는 데이터 셋을 복사하여 불러온 뒤, 특정 조건을 만족하는 데이터만을 가진  데이터 셋을 만드는 방법)";
DATA ds3_6;
SET WORK.SURVEY;
IF gender = 2;
DROP GENDER RESIDENCE
RUN;
PROC PRINT;
RUN;

TITLE "데이터셋의 연결(수직적 결합)";
DATA KUNSAN;
INPUT NAME: $14. ID GENDER$ AGE INCOME CITY$ x;
CARDS;
HONG_KILDONG 1 M 34 17 KUNSAN 10
LEE_DORYUNG 17 M 40 14 KUNSAN 20
SUNG_WON 33 F 25 16 KUNSAN 30
LEE_YOUNG 49 F 24 14 KUNSAN 40
LEE_SUNSHIN 50 M 55 20 KUNSAN 50
;
RUN;
DATA SEOUL;
INPUT NAME: $14. ID GENDER$ AGE INCOME CITY$ y;
CARDS
;
LIM_GUKJUNG 51 M 44 27 SEOUL 10
SUNG_CHUNHYANG 57 F 50 24 SEOUL 20
KIM_MIN 63 M 55 36 SEOUL 30
PARK_YOUNG 79 F 34 27 SEOUL 40
KIM_YOOSHIN 80 M 35 29 SEOUL 50
;
RUN;
DATA CONCATE;
SET KUNSAN SEOUL;
RUN;
PROC PRINT;
RUN;

TITLE "데이터셋의 연결(수평적 결합, 결합을 시킬 두 데이터 셋 내 데이터의 순서가 동일할 때)";
DATA PAGE1;
INPUT NAME: $14. ID GENDER$;
CARDS
;
HONG_KILDONG 1 1M
LEE_DORYONG 17 M
SUNG_WON 33 F
LEE_YOUNG 49 F
LEE_SUNSHIN 50 M
LIM_GUKJUNG 51 M
SUNG_CHUNHYWANG 57 F
;
RUN;
DATA PAGE2;
INPUT AGE INCOME CITY$;
CARDS
;
34 17 KUNSAN
40 14 KUNSAN
45 16 KUNSAN
24 14 KUNSAN
55 20 KUNSAN
44 27 SEOUL
50 24 SEOUL
99 99 BUSAN
88 88 BUSAN
;
RUN;
DATA MERGE1;
MERGE PAGE1 PAGE2;
RUN;
PROC PRINT;
RUN;

TITLE "데이터셋의 연결(수평적 결합, 결합을 시킬 두 데이터 셋 내 데이터의 순서가 동일하지 않을 때)";
DATA PAGE5;
INPUT ID NAME: $14. GENDER$;
CARDS
;
1 HONG_KILDONG M
33 SUNG_WON F
17 LEE_DORYUNG M
50 LEE_SUNSHIN M
49 LEE_YOUNG F
;
RUN;
DATA PAGE6;
INPUT ID AGE INCOME CITY$;
CARDS
;
49 24 14 KUNSAN
17 40 14 KUNSAN
33 45 16 KUNSAN
65 44 27 SEOUL
61 38 24 SEOUL
50 55 20 KUNSAN
1 34 17 KUNSAN
;
RUN;
PROC SORT DATA=PAGE5;
BY ID;
RUN;
PROC SORT DATA=PAGE6;
BY ID;
RUN;
DATA MERGE4;
MERGE PAGE5 PAGE6;
BY ID;
RUN;
PROC PRINT;
RUN;

TITLE "IF-THEN 조건 실행문";
DATA ds4_1;
SET SURVEY;
IF GENDER = 1 THEN q1s = q11 + q12 + q13 + q14; 
RUN;
PROC PRINT;
RUN;

TITLE "IF-THEN-ELSE 조건 실행문";
DATA ds4_1;
SET SURVEY;
IF GENDER = 1 THEN q1s = q11 + q12 + q13 + q14; 
ELSE q1s = q11 + q14;
RUN;
PROC PRINT;
RUN;

TITLE "IF-THEN 조건 실행문에 포함된 단순 DO문(END문과 한 세트로 사용되지 않는다.)";
DATA ds4_3;
SET SURVEY;
IF GENDER = 1 THEN DO;
q1s = q11 + q12 + q13 + q14;
q2s = q21 + q22 + q23 + q24;
END;
DROP q31-q34;
RUN;
PROC PRINT;
RUN;

TITLE "반복문을 실시하는 DO문(반드시 END문과 한 세트를 이뤄야한다. 파이썬의 for문과 동일하다.)";
DATA do1;
/*DROP문을 사용하지 않는 이상, 지표변수(DO문에 선언된 변수)도 당연히 데이터베이스 셋에 나타난다.*/
DO x = 1, 3, 4, 7, 8, 9;
x2 = x*x;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "지표변수를 활용하여 반복문을 실시하는 DO(파이썬의 range와 동일)";
DATA do2;
/*DROP문을 사용하지 않는 이상, 지표변수도 다연히 데이터베이스 셋에 나타난다.*/
DO x = 1 TO 9;
x2 = x*x;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "지표변수를 활용하여(TO와 BY 둘다 활용) 반복누을 실시하는 DO";
DATA do3;
/*DROP문을 사용하지 않는 이상, 지표변수도 다연히 데이터베이스 셋에 나타난다.*/
DO x = 1 TO 15 BY 3;
x2 = x**3;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "DO문 중첩(이중 DO문)";
DATA do4;
/*DROP문을 사용하지 않는 이상, 지표변수도 다연히 데이터베이스 셋에 나타난다.*/
DO x = 3, 6, 9;
DO y = 2 TO 6 BY 2;
xy = x*y;
OUTPUT;
END;
END;
RUN;
PROC PRINT;
RUN;

TITLE "DO WHILE 문의 예제";
DATA do5;
x = 1;
DO WHILE(x <= 10);
x2 = x*x;
OUTPUT;
x = x+2;
END;
RUN;
PROC PRINT;
RUN;

TITLE "ARRAY 문의 활용";
DATA ds4_4;
SET SURVEY;
/*배열 선언(SET문에 의해서 하나씩 불러와지는 행들의 데이터 값이 밑에 선언되는 배열에 복사되어 저장된다.)*/
ARRAY A(4) q11-q14;
ARRAY B(4) q21-q24;
ARRAY C(4) c1-c4;
TOTAL = 0;
DO i = 1 to 4;
C(i) = 0;
IF A(i) = B(i) THEN C(i) = 1;
TOTAL = TOTAL + C(i);
END;
DROP i
RUN;
PROC PRINT;
RUN;

TITLE "기초통계학 과목 점수표";
DATA STATISTIC_SCORE;
INPUT id mid final assignment;
CARDS
;
11 35 59 14
12 65 78 20
13 71 88 20
14 56 40 16
15 75 80 20
16 49 45 16
17 60 40 14
18 80 90 20
19 75 95 20
20 90 95 20
;
RUN;
PROC PRINT;
RUN;

TITLE "기초통계학 학점";
DATA STATISTIC_GRADE;
SET STATISTIC_SCORE;
IF mid + final + assignment >= 190 THEN grade = "A";
ELSE IF mid + final + assignment >= 170 THEN grade = "B";
ELSE grade = "C";
OUTPUT;
KEEP grade;
RUN;
PROC PRINT;
RUN;

TITLE "응답한 여성의 수를 나타내기";
DATA COUNT_FEMALE;
SET SURVEY;
IF GENDER = 2 THEN COUNT + 1;
RUN;
PROC PRINT;
RUN;




