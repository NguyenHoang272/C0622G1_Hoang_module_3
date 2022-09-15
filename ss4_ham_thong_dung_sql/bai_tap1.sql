USE QuanLySinhVien;
select * from `subject`
where credit = ( select max(credit) from `subject`);

select * from `mark`
where mark = ( select max(mark) from `mark`);

select student.StudentName, avg(mark) as diem_trung_binh from Mark
join student on student.StudentId= mark.StudentId 
group by student.StudentId
order by diem_trung_binh desc;

