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