USE SBS

--insert type tables
INSERT INTO state_type(state_type_desc) VALUES ('New York'),('New Jersey'),('Connecticut')
INSERT INTO address_type(address_type_desc) VALUES ('Home'),('Business'),('Job Location')
INSERT INTO person_type( person_type_desc) VALUES ('Employee'),('Client')
INSERT INTO phone_type( phone_type_desc) VALUES ('Office'),('Mobil')
INSERT INTO email_type( email_type_desc) VALUES ('Personal'),( 'Business')
INSERT INTO pay_type( pay_type_desc) VALUES ('Salary'),('Hourly')
INSERT INTO employee_type(employee_type_desc) VALUES ('Office'),('Technician'),('Office Management')
INSERT INTO contract_type( contract_type_desc) VALUES ('PMA'),('Monitoring')
INSERT INTO job_type(job_type_desc) VALUES ('Installation'),('Service Call'),('PMA')

--inserts for testing past due invoices select proc

insert into person(person_type_id, first_name, last_name, ss#)
values (2, 'Jerry','Jones','11111111'),(2,'James','Wallace',null), (2,'Meslissa','Oldham',null),
(2,'Tim','Jacobs',null)
insert into address(address_type_id, state_type_id, city, country, street, zip)
values (2,1, 'New York','USA','777 Third AVenue','10018'),
        (2,1, 'New York','USA','666 5th Avenue','10016'),
		(2,1, 'New York','USA','100 W 125th st','10022'),
		(2,1, 'New York','USA','100 Gold st','10018')
insert into organization(address_id, organization_name) values (1,'Sage Realty'),(2,'Colliers'),(3,'CBC Advisors'),
(4, 'Mongoive Associates')
insert into phone(phone_type_id, person_id, phone_number) 
values (1,1,'212-764-8891'),(2,1,'917-717-2721'), (1,2,'212-334-5564'), (2,2,'718-882-9972'),
       (1,3,'212-009-8897'),(2,3,'646-998-3321'), (1,4,'212-653-7782'), (2,4,'347-087-6621')
insert into email(email_type_id, person_id, email) 
values (1,1,'jjones@gmail.com'),(2,1,'jjones@sage.com'), (1,2,'jwallace@gmail.com'), (2,2,'jwallace@colliers'),
       (1,3,'moldham@gmail.com'),(2,3,'moldham@CBC.com'), (1,4,'tjacobs@gmail.com'), (2,4,'tjacods@mongovie.com')
insert into department(organization_id, person_id, department_name) 
values (1,1,'Accounts Payable'), (2,2,'Accounts Payable'),(3,3,'Accounts Payable'),(4,4,'Accounts Payable')
insert into contract(contract_type_id, contract_start_date, contract_end_date, contract_pdf)
values (1,'11.16.16','11.15.21','sss'), (1,'9.21.15','9.12.20','ccc'), (2,'8.31.14','9.2.19','cbc'),(2,'2.24.16','2.30.21','mmm')
insert into job(job_type_id, address_id, contract_id, person_id, organization_id, job_name)
values (2,1,1,1,1,'437 Madison'), (2,2,2,2,2,'230 w 41st st'), (3,3,3,3,3,'720 5th Avenue'),(3,4,4,4,4,'100 gold st')
insert into invoice(job_id, invoice_number, description_of_work, invoice_open_date, invoice_due_date, invoice_amount, invoice_tax_rate)
values (1, 24030, 'Changed speaker strobes on 24th floor','2017-10-10','2017-11-10', 413.73, 0.0887),
       (2, 24031, 'Replaced smoke detector on 12th floor','2017-11-10', '2018-11-11', 413.73, 0.0887),
	   (3, 24032, 'Monthly Monitoring October 2017','2017-10-11', '2017-11-11', 92.50, 0.0887),
	   (4, 24032, 'Monthly Monitoring charge for December 2017','2017-12-10', '2018-11-11', 92.50, 0.0887)

--inserts for testing employees who worked over 40 hours select proc


insert into person (person_type_id,first_name, last_name, ss#) values (1,'Raymond', 'Valeraze', '2325998'), (1,'Clide', 'Davis', '7622098'),
 (1,'Aaron', 'Andrews', '1234567'), (1,'William', 'Wallace', '888888888')
insert into address(address_type_id, state_type_id, city, country, street, zip)
 values (1, 1, 'Queens', 'USA', '4120 50th st 1F', '11377'), (1, 1, 'Queens', 'USA', '2207 42nd rd', '10015'),
 (1, 1, 'Queens', 'USA', '42-37 27th st 2b', '11101'), (1, 1, 'Queens', 'USA', '22704 Hoyt Aveu south 6G', '11104')
insert into pay(pay_type_id, hourly_rate, yearly_pay) values (2, 23.50, null),(2, 18.50, null),(2, 27.50, null),(2, 14.50, null)
insert into employee(employee_type_id, address_id, person_id, pay_id, employee_number) 
 values (2,1,5,1,12), (2,2,6,2,13),(2,3,7,3,14),(2,4,8,4,15)
insert into pay_period(employee_id, hours_worked, pp_start_date, pp_end_date)
 values (1, 44, '2017-11-20', '2017-11-26'),(2, 47, '2017-11-20', '2017-11-26'),
 (3, 38, '2017-11-20', '2017-11-26'),(4, 37, '2017-11-20', '2017-11-26')


 --inserts for total part price select proc

insert into address(address_type_id, state_type_id, city, country, street, zip) 
values (2, 1, 'Brooklyn', 'USA', '773 bedsty way', '10491'), (2, 1, 'Castle Park', 'USA', '91 Knight way', '16712'),
(2, 1, 'Manhattan', 'USA', '57 w 38th st 27th fl', '10016')
insert into contract(contract_type_id, contract_start_date, contract_end_date, contract_pdf)
values (2, '2.15.2014','1.15.2019', 'win')
insert into person(person_type_id, first_name, last_name, ss#) values (2,'Wanda','Grice', NULL)
insert into organization(address_id, organization_name) values (11, 'Winoker EVO')
insert into distributor(address_id, distributor_name) values(9,'ADI'),(10,'Doug Parts')
insert into job(job_type_id,address_id,contract_id,person_id,organization_id,job_name) values (1,11,5, 9,5,'24 Union Square East'),(1,11,5,9,5,'62 w 47th st')
insert into part (distributor_id, job_id, part_name, price)
values(1, 1, 'Smoke head', 24.59), (1,1, 'Duct detector', 44.58),(1,1, '12v7ah battery', 14.59), (1,1, 'Manual pull station', 73.77),
(2, 3,'Smoke head', 24.59), (2,3, 'Duct detector', 44.58),(2,3, '12v7ah battery', 14.59), (2,3, 'Manual pull station', 73.77)

