SELECT s.ContactandLeadId as uniqueID, 'new' as status, (GETDATE()) as createdDate, s.modifiedDate as SFmodifiedDate
FROM ENT.Switzerland_ContactsandLeads s
FULL OUTER JOIN "SW_Lead_saleswingsapp" w
ON s.ContactandLeadId = w.SFMC_SubscriberId
WHERE ( s.RecordType LIKE '%Lead%' AND s.Status = 'new' AND s.modifiedDate >= (DATEADD(day, -18, GETDATE())) )
OR ( s.RecordType LIKE '%Contact%' AND s.modifiedDate >= (DATEADD(day, -18, GETDATE())) )


SELECT s.SFMC_SubscriberId as uniqueID, 'new' as status, (GETDATE()) as createdDate, s.lastUpdatedDate as SFmodifiedDate
FROM "SW_Lead_saleswingsapp" s
WHERE s.SFMC_SubscriberId <> '' AND s.lastUpdatedDate >= ( DATEADD(day, -18, GETDATE() ) )

SELECT c.Name, COUNT(CASE WHEN c.MemberStatus='Form Submit' THEN 1 END) AS number, c.CampaignID, COUNT(CASE WHEN c.UniqueID LIKE '00Q%' AND MemberStatus='Form Submit' THEN 1 END) AS leads, COUNT(CASE WHEN c.UniqueID LIKE '003%' AND MemberStatus='Form Submit' THEN 1 END) AS contacts
FROM ent.Switzerland_Campaign_Membership c
WHERE c.Name NOT LIKE '%Test%'
OR c.Name NOT LIKE '%TEST%'
OR c.Name NOT LIKE '%test%'
OR c.Name NOT LIKE '%HC%'
GROUP BY c.Name, c.CampaignID



SELECT c.customerId, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 1, GETDATE() ) ) THEN 1 END) AS LoyalScore1, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 6, GETDATE() ) ) THEN 1 END) AS LoyalScore6, COUNT(CASE WHEN c.purchaseDate <= ( DATEADD(month, 12, GETDATE() ) ) THEN 1 END) AS LoyalScore12, GETDATE() as updatedAt
FROM ent.OrderInfo c
GROUP BY c.customerId