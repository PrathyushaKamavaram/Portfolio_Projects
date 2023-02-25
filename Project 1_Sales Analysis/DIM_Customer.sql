--Clensed DIM_Customer Table
SELECT
       c.CustomerKey AS CustomerKey
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
      ,c.FirstName AS [First Name]
      --,[MiddleName]
      ,c.LastName AS [LastName],
	  c.FirstName +' '+ LastName AS [Full Name] 
	  -- Combining First and Last Name
      --,[NameStyle]
      --,[BirthDate]
      --,[MaritalStatus]
      --,[Suffix]
      ,CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS [Gender]
     -- ,[EmailAddress]
     -- ,[YearlyIncome]
     -- ,[TotalChildren]
     -- ,[NumberChildrenAtHome]
      --,[EnglishEducation]
      --,[SpanishEducation]
     -- ,[FrenchEducation]
     -- ,[EnglishOccupation]
     -- ,[SpanishOccupation]
     -- ,[FrenchOccupation]
     -- ,[HouseOwnerFlag]
     -- ,[NumberCarsOwned]
      --,[AddressLine1]
     -- ,[AddressLine2]
     -- ,[Phone]
      ,c.DateFirstPurchase AS DateOfFirstPurchase,
      --,[CommuteDistance]
	  g.city AS [Customer City]
  FROM 
      dbo.DimCustomer as c
	  LEFT JOIN dbo.DimGeography as g ON g.GeographyKey = c.GeographyKey --Joined customer city from geography table
  ORDER BY 
      CustomerKey ASC