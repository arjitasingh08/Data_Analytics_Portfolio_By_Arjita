SELECT TOP (1000) [Attrition]
      ,[Business_Travel]
      ,[CF_age_band]
      ,[CF_attrition_label]
      ,[Department]
      ,[Education_Field]
      ,[emp_no]
      ,[Employee_Number]
      ,[Gender]
      ,[Job_Role]
      ,[Marital_Status]
      ,[Over_Time]
      ,[Over18]
      ,[Training_Times_Last_Year]
      ,[_2]
      ,[_0]
      ,[Age]
      ,[CF_current_Employee]
      ,[Daily_Rate]
      ,[Distance_From_Home]
      ,[Education]
      ,[Employee_Count]
      ,[Environment_Satisfaction]
      ,[Hourly_Rate]
      ,[Job_Involvement]
      ,[Job_Level]
      ,[Job_Satisfaction]
      ,[Monthly_Income]
      ,[Monthly_Rate]
      ,[Num_Companies_Worked]
      ,[Percent_Salary_Hike]
      ,[Performance_Rating]
      ,[Relationship_Satisfaction]
      ,[Standard_Hours]
      ,[Stock_Option_Level]
      ,[Total_Working_Years]
      ,[Work_Life_Balance]
      ,[Years_At_Company]
      ,[Years_In_Current_Role]
      ,[Years_Since_Last_Promotion]
      ,[Years_With_Curr_Manager]
  FROM [HR DATA BASE].[dbo].[HR DATABASE]

  SELECT DB_NAME() AS CurrentDatabase;

 ----EMPLOYEE COUNT

SELECT COUNT(*) AS TotalEmployees
FROM [dbo].[HR DATABASE];

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'HR DATABASE' AND TABLE_SCHEMA = 'dbo';

----Active Employees(those not marked 'No' for attrition)

SELECT COUNT(*) AS ActiveEmployees
FROM [dbo].[HR DATABASE]
WHERE [Attrition] <> 'No';

----Average Employee 

SELECT AVG(CAST([Age] AS FLOAT)) AS AverageAge
FROM [dbo].[HR DATABASE];

----Attrition by Gender

SELECT [Gender], 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS Attritions
FROM [dbo].[HR DATABASE]
GROUP BY [Gender];

----Department-wise Attrition 

SELECT [Department], 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       (SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*)) AS AttritionRate
FROM [dbo].[HR DATABASE]
GROUP BY [Department];

----Number of Employees by Age Group

SELECT [CF_age_band] AS AgeGroup, COUNT(*) AS EmployeeCount
FROM [dbo].[HR DATABASE]
GROUP BY [CF_age_band]
ORDER BY [CF_age_band];

----Education Field-wise Attrition

SELECT [Education_Field], 
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       (SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*)) AS AttritionRate
FROM [dbo].[HR DATABASE]
GROUP BY [Education_Field];

----Attrition Rate by Gender for Different Age Groups

SELECT [Gender], 
       [CF_age_band] AS AgeGroup,
       COUNT(*) AS TotalEmployees,
       SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS Attritions,
       (SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*)) AS AttritionRate
FROM [dbo].[HR DATABASE]
GROUP BY [Gender], [CF_age_band]
ORDER BY [Gender], AgeGroup;

----Job Satisfaction Rating by Job Role

SELECT [Job_Role], AVG(CAST([Job_Satisfaction] AS FLOAT)) AS AvgJobSatisfaction
FROM [dbo].[HR DATABASE]
GROUP BY [Job_Role]
ORDER BY AvgJobSatisfaction DESC;