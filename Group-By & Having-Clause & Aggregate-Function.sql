select City, state, sum (sales) as 'Total Sales'
from Customers
group by city, state
having sum (sales) > 600000 --Can't use Where (only for individual rows and this is total)
--having city = 'Cincinnati' or city = 'Columbus'
--having city in ('Cincinnati', 'Columbus');
