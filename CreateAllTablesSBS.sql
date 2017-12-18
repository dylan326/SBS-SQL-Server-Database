USE SBS

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'state_type')
	BEGIN
		CREATE TABLE state_type
		(
			state_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
			state_type_desc VARCHAR(50)
		)
		PRINT 'table state_type created'
END
ELSE 
BEGIN
   PRINT 'table state_type EXISTS already'
END




IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'address_type')
	            
BEGIN
   
   CREATE TABLE address_type
   (
      	  address_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	  address_type_desc VARCHAR(50)
	  
	)
	print 'table address_type created'
END
ELSE 
BEGIN
   PRINT 'table address_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'address')
	            
BEGIN
   
   CREATE TABLE address
   (
      	  address_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	  address_type_id INT NOT NULL CONSTRAINT FK_address_type_id_address REFERENCES address_type(address_type_id),
	  state_type_id INT NOT NULL CONSTRAINT FK_state_type_id_address REFERENCES state_type(state_type_id),
	  city varchar(50),
	  country varchar(50),
	  street varchar(50),
	  zip varchar (10)
	  
	)
	print 'table address created'
END
ELSE 
BEGIN
   PRINT 'table address EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'person_type')
	            
BEGIN
   
   CREATE TABLE person_type
   (
         person_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 person_type_desc VARCHAR(50)
	)  
	
	print 'table person_type created'
END
ELSE 
BEGIN
   PRINT 'table person_type EXISTS already'
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'person')
	            
BEGIN
   
   CREATE TABLE person
   (
         person_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 person_type_id INT NOT NULL CONSTRAINT FK_person_type_id_person REFERENCES person_type(person_type_id),
	 first_name varchar(50),
	 last_name varchar(50),
	 ss# varchar (12)
	)  
	
	print 'person table created'
END
ELSE 
BEGIN
   PRINT 'table person EXISTS already'
END



IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'phone_type')
	            
BEGIN
   
 create table phone_type
(
	phone_type_id int primary key identity(1,1),
	phone_type_desc varchar(30)

)
	print 'table phone_type created'
END
ELSE 
BEGIN
   PRINT 'table phone_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES where table_name = 'phone')
	            
BEGIN
   
create table phone
(
	phone_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	phone_type_id INT NOT NULL CONSTRAINT FK_phone_type_id_phone REFERENCES phone_type(phone_type_id),
	person_id INT NOT NULL CONSTRAINT FK_person_id_phone REFERENCES person(person_id),
	phone_number VARCHAR(30)
)
	print 'table phone created'
END
ELSE 
BEGIN
   PRINT 'table phone EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'email_type')
	            
BEGIN
   
create table email_type
(
	email_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	email_type_desc VARCHAR(30)
)
	print 'table email_type created'
END
ELSE 
BEGIN
   PRINT 'table email_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES where table_name = 'email')
	            
BEGIN
   
create table email
(
	email_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	email_type_id INT NOT NULL CONSTRAINT FK_email_type_id_email REFERENCES email_type(email_type_id),
	person_id INT NOT NULL CONSTRAINT FK_person_id_email REFERENCES person(person_id),
	email VARCHAR(30)
)
	print 'table email created'
END
ELSE 
BEGIN
   PRINT 'table email EXISTS already'
END




IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'pay_type')
	            
BEGIN
   
   CREATE TABLE pay_type
   (
          pay_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	  pay_type_desc VARCHAR(50)
	  
	)
	print 'table pay_type created'
END
ELSE 
BEGIN
   PRINT 'table pay_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'pay')
	            
BEGIN
   
   CREATE TABLE pay
   (
          pay_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	  pay_type_id INT NOT NULL CONSTRAINT FK_pay_type_id_pay REFERENCES pay_type(pay_type_id),
	  hourly_rate FLOAT,
	  yearly_pay FLOAT
	  
	)
	print 'table pay created'
END
ELSE 
BEGIN
   PRINT 'table pay EXISTS already'
END




IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'employee_type')
	            
BEGIN
   
   CREATE TABLE employee_type
   (
          employee_type_id INT NOT NULL PRIMARY KEY identity(1,1),
	  employee_type_desc VARCHAR(50)
	  
	)
	print 'table employee_type created'
END
ELSE 
BEGIN
   PRINT 'table employee_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'employee')
	            
BEGIN
   
   CREATE TABLE employee
   (
          employee_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	  employee_type_id INT NOT NULL CONSTRAINT FK_employee_type_id_employee REFERENCES employee_type(employee_type_id),
	  address_id INT NOT NULL CONSTRAINT FK_address_id_employee REFERENCES address(address_id),
	  person_id INT NOT NULL CONSTRAINT FK_person_id_employee REFERENCES person(person_id),
	  pay_id INT NOT NULL CONSTRAINT FK_pay_id_employee REFERENCES pay(pay_id),
	  employee_number INT
	  
	)
	print 'table employee created'
END
ELSE 
BEGIN
   PRINT 'table employee EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'pay_period')
	            
BEGIN
   
   CREATE TABLE pay_period
   (
         pay_period_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 employee_id INT NOT NULL CONSTRAINT FK_employee_id_pay_period REFERENCES employee(employee_id),
	 pp_start_date DATE, 
	 pp_end_date DATE,
	 hours_worked INT 
	)  
	
	print 'table pay_period created'
