CREATE VIEW dbo.vw_SKUPrice AS
SELECT ID, Code, Name, dbo.fn_get_price(ID) as price
FROM dbo.SKU;