USE SBS

--Execute Insert Employee

EXEC InsertEmployeeSBS 'Chris','Tucker','128947','1179',1,2,2,1,'Queens','USA','78 Leonard st',
                        '13823', '917-6648892','ctucker@gmail.com',2,1,2, 29.62,0.00
EXEC InsertEmployeeSBS 'Larry','Santana','146727','12',1,2,2,1,'Manhattan','USA','46 52nd st',
                        '10002', '212-886-4542','jSantana@gmail.com',2,1,2, 44.30,0.00
exec InsertEmployeeSBS 'John','Powell','604-99-3214','17',1,1,2,1,'Hoboken','USA','38 41st st 1F',
                        '14478', '713-6648892','jpowell@gmail.com',2,1,1, 0.00,42000.00

----Execute Insert Client

EXEC InsertClientSBS 'Thomas','Jay','163rd St improvement council',2,'Accounts Receivable', 1,
                     2,'Manhattan','USA','1107 Broadway 14th fl','10016','212-443-9021','tJay@163rd.com',
					 1,2

EXEC InsertClientSBS 'Uri','Lewis','CBRE',2,'Accounts Receivable', 1,
                     2,'Manhattan','USA','33 Broadway 11th fl','10018','212-499-9121','uri@CBRE.com',
					 1,2

EXEC InsertClientSBS 'dave','jones','Cmanagement',2,'Accounts Receivable', 1,
                     2,'Manhattan','USA','65 Broadway 10th fl','10018','212-499-9121','uri@CBRE.com',
					 1,2
					 

--Select employees who worked over 40 hours select proc

EXEC EmployeesOver40Hours 2, '2017-11-26'

--Select part price per job stored proc

EXEC partPrices '437 Madison',2
EXEC partPrices '720 5th Avenue',3

--Select past due invoices stored proc

EXEC PastDueInvoices 1,2
