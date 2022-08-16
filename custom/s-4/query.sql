SELECT c.customerId, GETDATE() as UpdatedAt, GETDATE() as CreatedAt
FROM OrderInfo c
INNER JOIN 
ON c.