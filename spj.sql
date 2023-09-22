/*     ***************Assignment1***************
       ************** Yomna Taher Abd-allah****************
       *************     20190624      ********************
*/
create database SPJ;
use SPJ;
CREATE TABLE S
(
    s#     
    VARCHAR(5),
    sname VARCHAR(20),
    status INTEGER,
    city VARCHAR(10),
    PRIMARY KEY (s#
    )
);
  
  use SPJ;
CREATE TABLE P
 (
    p#
    VARCHAR(5),
    pname VARCHAR(20),
    color VARCHAR(10),
    weight INTEGER,
    city VARCHAR(10),
    PRIMARY KEY (p#
    )
);
  
  use SPJ;
CREATE TABLE J
(
    j#
    VARCHAR(5),
    jname VARCHAR(20),
    city VARCHAR(10),
    PRIMARY KEY (j#
    )
);
  
  use SPJ;
CREATE TABLE SPJ (
    s#
    VARCHAR(5),
    p#
    VARCHAR(5),
    j#
    VARCHAR(5),
    qty INTEGER,
    PRIMARY KEY (s , p , j)
);
  
  use SPJ;
  alter table SPJ add constraint fk_S_s foreign key (s#
  )
references S (s#
);

use SPJ;
  alter table SPJ add constraint fk_P_p foreign key (p#
  )
references P (p#
);

use SPJ;
  alter table SPJ add constraint fk_J_j foreign key (j#
  )
references J (j#
);

use SPJ;
insert into S values('S1', 'Smith', 20, 'London');
insert into S values('S2', 'Jones', 10, 'Paris');
insert into S values('S3', 'Blake', 30, 'Paris');
insert into S values('S4', 'Clark', 20, 'London');
insert into S values('S5', 'Adams', 30, 'Athens');
select *from S;



use SPJ;
insert into P values('P1', 'Nut', 'Red', 12, 'London');
insert into P values('P2', 'Bolt', 'Green', 17, 'Paris');
insert into P values('P3', 'Screw', 'Blue', 17, 'Rome');
insert into P values('P4', 'Screw', 'Red', 14, 'London');
insert into P values('P5', 'Cam', 'Blue', 12, 'Paris');
insert into P values('P6', 'Cog', 'Red', 19, 'London');
select * from P;
  
  
  use SPJ;
  insert into J values('J1', 'Sorter', 'Paris');
insert into J values('J2', 'Punch', 'Rome');
insert into J values('J3', 'Reader', 'Athens');
insert into J values('J4', 'Console', 'Athens');
insert into J values('J5', 'Collator', 'London');
insert into J values('J6', 'Terminal', 'Oslo');
insert into J values('J7', 'Tape', 'London');
SELECT 
    *
FROM
    J;

  use SPJ;
insert into SPJ values('S1', 'P1', 'J1', 200);
insert into SPJ values('S1', 'P1', 'J4', 700);
insert into SPJ values('S2', 'P3', 'J1', 400);
insert into SPJ values('S2', 'P3', 'J2', 200);
insert into SPJ values('S2', 'P3', 'J3', 200);
insert into SPJ values('S2', 'P3', 'J4', 500);
insert into SPJ values('S2', 'P3', 'J5', 600);
insert into SPJ values('S2', 'P3', 'J6', 400);
insert into SPJ values('S2', 'P3', 'J7', 800);
insert into SPJ values('S2', 'P5', 'J2', 100);
insert into SPJ values('S3', 'P3', 'J1', 200);
insert into SPJ values('S3', 'P4', 'J2', 500);
insert into SPJ values('S4', 'P6', 'J3', 300);
insert into SPJ values('S4', 'P6', 'J7', 300);
insert into SPJ values('S5', 'P2', 'J2', 200);
insert into SPJ values('S5', 'P2', 'J4', 100);
insert into SPJ values('S5', 'P5', 'J5', 500);
insert into SPJ values('S5', 'P5', 'J7', 100);
insert into SPJ values('S5', 'P6', 'J2', 200);
insert into SPJ values('S5', 'P1', 'J4', 100);
insert into SPJ values('S5', 'P3', 'J4', 200);
insert into SPJ values('S5', 'P4', 'J4', 800);
insert into SPJ values('S5', 'P5', 'J4', 400);
insert into SPJ values('S5', 'P6', 'J4', 500);
select * from SPJ;

/*     ***************Assignment1***************
       ************** Yomna Taher Abd-allah****************
       *************     20190624      ********************
*/
 use SPJ;
 select distinct Pname, Sname
 from S ,P,J, SPJ
 where SpJ.s = S.s and SPJ.P = P.p and SPJ.j = J.j;
 
 use SPJ;
 select avg(qty) as avgQ
 from SPJ;
 
select s
from SPJ
where SPJ.p = 'p1' And SPJ.qty > 300; 

select j
from SPJ
WHERE SPJ.S = 'S1';

use SPJ;
select distinct sname
from S , SPJ , P
where S.s = SPJ.s and SPJ.p = P.p and P.p <> 'p2';

use SPJ;
select distinct Y.sname
from S as Z , S as Y , SPJ
where Z.s = SPJ.s  and Y.status = Z.status and SPJ.p = 'p1';

 use SPJ;
 SELECT  distinct SX.s, SY.s
FROM SPJ AS SX, SPJ AS SY
WHERE SX.P=SY.P AND SX.S<>SY.S ;

/******************************************************/
use SPJ;
 SELECT  distinct SX.sname 
FROM S AS SX , SPJ as SY 																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
WHERE SX.S=SY.S ;




select s
FROM SPJ
where SPJ.P <> 'P2' ;

 use SPJ;
select distinct S.sname 
from SPJ join S
where SPJ.s = S.s and SPJ.P = 'P1' 
and S.sname in ( select S.sname from S where S.status in (20,30) );