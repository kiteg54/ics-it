CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
IF (SELECT COUNT(ID_SKU) FROM dbo.Basket) > 1
    BEGIN
	    UPDATE dbo.Basket
	    SET DiscountValue = Value * 0.05;
    END;
ELSE 
    BEGIN
    	UPDATE dbo.Basket
    	SET DiscountValue = 0;
    END;