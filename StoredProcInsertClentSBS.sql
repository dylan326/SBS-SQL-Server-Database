USE SBS

IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'InsertClientSBS') 
AND type in (N'P', N'PC'))
DROP PROCEDURE InsertClientSBS
GO
CREATE PROCEDURE InsertClientSBS
(
   @first_name VARCHAR(50),
   @last_name VARCHAR(50),
   @organization_name varchar(30),
   @address_type_id INT,
   @department_name varchar(30),  
   @state_type_id INT,
   @person_type_id INT,
   @city varchar(50),
   @country varchar (50),
   @street VARCHAR (50),
   @zip VARCHAR(20),
   @phone_number VARCHAR(12),
   @email VARCHAR(30),
   @phone_type_id INT,
   @email_type_id INT
 )
 AS
BEGIN
    DECLARE @person_id INT = 0
    DECLARE @address_id INT = 0
    DECLARE @organization_id int = 0
    IF NOT EXISTS (SELECT person_id 
	               FROM person 
		       WHERE first_name = @first_name AND last_name = @last_name) 
    BEGIN
	INSERT INTO person (person_type_id, first_name, last_name)
	VALUES (@person_type_id, @first_name, @last_name)
    END
    SET @person_id = (SELECT person_id FROM person WHERE first_name = @first_name AND last_name = @last_name )
    IF NOT EXISTS(SELECT address_id 
	          FROM address 
		  WHERE address_type_id = @address_type_id AND state_type_id = @state_type_id AND city = @city AND street = @street AND zip = @zip)
    BEGIN
 	INSERT INTO address(address_type_id, state_type_id, city, country, street, zip) 
	VALUES(@address_type_id, @state_type_id, @city, @country, @street, @zip)
    END
    SET @address_id = (SELECT address_id 
	               FROM address 
		       WHERE street = @street and zip = @zip and city = @city)
    IF NOT EXISTS (SELECT organization_id 
                   FROM organization 
		   WHERE address_id = @address_id AND organization_name = @organization_name)
     BEGIN
	INSERT INTO organization(address_id, organization_name) 
	VALUES(@address_id, @organization_name)
     END
     SET @organization_id = (SELECT organization_id 
	                     FROM organization 
			     WHERE address_id = @address_id AND organization_name= @organization_name)
     IF NOT EXISTS (SELECT department_id 
	            FROM department 
		    WHERE organization_id = @organization_id and person_id = @person_id AND department_name = @department_name)
     BEGIN
	INSERT INTO department(organization_id, person_id, department_name)
	VALUES (@organization_id, @person_id, @department_name)
     END
     IF NOT EXISTS (SELECT phone_id 
	            FROM phone 
		    WHERE person_id =@person_id and phone_number =@phone_number)
     BEGIN
	INSERT INTO phone(phone_type_id, person_id, phone_number) 
	VALUES(@phone_type_id, @person_id, @phone_number)
     END
     IF NOT EXISTS(SELECT email_id 
	           FROM email  
		   WHERE person_id = @person_id and email = @email)
     BEGIN
	INSERT INTO email(email_type_id, person_id, email) 
	VALUES (@email_type_id, @person_id, @email)
     END
	PRINT 'you have inserted a client'
END
