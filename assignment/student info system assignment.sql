create database StudentInformationSystem 
use StudentInformationSystem 

create table Students (StudentID int primary key identity(1,1), name varchar (50), age int ,gender varchar(1));

create table Courses(CourseID int primary key identity(1,1),CourseName varchar(50) ,credits int);

create table Enrollment(EnrollmentID int primary key identity(1,1),StudentId int,CourseID int,Grade char(1) foreign key (StudentID) references Students(StudentID),
                                                                                                            foreign key (CourseID) references Courses(CourseID));


insert into Students (Name,Age,Gender) values ('Manjula',21,'F'),('Misha',20,'F'),('Moni',21,'F'),('Mythili',21,'F'),('Manoj',20,'M'),('Mani',22,'M'),('Neha',21,'F'),('Nithisha',21,'F'),('Nandhini',21,'F'),('Sowmiya',21,'F'),('Nirosha',20,'F'),('Soundhari',21,'F'),('Bala',22,'M'),('Yashwant',21,'M');



insert into Courses values('Software engg', 4),('Compiler Design', 3),('Computer Organisation', 5),('Operating System',3),('DBMS',3),('DBMS Lab',2),('Evs', 2);
select * from Students
select * from Courses

insert into Enrollment (StudentID, CourseID, Grade) Values(1, 1, 'A'), (1, 2, 'B'),(2, 3, 'A'),(3, 4, 'C'),(4, 5, 'B'),(5, 6, 'A'),(6, 7, 'A'),(7, 1, 'C'),(8, 2, 'B'),(9, 3, 'A'),(10, 4, 'B'),(11, 5, 'C'),(12, 6, 'A'),(13, 7, 'B'),(14, 1, 'A');

select * from Enrollment

ALTER TABLE Students
ADD Email VARCHAR(100),
    PhoneNumber VARCHAR(15);

ALTER TABLE Courses
ADD TeacherID INT;

create table Teachers (
    TeacherID int PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);
select * from Teachers
create table Payments (PaymentID int primary key identity(1,1),StudentID int,Amount decimal(10,2), PaymentDate date ,foreign key(StudentID)references Students(StudentID));

UPDATE Students
SET Email = CASE StudentID
    WHEN 1 THEN 'manjula@example.com'
    WHEN 2 THEN 'misha@example.com'
    WHEN 3 THEN 'moni@example.com'
    WHEN 4 THEN 'mythili@example.com'
    WHEN 5 THEN 'manoj@example.com'
    WHEN 6 THEN 'mani@example.com'
    WHEN 7 THEN 'neha@example.com'
    WHEN 8 THEN 'nithisha@example.com'
    WHEN 9 THEN 'nandhini@example.com'
    WHEN 10 THEN 'sowmiya@example.com'
    WHEN 11 THEN 'nirosha@example.com'
    WHEN 12 THEN 'soundhari@example.com'
    WHEN 13 THEN 'bala@example.com'
    WHEN 14 THEN 'yashwant@example.com'
END,
PhoneNumber = CASE StudentID
    WHEN 1 THEN '9999000001'
    WHEN 2 THEN '9999000002'
    WHEN 3 THEN '9999000003'
    WHEN 4 THEN '9999000004'
    WHEN 5 THEN '9999000005'
    WHEN 6 THEN '9999000006'
    WHEN 7 THEN '9999000007'
    WHEN 8 THEN '9999000008'
    WHEN 9 THEN '9999000009'
    WHEN 10 THEN '9999000010'
    WHEN 11 THEN '9999000011'
    WHEN 12 THEN '9999000012'
    WHEN 13 THEN '9999000013'
    WHEN 14 THEN '9999000014'
END;

