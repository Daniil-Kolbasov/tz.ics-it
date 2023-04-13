-- Создать триггер
--     Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, 
--     то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, 
--     иначе DiscountValue = 0

CREATE TRIGGER TR_Basket_insert_update ON Basket
AFTER INSERT
AS
BEGIN
    IF (@@ROWCOUNT > 2)
    BEGIN
        
    END
END