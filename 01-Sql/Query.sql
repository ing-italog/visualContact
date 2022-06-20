--1.2.1 Sabana de información por cliente con el detalle del cliente y los productos que hacomprado.
CREATE PROCEDURE [dbo].[AccountProductByClient] 
@DNI VARCHAR(150)
AS 

SELECT TOP 100 
 Co.DNI
 ,Co.FirstName
 ,Co.LastName
 ,Co.Address
 ,Se.Id AS 'NoFactura'
 ,Se.TmStmp AS 'Fecha_Factura' 
 ,Pr.Name AS 'Producto'
 ,Pr.Price AS 'Precio_Unitario'
 ,Ds.TotalItems 'Unidades_Vendidas' 
FROM VisualContact.dbo.Costumer Co WITH(NOLOCK) 
INNER JOIN VisualContact.dbo.Sell Se WITH(NOLOCK) ON Se.DNICostumer = Co.DNI
INNER JOIN  VisualContact.dbo.DetailSell Ds WITH(NOLOCK) ON Ds.IdSell = Se.Id
INNER JOIN VisualContact.dbo.Products Pr WITH(NOLOCK) ON Pr.Code = Ds.CodeProduct
WHERE DNI = @DNI
ORDER BY Se.TmStmp DESC
--EXEC [dbo].[AccountProductByClient]  '778454843' 



-----------------------------------------------------------------------------------------
--1.2.2 Productos más vendidos y menos vendidos junto con su total de ventas.
SELECT TOP 100
Pr.Name
,Pr.Price
,SUM(TotalItems) AS UnidadesVendidas
,SUM(TotalItems * Pr.Price) AS ImporteTotal
FROM VisualContact.dbo.DetailSell Ds WITH(NOLOCK) 
INNER JOIN VisualContact.dbo.Products Pr WITH(NOLOCK) ON Pr.Code = Ds.CodeProduct
GROUP BY Pr.Name, Pr.Price
ORDER BY UnidadesVendidas DESC --Cambiar esta condición por ASC para ver los productos mas o menos vendidos



-----------------------------------------------------------------------------------------
--1.2.3 Conteo de productos y valor total de productos por cliente
SELECT TOP 100 
 Co.DNI
 ,Co.FirstName
 ,Co.LastName
 ,Pr.Name AS Producto
 ,Pr.Price AS Precio_Unitario
 ,Ds.TotalItems AS Unidades_Vendidas 
 ,SUM(TotalItems * Pr.Price) AS ImporteTotal
FROM VisualContact.dbo.Costumer Co WITH(NOLOCK) 
INNER JOIN VisualContact.dbo.Sell Se WITH(NOLOCK) ON Se.DNICostumer = Co.DNI
INNER JOIN  VisualContact.dbo.DetailSell Ds WITH(NOLOCK) ON Ds.IdSell = Se.Id
INNER JOIN VisualContact.dbo.Products Pr WITH(NOLOCK) ON Pr.Code = Ds.CodeProduct
GROUP BY Co.DNI
 ,Co.FirstName
 ,Co.LastName
 ,Co.Address
 ,Se.Id
 ,Se.TmStmp
 ,Pr.Name
 ,Pr.Price
 ,Ds.TotalItems
ORDER BY Co.DNI DESC


-----------------------------------------------------------------------------------------
--1.2.4 Listado de clientes que han comprado un producto especifico.
CREATE PROCEDURE [dbo].[ListProductsByCliente] 
@DNI VARCHAR(150),
@CodeProduct VARCHAR(150)
AS 

SELECT TOP 100 
 Co.DNI,
 Co.FirstName,
 Co.LastName,
 Co.Address,
 Co.BirthDay 
FROM VisualContact.dbo.Costumer Co WITH(NOLOCK) 
INNER JOIN VisualContact.dbo.Sell Se WITH(NOLOCK) ON Se.DNICostumer = Co.DNI
INNER JOIN  VisualContact.dbo.DetailSell Ds WITH(NOLOCK) ON Ds.IdSell = Se.Id
INNER JOIN VisualContact.dbo.Products Pr WITH(NOLOCK) ON Pr.Code = Ds.CodeProduct
WHERE Co.DNI = @DNI AND Pr.Code = @CodeProduct
GROUP BY  Co.DNI ,Co.FirstName ,Co.LastName ,Co.Address ,Co.BirthDay 
-- EXEC [dbo].[ListProductsByCliente] '43651394', 'zxy321'