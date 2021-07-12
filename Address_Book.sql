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

/* UC-8-sorting by first_name and last_name */

mysql>  SELECT first_name, last_name From address_book ORDER BY first_name, last_name ASC;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| adithya    | rai       |
| allu       | arjun     |
| Dilip      | Kumar     |
| kabir      | singh     |
| Manoj      | Kumar     |
+------------+-----------+
5 rows in set (0.00 sec)

/* UC-9-identifying address_book with name and type */

mysql> ALTER TABLE address_book ADD Name varchar(20) AFTER email_id;
Query OK, 0 rows affected (4.62 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  UPDATE address_book
    -> SET name = 'ganesh', type = 'Friend' WHERE first_name = 'kabir';
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book
    -> SET name = 'prabhu', type = 'Family' WHERE first_name = 'Dilip';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book
    -> SET name = 'Teacher', type = 'Profession' WHERE first_name = 'adithya';
Query OK, 1 row affected (0.14 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book
    -> SET name = 'satish', type = 'Family' WHERE first_name = 'allu';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE address_book
    -> SET name = 'kamal', type = 'doctor' WHERE first_name = 'Manoj';
Query OK, 1 row affected (0.24 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
| first_name | last_name | address      | city      | state     | zip    | phone_number | email_id             | Name    | type       |
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
| Dilip      | Kumar     | Banagarpet   | Kolar     | Karnataka | 563114 | 7888898950   | dilip@gmail.com      | prabhu  | Family     |
| adithya    | rai       | NTRoad       | cochi     | kerala    | 565788 | 7998785454   | allu@gmail.com       | Teacher | Profession |
| kabir      | singh     | indiranagar  | Banglore  | Karnataka | 563110 | 8971923999   | kabir@gmail.com      | ganesh  | Friend     |
| allu       | arjun     | yeshwanthpur | Bangalore | Karnataka | 563256 | 8994578785   | allu12@gmail.com     | satish  | Family     |
| Manoj      | Kumar     | MGRoad       | Bengaluru | Karnataka | 560038 | 9902545780   | Manojkumar@gmail.com | kamal   | doctor     |
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
5 rows in set (0.00 sec)

/* UC-10 - number of contact persons in address_book by using type */

mysql> SELECT type, count(type) FROM address_book WHERE phone_number  GROUP BY type;
+------------+-------------+
| type       | count(type) |
+------------+-------------+
| Family     |           2 |
| Profession |           1 |
| Friend     |           1 |
| doctor     |           1 |
+------------+-------------+
4 rows in set (0.05 sec)

/* UC-11- adding persons to friends and family address_book  */

mysql> INSERT INTO address_book
    -> (first_name, last_name, address, city, state, zip, phone_number, email_id,Name,type) VALUES
    -> ('Thanu', 'shree', 'nagasandra', 'Banglore','Karnataka', 563035, 9963254120, 'thanu@gmail.com','book1','Friend'),
    -> ('bindhu', 'pani', 'KGroad', 'KGF','Karnataka', 563114, 8977787820, 'bindu@gmail.com','book2','Family');
Query OK, 2 rows affected (0.17 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book;
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
| first_name | last_name | address      | city      | state     | zip    | phone_number | email_id             | Name    | type       |
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
| Dilip      | Kumar     | Banagarpet   | Kolar     | Karnataka | 563114 | 7888898950   | dilip@gmail.com      | prabhu  | Family     |
| adithya    | rai       | NTRoad       | cochi     | kerala    | 565788 | 7998785454   | allu@gmail.com       | Teacher | Profession |
| kabir      | singh     | indiranagar  | Banglore  | Karnataka | 563110 | 8971923999   | kabir@gmail.com      | ganesh  | Friend     |
| bindhu     | pani      | KGroad       | KGF       | Karnataka | 563114 | 8977787820   | bindu@gmail.com      | book2   | Family     |
| allu       | arjun     | yeshwanthpur | Bangalore | Karnataka | 563256 | 8994578785   | allu12@gmail.com     | satish  | Family     |
| Manoj      | Kumar     | MGRoad       | Bengaluru | Karnataka | 560038 | 9902545780   | Manojkumar@gmail.com | kamal   | doctor     |
| Thanu      | shree     | nagasandra   | Banglore  | Karnataka | 563035 | 9963254120   | thanu@gmail.com      | book1   | Friend     |
+------------+-----------+--------------+-----------+-----------+--------+--------------+----------------------+---------+------------+
7 rows in set (0.01 sec)