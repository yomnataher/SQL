create database Company_2;

use Company_2;
create table Employee(
Ename varchar (50) not null,
SSN varchar (50) not null primary key,
Bdate date not null,
City varchar (50) not null,
Dnumber int not null

);

use Company_2;
create table Department(
Dname varchar (50) not null,
Dno int not null primary key,
Dmgr_SSN varchar (50) null,
unique (Dname)
);

use Company_2;
create table Project(
Pname varchar (50) not null,
Pnumber int not null primary key,
Plocation varchar (50) not null,
Dnumber int not null,
constraint fk_Project_Department foreign key (Dnumber) references Department(Dno)
);




use Company_2;
create table WorksOn(
Pnumber int not null ,
SSN varchar (50) not null ,
Hours int not null,
primary key (SSN,Pnumber),
constraint fk_WorksOn_Employee foreign key (SSN) references Employee (SSN)
);




use Company_2;
alter table Department add constraint fk_Department_Employee foreign key (Dmgr_SSN)
references Employee (SSN);


use Company_2;
alter table Employee add constraint fk_Employee_Department foreign key (Dnumber)
references Department (Dno);


use Company_2;
insert into Employee values ('Hytham',123456789, '1989-03-12','Cairo',3) ;
insert into Employee values ('Mona', 101112131,'1990-03-02','Cairo',1) ;
insert into Employee values ('Maryam', 141516171,'1990-08-12','Cairo',3); 
insert into Employee values ('Mahmoud',181920212, '1989-11-05','Alex',1) ;
insert into Employee values ('Osama',222324252, '1989-05-12','Alex',4) ;
insert into Employee values ('Ghada',262728293, '1990-12-12','Cairo',2) ;
insert into Employee values ('Noha',303132333, '1990-02-15','Cairo',2);
select * from Employee;

use Company_2;
select * from Department;
insert into Department (Dname , Dno )values ('MobileTeam' , 2);
insert into Department (Dname , Dno )values ('Development Teams' , 3);
insert into Department (Dname , Dno )values ('General Team' , 4);
insert into Department (Dname , Dno )values ('.NetTeam' , 1);



use Company_2;
Update Department SET Dmgr_SSN = 123456789 WHERE Dno = 1 ;
Update Department SET Dmgr_SSN = 141516171 WHERE Dno = 2 ;
Update Department SET Dmgr_SSN = 222324252 WHERE Dno = 3;

use Company_2;
INSERT INTO Project VALUES ('SPOC',1,'Cairo',1) ;
INSERT INTO Project VALUES ('SalesPer',2,'Alex',2); 
INSERT INTO Project VALUES ('ALICO',3,'Cairo',1) ;
INSERT INTO Project VALUES ('TGuide',4,'Cairo',2) ;
select * from Project;


use Company_2;
INSERT INTO WorksOn VALUES (1,101112131,19) ;
INSERT INTO WorksOn VALUES (2,303132333,6) ;
INSERT INTO WorksOn VALUES (3,181920212,14) ;
INSERT INTO WorksOn VALUES (4,262728293,3) ;
select * from WorksOn;


/*1*/use Company_2;
select Dname,Dmgr_SSN
from department
order by Dmgr_SSN;

/*2*/use Company_2;
select distinct Dnumber
from Project;


/*3*/use Company_2;
select *
from Employee
where Dnumber= 3;


use Company_2;
select Dname,Dmgr_SSN
from department
order by Dmgr_SSN;

/*4*/use Company_2;
select Ename
from Employee,Department
where Department.Dname= 'MobileTeam' and Employee.City='Cairo';

/*6*/use Company_2;
select Ename
from Employee
where Dnumber= 1 or Dnumber=2 ;

/*7*/use Company_2;
select Ename
from Employee,Department
where Employee.SSN = Department.Dmgr_SSN;

/*8*/use Company_2;
select Pname,Dname
from Project,Department
where Project.Dnumber=Department.Dno;

/*9*/use Company_2;
select Ename
from Employee,Project,WorksON
where Employee.SSN=WorksON.SSN and Project.Pnumber=WorksON.Pnumber;


/*10*/use Company_2;
select Ename
from Employee,Project,WorksON
where Employee.SSN=WorksON.SSN and Project.Pnumber=WorksON.Pnumber and Employee.City=Project.Plocation;


select distinct Ename,Dname,Hours
from Employee,Department,WorksOn,Project
where Employee.SSN = Department.Dmgr_SSN and WorksOn.Pnumber = Project.Pnumber;

select distinct Ename
From Employee, Project, WorksOn
where Employee.City = Project.Plocation and WorksOn.Pnumber = Project.Pnumber and Employee.SSN = WorksOn.SSN