insert into Teachers values  ('Saranya', 'Raj', 'saranya.raj@example.com'),('Sasikala', 'Devi', 'sasikala.devi@example.com'),('Mohanapriya', 'Selvam', 'mohanapriya.selvam@example.com'),('Poongodi', 'Ravi', 'poongodi.ravi@example.com'),('Prakash', 'Kumar', 'prakash.kumar@example.com'),('Sivapriya', 'Natarajan', 'sivapriya.natarajan@example.com'),('Ramesh', 'Varma', 'ramesh.varma@example.com')
UPDATE Courses SET TeacherID = 1 WHERE CourseName = 'Software engg';
UPDATE Courses SET TeacherID = 2 WHERE CourseName = 'Compiler Design';
UPDATE Courses SET TeacherID = 3 WHERE CourseName = 'Computer Organisation';
UPDATE Courses SET TeacherID = 4 WHERE CourseName = 'Operating System';
UPDATE Courses SET TeacherID = 5 WHERE CourseName = 'DBMS';
UPDATE Courses SET TeacherID = 6 WHERE CourseName = 'DBMS Lab';
UPDATE Courses SET TeacherID = 7 WHERE CourseName = 'Evs';

select * from courses

select * from Enrollment

UPDATE Courses
SET TeacherID = CASE CourseID
    WHEN 1 THEN 1  
    WHEN 2 THEN 1  
    WHEN 3 THEN 2  
    WHEN 4 THEN 2 
    WHEN 5 THEN 3  
    WHEN 6 THEN 3 
    WHEN 7 THEN 3  
END;

insert into Payments values
(1, 5000.00, '2025-04-01'),
(2, 3000.00, '2025-04-03'),
(3, 2500.00, '2025-04-05'),
(4, 4000.00, '2025-04-07'),
(5, 1500.00, '2025-04-09'),
(6, 3000.00, '2025-04-11'),
(7, 2000.00, '2025-04-13'),
(8, 3500.00, '2025-04-15'),
(9, 2700.00, '2025-04-17'),
(10, 3800.00, '2025-04-19'),
(11, 4100.00, '2025-04-21'),
(12, 3600.00, '2025-04-23'),
(13, 5000.00, '2025-04-25'),
(14, 4500.00, '2025-04-27');

select * from Students
select * from Courses
select * from Enrollment

alter table Enrollment drop column Grade
alter table Enrollment Add EnrollmentDate date;




---------------------------------------------------------------------------------------------TASK 2-----------------------------------------------------------------------------------------------------------------
1.Inserting a new student record

insert into Students values('deepu',19,'F','deepu@gmail.com','9090909090')

select * from Students

2.Enroll a student in a course---------------------------------------
select * from Enrollment

insert into Enrollment values (15,2,'2025-04-08');

3.Update a email for specific teacher------------------------------------------

update teachers
set email = 'newmail@mail.com' where TeacherID = 3;

select * from Teachers

4.Delete a specific enrollment record-----------------------------------------

delete from Enrollment
where StudentId =1 and CourseID=2;

select *from Enrollment

5.assign a teacher to a course------------------------------------------------

update courses 
set TeacherID=4
where CourseID=3;

6.delete a specific student and remove their enrollment records-------------------

delete from Enrollment
where StudentId=5;

delete from Students
where StudentID=2;

6.update the payment amount
 
 update Payments
 set Amount=4500
 where PaymentID=3;

------------------------------------------------------------TASK 3-------------------------------------------------------
----------------1.TOTAL payments by specific student

select s.name as studentname ,sum(p.amount) as totalpayments
from students s
join payments p on s.StudentID=p.StudentID
where s.StudentID=6
group by name;


----------------2.list of courses with the count of students enrolled in it-----------------------------------------------------

select c.coursename,count(e.enrollmentid) as studentcount
from courses c
left join Enrollment e on c.courseid =e.CourseID
group by c.coursename;

select * from Enrollment

-------------3.names of students who have not enrolled in any course----------------------------------------------------'

select s.name as studentname from students s
left join Enrollment e on s.StudentID=e.studentid where e.enrollmentid is null

------------4.names of students and the courses they have enrolled in------------------------------------------------

select s.name as studentname,c.coursename 
from students s 
join Enrollment e on s.StudentID=e.StudentId
join Courses c on e.CourseID=c.CourseID;

------------5.names of teachers adn their courses--------------------------------------------------------

select t.firstname as teacherFirstName ,t.lastname as teacherLastName ,c.courseName 
from Teachers t join courses c on t.teacherid = c.TeacherID

--------6.list of students and their enrollment dates for specific course---------------------------------

select s.name as studentname ,e.enrollmentdate
from students s 
join Enrollment e on s.studentid = e.StudentId
join courses c on e.courseid =c.CourseID
where c.coursename ='dbms'



