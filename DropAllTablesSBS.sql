USE SBS

alter table address drop constraint FK_address_type_id_address
alter table address drop constraint FK_state_type_id_address
alter table contract drop constraint FK_contract_type_id_contract
alter table department drop constraint FK_organization_id_deprtment
alter table department drop constraint FK_person_id_department
alter table distributor drop constraint FK_address_id_distributor
alter table email drop constraint FK_email_type_id_email
alter table email drop constraint FK_person_id_email
alter table employee drop constraint FK_address_id_employee
alter table employee drop constraint FK_employee_type_id_employee
alter table employee drop constraint FK_pay_id_employee
alter table employee drop constraint FK_person_id_employee
alter table invoice drop constraint FK_job_id_invoice
alter table job drop constraint FK_address_id_job
alter table job drop constraint FK_contract_id_job
alter table job drop constraint FK_job_type_id_job
alter table job drop constraint FK_organization_id_job
alter table job drop constraint FK_person_id_job
alter table organization drop constraint FK_address_id_organization
alter table part drop constraint FK_distributor_id_part
alter table part drop constraint FK_job_id_part
alter table pay drop constraint FK_pay_type_id_pay
alter table pay_period drop constraint FK_employee_id_pay_period
alter table paycheck drop constraint FK_deductions_id_paycheck
alter table paycheck drop constraint FK_employee_id_paycheck
alter table paycheck drop constraint FK_pay_id_paycheck
alter table paycheck drop constraint FK_pay_period_id_paycheck
alter table person drop constraint FK_person_type_id_person
alter table phone drop constraint FK_person_id_phone
alter table phone drop constraint FK_phone_type_id_phone



drop table address
drop table address_type
drop table contract
drop table contract_type
drop table deductions
drop table department
drop table distributor 
drop table email
drop table email_type
drop table employee
drop table employee_type
drop table invoice
drop table job
drop table job_type
drop table organization
drop table part
drop table pay
drop table pay_period
drop table pay_type
drop table paycheck
drop table person
drop table person_type
drop table phone
drop table phone_type
drop table state_type


print 'All tables dropped'
