USE SBS

IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'partPrices') 
AND type in (N'P', N'PC'))
DROP PROCEDURE partPrices
GO
CREATE PROCEDURE partPrices
(
	@job_name varchar(30),
	@job_type_id int
)
AS
BEGIN

CREATE TABLE #total
( totalID int,
  totalPart int
)
  DECLARE @totalIDVar INT = (SELECT job.job_id FROM job WHERE job.job_name LIKE '%' + @job_name + '%')
  DECLARE @totalPartVar INT = ( SELECT SUM(part.price) FROM part WHERE part.job_id = @totalIDVar)
  INSERT INTO #total(totalID, totalPart) 
  VALUES (@totalIDVar, @totalPartVar)
	SELECT   j.job_name, jt.job_type_desc, d.distributor_name, p.part_name, p.price, t.totalPart
	FROM     job j
	         INNER JOIN job_type jt ON j.job_type_id = jt.job_type_id
		 INNER JOIN part p ON j.job_id = p.job_id 
		 INNER JOIN distributor d ON p.distributor_id = d.distributor_id
		 RIGHT JOIN #total t on t.totalID = j.job_id
	WHERE    j.job_name LIKE '%' + @job_name +'%' AND jt.job_type_id = @job_type_id
END
