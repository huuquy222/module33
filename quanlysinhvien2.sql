create database quanlysinhvien;

use quanlysinhvien;

create table class(
ClassId  int   not null auto_increment primary key,
ClassName varchar(50)  not null,
StartDate datetime  not null,
Status  bit
);

create table student(
StudentId  int  not null auto_increment primary key,
StudentName varchar(30) not null,
Address  varchar(30),
Phone varchar(20),
Status  bit,
ClassId  int   not null,
foreign key (ClassId) references Class (ClassId)
);


create table Subjectt(
SubId  int   not null auto_increment primary key,
SubName  varchar(30) not null,
Credit   tinyint  not null default 1 check(Credit >= 1),
Status   bit               default 1
);

create table mark(
MarkId  int not null  auto_increment primary key,
SubId   int not null,
StudentId int not null,
Mark  float  default 0 check (Mark between 0 and 100),
ExamTimes  tinyint default 1,
Unique (SubId, StudentId),
foreign key (SubId) references Subjectt  (SubId),
foreign key (StudentId) references student (StudentId)
);









