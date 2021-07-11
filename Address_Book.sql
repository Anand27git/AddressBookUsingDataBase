/*******
*
*Welcome to Address_Book Using MySql Database
*
****/

/* UC-1 creation of Address_Book Service */
mysql> Create database Address_Book;
Query OK, 1 row affected (0.35 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| address_book       |
| classicmodels      |
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sys                |
+--------------------+
7 rows in set (0.00 sec)

mysql> USE Address_Book;
Database changed

/* UC-2- Creation of table of address_book */
mysql>  CREATE table address_book (
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL,
    -> address VARCHAR(200) NOT NULL,
    -> city VARCHAR(50) NOT NULL,
    -> state VARCHAR(50) NOT NULL,
    -> zip INT NOT NULL,
    -> phone_number VARCHAR(10) NOT NULL,
    -> email_id VARCHAR(20) NOT NULL,
    -> primary key (phone_number)
    -> );
Query OK, 0 rows affected (1.55 sec)

mysql> desc address_book;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| first_name   | varchar(50)  | NO   |     | NULL    |       |
| last_name    | varchar(50)  | NO   |     | NULL    |       |
| address      | varchar(200) | NO   |     | NULL    |       |
| city         | varchar(50)  | NO   |     | NULL    |       |
| state        | varchar(50)  | NO   |     | NULL    |       |
| zip          | int          | NO   |     | NULL    |       |
| phone_number | varchar(10)  | NO   | PRI | NULL    |       |
| email_id     | varchar(20)  | NO   |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
8 rows in set (0.07 sec)

mysql>