/* 01.列出薪資不介於1000到2000元的員工之姓名和薪資*/
select 
	ENAME,
    SAL
from EMP
where
	SAL between 1000 and 2000;



/* 02.列出到職日為1981年的員工之姓名、職稱、到職日，並依到職日遞減排序*/
select 
	ENAME,
    JOB,
    HIREDATE
from EMP 
where
	HIREDATE like '__81%'
order by 3;




/*  03.列出薪資超過2000元 且 部門編號為10或30 的員工之姓名、薪資，並依序取別名為 
"EMPLOYEE_NAME"、"SALARY"*/
select 
	ENAME EMPLOYEE_NAME,
    SAL SALARY
from EMP
where
	 DEPTNO in(10,30);




/* 04.列出有獎金(獎金 不是null，也不是0)的員工之姓名、薪資、獎金，並排序，排序依據為
薪資加上獎金 */
select 
	ENAME,
    SAL,
    COMM
from EMP
where
	COMM is not null and COMM != 0
order by SAL + COMM;



/* 05.列出員工姓名最後一個字是"S"的員工之姓名、職稱 */
select * from EMP;
select 
	ENAME, 
    JOB
from EMP
where
	ENAME like '%S';



/*06.列出職稱為CLERK、SALESMAN，且薪資不等於1100、1300、1500的員工之姓名、職稱、
薪資 */
select * from EMP;
select
	ENAME,
    JOB,
    SAL
from EMP
where 
	(JOB like 'CLERK' or JOB like'SALESMAN')
    and (SAL !=1100 and SAL !=1300 and SAL != 1500);
     #and SAL not in (1100,1300,1500)
    



/*07.列出獎金大於薪資1.05倍的員工之姓名、薪資、獎金 */
select * from EMP;
select 
	ENAME, 
    SAL,
    COMM    
from EMP
where
	COMM >= (SAL*1.05);
    

