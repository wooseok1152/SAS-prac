TITLE "������ �ڷ��� �Է�";
DATA work.one;
INPUT name: $ 20. id gender $ age income 5.1;
/*CARDS������ OUTPUT���� ����Ǿ� �ִ�. OUTPUT���� CARDS���� �Բ� �����Ѵٸ�, CARDS���� ����Ǿ� �ִ� OUTPUT���� �������� �ʴ´�. ��õǾ� �ִ� OUTPUT���� �����ϴ� ���̴�.*/
/*OUTPUT���� �����ͼ¿� �� ���� ����ϴ� ����̴�. ���� ��ϵ��� ���� �����͸� �����ͼ��� �� �࿡ ����ϴ� ���̴�.*/
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
label gender = "����";
label residence = "������";
label age = "����";
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

TITLE "SET ���� �̿��� ���ο� DataSet�� ����";
DATA WORK.SURVEY1;
/*SET���� ���� �����ͼ��� ��(������)�� �� ���� �����ϴ� ���̴�. �׸��� SET������ OUTPUT���� ����Ǿ� �ִ�. ���� OUTPUT���� SET���� ���� �����Ѵٸ�, SET���� ����Ǿ� �ִ� OUTPUT���� ������� �ʴ´�. ��õǾ� �ִ� OUTPUT���� ����Ǵ� ���̴�.*/
SET WORK.ONE;
INCOME2 = INCOME*2;
OUTPUT;
RUN;
PROC PRINT;
RUN;

TITLE "SET ���� �̿��� ���ο� DataSet�� ���� : KEEP";
DATA ds3_1 (KEEP = NAME ID);
SET WORK.ONE;
RUN;
PROC PRINT;
RUN;

TITLE "�κ�����ȭ IF��(SET���� ������ �ִ� ������ ���� �����Ͽ� �ҷ��� ��, Ư�� ������ �����ϴ� �����͸��� ����  ������ ���� ����� ���)";
DATA ds3_6;
SET WORK.SURVEY;
IF gender = 2;
DROP GENDER RESIDENCE
RUN;
PROC PRINT;
RUN;

TITLE "�����ͼ��� ����(������ ����)";
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

TITLE "�����ͼ��� ����(������ ����, ������ ��ų �� ������ �� �� �������� ������ ������ ��)";
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

TITLE "�����ͼ��� ����(������ ����, ������ ��ų �� ������ �� �� �������� ������ �������� ���� ��)";
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

TITLE "IF-THEN ���� ���๮";
DATA ds4_1;
SET SURVEY;
IF GENDER = 1 THEN q1s = q11 + q12 + q13 + q14; 
RUN;
PROC PRINT;
RUN;

TITLE "IF-THEN-ELSE ���� ���๮";
DATA ds4_1;
SET SURVEY;
IF GENDER = 1 THEN q1s = q11 + q12 + q13 + q14; 
ELSE q1s = q11 + q14;
RUN;
PROC PRINT;
RUN;

TITLE "IF-THEN ���� ���๮�� ���Ե� �ܼ� DO��(END���� �� ��Ʈ�� ������ �ʴ´�.)";
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

TITLE "�ݺ����� �ǽ��ϴ� DO��(�ݵ�� END���� �� ��Ʈ�� �̷���Ѵ�. ���̽��� for���� �����ϴ�.)";
DATA do1;
/*DROP���� ������� �ʴ� �̻�, ��ǥ����(DO���� ����� ����)�� �翬�� �����ͺ��̽� �¿� ��Ÿ����.*/
DO x = 1, 3, 4, 7, 8, 9;
x2 = x*x;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "��ǥ������ Ȱ���Ͽ� �ݺ����� �ǽ��ϴ� DO(���̽��� range�� ����)";
DATA do2;
/*DROP���� ������� �ʴ� �̻�, ��ǥ������ �ٿ��� �����ͺ��̽� �¿� ��Ÿ����.*/
DO x = 1 TO 9;
x2 = x*x;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "��ǥ������ Ȱ���Ͽ�(TO�� BY �Ѵ� Ȱ��) �ݺ����� �ǽ��ϴ� DO";
DATA do3;
/*DROP���� ������� �ʴ� �̻�, ��ǥ������ �ٿ��� �����ͺ��̽� �¿� ��Ÿ����.*/
DO x = 1 TO 15 BY 3;
x2 = x**3;
OUTPUT;
END;
RUN;
PROC PRINT;
RUN;

TITLE "DO�� ��ø(���� DO��)";
DATA do4;
/*DROP���� ������� �ʴ� �̻�, ��ǥ������ �ٿ��� �����ͺ��̽� �¿� ��Ÿ����.*/
DO x = 3, 6, 9;
DO y = 2 TO 6 BY 2;
xy = x*y;
OUTPUT;
END;
END;
RUN;
PROC PRINT;
RUN;

TITLE "DO WHILE ���� ����";
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

TITLE "ARRAY ���� Ȱ��";
DATA ds4_4;
SET SURVEY;
/*�迭 ����(SET���� ���ؼ� �ϳ��� �ҷ������� ����� ������ ���� �ؿ� ����Ǵ� �迭�� ����Ǿ� ����ȴ�.)*/
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

TITLE "��������� ���� ����ǥ";
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

TITLE "��������� ����";
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

TITLE "������ ������ ���� ��Ÿ����";
DATA COUNT_FEMALE;
SET SURVEY;
IF GENDER = 2 THEN COUNT + 1;
RUN;
PROC PRINT;
RUN;




