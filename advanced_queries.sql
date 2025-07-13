/*
==================================================
  Advanced SQL Practice Script
  Author: [Your Name]
  Date: [Today's Date]
  Description: Collection of SQL queries showing
  filtering, aggregation, joins, conditional logic,
  pattern matching, subqueries, and ordering.
==================================================
*/

-- 📌 1. Select all rows & columns
SELECT * 
FROM Employeesdata;

-- 📌 2. Count total number of rows
SELECT COUNT(*) 
FROM Employeesdata;

-- 📌 3. Get unique departments
SELECT DISTINCT Department 
FROM Employeesdata;

-- 📌 4. Return rows matching multiple conditions
SELECT * 
FROM Employeesdata
WHERE Department = 'sales' 
  AND Country = 'Egypt' 
  AND Job_Rate = 4.5;

-- 📌 5. Filter by Gender and Years, order by First_Name ascending
SELECT First_Name, Last_Name, Start_Date, Department
FROM Employeesdata
WHERE Gender = 'Male' AND Years >= 5
ORDER BY First_Name ASC;

-- 📌 6. Filter by Years > 5, order by Years descending
SELECT * 
FROM Employeesdata
WHERE Years > 5
ORDER BY Years DESC;

-- 📌 7. Conditional logic: label overpaid / underpaid
SELECT First_Name, Last_Name,
    CASE
        WHEN Monthly_Salary >= 2000 THEN 'Overpaid'
        WHEN Monthly_Salary <= 1500 THEN 'Underpaid'
        ELSE 'OK'
    END AS Status
FROM Employeesdata
ORDER BY Annual_Salary DESC;

-- 📌 8. Rows where Overtime_Hours < 5
SELECT First_Name, Last_Name, Years, Department, Country
FROM Employeesdata
WHERE Overtime_Hours < 5;

-- 📌 9. Replace Sick_Leaves = 0 with 100 (else keep value)
SELECT Sick_Leaves,
    CASE
        WHEN Sick_Leaves = 0 THEN 100
        ELSE Sick_Leaves
    END AS SickLeaveAdjusted
FROM Employeesdata;

-- 📌 10. Rows matching specific years and pattern in name or country
SELECT First_Name, Department
FROM Employeesdata
WHERE Years IN (6, 7)
  AND (First_Name LIKE 'A%' OR Country LIKE '%E');

-- 📌 11. Filter by Years = 7, order First_Name descending
SELECT First_Name, Department
FROM Employeesdata
WHERE Years = 7
ORDER BY First_Name DESC;

-- 📌 12. Order by multiple columns (Monthly_Salary, Annual_Salary, Overtime_Hours descending)
SELECT First_Name, Department, Years
FROM Employeesdata
ORDER BY Monthly_Salary, Annual_Salary, Overtime_Hours DESC;

-- 📌 13. IT department employees, order by Years and Annual_Salary descending
SELECT First_Name, Last_Name, Years, Annual_Salary
FROM Employeesdata
WHERE Department = 'IT'
ORDER BY Years, Annual_Salary DESC;

-- 📌 14. Employees whose salary is above average
SELECT First_Name, Last_Name, Annual_Salary
FROM Employeesdata
WHERE Monthly_Salary > (
    SELECT AVG(Monthly_Salary)
    FROM Employeesdata
);

-- 📌 15. Self-join: list employees with others in the same department
SELECT e.No, e.First_Name, e.Last_Name, e.Department,
       d.No AS OtherNo, d.First_Name AS OtherFirstName
FROM Employeesdata e
LEFT JOIN Employeesdata d ON e.Department = d.Department;

-- 📌 16. Count employees per department, order by count descending
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employeesdata
GROUP BY Department
ORDER BY EmployeeCount DESC;
