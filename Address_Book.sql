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

/* UC-3-Inserting the new contacts to address_book */

mysql>mysql> INSERT INTO address_book
          -> (first_name, last_name, address, city, state, zip, phone_number, email_id ) VALUES
          -> ('Manoj', 'Kumar', 'MGRoad', 'Bengaluru','Karnataka', 560038, 9902545780,'Manojkumar@gmail.com'),
          -> ('Raj', 'Tarun', 'Kolar', 'Bangarpet','Karnataka', 563114, 8088546145, 'RajTarun@gmail.com');

      Query OK, 2 rows affected (0.25 sec)
      Records: 2  Duplicates: 0  Warnings: 0

      mysql> SELECT * FROM address_book;
      +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
      | first_name | last_name | address         | city      | state         | zip    | phone_number | email_id             |
      +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
      |  Raj       | Tarun     | Kolar           | Bangarpet |  Karnataka    | 563114 | 8088546145   | RajTarun@gmail.com   |
      |  Manoj     | Kumar     | MGRoad          | Bengaluru |  Karnataka    | 560038 | 9902545780   | Manojkumar@gmail.com |
      +------------+-----------+-----------------+---------+---------------+-------+--------------+-------------------------+
      2 rows in set (0.04 sec)

/* UC-4- editing the existing contact using name */
mysql> UPDATE address_book
    -> SET address = 'KGF' WHERE first_name = 'Raj';
Query OK, 1 row affected (0.17 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;

      +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
      | first_name | last_name | address         | city      | state         | zip    | phone_number | email_id             |
      +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
      |  Raj       | Tarun     | KGF             | Bangarpet |  Karnataka    | 563114 | 8088546145   | RajTarun@gmail.com   |
      |  Manoj     | Kumar     | MGRoad          | Bengaluru |  Karnataka    | 560038 | 9902545780   | Manojkumar@gmail.com |
      +------------+-----------+-----------------+---------+---------------+-------+--------------+-------------------------+
      2 rows in set (0.03 sec)

/* UC-5  delete operation using person name */
mysql> DELETE FROM address_book WHERE first_name = 'Raj';
     Query OK, 1 row affected (0.12 sec)

 mysql> SELECT * FROM address_book;

           +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
           | first_name | last_name | address         | city      | state         | zip    | phone_number | email_id             |
           +------------+-----------+-----------------+-----------+---------------+--------+--------------+----------------------+
           |  Manoj     | Kumar     | MGRoad          | Bengaluru |  Karnataka    | 560038 | 9902545780   | Manojkumar@gmail.com |
           +------------+-----------+-----------------+---------+---------------+-------+--------------+-------------------------+
           1 rows in set (0.03 sec)

/* UC-6  finding person by city or state  */

mysql> INSERT INTO address_book
    -> (first_name, last_name, address, city, state, zip, phone_number, email_id) VALUES
    -> ('Dilip', 'Kumar', 'Banagarpet', 'Kolar  ','Karnataka', 563114,7888898950, 'dilip@gmail.com'),
    -> ('adithya', 'rai', 'NTRoad', 'cochi','kerala', 565788,7998785454, 'allu@gmail.com'),
    -> ('kabir', 'singh', 'indiranagar', ' Banglore','Karnataka',563110 ,8971923999 , 'kabir@gmail.com'),
    -> ('allu ', 'arjun', 'yeshwanthpur ', 'Bangalore','Karnataka',563256,8994578785, 'allu12@gmail.com');

Query OK, 4 rows affected (0.17 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
    | first_name | last_name | address      | city      | state     | zip    | phone_number | email_id             |
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
    | Dilip      | Kumar     | Banagarpet   | Kolar     | Karnataka | 563114 | 7888898950   | dilip@gmail.com      |
    | adithya    | rai       | NTRoad       | cochi     | kerala    | 565788 | 7998785454   | allu@gmail.com       |
    | kabir      | singh     | indiranagar  | Banglore  | Karnataka | 563110 | 8971923999   | kabir@gmail.com      |
    | allu       | arjun     | yeshwanthpur | Bangalore | Karnataka | 563256 | 8994578785   | allu12@gmail.com     |
    | Manoj      | Kumar     | MGRoad       | Bengaluru | Karnataka | 560038 | 9902545780   | Manojkumar@gmail.com |
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM address_book
    ->  WHERE state = 'karnataka';
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
    | first_name | last_name | address      | city      | state     | zip    | phone_number | email_id             |
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
    | Dilip      | Kumar     | Banagarpet   | Kolar     | Karnataka | 563114 | 7888898950   | dilip@gmail.com      |
    | kabir      | singh     | indiranagar  | Banglore  | Karnataka | 563110 | 8971923999   | kabir@gmail.com      |
    | allu       | arjun     | yeshwanthpur | Bangalore | Karnataka | 563256 | 8994578785   | allu12@gmail.com     |
    | Manoj      | Kumar     | MGRoad       | Bengaluru | Karnataka | 560038 | 9902545780   | Manojkumar@gmail.com |
    +------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+
4 rows in set (0.00 sec)

/* UC-7- Size of the address_book by city or state */

mysql> SELECT state, count(state) FROM address_book WHERE state = 'Karnataka' GROUP BY state;
    +-----------+--------------+
    | state     | count(state) |
    +-----------+--------------+
    | Karnataka |            4 |
    +-----------+--------------+
    1 row in set (0.00 sec)

mysql> SELECT state, count(state) FROM address_book WHERE state = 'kerala' GROUP BY state;
    +--------+--------------+
    | state  | count(state) |
    +--------+--------------+
    | kerala |            1 |
    +--------+--------------+
    1 row in set (0.00 sec)

mysql> SELECT state, count(state) FROM address_book WHERE city = 'bangarpet' GROUP BY city;
Empty set (0.00 sec)

mysql> SELECT state, count(state) FROM address_book WHERE city = 'kolar' GROUP BY city;
    +-----------+--------------+
    | state     | count(state) |
    +-----------+--------------+
    | Karnataka |            1 |
    +-----------+--------------+
1 row in set (0.00 sec)
