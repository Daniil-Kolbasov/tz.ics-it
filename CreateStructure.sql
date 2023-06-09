-- Создать таблицы
--     dbo.SKU (ID identity, Code, Name)
--         * Ограничение на уникальность поля Code
--         * Поле Code вычисляемое: "s" + ID
--     dbo.Family (ID identity, SurName, BudgetValue)
--     dbo.Basket (ID identity, ID_SKU (внешний ключ на таблицу dbo.SKU), ID_Family (внешний ключ на таблицу dbo.Family) Quantity, Value, PurchaseDate, DiscountValue)
--         * Ограничение, что поле Quantity и Value не могут быть меньше 0
--         * Добавить значение по умолчанию для поля PurchaseDate: дата добавления записи (текущая дата)

CREATE TABLE SKU (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Code AS ('s' + CONVERT(VARCHAR(255), ID)) UNIQUE,
    Name NVARCHAR (255) NOT NULL
)

GO

CREATE TABLE Family (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    SurName VARCHAR(255) NOT NULL,
    BudgetValue INT NOT NULL
)

GO

CREATE TABLE Basket (
    ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ID_SKU INT NOT NULL REFERENCES SKU (ID),
    ID_Family INT NOT NULL REFERENCES Family (ID),
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    [Value] INT NOT NULL CHECK ([Value] >= 0),
    PurchaseDate DATE NOT NULL DEFAULT GETDATE(),
    DiscountValue FLOAT NOT NULL
)