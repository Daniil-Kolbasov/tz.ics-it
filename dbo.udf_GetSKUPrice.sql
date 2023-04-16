-- Создать функцию
--     1. Входной параметр @ID_SKU
--     2. Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле
--         * Cумма Value по переданному ID_SKU / сумма Quantity по переданному ID_SKU
--     3. На выходе значение типа decimal(18, 2)

CREATE FUNCTION udf_GetSKUPrice (
    @ID_SKU INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @SumValue INT;
    DECLARE @SumQuantity INT

    SELECT 
        @SumValue = SUM([Value]),
        @SumQuantity = SUM(Quantity)
    FROM Basket
    WHERE ID_SKU = @ID_SKU

    RETURN @SumValue / @SumQuantity
END

GO