
/* SafetyInfo QUERY */
SELECT c.customerId, GETDATE() as UpdatedAt, GETDATE() as CreatedAt
FROM OrderInfo c
WHERE c.OrderType='purchase'


/* Sendable Data Extension QUERY */
SELECT s.customerId, c.email, e.EventDate
FROM SafetyInfo s
INNER JOIN ContactInfo c
ON s.customerId= s.ContactId
INNER JOIN EventsInfo e
ON e.EventId=o.EventId /* we assume that the eventid is available from the Order object */