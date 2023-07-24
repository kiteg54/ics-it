CREATE FUNCTION fn_get_price(@ID_SKU INT)
RETURNS DECIMAL(18, 2)
BEGIN
    DECLARE @num DECIMAL(18,2);
	SET @num = (SELECT SUM(s.Value)/SUM(s.Quantity) FROM dbo.Basket s WHERE s.ID_SKU = @ID_SKU);
	RETURN @num;
END;