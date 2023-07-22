CREATE PROCEDURE dbo.usp_MakeFamilyPurchase(@FamilySurName varchar(255))
AS
DECLARE @FamilyBasket DECIMAL(18, 2);

SET @FamilyBasket = (SELECT SUM(Value) 
					 FROM dbo.Basket b
					 JOIN dbo.Family f ON b.ID_Family = f.ID
					 WHERE f.SurName = @FamilySurName);

IF @FamilySurName = (SELECT SurName FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
		UPDATE dbo.Family
		SET dbo.Family.BudgetValue = f.BudgetValue - @FamilyBasket 
		FROM dbo.Family f
		JOIN dbo.Basket b ON f.ID = b.ID_Family
		WHERE f.SurName = @FamilySurName;
	END
ELSE
	BEGIN
        PRINT 'Такой семьи не существует';
    END;