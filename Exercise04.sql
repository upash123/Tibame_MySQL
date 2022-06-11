/* 01.請列出部門編號、部門平均薪資，只顯示部門平均薪資大於2500的部門 */
select * from EMP;
select DEPTNO 部門編號, ROUND(AVG(SAL),2) as 部門平均薪資
from EMP
group by DEPTNO
having AVG(SAL) >= 2500;


/* 02.請列出到職年、到職年當年人數，只顯示到職年當年人數等於1的資料 */
select * from EMP;
select YEAR(HIREDATE) 到職年, COUNT(HIREDATE) 到職年人數
from EMP
group by HIREDATE
having COUNT(HIREDATE) =1;



/* 03.請列出各部門編號、部門每月發出薪資總和，只顯示部門每月發出薪資總和小於10000的 
部門，並依部門編號遞減排序 */
select * from EMP;
select DEPTNO, ROUND(SUM(SAL)) as 部門每月薪資總和
from EMP
group by DEPTNO
having ROUND(SUM(SAL)) < 10000;

/* 04.請列出職稱、該職稱平均薪資、該職稱人數，只顯示職稱平均薪資大於2000(<=)且職稱人數小
於2的資料 */
select * from EMP;
select JOB 職稱, ROUND(AVG(SAL),2) as 平均薪資, count(JOB) 職稱人數
from EMP
group by JOB
having ROUND(AVG(SAL),2) >= 2000 and count(JOB)<2;





/* 05.請列出部門編號、部門最低薪資、部門最高薪資，且過濾掉最低薪資大於1200的資料 */
select * from EMP;
select DEPTNO 部門編號, ROUND(MIN(SAL)) 最低薪資, ROUND(MAX(SAL)) 最高薪資
from EMP
group by DEPTNO
having ROUND(MIN(SAL)) < 1200;


