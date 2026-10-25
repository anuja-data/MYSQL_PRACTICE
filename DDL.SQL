create database institute;
show tables;
use institute;
create table staff(staff_id int ,first_name varchar(50),last_name varchar(50),DOB date,dept_id int);

create table Department(dept_id int, dept_name varchar(50),dept_location varchar(50));

desc staff;
desc department;

/*alter the table add new values*/
alter table staff add location varchar(50);
alter table staff add joining_year int;
alter table staff add age int, add contact_no int(10);

/*alter table staff add (age int,contact_no int(10));*/

/*change the data type of column in an existing table*/
alter table staff modify first_name text;

/* Drop column from an existing table*/
alter table staff drop column contact_no;

/* Change the size of table*/
alter table staff modify last_name varchar(100);

/*crate foregin key constraint between two tables*/
alter table staff add primary key (staff_id);
alter table department add primary key(dept_id);
desc staff;
desc department;

/* Drop primary key constraint from departments*/
alter table department drop primary key;

/*to add foregin key in the table*/
/*alter table staff add foreign key(dept_id) references department(dept_id);*/


alter table staff rename staff1;

desc staff1;






