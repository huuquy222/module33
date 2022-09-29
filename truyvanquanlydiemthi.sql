use quanlysinhvien;

select* from student;

select* from student
where Status = true;

select*from subjectt
where Credit < 10;

select S.StudentId, StudentName, ClassName
from student S join class C on S.ClassId = C.ClassID;

select S.StudentId, S.StudentName, ClassName
from Student S join Class C on S.ClassId = C.ClassID
where C.ClassName = 'A1';

select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from student S join mark M on S.StudentId = M.StudentId join subjectt Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';




