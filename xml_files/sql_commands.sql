select * from department;
select * from employee;
select * from person;
select * from testtable;
select * from testtable17;

select column_name,data_type,column_default,is_nullable from information_schema.columns where table_schema = 'public' and table_name = 'department';
select column_name,data_type,column_default,is_nullable from information_schema.columns where table_schema = 'public' and table_name = 'employee';
select column_name,data_type,column_default,is_nullable from information_schema.columns where table_schema = 'public' and table_name = 'person';
select column_name,data_type,column_default,is_nullable from information_schema.columns where table_schema = 'public' and table_name = 'testtable';
