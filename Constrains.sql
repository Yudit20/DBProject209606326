alter table medicine
add constraint default_qantity_of_medicine
default );

alter table employee
add constraint check_salary
check ( salary!= 9999);

alter table pharmacy
add constraint check_name
check(name != 'pharmacy');
