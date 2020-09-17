select * from orders o
join orderlines l on o.id = l.ordersid
join customers c on c.id = o.CustomerId