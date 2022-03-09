Last login: Fri Feb 25 00:11:26 on ttys001
/usr/bin/clear; ssh -i '/Users/suppakornrakna/.bitnami/stackman/machines/xampp/ssh/id_rsa' -o StrictHostKeyChecking=no 'root@192.168.64.2'
(base) suppakornrakna@Taps-MacBook-Pro ~ % /usr/bin/clear; ssh -i '/Users/suppakornrakna/.bitnami/stackman/machines/xampp/ssh/id_rsa' -o StrictHostKeyChecking=no 'root@192.168.64.2'
Linux debian 4.19.0-17-amd64 #1 SMP Debian 4.19.194-3 (2021-07-18) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Thu Feb 24 17:11:27 2022 from 192.168.64.1
root@debian:~# clear

root@debian:~# mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 52
Server version: 10.4.22-MariaDB Source distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Art_Course         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
6 rows in set (0.000 sec)

MariaDB [(none)]> CREATE DATABASE conference
    -> DEFAULT CHARACTER SET utf8
    -> DEFAULT COLLATE utf8_general_ci;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> use conference
Database changed
MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_account` (
    -> `_id` int(11) NOT NULL AUTO_INCREMENT,
    -> `email` text NOT NULL,
    -> `password` text NOT NULL,
    -> `code` text NOT NULL,
    -> `title_name` text NOT NULL,
    -> `first_name` text NOT NULL,
    -> `middle_name` text,
    -> `last_name` text NOT NULL,
    -> `address` text,
    -> `city` text,
    -> `postal_code` text,
    -> `country` text NOT NULL,
    -> PRIMARY KEY (`_id`)
    -> );
Query OK, 0 rows affected (0.014 sec)

MariaDB [conference]> ALTER TABLE tb_account CHANGE _id account_id int(11);
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0


MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_paper` (
    -> `_id` int(11) NOT NULL AUTO_INCREMENT,
    -> `created` timestamp DEFAULT CURRENT_TIMESTAMP NULL DEFAULT NULL,
    -> `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    -> `category` int(11) NOT NULL,
    -> `title` text COLLATE utf8_unicode_ci NOT NULL,
    -> `author` text COLLATE utf8_unicode_ci NOT NULL,
    -> `present` int(11) NOT NULL,
    -> `correspond` int(11) NOT NULL,
    -> `emailcorr` text COLLATE utf8_unicode_ci NOT NULL,
    -> `abstract` text COLLATE utf8_unicode_ci NOT NULL,
    -> `status` int(11) NOT NULL,
    -> PRIMARY KEY (`_id`)
    -> );
Query OK, 0 rows affected (0.014 sec)

MariaDB [conference]> drop table tb_paper;
Query OK, 0 rows affected (0.006 sec)


MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_paper` (
    -> `_id` int(11) NOT NULL,
    -> `account_id` int(11) NOT NULL,
    -> `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    -> `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
    -> `category` int(11) NOT NULL,
    -> `title` text COLLATE utf8_unicode_ci NOT NULL,
    -> `author` text COLLATE utf8_unicode_ci NOT NULL,
    -> `present` int(11) NOT NULL,
    -> `correspond` int(11) NOT NULL,
    -> `emailcorr` text COLLATE utf8_unicode_ci NOT NULL,
    -> `abstract` text COLLATE utf8_unicode_ci NOT NULL,
    -> `status` int(11) NOT NULL,
    -> PRIMARY KEY (`_id`)
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [conference]> ALTER TABLE tb_paper CHANGE _id paper_id int(11);
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper
    -> DROP PRIMARY KEY,
    -> ADD PRIMARY KEY(paper_id, account_id);
Query OK, 0 rows affected (0.030 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> SHOW COLUMNS FROM tb_account;
+-------------+---------+------+-----+---------+-------+
| Field       | Type    | Null | Key | Default | Extra |
+-------------+---------+------+-----+---------+-------+
| account_id  | int(11) | NO   | PRI | NULL    |       |
| email       | text    | NO   |     | NULL    |       |
| password    | text    | NO   |     | NULL    |       |
| code        | text    | NO   |     | NULL    |       |
| title_name  | text    | NO   |     | NULL    |       |
| first_name  | text    | NO   |     | NULL    |       |
| middle_name | text    | YES  |     | NULL    |       |
| last_name   | text    | NO   |     | NULL    |       |
| address     | text    | YES  |     | NULL    |       |
| city        | text    | YES  |     | NULL    |       |
| postal_code | text    | YES  |     | NULL    |       |
| country     | text    | NO   |     | NULL    |       |
+-------------+---------+------+-----+---------+-------+
12 rows in set (0.001 sec)

MariaDB [conference]> SHOW COLUMNS from tb_paper; 
+------------+-----------+------+-----+---------------------+-------+
| Field      | Type      | Null | Key | Default             | Extra |
+------------+-----------+------+-----+---------------------+-------+
| paper_id   | int(11)   | NO   | PRI | NULL                |       |
| account_id | int(11)   | NO   | PRI | NULL                |       |
| created    | timestamp | YES  |     | current_timestamp() |       |
| modified   | timestamp | NO   |     | 0000-00-00 00:00:00 |       |
| category   | int(11)   | NO   |     | NULL                |       |
| title      | text      | NO   |     | NULL                |       |
| author     | text      | NO   |     | NULL                |       |
| present    | int(11)   | NO   |     | NULL                |       |
| correspond | int(11)   | NO   |     | NULL                |       |
| emailcorr  | text      | NO   |     | NULL                |       |
| abstract   | text      | NO   |     | NULL                |       |
| status     | int(11)   | NO   |     | NULL                |       |
+------------+-----------+------+-----+---------------------+-------+
12 rows in set (0.001 sec)

MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN modified;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN present;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN correspond;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper MODIFY status boolean;        
Query OK, 0 rows affected (0.049 sec)              
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper MODIFY status boolean NOT NULL;
Query OK, 0 rows affected (0.024 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper ADD comment VARCHAR(60) AFTER abstract;
Query OK, 0 rows affected (0.006 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_category` (
    -> `category_id` int(11) NOT NULL AUTO_INCREMENT,
    -> `category` text COLLATE utf8_unicode_ci NOT NULL,
    -> PRIMARY KEY (`category_id`)
    -> );
Query OK, 0 rows affected (0.011 sec)

MariaDB [conference]> INSERT INTO tb_category (category) VALUES ('Chemistry'), ('Biology'), ('Physics'), ('Mathematics'), ('Computing and Information Technology');
Query OK, 5 rows affected (0.003 sec)
Records: 5  Duplicates: 0  Warnings: 0

MariaDB [conference]> SELECT * FROM tb_category;
+-------------+--------------------------------------+
| category_id | category                             |
+-------------+--------------------------------------+
|           1 | Chemistry                            |
|           2 | Biology                              |
|           3 | Physics                              |
|           4 | Mathematics                          |
|           5 | Computing and Information Technology |
+-------------+--------------------------------------+
5 rows in set (0.000 sec)

MariaDB [conference]> SELECT * FROM tb_category;
+-------------+--------------------------------------+
| category_id | category                             |
+-------------+--------------------------------------+
|           1 | Chemistry                            |
|           2 | Biology                              |
|           3 | Physics                              |
|           4 | Mathematics                          |
|           5 | Computing and Information Technology |
+-------------+--------------------------------------+
5 rows in set (0.000 sec)

MariaDB [conference]> ALTER TABLE tb_paper
    -> ADD FOREIGN KEY (category) REFERENCES tb_category (category_id);
Query OK, 0 rows affected (0.058 sec)              
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> ALTER TABLE tb_paper ADD FOREIGN KEY (account_id) REFERENCES tb_account (account_id);
Query OK, 0 rows affected (0.063 sec)              
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE where TABLE_NAME = 'tb_paper';
+-------------+-----------------+------------------------+-----------------------+
| COLUMN_NAME | CONSTRAINT_NAME | REFERENCED_COLUMN_NAME | REFERENCED_TABLE_NAME |
+-------------+-----------------+------------------------+-----------------------+
| paper_id    | PRIMARY         | NULL                   | NULL                  |
| account_id  | PRIMARY         | NULL                   | NULL                  |
| category    | tb_paper_ibfk_1 | category_id            | tb_category           |
| account_id  | tb_paper_ibfk_2 | account_id             | tb_account            |
+-------------+-----------------+------------------------+-----------------------+
4 rows in set (0.001 sec)

MariaDB [conference]> ALTER TABLE tb_paper DROP FOREIGN KEY tb_paper_ibfk_2, ADD CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `tb_account` (`account_id`);
Query OK, 0 rows affected (0.049 sec)              
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [conference]> SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE where TABLE_NAME = 'tb_paper';
+-------------+-----------------+------------------------+-----------------------+
| COLUMN_NAME | CONSTRAINT_NAME | REFERENCED_COLUMN_NAME | REFERENCED_TABLE_NAME |
+-------------+-----------------+------------------------+-----------------------+
| paper_id    | PRIMARY         | NULL                   | NULL                  |
| account_id  | PRIMARY         | NULL                   | NULL                  |
| account_id  | fk_account_id   | account_id             | tb_account            |
| category    | tb_paper_ibfk_1 | category_id            | tb_category           |
+-------------+-----------------+------------------------+-----------------------+
4 rows in set (0.000 sec)

MariaDB [conference]> INSERT INTO tb_account
    -> (account_id, email, password, code, title_name, first_name, middle_name, last_name, address, city, postal_code, country)
    -> VALUES (1, 'email@email.com', 'p@assword123', 'code', 'titlename', 'John', 'Mid', 'Doe', 'abc', 'BKK', '10140', 'Thailand');
Query OK, 1 row affected (0.003 sec)

MariaDB [conference]> INSERT INTO tb_paper
    -> (paper_id, account_id, category, title, author, emailcorr, abstract, status) 
    -> VALUES (1, 1, 2, 'title', 'author', 'emailcorr', 'abstract', 0)
    -> ;
Query OK, 1 row affected (0.003 sec)

MariaDB [conference]> SELECT * FROM tb_account;
+------------+-----------------+--------------+------+------------+------------+-------------+-----------+---------+------+-------------+----------+
| account_id | email           | password     | code | title_name | first_name | middle_name | last_name | address | city | postal_code | country  |
+------------+-----------------+--------------+------+------------+------------+-------------+-----------+---------+------+-------------+----------+
|          1 | email@email.com | p@assword123 | code | titlename  | John       | Mid         | Doe       | abc     | BKK  | 10140       | Thailand |
+------------+-----------------+--------------+------+------------+------------+-------------+-----------+---------+------+-------------+----------+
1 row in set (0.000 sec)

MariaDB [conference]> DROP DATABASE conference;
Query OK, 3 rows affected, 2 warnings (0.027 sec)

MariaDB [(none)]> 
