
create table admin_info
(id number(4) constraint admin_info_id_pk primary key,
 admin_code varchar2(30) constraint admin_info_admin_code_uk unique not null,
 password varchar2(8) not null,
 name varchar2(20) not null,
 telephone varchar2(15) null,
 email varchar2(50) null,
 enrolldate date not null
);
select * from cost;
--管理员角色表--
create table admin_role
(admin_id number(4) constraint admin_role_admin_id_FK references admin_info(id),
 role_id number(4) constraint admin_role_role_id_FK references role_info(id),
 constraint admin_info_role_uk unique(admin_id,role_id)
 
 
);


select * from (select c.*, rownum rn from cost c where rownum<5) where rn >3;

select empno,ename,sal
 from (
  select empno,ename,
         sal,rownum rn
  from
    (select * from emp
     order by sal desc)
  where rownum <=10
 )
 where rn>5;
