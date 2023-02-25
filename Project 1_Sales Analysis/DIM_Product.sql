--Clensed DIM_Product Table
SELECT 
       p.[ProductKey]
      ,p.[ProductAlternateKey] AS ProductItemCode
      --,[ProductSubcategoryKey]
      --,[WeightUnitMeasureCode]
      --,[SizeUnitMeasureCode]
      ,p.[EnglishProductName] AS ProductName,
	  ps.EnglishProductSubcategoryName AS ProductSubcategory, --Joined from Sub-Category table
	  pc.EnglishProductCategoryName AS ProductCategory,  --Joined from Category table
      --,[SpanishProductName]
      --,[FrenchProductName]
      --,[StandardCost]
      --,[FinishedGoodsFlag]
      p.[Color] AS [Product Color],
      --,[SafetyStockLevel]
      --,[ReorderPoint]
      --,[ListPrice]
      p.[Size] AS [Product Size]
      --,[SizeRange]
      --,[Weight]
      --,[DaysToManufacture]
      ,p.[ProductLine] AS [Product Line]
      --,[DealerPrice]
      --,[Class]
      --,[Style]
      ,p.[ModelName] AS [Product Model Name]
      --,[LargePhoto]
      ,p.[EnglishDescription] AS [Product Description]
      --,[FrenchDescription]
      --,[ChineseDescription]
      --,[ArabicDescription]
      --,[HebrewDescription]
      --,[ThaiDescription]
      --,[GermanDescription]
      --,[JapaneseDescription]
      --,[TurkishDescription]
      --,[StartDate]
      --,[EndDate]
      ,ISNULL(p.Status ,'Outdated') AS [Product Status]
  FROM 
    [dbo].[DimProduct] AS p
    LEFT JOIN dbo.DimProductsubcategory as ps ON ps.ProductSubcategoryKey = p.ProductKey
	LEFT JOIN dbo.DimProductCategory as pc ON ps.ProductCategoryKey = pc.ProductCategoryKey
  ORDER BY 
    p.ProductKey ASC
