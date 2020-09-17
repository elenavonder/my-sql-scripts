/*Want to know what major student can take (not in system) 
with an SAT less than or equal to 1000*/
declare @MinSAT int = 1000
select * 
from Major
where MinSAT <= @MinSAT 
order by MinSAT;