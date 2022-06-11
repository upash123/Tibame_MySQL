/* 01.請列出公司一年需發出薪資總和 (不含獎金) (只有一個答案) */
select * from EMP;

select ROUND(SUM(SAL*12)) as 年薪資總和
from EMP;


/* 02.請列出公司平均月薪  */
select ROUND(AVG(SAL),2) as 平均月薪
from EMP;


/* 03.請列出各部門編號、部門每月發出薪資總和，並依部門編號遞增排序 */
select * from EMP;
select DEPTNO, ROUND(SUM(SAL)) as 部門每月薪資總和
from EMP
group by DEPTNO;

/* 04.請列出職稱、該職稱平均薪資、該職稱人數 */
select * from EMP;
select JOB 職稱, ROUND(AVG(SAL),2) as 平均薪資, count(JOB) 職稱人數
from EMP
group by JOB;


/* 05.請列出部門編號、部門最低薪資、部門最高薪資 */
select * from EMP;
select DEPTNO 部門編號, ROUND(MIN(SAL)) 最低薪資, ROUND(MAX(SAL)) 最高薪資
from EMP
group by DEPTNO;


/* 06.請列出到職年、到職年當年人數   1980 3 */
select * from EMP;
select YEAR(HIREDATE) 到職年, COUNT(HIREDATE) 到職年人數
from EMP
group by HIREDATE;
