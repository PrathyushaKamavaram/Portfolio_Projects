--Clensed Dim_Date Table
SELECT 
  [DateKey], 
  [FullDateAlternateKey] As Date 
  --,[DayNumberOfWeek]
  ,[EnglishDayNameOfWeek] as Day 
  --,[SpanishDayNameOfWeek]
  --,[FrenchDayNameOfWeek]
  --,[DayNumberOfMonth]
  --,[DayNumberOfYear]
  ,[WeekNumberOfYear] as Week, 
  [EnglishMonthName] as Month, 
  LEFT([EnglishMonthName], 3) as MonthShort
  --,[SpanishMonthName]
  --,[FrenchMonthName]
  ,[MonthNumberOfYear] as MonthNo, 
  [CalendarQuarter] as Quarter, 
  [CalendarYear] as Year 
  --,[CalendarSemester]
  --,[FiscalQuarter]
  --,[FiscalYear]
  --,[FiscalSemester]
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate] 
WHERE 
  [CalendarYear] >= 2021

  