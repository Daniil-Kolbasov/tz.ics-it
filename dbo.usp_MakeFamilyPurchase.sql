-- Создать процедуру
--     1. Входной параметр (@FamilySurName varchar(255)) одно из значений атрибута SurName таблицы dbo.Family
--     2. Процедура при вызове обновляет данные в таблицы dbo.Family в поле BudgetValue по логике
--         * dbo.Family.BudgetValue - SUM(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
--         * При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет

CREATE PROCEDURE usp_MakeFamilyPurchase (
    @FamilySurName VARCHAR(255)
)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Family WHERE @FamilySurName = SurName)
    BEGIN
        DECLARE @msg VARCHAR(100) = FORMATMESSAGE('The "%s" entry does not exist in the Family table', @FamilySurName);
        THROW 50001, @msg, 1
    END
    
    PRINT ('1 OK')

    DECLARE @sumValue INT
    SELECT @sumValue = ISNULL(SUM([Value]), 0)
    FROM Basket AS b
    INNER JOIN Family AS f ON b.ID_Family = f.ID
    WHERE SurName = @FamilySurName
    
    PRINT ('2 OK')

    UPDATE Family
    SET BudgetValue = BudgetValue - @sumValue
    WHERE SurName = @FamilySurName
    
    PRINT ('3 OK')
END

GO