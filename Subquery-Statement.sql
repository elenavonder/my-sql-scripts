/*Display all students wuth GPA scores greater
than the average GPA of all students*/
select *
	from Student 
	where GPA > (select AVG(GPA) from Student);

/*Make the first part of the query to get data;
then add select AVG statement;
then add where clause and combine both select statements*/