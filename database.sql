/*     ***************Assignment1***************
       ************** Yomna Taher Abd-allah****************
       *************     20190624      ********************
*/
create database XYZ_Company;
use XYZ_Company;
CREATE TABLE Employee (
    SSN VARCHAR(50) NOT NULL PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Bdate DATE NOT NULL,
    City VARCHAR(50) NOT NULL,
    Dnumber INT NOT NULL
);

use XYZ_Company;
CREATE TABLE Department (
    Dname VARCHAR(50) NOT NULL,
    Dno INT NOT NULL PRIMARY KEY,
    Dmgr_SSN VARCHAR(50) NULL,
    UNIQUE (Dname)
);

use XYZ_Company;
CREATE TABLE Project (
    Pname VARCHAR(50) NOT NULL,
    Pnumber INT NOT NULL PRIMARY KEY,
    Plocation VARCHAR(50) NOT NULL,
    Dnumber INT NOT NULL,
    CONSTRAINT fk_Project_Department FOREIGN KEY (Dnumber)
        REFERENCES Department (Dno)
);

use XYZ_Company;
CREATE TABLE WorksOn (
    Pnumber INT NOT NULL,
    SSN VARCHAR(50) NOT NULL,
    Hours INT NOT NULL,
    PRIMARY KEY (SSN , Pnumber),
    CONSTRAINT fk_WorksOn_Employee FOREIGN KEY (SSN)
        REFERENCES Employee (SSN)
);


use XYZ_Company;
SELECT *
FROM Employee;

insert into Employee values (123456789,'Hytham', '1989-03-12','Cairo',3) ;
insert into Employee values (101112131,'Mona', '1990-03-02','Cairo',1) ;
insert into Employee values (141516171,'Maryam', '1990-08-12','Cairo',3); 
insert into Employee values (181920212,'Mahmoud', '1989-11-05','Alex',1) ;
insert into Employee values (222324252,'Osama', '1989-05-12','Alex',4) ;
insert into Employee values (262728293,'Ghada', '1990-12-12','Cairo',2) ;
insert into Employee values (303132333,'Noha', '1990-02-15','Cairo',2);

use XYZ_Company;
insert into Department (Dname , Dno )values ('MobileTeam' , 2);
insert into Department (Dname , Dno )values ('Development Teams' , 3);
insert into Department (Dname , Dno )values ('General Team' , 4);
insert into Department (Dname , Dno )values ('.NetTeam' , 1);
SELECT *
FROM Department;









use XYZ_Company;
alter table Department add constraint fk_Department_Employee foreign key (Dmgr_SSN)
references Employee (SSN);

use XYZ_Company;
alter table Employee add constraint fk_Employee_Department foreign key (Dnumber)
references Department (Dno);

use XYZ_Company;
UPDATE Department 
SET 
    Dmgr_SSN = 123456789
WHERE
    Dno = 1;
    
UPDATE Department 
SET 
    Dmgr_SSN = 141516171
WHERE
    Dno = 2;
    
UPDATE Department 
SET 
    Dmgr_SSN = 222324252
WHERE
    Dno = 3;

use XYZ_Company;
INSERT INTO Project VALUES ('SPOC',1,'Cairo',1) ;
INSERT INTO Project VALUES ('SalesPer',2,'Alex',2); 
INSERT INTO Project VALUES ('ALICO',3,'Cairo',1) ;
INSERT INTO Project VALUES ('TGuide',4,'Cairo',2) ;
SELECT *
FROM Project;


use XYZ_Company;
INSERT INTO WorksOn VALUES (1,101112131,19) ;
INSERT INTO WorksOn VALUES (2,303132333,6) ;
INSERT INTO WorksOn VALUES (3,181920212,14) ;
INSERT INTO WorksOn VALUES (4,262728293,3) ;
select * from WorksOn;


use XYZ_Company;
select Dname,Ename
from department,Employee
where department.Dmgr_SSN = Employee.SSN;

use XYZ_Company;
select distinct Dnumber
from Project;

use XYZ_Company;
select Ename
from Employee
where Dnumber= 3;

use XYZ_Company;
select Ename
from Employee,Department
where Department.Dname = 'MobileTeam' and Employee.City='Cairo' and Employee.Dnumber = Department.Dno;



use XYZ_Company;
select Ename
from Employee
where Dnumber= 1 or Dnumber=2 ;

use XYZ_Company;
select Ename
from Employee,Department
where Employee.SSN = Department.Dmgr_SSN;


use XYZ_Company;
select Pname,Dname
from Project,Department
where Project.Dnumber=Department.Dno;

use XYZ_Company;
select Ename,Pname
from Employee,Project,WorksON
where Employee.SSN=WorksON.SSN and Project.Pnumber=WorksON.Pnumber;

use XYZ_Company;
select Ename
from Employee,Project,WorksON
where Employee.SSN=WorksON.SSN and Project.Pnumber=WorksON.Pnumber and Employee.City=Project.Plocation;


use XYZ_Company;
select distinct Ename
From Employee, Project, WorksOn
where Employee.City = Project.Plocation and WorksOn.Pnumber = Project.Pnumber and Employee.SSN = WorksOn.SSN;


use XYZ_Company;
select distinct A.Ename , B.Hours
from Employee as A , WorksOn as B , Department , Poject
where A.SSN = B.SSN and B.Pnumber = Project.Pnumber and A.City =Project.Plocation and A.Dnumber <> Project.Dnumber;

use XYZ_Company;
select distinct Ename,Hours
from Employee,Department,WorksOn,Project
where Employee.SSN = WorksOn.SSN and WorksOn.Pnumber = Project.Pnumber
and Department.Dmgr_SSN <> WorksOn.SSN;



use XYZ_Company;
select Dname,Dmgr_SSN
from department
order by Dmgr_SSN;
