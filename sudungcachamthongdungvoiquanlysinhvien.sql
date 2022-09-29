use quanlysinhvien;

select Address, COUNT(StudentId) AS 'so luong hoc vien'
from student
group by Address;


select S.StudentId, S.StudentName, AVG(mark)
from student S join mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(mark) > 15;

select S.StudentId, S.StudentName, AVG(mark)
from student S join mark M on S.StudentId = M.StudentId
group by S.StudentId, StudentName
having AVG(mark) >= all (select AVG(mark) from mark group by mark.StudentId);