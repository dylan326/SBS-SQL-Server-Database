USE SBS

IF  EXISTS (SELECT * FROM sys.objects  WHERE object_id = OBJECT_ID(N'InsertEmployeeSBS') 
AND type in (N'P', N'PC'))
DROP PROCEDURE InsertEmployeeSBS
GO
CREATE PROCEDURE InsertEmployeeSBS
(
   @first_name VARCHAR(50),
   @last_name VARCHAR(50),
   @ss# VARCHAR(12),
   @employee_nuber INT,
   @address_type_id int,
   @employee_type_id int,
   @state_type_id int,
   @person_type_id int,
   @city varchar(50),
   @country varchar (50),
   @street VARCHAR (50),
   @zip VARCHAR(20),
   @phone_number VARCHAR(12),
   @email VARCHAR(30),
   @phone_type_id int,
   @email_type_id int,
   @pay_type_id int,
   @hourly_rate float,
   @yearly_pay float
)
AS
BEGIN
	DECLARE @person_id INT = 0
	DECLARE @address_id INT = 0
	DECLARE @pay_id INT = 0

	IF NOT EXISTS (SELECT person_id 
                   FROM person
                   WHERE first_name = @first_name AND last_name = @last_name AND ss# =@ss#) 
	BEGIN 
		INSERT INTO person (person_type_id, first_name, last_name, ss#)
		VALUES (@person_type_id, @first_name, @last_name, @ss#)
	END
    SET @person_id = (SELECT person_id 
	                  FROM person 
					  WHERE first_name = @first_name AND last_name = @last_name AND ss# = @ss#)
			
	IF NOT EXISTS (SELECT phone_id 
	               FROM phone
				   WHERE person_id = @person_id AND phone_number = @phone_number)
	BEGIN
		INSERT INTO phone(phone_type_id, person_id, phone_number)
		VALUES(@phone_type_id, @person_id, @phone_number)
	END
	IF NOT EXISTS (SELECT email_id 
	               FROM email
				   WHERE person_id = @person_id AND email = @email)
	BEGIN
		INSERT INTO email(email_type_id, person_id, email) 
		VALUES (@email_type_id, @person_id, @email)
	END
	IF NOT EXISTS (SELECT address_id 
	                   FROM address 
					   WHERE address_type_id = @address_type_id AND state_type_id = @state_type_id AND city = @city AND country = @country AND street = @street AND zip = @zip)
    BEGIN
 		INSERT INTO address(address_type_id, state_type_id, city, country, street, zip) 
        VALUES(@address_type_id, @state_type_id, @city, @country, @street, @zip)
	END
    SET @address_id = (SELECT address_id 
	                   FROM address 
					   WHERE address_type_id = @address_type_id AND state_type_id = @state_type_id AND city = @city AND country = @country AND street = @street AND zip = @zip)
		
	IF @yearly_pay = 0.00
		BEGIN
			IF NOT EXISTS (SELECT pay_id 
	                       FROM pay
					       WHERE  pay_type_id = @pay_type_id and hourly_rate = @hourly_rate)
		    BEGIN
				INSERT INTO pay(pay_type_id, hourly_rate, yearly_pay)
				VALUES (@pay_type_id, @hourly_rate, @yearly_pay)
			END
			SET @pay_id = (SELECT pay_id 
						   FROM pay 
				           WHERE pay_type_id = @pay_type_id and hourly_rate = @hourly_rate)
		END
	ELSE
		BEGIN
			IF NOT EXISTS (SELECT pay_id 
	                       FROM pay
					       WHERE  pay_type_id = @pay_type_id and yearly_pay = @yearly_pay)
			BEGIN
				INSERT INTO pay(pay_type_id, hourly_rate, yearly_pay)
				VALUES (@pay_type_id, @hourly_rate, @yearly_pay)
			END
			SET @pay_id = (SELECT pay_id 
				   FROM pay 
				   WHERE pay_type_id = @pay_type_id and yearly_pay = @yearly_pay )
		END

	IF NOT EXISTS (SELECT employee_id 
	               FROM employee
				   WHERE  employee_number = @employee_nuber)
	BEGIN
		INSERT INTO employee(employee_type_id, address_id, person_id, pay_id, employee_number) 
        VALUES(@employee_type_id, @address_id, @person_id, @pay_id, @employee_nuber)
	END

	IF @yearly_pay = 0.00
	BEGIN
		UPDATE pay SET yearly_pay = NULL WHERE yearly_pay = 0.00
	PRINT 'you have added an hourly paid employee'
	END
	ELSE 
	BEGIN
		UPDATE pay SET hourly_rate = NULL WHERE hourly_rate = 0.00
	PRINT 'You have added a salaried employee'
	END	
END
