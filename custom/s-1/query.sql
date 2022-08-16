SELECT a.OwnerEmail, a.AccountId, o.CustomerId, o.PurchaseDate, (CASE WHEN o.purchaseDate >= ( DATEADD(month, 11, GETDATE() ) ) THEN TRUE END) as alerted
FROM Account a
INNER JOIN OrderInfo o
ON a.AccountId=o.CustomerId