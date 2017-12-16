USE SBS

IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'PastDueInvoices') 
AND type in (N'P', N'PC'))
DROP PROCEDURE PastDueInvoices
GO
CREATE PROCEDURE PastDueInvoices
(
	@phone_type_id int,
	@email_type_id int
)
AS
BEGIN
	SELECT p.person_id, jt.job_type_desc, j.job_name, o.organization_name, p.last_name, p.first_name, 
	       d.department_name, i.invoice_number, i.description_of_work, i.invoice_open_date, i.invoice_due_date,
		   i.invoice_amount, i.invoice_tax_rate, ph.phone_number, pt.phone_type_desc, et.email_type_desc, e.email
	FROM   person p
	       INNER JOIN email e ON p.person_id = e.person_id 
		   INNER JOIN phone ph ON p.person_id = ph.person_id 
		   INNER JOIN phone_type pt ON ph.phone_type_id = pt.phone_type_id 
		   INNER JOIN email_type et ON e.email_type_id = et.email_type_id
		   INNER JOIN department d ON p.person_id = d.person_id 
		   INNER JOIN organization o ON d.organization_id = o.organization_id 
		   INNER JOIN job j ON p.person_id = j.person_id
		   INNER JOIN job_type jt ON j.job_type_id = jt.job_type_id
		   INNER JOIN invoice i ON j.job_id = i.job_id
	WHERE department_name LIKE '%Accounts Payable%' AND pt.phone_type_id = @phone_type_id AND et.email_type_id = @email_type_id
	      AND i.invoice_due_date <= GETDATE()
	ORDER BY organization_name
END
