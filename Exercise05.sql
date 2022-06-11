/* 01.請列出所有員工的員工編號、姓名、職稱、部門編號及部門名稱 */
select  * from EMP;
select 
	e.EMPNO as 員工編號,
    e.ENAME as 姓名,
    e.JOB as 職稱,
    e.DEPTNO as 部門編號,
    d.DNAME as 部門名稱
    
from 
	EMP e
    join DEPT d
    on e.DEPTNO = d.DEPTNO;




/* 02.請列出所有部門編號為30 且 職稱為"SALESMAN"之部門名稱、員工姓名、獎金 */
select  * from EMP;
select  * from DEPT;
select 
		e.DEPTNO,
        e.JOB,
		d.DNAME,
		e.ENAME,
		e.SAL
from 
	EMP e
	join DEPT d
where
	e.DEPTNO = 30 and e.JOB = "SALESMAN";
		
        
        

/* 03.請列出薪水等級為"B"的員工之員工編號、員工姓名、薪資 */
select  * from EMP;
select  * from DEPT;
select  * from SAL_LEVEL;
select 
	e.EMPNO,
    e.ENAME,
    e.SAL,
    s1.LEVEL
from 
	EMP e
	join SAL_LEVEL s1
		on s1.LEVEL ='B';
 

/* 04.請列出部門編號、部門名稱及部門人數 */
select  * from EMP;
select  * from DEPT;

select 
	d.DEPTNO,
    d.DNAME,
    dd.DEPT_COUNT
from DEPT d
	join (select 
			DEPTNO,
			COUNT(*) DEPT_COUNT
		from EMP
		group by DEPTNO) dd
	on d.DEPTNO = dd.DEPTNO;
#連接DEPT中的DEPTNO在虛擬表格d(有部門編號、部門人數)內
/*
select  * 
from DEPT d
	join (select 
			DEPTNO,
			COUNT(*) DEPP_COUNT
		  from EMP
		  group by DEPTNO) dd
	on d.DEPTNO = dd.DEPTNO;   */
#創立計數部門人數
/*
(select 
			DEPTNO,
			COUNT(*) DEPP_COUNT
		from EMP
		group by DEPTNO); */




/* 05.請列出每個主管之姓名、直屬下屬人數、直屬下屬平均薪資，並依 直屬下屬人數遞減
、主管姓名遞增排序 */
select  * from EMP;
select  * from DEPT;
select  * from SAL_LEVEL;


select 
	e1.ENAME 主管名,
    COUNT(e1.ENAME) 直屬下屬數,
	ROUND(AVG(e1.SAL),0) 下屬平均薪
    
FROM EMP e 
	LEFT JOIN EMP e1
    on e.MGR = e1.EMPNO
group by e1.ENAME
having 主管名 is not null
order by 直屬下屬數 desc, 下屬平均薪 asc

 
 
 
 