END
ELSE 
BEGIN
   PRINT 'table pay_period EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'deductions')
	            
BEGIN
   
   CREATE TABLE deductions
   (
        deductions_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	federal DECIMAL,
	fica DECIMAL,
	state_deductions DECIMAL,
	city_deductions DECIMAL,
	)  
	
	print 'table deductions created'
END
ELSE 
BEGIN
   PRINT 'table deductions EXISTS already'
END




IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'paycheck')
	            
BEGIN
   
   CREATE TABLE paycheck
   (
         paycheck_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 pay_period_id INT NOT NULL CONSTRAINT FK_pay_period_id_paycheck REFERENCES pay_period(pay_period_id),
	 employee_id INT NOT NULL CONSTRAINT FK_employee_id_paycheck REFERENCES employee(employee_id),
	 deductions_id INT NOT NULL CONSTRAINT FK_deductions_id_paycheck REFERENCES deductions(deductions_id),
	 pay_id INT NOT NULL CONSTRAINT FK_pay_id_paycheck REFERENCES pay(pay_id)

	)  
	
	print 'table paycheck created'
END
ELSE 
BEGIN
   PRINT 'table paycheck EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'distributor')
	            
BEGIN
   
   CREATE TABLE distributor
   (
         distributor_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 address_id INT NOT NULL CONSTRAINT FK_address_id_distributor REFERENCES address(address_id),
	 distributor_name VARCHAR(100),
	)  
	
	print 'table distributor created'
END
ELSE 
BEGIN
   PRINT 'table distributor EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'contract_type')
	            
BEGIN
   
   CREATE TABLE contract_type
   (
      contract_type_id INT PRIMARY KEY IDENTITY(1,1),
      contract_type_desc VARCHAR(50)
   )

print 'table contract_type created'

end
else
begin
print 'table contract_type exists'
end

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'contract')
	            
BEGIN
   
   CREATE TABLE contract
   (
   	contract_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   	contract_type_id INT NOT NULL CONSTRAINT FK_contract_type_id_contract REFERENCES contract_type(contract_type_id),
   	contract_start_date VARCHAR(30),
   	contract_end_date VARCHAR(30),
  	contract_pdf IMAGE
    
    )  
	
	print 'table contract created'
END
ELSE 
BEGIN
   PRINT 'table contract EXISTS already'
END





IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'organization')
	            
BEGIN
   
   CREATE TABLE organization
   (
   	organization_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   	address_id INT NOT NULL CONSTRAINT FK_address_id_organization REFERENCES address(address_id),
   	organization_name VARCHAR(50)
    
   )  
	
	print 'table organization created'
END
ELSE 
BEGIN
   PRINT 'table organization EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'department')
	            
BEGIN
   
   create table department
(
	department_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	organization_id INT NOT NULL CONSTRAINT FK_organization_id_deprtment REFERENCES organization(organization_id),
	person_id INT NOT NULL CONSTRAINT FK_person_id_department REFERENCES person(person_id),
	department_name VARCHAR(30)
) 
	
	print 'table department created'
END
ELSE 
BEGIN
   PRINT 'table department EXISTS already'
END

IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'job_type')
	            
BEGIN
   
   CREATE TABLE job_type
   (
   	job_type_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   	job_type_desc VARCHAR(50)
   )  
	
	print 'table job_type created'
END
ELSE 
BEGIN
   PRINT 'table job_type EXISTS already'
END


IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'job')
	            
BEGIN
   
   CREATE TABLE job
   (
        job_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	job_type_id INT NOT NULL CONSTRAINT FK_job_type_id_job REFERENCES job_type(job_type_id),
	address_id INT NOT NULL CONSTRAINT FK_address_id_job REFERENCES address(address_id),
	contract_id INT NOT NULL CONSTRAINT FK_contract_id_job REFERENCES contract(contract_id),
	person_id INT NOT NULL CONSTRAINT FK_person_id_job REFERENCES person(person_id),
	organization_id INT NOT NULL CONSTRAINT FK_organization_id_job REFERENCES organization(organization_id),
	job_name VARCHAR(30) 
    )  
	
	print 'table job created'
END
ELSE 
BEGIN
   PRINT 'table job EXISTS already'
END



IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'part')
	            
BEGIN
   
   CREATE TABLE part
   (
        part_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	distributor_id INT NOT NULL CONSTRAINT FK_distributor_id_part REFERENCES distributor(distributor_id),
	job_id INT NOT NULL CONSTRAINT FK_job_id_part REFERENCES job(job_id),
	part_name VARCHAR(30),
	price DECIMAL 
    )  
	
	print 'table part created'
END
ELSE 
BEGIN
   PRINT 'table part EXISTS already'
END



IF NOT EXISTS( SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name = 'invoice')
	            
BEGIN
   
   CREATE TABLE invoice
   (
         invoice_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	 job_id INT NOT NULL CONSTRAINT FK_job_id_invoice REFERENCES job(job_id),
	 invoice_number INT NOT NULL,
	 description_of_work VARCHAR (500),
	 invoice_open_date DATE,
	 invoice_due_date DATE,
	 invoice_amount FLOAT,
	 invoice_tax_rate FLOAT,
   )  
	
	print 'table invoice created'
END
ELSE 
BEGIN
   PRINT 'table invoice EXISTS already'
END
