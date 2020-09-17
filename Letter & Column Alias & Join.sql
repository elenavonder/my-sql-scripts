
select s.Id, concat(s.Firstname, ' ', s.Lastname)as 'Name', s.gpa, m.description as 'Major'
from student s
join Major m on m.Id = s.MajorId;