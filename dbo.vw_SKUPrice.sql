CREATE VIEW vw_SKUPrice
AS
SELECT
    ID,
    Code
    [Name],
    udf_GetSKUPrice(ID) AS [SumPrise]
FROM SKU