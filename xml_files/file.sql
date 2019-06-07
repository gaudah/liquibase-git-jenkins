select * from department;
select * from employee;
select * from person;
select * from state;
select * from testtable;
select column_name,data_type,column_default,is_nullable from information_schema.columns where table_schema = 'public' and table_name = 'department';
