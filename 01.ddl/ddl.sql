create database swimming_coach;


--show all the databases on the server

show databases;


--set the current active databases
--use <name of the database>

use swimming_coach;

--to create a new table
--create table <name of the table> (
-- <name of the column> <data type> <options>
-- ) engine = innode;


-- all tables must have at least one primary key column
-- and all the values must be unique in the table
-- if a column is not marked with NOT NULL then it is optional
-- (exception: primary key)


create table parents (
parent_id int unsigned auto_increment primary key,
first_name varchar(200) not null,
last_name varchar(200) not null
) engine = innodb;


--to create a new table
--create table <name of the table> (
-- <name of the column> <data type> <options>
-- ) engine = innode;

create table locations (
    location_id int unsigned auto_increment primary key,
    name varchar(200) not null,
    address varchar(500) not null
) engine = innodb;


--show tables

show tables;


--check the column in a table
--describe <name of table>

describe parents;


--if you ever need to
-- rename table <old_name> to <new-name>
--rename table Locations to locations

rename table locations to locations;

--Adding a new column
-- later table <name of table> add new column <new name of column> <data type> <options>

alter table parents add column contact_number varchar(30) not null;

--Modifying an existing column
-- alter table <name of table> modify column <name of column> <data type> <options>

alter table parents modify column contact_number varchar(50) null default 'n/a';


--Delete an existing column

alter table parents drop column contact_number;


-- Create a table with foreign key
-- Create the students table (WITHOUT FOREIGN KEY)

create table students (
    student_id int unsigned auto_increment primary key,
     first_name varchar(45) not null,
    last_name varchar(45) default '',
    swimming_level tinyint unsigned,
    dob datetime
) engine = innodb;

--Add parent_id into the students table as foreign key
--the related primary key and foreign key must have
--the same data type

alter table students add column parent_id int unsigned not null;

--define the parent_id column as a foreign key
--that refers to the parent_id column in the parents table

--add constraint is a rule in SQL
-- (eg. the UNIQUE constraint ensures that a value is not repeated in a column)

alter table students add constraint fk_parents_students
    foreign key (parent_id) references parents(parent_id);


    -- a schema file in a relational databse is a .sql file that only has create tables
    --and alter tables (or drop tables). The intent of the file is for people to create tables
    -- in a database quickly


    --INSERT ROWS
    --insert into <table name> (<col1>, <col2>, col3>.....) VALUES (value for col 1,)

    insert into parents (first_name, last_name) VALUES ("Jon", "Snow");

    -- see all rows from a table

    select * from parents;

    --Insert multiple rows

    Insert into parents (first_name, last_name) VALUES ("Mary", "Sue"),
    ("Ah Kow", "Tan"),
    ("Peter", "Barker");


    --Insert a new student with a foreign key

    Insert into students (first_name, last_name, swimming_level, dob, parent_id)
    values ('Ah Mew', 'Tan', 1, '2019-06-28', 3);


    --Update an existing row's database
-- Update <table name> SET col = <new value> WHERE ....
-- WHERE is very important
update parents set first_name = "John" where parent_id=1;

-- Delete an existing row from a table
-- If we just want to delete one single specific row
-- its best that we delete by the primary key (aka the id column)

DELETE FROM parents WHERE parent_id = 4;

insert into parents (first_name,last_name)
values ("Peter","Barker");

insert into students(first_name,last_name,swimming_level,dob,parent_id)
values 
('test','Tan',1, '2019-06-28',5);