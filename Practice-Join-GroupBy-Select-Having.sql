/*Want to see Major and Classes for Major;
Then see just the Major and how many classes are required
Then just see which Majors take more than 10 classes*/
select m.description 'Major', count (*) as 'Classes Required'
	from Major m
	join MajorClassRel r on r.MajorId = m.Id
	join Class C on c.Id = r.ClassId
	group by m.description
	having count (*) > 10; 