-- Создать представление
--     Возвращает все атрибуты продуктов из таблицы dbo.SKU и расчетный атрибут 
--     со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)

CREATE VIEW vw_SKUPrice
AS
SELECT
    ID,
    Code
    [Name],
    udf_GetSKUPrice(ID) AS [SumPrise]
FROM SKU