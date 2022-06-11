/* 01.請列出薪資比所有SALESMAN還低的員工(有沒有人比所有的SALESMAN還低) */
#第一步 先列出所有SALESMAN的薪資
select 
	MIN(SAL)
from EMP
where JOB = 'SALESMAN';



#第二步 找出薪水小於SALESMAN
select *
from EMP
where SAL < (
		select	MIN(SAL)
		from EMP
		where JOB = 'SALESMAN');


/* 02.請列出到職年(到職日之年)最早的兩年，那兩年到職的員工，
並依到職日排序(ANS:1980.1981 >>不能寫死)*/

#第一步 篩選到職年
select * from EMP;
select 
	distinct year(HIREDATE) as 到職年
from EMP
order by year(HIREDATE);

#第二步 篩選前兩年		
select
	 e.到職年
from (select distinct year(HIREDATE) as 到職年
	  from EMP
	  order by year(HIREDATE)) e
limit 2;    


#第三步 將員工列出
select 
	e1.到職年,
    e1.ENAME
from (select  year(HIREDATE) as 到職年,ENAME from EMP ) e1
	join(select e.到職年
		 from (
			select distinct year(HIREDATE) as 到職年
			from EMP
			order by year(HIREDATE)) e
	   limit 2) e2
       on e1.到職年 = e2.到職年 
order by e1.到職年;


#第三步 將到職日排序




/* 03.請列出主管的主管是KING 的員工 */
#步驟一 列出KING的員工編號
select 
	EMPNO KING員編,
    ENAME KING
from EMP
where ENAME = 'KING';


#步驟二 KING的第一個下屬
select * from EMP;
select 
	e.EMPNO 直屬員工編號,
    e.ENAME 直屬員工姓名,
    e1.KING員編,
    e1.KING
from EMP e
	join (select EMPNO KING員編, ENAME KING from EMP where ENAME = 'KING') e1
		on e.MGR = e1.KING員編;

#步驟三 找出直屬下屬的員工

select 
	e3.EMPNO 直屬員工的下屬員編,
    e3.ENAME 直屬員工的下屬名,
    e2.直屬員工編號,
    e2.直屬員工姓名,
    e2.KING員編,
    e2.KING
from EMP e3
	join (select e.EMPNO 直屬員工編號,
				 e.ENAME 直屬員工姓名,
				 e1.KING員編,
				 e1.KING
		 from EMP e
		 join (select EMPNO KING員編, ENAME KING from EMP where ENAME = 'KING') e1
			on e.MGR = e1.KING員編) e2
		on e3.MGR = e2.直屬員工編號

/* 04.請列出部門內員工薪資有3種薪資等級之部門名稱、部門所在地 */
#列出部門內員工
select * from EMP;
select * from DEPT;
select * from SAL_LEVEL;


select 
	e.DEPTNO 部門號碼,
	e.SAL 薪資,
    s.LEVEL 
from EMP e
	join SAL_LEVEL s
		on e.SAL between s.SAL_MIN and s.SAL_MAX;

select *
from (select 
		e.DEPTNO 部門號碼,
		e.SAL 薪資,
		s.LEVEL 
	 from EMP e
		join SAL_LEVEL s
			on e.SAL between s.SAL_MIN and s.SAL_MAX) e1
order by e1.部門號碼




select 
	e1.部門號碼,
    count(distinct e1.薪資等級)
    
from(select 
		e.DEPTNO 部門號碼,
		e.SAL 薪資,
		s.LEVEL 薪資等級
	from EMP e
		join SAL_LEVEL s
			on e.SAL between s.SAL_MIN and s.SAL_MAX) e1
group by e1.部門號碼
having count(distinct e1.薪資等級) = 3

select 
	d.DNAME 部門名稱,
    d.LOC 部門所在地
from(select 
		e1.部門號碼,
		count(distinct e1.薪資等級)
    
	from (select 
			e.DEPTNO 部門號碼,
			e.SAL 薪資,
			s.LEVEL 薪資等級
		  from EMP e
			join SAL_LEVEL s
				on e.SAL between s.SAL_MIN and s.SAL_MAX) e1
		  group by e1.部門號碼
		  having count(distinct e1.薪資等級) = 3) e2
			left join DEPT d
				on e2.部門號碼 = d.DEPTNO



/* 05.請列出跟員工姓名最後一字元是S的員工同部門，
該部門薪資最低的員工之部門名稱、姓名、薪資 */
/*
select 
	DEPTNO,
    MIN(SAL) MIN_SAL
from EMP
group by DEPTNO;


select *
from EMP e
	join(select DEPTNO,
				MIN(SAL) MIN_SAL
		from EMP
		group by DEPTNO) e1
			on e.DEPTNO = e1.DEPTNO
where e.SAL = e1.MIN_SAL;
*/	
    
select * from (
	select *
		from EMP e
			join(select DEPTNO 部編,
						MIN(SAL) MIN_SAL
				 from EMP
				 group by 部編) e1
				on e.DEPTNO = e1.部編
		where e.SAL = e1.MIN_SAL
			) e2
where e2.部編 in (select DEPTNO from EMP where ENAME like '%S')


/*
select * from EMP where ENAME like '%S';
*/
