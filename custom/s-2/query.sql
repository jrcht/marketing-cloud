SELECT c.customerId, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 1, GETDATE() ) ) THEN 1 END) AS LoyalScore1, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 6, GETDATE() ) ) THEN 1 END) AS LoyalScore6, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 12, GETDATE() ) ) THEN 1 END) AS LoyalScore12, GETDATE() as updatedAt
FROM ent.OrderInfo c
GROUP BY c.customerId