--------7.names of students who have not done payments yet---------------------------------------------------

select s.name as studentname
from students s
left join payments p on s.StudentID=p.StudentID
where p.PaymentDate is null;

--------8.courses with no enrollments---------------------------------------------------------------------------

select c.coursename from courses c
left join Enrollment e on c.CourseID =e.CourseID
where e.EnrollmentID is null;

---------9.students enrolled in more than one course-----------------------------------------------------------

select s.name as studentname ,count(e.courseid) as coursecount
from students s
join enrollment e on s.studentid = e.studentid 
group by s.name 
having count(e.courseID) > 1;


---------10.teachers not assigned to any courses -----------------------------------------------------------

select t.firstname as teacherFirstName ,t.lastname as teacherLastName
from teachers t
left join courses c on t.TeacherID = c.TeacherID
where c.CourseID is null;


use studentInformationSystem
---------------------------------------------------------------------------------------------TASK 4---------------------------------------------------------------------------------------------------------------------------------
-----1. average no. of students enrolled in each course
select * from enrollment


SELECT AVG(sub.total_enrollment) AS Average_enrollment_per_course
FROM (
    SELECT c.CourseName, COUNT(e.EnrollmentID) AS total_enrollment
    FROM Courses c
    JOIN Enrollment e ON c.CourseID = e.CourseID
    GROUP BY c.CourseName
) AS sub;

--------2.students who made highest payment --------------------------------------------------------------------------------------
select * from students

select studentId,amount
from payments 
where Amount = (select max (Amount) from payments);

------3.list of courses with highest enrollments-------------------------------------------------------------------------------

select courseID,Count(StudentID) as enrollmentCount from enrollment
group by COurseId
having count(studentID)= (select max(EnrollmentCount) 
from (select CourseID,COunt(studentid) as ENrollmentCount from enrollment
group by courseid ) as ENrollmentstats);

------4.total payments made to courses taught by teacher---------------------------------------------------------------------

select t.teacherid, t.firstname, t.lastname,
(
  select sum(p.amount)
  from payments p
  join students s on p.studentid = s.studentid
  join enrollment e on s.studentid = e.studentid
  join courses c on e.courseid = c.courseid
  where c.teacherid = t.teacherid
) as totalpayment
from teachers t;



----5. students enrolled in all available courses -----------------------------------------------------------------------------

select s.studentid,s.name from students s 
join enrollment e on s.studentid = e.studentid 
group by s.studentid,s.name 
having count(distinct e.courseid)=(select count(*) from courses); -------count(*) - counts all the rows------------

-----6.name of teachers not assigned in anycourse-----------------------------------------------------------------------------------

select * from payments

select t.teacherid ,t.firstname,t.lastname  from teachers t
where t.teacherid not in (select teacherid from courses where teacherid is not null);----------not in filters teachers in subquery leaving only those who aren't assigned----------------------

------7.avg age of all students--------------------------------------------------------------------------------------------------------------

select avg (age) as averageAge from students;

-----8.course with no enrollments------------------------------------------------------------------------------------------------------

select c.courseid ,c.coursename from courses c 
left join enrollment e on c.courseid = e.courseid 
where e.courseid is null;


-----9.total payments made by each student for each course they are enrolled------------------------------------------------------------

select e.studentid,e.courseid,sum(p.amount) as TotalPayment 
from enrollment e 
join payments p on e.studentid = p.studentid
group by e.studentid ,e.courseid;

-----10.students who made more than one payment----------------------------------------------------------------------------------------------

select p.studentid ,count(*) as paymentCount from payments p
group by p.studentid 
having count(*)>1;------------------------count(*) counts all the rows and shows only more than once paid students-----------------------------

------11.total payments made by each student---------------------------------------------------------------------------------------------------

select e.studentid,sum(p.amount) as TotalPayment 
from enrollment e 
join payments p on e.studentid = p.studentid
group by e.studentid ; 

-----12. course names along with students enrolled in it--------------------------------------------------------------------------------

select c.coursename ,count(e.studentid) as studentcount
from courses c
left join enrollment e on c.courseid=e.courseid
group by c.coursename;

------13. avg of payment amount made by students---------------------------------------------------------------------------------------------

select avg(p.amount) as avgamount
from payments p;