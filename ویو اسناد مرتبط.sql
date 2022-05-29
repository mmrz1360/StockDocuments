SELECT
S1.DocumentID AS [آی دی سند],
S1.DocumentCode AS [کد سند],
CASE WHEN S1.StatusID = '245' THEN N'در حال کار'
WHEN S1.StatusID = '246' THEN N'تصویب'
WHEN S1.StatusID = '247' THEN N'ابطال'
END AS [وضعیت],
S2.DocumentID AS [آی دی سند مرتبط],
S2.DocumentCode AS [کد سند مرتبط]

FROM StockDocument AS S1

LEFT JOIN StockDocumentReference AS SR
ON S1.DocumentID = SR.DocumentID

LEFT JOIN StockDocument AS S2
ON   SR.ReferStoreID = S2.BookerStoreID
AND  SR.ReferWorkstationID = S2.BookerWorkstationID 
AND  SR.ReferDocumentID = S2.DocumentID
where S1.DocumentTypeID = '296'