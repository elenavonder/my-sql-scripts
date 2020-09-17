/*Create a list of Students where SAT less than 1000*/
select * from Student
where SAT < 1000;

/*Create a list of instructors showing only the FirstName, LastName,
and YearsExperience columns ordered by LastName in asc sequence*/
Select Firstname, Lastname, YearsExperience from Instructor
order by Lastname;

/*Display the student lastname and the major description for
only students that have a declared major*/
select s.Lastname, m.Description from Student s
join Major m on s.MajorId = m.Id;

/*Create a list of major description, class code, and 
class subject for required classes for the major 'General Business'*/
Select m.Description, c.Section, c.Subject from MajorClassRel r
join Major m on r.MajorId = m.Id
join Class c on r.ClassId = c.Id
where m.Description = 'general business';

/*Create a list of ALL CLASSES (outerjoin)
and include the instructors name if one exists*/
select * from Class c LEFT join Instructor i
on c.InstructorId = i.Id;
/*If you just want class information and Instructor LastName
AND have it labeled as Instructor
Select c.*, i.lastname as 'Instructor' from ________*/