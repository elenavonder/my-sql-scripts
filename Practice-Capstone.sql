/*
Select r.Description, r.DeliveryMode, r. Status, r.Total,
p.Name, p.Price, l.Quantity, (p.price * l.Quantity) as 'Subtotal',
concat (u. FirstName, ' ', u.LastName) as Name, u.PhoneNumber */
Select sum (l.quantity * p.price) as 'Total', r. Description
from Requests r
left join LineItems l on r.Id = l.RequestsId
left join Products p on p.Id = l.ProductsId
left join Vendors v on v.Id = p. VendorsId
left join Users u on u.id = r.UsersId
group by r. Description;