USE SBS

IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'EmployeesOver40Hours') 
AND type in (N'P', N'PC'))
DROP PROCEDURE EmployeesOver40Hours
GO
CREATE PROCEDURE EmployeesOver40Hours
(
   @pay_type_id int,
   @endPeriod date
)
AS
BEGIN
	SELECT p.first_name, p.last_name, e.employee_id, et.employee_type_desc, prt.person_type_desc, 
           pt.pay_type_desc, pay.hourly_rate, pp.hours_worked
	FROM   employee e
	       INNER JOIN employee_type et ON e.employee_type_id = et.employee_type_id 
	       INNER JOIN pay_period pp ON e.employee_id = pp.employee_id
	       INNER JOIN pay ON e.pay_id = pay.pay_id 
	       INNER JOIN pay_type pt ON pay.pay_type_id = @pay_type_id 
	       INNER JOIN person p ON e.person_id = p.person_id 
	       INNER JOIN person_type prt ON p.person_type_id = prt.person_type_id
	WHERE  hours_worked > 40 AND pay_type_desc LIKE '%hourly%' AND PP.pp_end_date = @endPeriod
END
