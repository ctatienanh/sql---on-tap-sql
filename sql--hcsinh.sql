create database qlhocvien;
use qlhocvien;
create table Test(
testid int primary key auto_increment,
name varchar(250) not null
);

create table student(
rn int primary key auto_increment,
name varchar(250) not null,
age int not null,
status varchar(250)
);

create table studenttest(
rn int,
testid int,
primary key(rn,testid),
ngaythi date,
mark int,
foreign key (rn) references student(rn),
foreign key (testid) references test(testid)
);

insert into student values( null ,'Nguyen Hong Ha', 20,null);
insert into student values( null ,'Truong Ngoc Anh', 30,null);
insert into student values( null ,'Tuan Minh', 25,null);
insert into student values( null ,'Dan Truong', 22,null);

insert into test values(null, 'EPC');
insert into test values(null, 'DWMX');
insert into test values(null, 'SQL1');
insert into test values(null, 'SQL2');

insert into studenttest values(1, 1 , '2006-07-17', 8),(1,2,'2006-07-17',5),
(1,3,'19-07-2006',7),(2,1,'2006-07-17',7),(2,2,'2006-07-18',4),
(2,3,'2006-07-19',2),(3,1,'2006-07-17',10),(3,3,'2006-07-18',1);
truncate table student;

create view ketquathi as
select st.name  , t.name as 'testname' , stt.mark, stt.ngaythi
from studenttest stt
join student st on stt.rn = st.rn
join test t on stt.testid = t.testid;


-- cau2
select * from ketquathi;

-- cau3
select * from student where student.rn  not in(select studenttest.rn from studenttest);

-- cau4
select*from ketquathi where mark<5;

-- cau5
select  name , avg(mark) from ketquathi
group by name order by avg(mark) desc ;

-- cau6
select  name , avg(mark) from ketquathi
group by name order by avg(mark) desc limit 1 ;

-- cau7
select testname ,max( mark) from ketquathi
group by testname;

-- cau8
select st.name, t.name from student st
left join studenttest stt on stt.rn = st.rn
left join test t on stt.testid = t.testid ;

-- cau9
update student set age = age +1 where rn>0 ;  
-- cau10
alter table student add column status varchar(250);

-- cau 11
update student set status = 'young' where rn>0 and age <30 ;
update student set status = 'old' where rn>0 and age >30;

-- cau12
select * from ketquathi order by ngaythi;

-- cau 13
