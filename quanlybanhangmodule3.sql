use quanlysinhvien;


alter table mark
 add UNIQUE (SubId, StudentId),
 add FOREIGN KEY (SubId) REFERENCES Subject (SubId),
 add FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

