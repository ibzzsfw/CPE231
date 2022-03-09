
root@debian:~# mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 51
Server version: 10.4.22-MariaDB Source distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use `dreamhome database`;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [dreamhome database]> SELECT * FROM staff;
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| staffNo | fName | lName | position   | sex  | DOB                 | salary | branchNo | Telephone | Mobile       | Email                      |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| SA9     | Mary  | Howe  | Assistant  | F    | 1970-02-19 00:00:00 |   9000 | B007     | 1338      | 079555 12345 | MaryHowe@Dreamhome.co.uk   |
| SG14    | David | Ford  | Supervisor | M    | 1958-03-24 00:00:00 |  18000 | B003     | 0223      | 079555 12344 | DavidFord@Dreamhome.co.uk  |
| SG37    | Ann   | Beech | Assistant  | F    | 1960-11-10 00:00:00 |  12000 | B003     | 0224      | 079555 12346 | AnnBeech@Dreamhome.co.uk   |
| SG5     | Susan | Brand | Manager    | F    | 1940-06-03 00:00:00 |  24000 | B003     | 0225      | 079555 12347 | SusanBrand@Dreamhome.co.uk |
| SL21    | John  | White | Manager    | M    | 1945-10-01 00:00:00 |  30000 | B005     | 1512      | 090555 12345 | JohnWhite@Dreamhome.co.uk  |
| SL41    | Julie | Lee   | Assistant  | F    | 1965-06-13 00:00:00 |   9000 | B005     | 1514      | 090555 12346 | JulieLee@Dreamhome.co.uk   |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, salary FROM Staff;
ERROR 1146 (42S02): Table 'dreamhome database.Staff' doesn't exist
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, salary FROM staff;
+---------+-------+-------+--------+
| staffNo | fName | lName | salary |
+---------+-------+-------+--------+
| SA9     | Mary  | Howe  |   9000 |
| SG14    | David | Ford  |  18000 |
| SG37    | Ann   | Beech |  12000 |
| SG5     | Susan | Brand |  24000 |
| SL21    | John  | White |  30000 |
| SL41    | Julie | Lee   |   9000 |
+---------+-------+-------+--------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT propertyNo FROM viewing;
+------------+
| propertyNo |
+------------+
| PA14       |
| PG36       |
| PG4        |
| PA14       |
| PG4        |
| PA14       |
| PG21       |
| PA14       |
| PG21       |
| PG36       |
| PG16       |
| PG21       |
+------------+
12 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT DISTINCT propertyNo FROM viewing;
+------------+
| propertyNo |
+------------+
| PA14       |
| PG36       |
| PG4        |
| PG21       |
| PG16       |
+------------+
5 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, salary/12 FROM staff;
+---------+-------+-------+-----------+
| staffNo | fName | lName | salary/12 |
+---------+-------+-------+-----------+
| SA9     | Mary  | Howe  |  750.0000 |
| SG14    | David | Ford  | 1500.0000 |
| SG37    | Ann   | Beech | 1000.0000 |
| SG5     | Susan | Brand | 2000.0000 |
| SL21    | John  | White | 2500.0000 |
| SL41    | Julie | Lee   |  750.0000 |
+---------+-------+-------+-----------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, salary/12 AS monthlySalary
    -> FROM staff;
+---------+-------+-------+---------------+
| staffNo | fName | lName | monthlySalary |
+---------+-------+-------+---------------+
| SA9     | Mary  | Howe  |      750.0000 |
| SG14    | David | Ford  |     1500.0000 |
| SG37    | Ann   | Beech |     1000.0000 |
| SG5     | Susan | Brand |     2000.0000 |
| SL21    | John  | White |     2500.0000 |
| SL41    | Julie | Lee   |      750.0000 |
+---------+-------+-------+---------------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary FROM Staff
    -> WHERE salary > 10000;
ERROR 1146 (42S02): Table 'dreamhome database.Staff' doesn't exist
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary FROM staff WHERE salary > 10000;
+---------+-------+-------+------------+--------+
| staffNo | fName | lName | position   | salary |
+---------+-------+-------+------------+--------+
| SG14    | David | Ford  | Supervisor |  18000 |
| SG37    | Ann   | Beech | Assistant  |  12000 |
| SG5     | Susan | Brand | Manager    |  24000 |
| SL21    | John  | White | Manager    |  30000 |
+---------+-------+-------+------------+--------+
4 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT *
    -> FROM branch
    -> WHERE city = `London` OR city = `Glasgow`;                    
ERROR 1054 (42S22): Unknown column 'London' in 'where clause'
MariaDB [dreamhome database]> SELECT * FROM branch WHERE city = 'London' OR city = 'Glasgow';
+----------+-----------------+---------+----------+
| branchNo | street          | city    | postcode |
+----------+-----------------+---------+----------+
| B002     | 56 Cover Drive  | London  | NW10 6EU |
| B003     | 163 Main Street | Glasgow | G11 9QX  |
| B005     | 22 Deer Road    | London  | SW1 4EH  |
+----------+-----------------+---------+----------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary FROM staff
    -> WHERE salary BETWEEN 20000 AND 30000;
+---------+-------+-------+----------+--------+
| staffNo | fName | lName | position | salary |
+---------+-------+-------+----------+--------+
| SG5     | Susan | Brand | Manager  |  24000 |
| SL21    | John  | White | Manager  |  30000 |
+---------+-------+-------+----------+--------+
2 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary FROM staff WHERE salary>=20000 AND salary <= 30000;
+---------+-------+-------+----------+--------+
| staffNo | fName | lName | position | salary |
+---------+-------+-------+----------+--------+
| SG5     | Susan | Brand | Manager  |  24000 |
| SL21    | John  | White | Manager  |  30000 |
+---------+-------+-------+----------+--------+
2 rows in set (0.000 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff
    -> WHERE position staffNo,);SupervisorstaffNo,, ManagerIN (
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'staffNo,)' at line 2
    -> ;                                                                          
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'SupervisorstaffNo,, ManagerIN (' at line 1
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff WHERE position IN ('Manager', 'Supervisor');    
+---------+-------+-------+------------+
| staffNo | fName | lName | position   |
+---------+-------+-------+------------+
| SG14    | David | Ford  | Supervisor |
| SG5     | Susan | Brand | Manager    |
| SL21    | John  | White | Manager    |
+---------+-------+-------+------------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff WHERE position = 'Manager' OR position = 'Supervisor';
+---------+-------+-------+------------+
| staffNo | fName | lName | position   |
+---------+-------+-------+------------+
| SG14    | David | Ford  | Supervisor |
| SG5     | Susan | Brand | Manager    |
| SL21    | John  | White | Manager    |
+---------+-------+-------+------------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT ownerNo, fName, lName, address, telNo FROM PrivateOwner
    -> WHERE address LIKE '%Glasgow%';
ERROR 1146 (42S02): Table 'dreamhome database.PrivateOwner' doesn't exist
MariaDB [dreamhome database]> SELECT ownerNo, fName, lName, address, telNo FROM privateOwner WHERE address LIKE '%Glasgow%';
ERROR 1146 (42S02): Table 'dreamhome database.privateOwner' doesn't exist
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> SELECT ownerNo, fName, lName, address, telNo FROM privateOwner WHERE address LIKE '%Glasgow%';
ERROR 1146 (42S02): Table 'dreamhome database.privateOwner' doesn't exist
MariaDB [dreamhome database]> select * from staff
    -> ;
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| staffNo | fName | lName | position   | sex  | DOB                 | salary | branchNo | Telephone | Mobile       | Email                      |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| SA9     | Mary  | Howe  | Assistant  | F    | 1970-02-19 00:00:00 |   9000 | B007     | 1338      | 079555 12345 | MaryHowe@Dreamhome.co.uk   |
| SG14    | David | Ford  | Supervisor | M    | 1958-03-24 00:00:00 |  18000 | B003     | 0223      | 079555 12344 | DavidFord@Dreamhome.co.uk  |
| SG37    | Ann   | Beech | Assistant  | F    | 1960-11-10 00:00:00 |  12000 | B003     | 0224      | 079555 12346 | AnnBeech@Dreamhome.co.uk   |
| SG5     | Susan | Brand | Manager    | F    | 1940-06-03 00:00:00 |  24000 | B003     | 0225      | 079555 12347 | SusanBrand@Dreamhome.co.uk |
| SL21    | John  | White | Manager    | M    | 1945-10-01 00:00:00 |  30000 | B005     | 1512      | 090555 12345 | JohnWhite@Dreamhome.co.uk  |
| SL41    | Julie | Lee   | Assistant  | F    | 1965-06-13 00:00:00 |   9000 | B005     | 1514      | 090555 12346 | JulieLee@Dreamhome.co.uk   |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> show tables;
+------------------------------+
| Tables_in_dreamhome database |
+------------------------------+
| branch                       |
| client                       |
| propertyforrent              |
| staff                        |
| viewing                      |
+------------------------------+
5 rows in set (0.000 sec)

MariaDB [dreamhome database]> SELECT ownerNo, fName, lName, address, telNo FROM client WHERE address LIKE '%Glasgow%';
ERROR 1054 (42S22): Unknown column 'ownerNo' in 'field list'
MariaDB [dreamhome database]> select * from client;
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
| ID   | clientNo | fName     | lName        | telNo     | Street                 | City           | PostCode | email                  | JoinedOn            | Region              | preType | maxRent |
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
|    2 | CR56     | Fred      | Flintstone   | 555 1234  | 12 Rock Way            | Bedrock        | BD3 8RK  | fred@flintyrock.com    | 2004-05-09 00:00:00 | NULL                | House   |     450 |
|    6 | CR62     | Wilma     | Flintstone   | 555 1234  | 12 Rock Way            | Bedrock        | BD3 8RK  | wilma@flintyrock.com   | 2004-05-09 00:00:00 | NULL                | Flat    |     350 |
|    7 | CR74     | Albert    | Johnstone    | 555 6677  | 1 Way St.              | Chicago        | PO34 5FB | albie@johnstone.com    | 2004-05-09 00:00:00 | (N/A)               | Flat    |     450 |
|    9 | CR77     | Clark     | Kent         | 555 9999  | 1 Super Way            | Smallville     | SM4 2ME  | clark@supersite.com    | 2004-05-09 00:00:00 | (N/A)               | Flat    |     400 |
|   10 | CR79     | Joe       | Bloggs       | 123 4567  | 5 High St              | Paisley        | PA2 2BB  | joe@paisley.com        | 2004-05-10 00:00:00 | London (North West) | House   |     450 |
|   12 | CR83     | Edward    | Scissorhands | 123 4567  | 1 Snip St.             | Scissorland    | SC1 2XX  | eddie@scix.com         | 2004-05-21 00:00:00 | (N/A)               | House   |     300 |
|   17 | NULL     | Albert    | Enistein     | 555 6789  | 12 Long Island Way     | New Jersey     | NJ44 2RD | bert@nuclearintent.com | 2004-05-21 00:00:00 | London (North West) | NULL    |     450 |
|   18 | NULL     | Snorrie   | Sturrluson   | 333 4567  | 1 Vik Way              | Rekjavik       | RK22 3RD | snorrie@iceland.com    | 2004-05-21 00:00:00 | (N/A)               | NULL    |     400 |
|   19 | NULL     | Ferdinand | Oblogiotta   | 123 5555  | 12 Strumpetwise Street | Lagrange Orage | PP2 1BB  | ferdy@orage.com        | 2004-05-31 00:00:00 | (N/A)               | House   |     450 |
|   20 | NULL     | Joe       | Schmoe       | 123 45678 | 1 High St              | Largs          | KA30 9DD | joes@largy.com         | 2004-05-31 00:00:00 | (N/A)               | House   |     550 |
|   21 | NULL     | Bill      | Gates        | 123 5555  | 1 Rich Street          | Seattle        | SE2 TTL  | bill@gatesland.com     | 2004-06-01 00:00:00 | London (South)      | House   |    1000 |
|   24 | NULL     | Bruce     | Wayne        | 555 6789  | 1 Wayne Manor          | Gotham         | BA01 TT0 | wayne@batty.com        | 2004-11-22 00:00:00 | Glasgow             | House   |     900 |
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
12 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT clientNo, fName, lName, address, telNo FROM client WHERE address LIKE '%Glasgow%';
ERROR 1054 (42S22): Unknown column 'address' in 'field list'
MariaDB [dreamhome database]> SELECT clientNo, fName, lName, City, telNo FROM client WHERE address LIKE '%Glasgow%';
ERROR 1054 (42S22): Unknown column 'address' in 'where clause'
MariaDB [dreamhome database]> SELECT clientNo, fName, lName, City, telNo FROM client WHERE address LIKE '%Chicago%';
ERROR 1054 (42S22): Unknown column 'address' in 'where clause'
MariaDB [dreamhome database]> SELECT clientNo, fName, lName, City, telNo FROM client WHERE City LIKE '%Chicago%';
+----------+--------+-----------+---------+----------+
| clientNo | fName  | lName     | City    | telNo    |
+----------+--------+-----------+---------+----------+
| CR74     | Albert | Johnstone | Chicago | 555 6677 |
+----------+--------+-----------+---------+----------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> SELECT clientNo, viewDate FROM viewing
    -> WHERE propertyNo = 'PG4' AND comment IS NULL;
ERROR 1054 (42S22): Unknown column 'clientNo' in 'field list'
MariaDB [dreamhome database]> select * from viewing
    -> 
    -> ;
+------+----------+------------+---------------------+----------+--------------------+------------+
| ID   | clientID | propertyNo | viewDate            | viewHour | Comment            | WishToRent |
+------+----------+------------+---------------------+----------+--------------------+------------+
|    2 |        2 | PA14       | 2004-07-01 00:00:00 |       11 | NULL               |            |
|    3 |        7 | PG36       | 2004-07-01 00:00:00 |       12 | NULL               |            |
|    4 |        9 | PG4        | 2004-07-01 00:00:00 |       12 | Tidy but too small |            |
|    5 |       10 | PA14       | 2004-07-02 00:00:00 |       10 | NULL               |            |
|    6 |       12 | PG4        | 2004-07-02 00:00:00 |       14 | NULL               |            |
|    7 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|    8 |        6 | PG21       | 2004-06-21 00:00:00 |       13 | NULL               |            |
|   11 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|   12 |        9 | PG21       | 2004-11-22 00:00:00 |        9 | Not bad at all.    |            |
|   13 |        9 | PG36       | 2004-11-23 00:00:00 |        9 | Kitchen too small. |            |
|   14 |        9 | PG16       | 2004-11-23 00:00:00 |        9 | NULL               |            |
|   15 |       24 | PG21       | 2004-11-25 00:00:00 |       11 | NULL               |            |
+------+----------+------------+---------------------+----------+--------------------+------------+
12 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT clientID, viewDate FROM viewing WHERE propertyNo = 'PG4' AND comment IS NULL;
+----------+---------------------+
| clientID | viewDate            |
+----------+---------------------+
|       12 | 2004-07-02 00:00:00 |
+----------+---------------------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, salary FROM staff
    -> ORDER BY salary DESC;
+---------+-------+-------+--------+
| staffNo | fName | lName | salary |
+---------+-------+-------+--------+
| SL21    | John  | White |  30000 |
| SG5     | Susan | Brand |  24000 |
| SG14    | David | Ford  |  18000 |
| SG37    | Ann   | Beech |  12000 |
| SA9     | Mary  | Howe  |   9000 |
| SL41    | Julie | Lee   |   9000 |
+---------+-------+-------+--------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT propertyNo, type, rooms, rent FROM propertyforrent
    -> ORDER BY type;
+------------+-------+-------+------+
| propertyNo | type  | rooms | rent |
+------------+-------+-------+------+
| PG16       | Flat  |     4 |  450 |
| PG36       | Flat  |     3 |  375 |
| PG4        | Flat  |     3 |  350 |
| PL94       | Flat  |     4 |  400 |
| PA14       | House |     6 |  650 |
| PG21       | House |     5 |  600 |
| PG97       | House |     3 |  380 |
+------------+-------+-------+------+
7 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT propertyNo, type, rooms, rent FROM propertyforrent               
    -> ORDER BY type, rent DESC;
+------------+-------+-------+------+
| propertyNo | type  | rooms | rent |
+------------+-------+-------+------+
| PG16       | Flat  |     4 |  450 |
| PL94       | Flat  |     4 |  400 |
| PG36       | Flat  |     3 |  375 |
| PG4        | Flat  |     3 |  350 |
| PA14       | House |     6 |  650 |
| PG21       | House |     5 |  600 |
| PG97       | House |     3 |  380 |
+------------+-------+-------+------+
7 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT COUNT(*) AS myCount FROM propertyforrent    
    -> WHERE rent > 350;
+---------+
| myCount |
+---------+
|       6 |
+---------+
1 row in set (0.002 sec)

MariaDB [dreamhome database]> SELECT COUNT(DISTINCT propertyNo) AS myCount FROM viewing
    -> WHERE viewDate BETWEEN '1-May-04' AND '31-May-04';
+---------+
| myCount |
+---------+
|       0 |
+---------+
1 row in set, 2 warnings (0.001 sec)

MariaDB [dreamhome database]> SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum FROM staff
    -> WHERE COUNT;Managerposition = 
ERROR 1054 (42S22): Unknown column 'COUNT' in 'where clause'
    -> SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum FROM staff
    -> WHERE position = 'Manager'; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Managerposition = 
SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum FRO...' at line 1
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum FROM staff WHERE position = 'Manager';
+---------+-------+
| myCount | mySum |
+---------+-------+
|       2 | 54000 |
+---------+-------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> SELECT MIN(salary) AS myMin, MAX(salary) AS myMax,
    -> AVG(salary) AS myAvg
    -> FROM staff
    -> ;
+-------+-------+------------+
| myMin | myMax | myAvg      |
+-------+-------+------------+
|  9000 | 30000 | 17000.0000 |
+-------+-------+------------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> SELECT branchNo, COUNT(staffNo) AS myCount,
    -> SUM(salary) AS mySum
    -> FROM staff
    -> GROUP BY branchNo ORDER BY branchNo;
+----------+---------+-------+
| branchNo | myCount | mySum |
+----------+---------+-------+
| B003     |       3 | 54000 |
| B005     |       2 | 39000 |
| B007     |       1 |  9000 |
+----------+---------+-------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT branchNo,
    -> COUNT(staffNo) AS myCount,
    -> SUM(salary) AS mySum
    -> FROM staff
    -> GROUP BY branchNo HAVING COUNT(staffNo) > 1 ORDER BY branchNo;
+----------+---------+-------+
| branchNo | myCount | mySum |
+----------+---------+-------+
| B003     |       3 | 54000 |
| B005     |       2 | 39000 |
+----------+---------+-------+
2 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff
    -> WHERE branchNo =
    -> (SELECT branchNo
    -> FROM Branch
    -> WHERE street = '163 Main St');    
ERROR 1146 (42S02): Table 'dreamhome database.Branch' doesn't exist
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff WHERE branchNo = (SELECT branchNo FROM branch WHERE street = '163 Main St');
Empty set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff
    -> WHERE branchNo =  'B003';
+---------+-------+-------+------------+
| staffNo | fName | lName | position   |
+---------+-------+-------+------------+
| SG14    | David | Ford  | Supervisor |
| SG37    | Ann   | Beech | Assistant  |
| SG5     | Susan | Brand | Manager    |
+---------+-------+-------+------------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position,
    -> WHERE branchNo =  'B003';;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'WHERE branchNo =  'B003'' at line 2
ERROR: No query specified

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position,
    -> salary - (SELECT AVG(salary) FROM staff) As SalDif
    -> FROM  staff
    -> WHERE salary >
    -> (SELECT AVG(salary)
    -> FROM staff);
+---------+-------+-------+------------+------------+
| staffNo | fName | lName | position   | SalDif     |
+---------+-------+-------+------------+------------+
| SG14    | David | Ford  | Supervisor |  1000.0000 |
| SG5     | Susan | Brand | Manager    |  7000.0000 |
| SL21    | John  | White | Manager    | 13000.0000 |
+---------+-------+-------+------------+------------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position,
    -> salary -  17000 As salDiff       
    -> FROM staff
    -> WHERE salary > 17000;
+---------+-------+-------+------------+---------+
| staffNo | fName | lName | position   | salDiff |
+---------+-------+-------+------------+---------+
| SG14    | David | Ford  | Supervisor |    1000 |
| SG5     | Susan | Brand | Manager    |    7000 |
| SL21    | John  | White | Manager    |   13000 |
+---------+-------+-------+------------+---------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT propertyNo, street, city, postcode, type, rooms, rent
    -> FROM propertyForRent
    -> WHERE staffNo IN
    -> (SELECT staffNo
    -> FROM staff
    -> WHERE branchNo =
    -> (SELECT branchNo
    -> FROM Branch
    -> WHERE street = '163 Main St'));           
ERROR 1146 (42S02): Table 'dreamhome database.propertyForRent' doesn't exist
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> SELECT propertyNo, street, city, postcode, type, rooms, rent
    -> FROM propertyforrent
    -> WHERE staffNo IN
    -> (SELECT staffNo
    -> FROM staff
    -> WHERE branchNo =
    -> (SELECT branchNo
    -> FROM branch     
    -> WHERE street = '163 Main St'));
Empty set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary
    -> FROM staff
    -> WHERE salary > SOME
    -> (SELECT salary
    -> FROM staff
    -> WHERE branchNo = 'B003');
+---------+-------+-------+------------+--------+
| staffNo | fName | lName | position   | salary |
+---------+-------+-------+------------+--------+
| SG14    | David | Ford  | Supervisor |  18000 |
| SG5     | Susan | Brand | Manager    |  24000 |
| SL21    | John  | White | Manager    |  30000 |
+---------+-------+-------+------------+--------+
3 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position, salary
    -> FROM staff
    -> WHERE salary > ALL
    -> (SELECT salary
    -> FROM staff
    -> WHERE branchNo = 'B003');
+---------+-------+-------+----------+--------+
| staffNo | fName | lName | position | salary |
+---------+-------+-------+----------+--------+
| SL21    | John  | White | Manager  |  30000 |
+---------+-------+-------+----------+--------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> SELECT c.clientNo, fName, lName,
    -> propertyNo, comment
    -> FROM client c, viewing v
    -> WHERE c.clientNo = v.clientNo;
ERROR 1054 (42S22): Unknown column 'v.clientNo' in 'where clause'
MariaDB [dreamhome database]> show table
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [dreamhome database]> show tables;
+------------------------------+
| Tables_in_dreamhome database |
+------------------------------+
| branch                       |
| client                       |
| propertyforrent              |
| staff                        |
| viewing                      |
+------------------------------+
5 rows in set (0.001 sec)

MariaDB [dreamhome database]> select * from client
    -> ;
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
| ID   | clientNo | fName     | lName        | telNo     | Street                 | City           | PostCode | email                  | JoinedOn            | Region              | preType | maxRent |
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
|    2 | CR56     | Fred      | Flintstone   | 555 1234  | 12 Rock Way            | Bedrock        | BD3 8RK  | fred@flintyrock.com    | 2004-05-09 00:00:00 | NULL                | House   |     450 |
|    6 | CR62     | Wilma     | Flintstone   | 555 1234  | 12 Rock Way            | Bedrock        | BD3 8RK  | wilma@flintyrock.com   | 2004-05-09 00:00:00 | NULL                | Flat    |     350 |
|    7 | CR74     | Albert    | Johnstone    | 555 6677  | 1 Way St.              | Chicago        | PO34 5FB | albie@johnstone.com    | 2004-05-09 00:00:00 | (N/A)               | Flat    |     450 |
|    9 | CR77     | Clark     | Kent         | 555 9999  | 1 Super Way            | Smallville     | SM4 2ME  | clark@supersite.com    | 2004-05-09 00:00:00 | (N/A)               | Flat    |     400 |
|   10 | CR79     | Joe       | Bloggs       | 123 4567  | 5 High St              | Paisley        | PA2 2BB  | joe@paisley.com        | 2004-05-10 00:00:00 | London (North West) | House   |     450 |
|   12 | CR83     | Edward    | Scissorhands | 123 4567  | 1 Snip St.             | Scissorland    | SC1 2XX  | eddie@scix.com         | 2004-05-21 00:00:00 | (N/A)               | House   |     300 |
|   17 | NULL     | Albert    | Enistein     | 555 6789  | 12 Long Island Way     | New Jersey     | NJ44 2RD | bert@nuclearintent.com | 2004-05-21 00:00:00 | London (North West) | NULL    |     450 |
|   18 | NULL     | Snorrie   | Sturrluson   | 333 4567  | 1 Vik Way              | Rekjavik       | RK22 3RD | snorrie@iceland.com    | 2004-05-21 00:00:00 | (N/A)               | NULL    |     400 |
|   19 | NULL     | Ferdinand | Oblogiotta   | 123 5555  | 12 Strumpetwise Street | Lagrange Orage | PP2 1BB  | ferdy@orage.com        | 2004-05-31 00:00:00 | (N/A)               | House   |     450 |
|   20 | NULL     | Joe       | Schmoe       | 123 45678 | 1 High St              | Largs          | KA30 9DD | joes@largy.com         | 2004-05-31 00:00:00 | (N/A)               | House   |     550 |
|   21 | NULL     | Bill      | Gates        | 123 5555  | 1 Rich Street          | Seattle        | SE2 TTL  | bill@gatesland.com     | 2004-06-01 00:00:00 | London (South)      | House   |    1000 |
|   24 | NULL     | Bruce     | Wayne        | 555 6789  | 1 Wayne Manor          | Gotham         | BA01 TT0 | wayne@batty.com        | 2004-11-22 00:00:00 | Glasgow             | House   |     900 |
+------+----------+-----------+--------------+-----------+------------------------+----------------+----------+------------------------+---------------------+---------------------+---------+---------+
12 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT c.clientNo, fName, lName, propertyNo, comment FROM client c, viewing v WHERE c.clientNo = v.clientNo;
ERROR 1054 (42S22): Unknown column 'v.clientNo' in 'where clause'
MariaDB [dreamhome database]> select * from viewing
    -> ;
+------+----------+------------+---------------------+----------+--------------------+------------+
| ID   | clientID | propertyNo | viewDate            | viewHour | Comment            | WishToRent |
+------+----------+------------+---------------------+----------+--------------------+------------+
|    2 |        2 | PA14       | 2004-07-01 00:00:00 |       11 | NULL               |            |
|    3 |        7 | PG36       | 2004-07-01 00:00:00 |       12 | NULL               |            |
|    4 |        9 | PG4        | 2004-07-01 00:00:00 |       12 | Tidy but too small |            |
|    5 |       10 | PA14       | 2004-07-02 00:00:00 |       10 | NULL               |            |
|    6 |       12 | PG4        | 2004-07-02 00:00:00 |       14 | NULL               |            |
|    7 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|    8 |        6 | PG21       | 2004-06-21 00:00:00 |       13 | NULL               |            |
|   11 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|   12 |        9 | PG21       | 2004-11-22 00:00:00 |        9 | Not bad at all.    |            |
|   13 |        9 | PG36       | 2004-11-23 00:00:00 |        9 | Kitchen too small. |            |
|   14 |        9 | PG16       | 2004-11-23 00:00:00 |        9 | NULL               |            |
|   15 |       24 | PG21       | 2004-11-25 00:00:00 |       11 | NULL               |            |
+------+----------+------------+---------------------+----------+--------------------+------------+
12 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT c.clientNo, fName, lName, propertyNo, comment FROM client c, viewing v WHERE c.clientNo = v.clientID;
Empty set, 72 warnings (0.001 sec)

MariaDB [dreamhome database]> SELECT s.branchNo, s.staffNo, fName, lName, propertyNo
    -> FROM staff s, propertyforrent p
    -> WHERE s.staffNo = p.staffNo
    -> ORDER BY s.branchNo, s.staffNo, propertyNo;
+----------+---------+-------+-------+------------+
| branchNo | staffNo | fName | lName | propertyNo |
+----------+---------+-------+-------+------------+
| B003     | SG14    | David | Ford  | PG16       |
| B003     | SG37    | Ann   | Beech | PG21       |
| B003     | SG37    | Ann   | Beech | PG36       |
| B005     | SL41    | Julie | Lee   | PL94       |
| B007     | SA9     | Mary  | Howe  | PA14       |
| B007     | SA9     | Mary  | Howe  | PG4        |
| B007     | SA9     | Mary  | Howe  | PG97       |
+----------+---------+-------+-------+------------+
7 rows in set (0.002 sec)

MariaDB [dreamhome database]> SELECT b.branchNo, b.city, s.staffNo, fName, lName, propertyNo
    -> FROM branch b, staff s, propertyforrent p
    -> WHERE b.branchNo = s.branchNo AND s.staffNo = p.staffNo
    -> ORDER BY b.branchNo, s.staffNo, propertyNo;
+----------+----------+---------+-------+-------+------------+
| branchNo | city     | staffNo | fName | lName | propertyNo |
+----------+----------+---------+-------+-------+------------+
| B003     | Glasgow  | SG14    | David | Ford  | PG16       |
| B003     | Glasgow  | SG37    | Ann   | Beech | PG21       |
| B003     | Glasgow  | SG37    | Ann   | Beech | PG36       |
| B005     | London   | SL41    | Julie | Lee   | PL94       |
| B007     | Aberdeen | SA9     | Mary  | Howe  | PA14       |
| B007     | Aberdeen | SA9     | Mary  | Howe  | PG4        |
| B007     | Aberdeen | SA9     | Mary  | Howe  | PG97       |
+----------+----------+---------+-------+-------+------------+
7 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT s.branchNo, s.staffNo, COUNT(*) AS myCount
    -> FROM staff s, propertyforrent p
    -> WHERE s.staffNo = p.staffNo
    -> GROUP BY s.branchNo, s.staffNo
    -> 
    -> ORDER BY s.branchNo, s.staffNo;
+----------+---------+---------+
| branchNo | staffNo | myCount |
+----------+---------+---------+
| B003     | SG14    |       1 |
| B003     | SG37    |       2 |
| B005     | SL41    |       1 |
| B007     | SA9     |       3 |
+----------+---------+---------+
4 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT b.*, p.*
    -> FROM branch1 b LEFT JOIN
    -> propertyforrent1 p ON b.bCity = p.pCity;
ERROR 1146 (42S02): Table 'dreamhome database.branch1' doesn't exist
MariaDB [dreamhome database]> SELECT b.*, p.*
    -> FROM Branch1 b LEFT JOIN
    -> PropertyForRent1 p ON b.bCity = p.pCity;
ERROR 1146 (42S02): Table 'dreamhome database.Branch1' doesn't exist
MariaDB [dreamhome database]> select * from branch
    -> ;
+----------+------------------+----------+----------+
| branchNo | street           | city     | postcode |
+----------+------------------+----------+----------+
| B002     | 56 Cover Drive   | London   | NW10 6EU |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  |
| B004     | 32 Manse Road    | Bristol  | BS99 1NZ |
| B005     | 22 Deer Road     | London   | SW1 4EH  |
| B007     | 16 Argyll Street | Aberdeen | AB2 3SU  |
+----------+------------------+----------+----------+
5 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT b.*, p.* FROM Branch1 b LEFT JOIN PropertyForRent1 p ON b.city = p.pcity;
ERROR 1146 (42S02): Table 'dreamhome database.Branch1' doesn't exist
MariaDB [dreamhome database]> select * from propertyforrent
    -> ;
+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| propertyNo | street            | city     | postcode | type  | rooms | rent | ownerNo | staffNo | branchNo | picture           | floorPlan        |
+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| PA14       | 16 Holhead        | Aberdeen | AB7 5SU  | House |     6 |  650 | CO46    | SA9     | B007     | images/house2.jpg | images/plan1.jpg |
| PG16       | 5 Novar Drive     | Glasgow  | G12 9AX  | Flat  |     4 |  450 | CO93    | SG14    | B003     | images/house3.jpg | images/plan1.jpg |
| PG21       | 18 Dale Road      | Glasgow  | G12      | House |     5 |  600 | CO87    | SG37    | B003     | images/house4.jpg | images/plan1.jpg |
| PG36       | 2 Manor Road      | Glasgow  | G32 4QX  | Flat  |     3 |  375 | CO93    | SG37    | B003     | images/house5.jpg | images/plan1.jpg |
| PG4        | 6 Lawrence Street | Glasgow  | G11 9QX  | Flat  |     3 |  350 | CO40    | SA9     | B003     | images/house2.jpg | images/plan1.jpg |
| PG97       | Muir Drive        | Aberdeen | AB42 1DD | House |     3 |  380 | CO46    | SA9     | B007     | images/house1.jpg | images/plan1.jpg |
| PL94       | 6 Argyll Street   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | B005     | images/house3.jpg | images/plan1.jpg |
+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
7 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch1 b LEFT JOIN propertyforrent1 p ON b.bcity = p.pcity;
ERROR 1146 (42S02): Table 'dreamhome database.branch1' doesn't exist
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch1 b LEFT JOIN propertyforrent1 p ON b.city = p.city;
ERROR 1146 (42S02): Table 'dreamhome database.branch1' doesn't exist
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch b LEFT JOIN propertyforrent1 p ON b.city = p.city;
ERROR 1146 (42S02): Table 'dreamhome database.propertyforrent1' doesn't exist
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch b LEFT JOIN propertyforrent1 p ON b.city = p.city;
ERROR 1146 (42S02): Table 'dreamhome database.propertyforrent1' doesn't exist
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch b LEFT JOIN propertyforrent p ON b.city = p.city;
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| branchNo | street           | city     | postcode | propertyNo | street            | city     | postcode | type  | rooms | rent | ownerNo | staffNo | branchNo | picture           | floorPlan        |
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| B007     | 16 Argyll Street | Aberdeen | AB2 3SU  | PA14       | 16 Holhead        | Aberdeen | AB7 5SU  | House |     6 |  650 | CO46    | SA9     | B007     | images/house2.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG16       | 5 Novar Drive     | Glasgow  | G12 9AX  | Flat  |     4 |  450 | CO93    | SG14    | B003     | images/house3.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG21       | 18 Dale Road      | Glasgow  | G12      | House |     5 |  600 | CO87    | SG37    | B003     | images/house4.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG36       | 2 Manor Road      | Glasgow  | G32 4QX  | Flat  |     3 |  375 | CO93    | SG37    | B003     | images/house5.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG4        | 6 Lawrence Street | Glasgow  | G11 9QX  | Flat  |     3 |  350 | CO40    | SA9     | B003     | images/house2.jpg | images/plan1.jpg |
| B007     | 16 Argyll Street | Aberdeen | AB2 3SU  | PG97       | Muir Drive        | Aberdeen | AB42 1DD | House |     3 |  380 | CO46    | SA9     | B007     | images/house1.jpg | images/plan1.jpg |
| B002     | 56 Cover Drive   | London   | NW10 6EU | PL94       | 6 Argyll Street   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | B005     | images/house3.jpg | images/plan1.jpg |
| B005     | 22 Deer Road     | London   | SW1 4EH  | PL94       | 6 Argyll Street   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | B005     | images/house3.jpg | images/plan1.jpg |
| B004     | 32 Manse Road    | Bristol  | BS99 1NZ | NULL       | NULL              | NULL     | NULL     | NULL  |  NULL | NULL | NULL    | NULL    | NULL     | NULL              | NULL             |
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
9 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT b.*, p.*
    -> FROM Branch b RIGHT JOIN
    -> propertyforrent p ON b.city = p.city;
ERROR 1146 (42S02): Table 'dreamhome database.Branch' doesn't exist
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch b RIGHT JOIN propertyforrent p ON b.city = p.city;
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| branchNo | street           | city     | postcode | propertyNo | street            | city     | postcode | type  | rooms | rent | ownerNo | staffNo | branchNo | picture           | floorPlan        |
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
| B002     | 56 Cover Drive   | London   | NW10 6EU | PL94       | 6 Argyll Street   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | B005     | images/house3.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG16       | 5 Novar Drive     | Glasgow  | G12 9AX  | Flat  |     4 |  450 | CO93    | SG14    | B003     | images/house3.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG21       | 18 Dale Road      | Glasgow  | G12      | House |     5 |  600 | CO87    | SG37    | B003     | images/house4.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG36       | 2 Manor Road      | Glasgow  | G32 4QX  | Flat  |     3 |  375 | CO93    | SG37    | B003     | images/house5.jpg | images/plan1.jpg |
| B003     | 163 Main Street  | Glasgow  | G11 9QX  | PG4        | 6 Lawrence Street | Glasgow  | G11 9QX  | Flat  |     3 |  350 | CO40    | SA9     | B003     | images/house2.jpg | images/plan1.jpg |
| B005     | 22 Deer Road     | London   | SW1 4EH  | PL94       | 6 Argyll Street   | London   | NW2      | Flat  |     4 |  400 | CO87    | SL41    | B005     | images/house3.jpg | images/plan1.jpg |
| B007     | 16 Argyll Street | Aberdeen | AB2 3SU  | PA14       | 16 Holhead        | Aberdeen | AB7 5SU  | House |     6 |  650 | CO46    | SA9     | B007     | images/house2.jpg | images/plan1.jpg |
| B007     | 16 Argyll Street | Aberdeen | AB2 3SU  | PG97       | Muir Drive        | Aberdeen | AB42 1DD | House |     3 |  380 | CO46    | SA9     | B007     | images/house1.jpg | images/plan1.jpg |
+----------+------------------+----------+----------+------------+-------------------+----------+----------+-------+-------+------+---------+---------+----------+-------------------+------------------+
8 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT b.*, p.*
    -> FROM branch b FULL JOIN
    -> propertyforrent p ON b.city = p.city;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FULL JOIN
propertyforrent p ON b.city = p.city' at line 2
MariaDB [dreamhome database]> SELECT b.*, p.* FROM branch b FULL JOIN propertyforrent p ON b.city = p.city;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FULL JOIN propertyforrent p ON b.city = p.city' at line 1
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position
    -> FROM staff s
    -> WHERE EXISTS
    -> (SELECT *
    -> FROM branch b
    -> WHERE s.branchNo = b.branchNo AND
    -> s.branchNo);Londoncity = 
Empty set, 6 warnings (0.001 sec)

    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Londoncity =' at line 1
MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position
    -> FROM staff s
    -> WHERE EXISTS
    -> (SELECT *
    -> FROM branch b
    -> WHERE s.branchNo = b.branchNo AND
    -> city = 'London');             
+---------+-------+-------+-----------+
| staffNo | fName | lName | position  |
+---------+-------+-------+-----------+
| SL21    | John  | White | Manager   |
| SL41    | Julie | Lee   | Assistant |
+---------+-------+-------+-----------+
2 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT * FROM branch WHERE city='London'      
    -> ;
+----------+----------------+--------+----------+
| branchNo | street         | city   | postcode |
+----------+----------------+--------+----------+
| B002     | 56 Cover Drive | London | NW10 6EU |
| B005     | 22 Deer Road   | London | SW1 4EH  |
+----------+----------------+--------+----------+
2 rows in set (0.001 sec)

MariaDB [dreamhome database]> SELECT staffNo, fName, lName, position FROM staff
    -> WHERE true;
+---------+-------+-------+------------+
| staffNo | fName | lName | position   |
+---------+-------+-------+------------+
| SA9     | Mary  | Howe  | Assistant  |
| SG14    | David | Ford  | Supervisor |
| SG37    | Ann   | Beech | Assistant  |
| SG5     | Susan | Brand | Manager    |
| SL21    | John  | White | Manager    |
| SL41    | Julie | Lee   | Assistant  |
+---------+-------+-------+------------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> (SELECT city
    -> FROM branch
    -> WHERE city IS NOT NULL) UNION
    -> (SELECT city
    -> FROM propertyforrent
    -> WHERE city IS NOT NULL);
+----------+
| city     |
+----------+
| London   |
| Glasgow  |
| Bristol  |
| Aberdeen |
+----------+
4 rows in set (0.001 sec)

MariaDB [dreamhome database]> (SELECT city FROM branch)
    -> INTERSECT
    -> (SELECT city FROM propertyforrent);
+----------+
| city     |
+----------+
| London   |
| Glasgow  |
| Aberdeen |
+----------+
3 rows in set (0.002 sec)

MariaDB [dreamhome database]> (SELECT city FROM Branch)
    -> ;
ERROR 1146 (42S02): Table 'dreamhome database.Branch' doesn't exist
MariaDB [dreamhome database]> (SELECT city FROM branch)
    -> EXCEPT
    -> (SELECT city FROM propertyforrent);
+---------+
| city    |
+---------+
| Bristol |
+---------+
1 row in set (0.001 sec)

MariaDB [dreamhome database]> INSERT INTO staff
    -> VALUES ('SG16' , 'Alan', 'Brown', 'Assistant', 'M', Date'1957-05-25', 8300, 'B003');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [dreamhome database]> INSERT INTO staff VALUES ('SG16' , 'Alan', 'Brown', 'Assistant', 'M', Date'1957-05-25', 8300, 'B003');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [dreamhome database]> select * from staff
    -> ;
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| staffNo | fName | lName | position   | sex  | DOB                 | salary | branchNo | Telephone | Mobile       | Email                      |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| SA9     | Mary  | Howe  | Assistant  | F    | 1970-02-19 00:00:00 |   9000 | B007     | 1338      | 079555 12345 | MaryHowe@Dreamhome.co.uk   |
| SG14    | David | Ford  | Supervisor | M    | 1958-03-24 00:00:00 |  18000 | B003     | 0223      | 079555 12344 | DavidFord@Dreamhome.co.uk  |
| SG37    | Ann   | Beech | Assistant  | F    | 1960-11-10 00:00:00 |  12000 | B003     | 0224      | 079555 12346 | AnnBeech@Dreamhome.co.uk   |
| SG5     | Susan | Brand | Manager    | F    | 1940-06-03 00:00:00 |  24000 | B003     | 0225      | 079555 12347 | SusanBrand@Dreamhome.co.uk |
| SL21    | John  | White | Manager    | M    | 1945-10-01 00:00:00 |  30000 | B005     | 1512      | 090555 12345 | JohnWhite@Dreamhome.co.uk  |
| SL41    | Julie | Lee   | Assistant  | F    | 1965-06-13 00:00:00 |   9000 | B005     | 1514      | 090555 12346 | JulieLee@Dreamhome.co.uk   |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
6 rows in set (0.001 sec)

MariaDB [dreamhome database]> INSERT INTO staff VALUES ('SG16' , 'Alan', 'Brown', 'Assistant', 'M', Date'1957-05-25', 8300, 'B003', '0', 'a');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [dreamhome database]> INSERT INTO staff VALUES ('SG16' , 'Alan', 'Brown', 'Assistant', 'M', Date'1957-05-25', 8300, 'B003', '0', '0', 'a');
Query OK, 1 row affected (0.004 sec)

MariaDB [dreamhome database]> INSERT INTO staff (staffNo, fName, lName, position, salary, branchNo)
    -> VALUES ('SG44', 'Anne', 'Jones', 'Assistant', 8100, 'B003');                           
Query OK, 1 row affected (0.004 sec)

MariaDB [dreamhome database]> CREAT TABLE 'StaffPropCount'
    -> text 'staffNo' NOT NULL,
    -> text 'fName' NOT NULL,
    -> text 'lName' NOT NULL,
    -> int 'propCount' DEFAULT 0 NOT NULL
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREAT TABLE 'StaffPropCount'
text 'staffNo' NOT NULL,
text 'fName' NOT NULL,
...' at line 1
MariaDB [dreamhome database]> CREAT TABLE `StaffPropCount` (
    -> `staffNo` text NOT NULL,
    -> `fName` text NOT NULL,
    -> `lName` text NOT NULL,
    -> `propCount` int(11) DEFAULT 0 NOT NULL,
    -> PRIMARY KEY (`staffNo`)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREAT TABLE `StaffPropCount` (
`staffNo` text NOT NULL,
`fName` text NOT NULL...' at line 1
MariaDB [dreamhome database]> CREAT TABLE IF NOT EXISTS `StaffPropCount` ( `staffNo` text NOT NULL, `fName` text NOT NULL, `lName` text NOT NULL, `propCount` int(11) DEFAULT 0 NOT NULL, PRIMARY KEY (`staffNo`) );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'CREAT TABLE IF NOT EXISTS `StaffPropCount` ( `staffNo` text NOT NULL, `fName`...' at line 1
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> 
MariaDB [dreamhome database]> CREATE TABLE IF NOT EXISTS `StaffPropCount` ( `staffNo` text NOT NULL, `fName` text NOT NULL, `lName` text NOT NULL, `propCount` int(11) DEFAULT 0 NOT NULL, PRIMARY KEY (`staffNo`) );
ERROR 1170 (42000): BLOB/TEXT column 'staffNo' used in key specification without a key length
MariaDB [dreamhome database]> CREATE TABLE IF NOT EXISTS `StaffPropCount` ( `staffNo` text NOT NULL, `fName` text NOT NULL, `lName` text NOT NULL, `propCount` int(11) DEFAULT 0 NOT NULL);
Query OK, 0 rows affected (0.018 sec)

MariaDB [dreamhome database]> INSERT INTO StaffPropCount
    -> (SELECT s.staffNo, fName, lName, COUNT(*)
    -> FROM staff s, propertyforrent p
    -> WHERE s.staffNo = p.staffNo
    -> GROUP BY s.staffNo, fName, lName)
    -> UNION
    -> (SELECT staffNo, fName, lName, 0
    -> FROM staff
    -> WHERE staffNo NOT IN
    -> (SELECT DISTINCT staffNo
    -> FROM propertyforrent));
Query OK, 8 rows affected (0.024 sec)
Records: 8  Duplicates: 0  Warnings: 0

MariaDB [dreamhome database]> select * from StaffPropCount
    -> ;
+---------+-------+-------+-----------+
| staffNo | fName | lName | propCount |
+---------+-------+-------+-----------+
| SA9     | Mary  | Howe  |         3 |
| SG14    | David | Ford  |         1 |
| SG37    | Ann   | Beech |         2 |
| SL41    | Julie | Lee   |         1 |
| SG5     | Susan | Brand |         0 |
| SL21    | John  | White |         0 |
| SG16    | Alan  | Brown |         0 |
| SG44    | Anne  | Jones |         0 |
+---------+-------+-------+-----------+
8 rows in set (0.001 sec)

MariaDB [dreamhome database]> UPDATE staff
    -> SET salary = salary*1.03;
Query OK, 8 rows affected (0.005 sec)
Rows matched: 8  Changed: 8  Warnings: 0

MariaDB [dreamhome database]> UPDATE staff
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '' at line 1
MariaDB [dreamhome database]> select * from staff      
    -> ;
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| staffNo | fName | lName | position   | sex  | DOB                 | salary | branchNo | Telephone | Mobile       | Email                      |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| SA9     | Mary  | Howe  | Assistant  | F    | 1970-02-19 00:00:00 |   9270 | B007     | 1338      | 079555 12345 | MaryHowe@Dreamhome.co.uk   |
| SG14    | David | Ford  | Supervisor | M    | 1958-03-24 00:00:00 |  18540 | B003     | 0223      | 079555 12344 | DavidFord@Dreamhome.co.uk  |
| SG37    | Ann   | Beech | Assistant  | F    | 1960-11-10 00:00:00 |  12360 | B003     | 0224      | 079555 12346 | AnnBeech@Dreamhome.co.uk   |
| SG5     | Susan | Brand | Manager    | F    | 1940-06-03 00:00:00 |  24720 | B003     | 0225      | 079555 12347 | SusanBrand@Dreamhome.co.uk |
| SL21    | John  | White | Manager    | M    | 1945-10-01 00:00:00 |  30900 | B005     | 1512      | 090555 12345 | JohnWhite@Dreamhome.co.uk  |
| SL41    | Julie | Lee   | Assistant  | F    | 1965-06-13 00:00:00 |   9270 | B005     | 1514      | 090555 12346 | JulieLee@Dreamhome.co.uk   |
| SG16    | Alan  | Brown | Assistant  | M    | 1957-05-25 00:00:00 |   8549 | B003     | 0         | 0            | a                          |
| SG44    | Anne  | Jones | Assistant  | NULL | NULL                |   8343 | B003     | NULL      | NULL         | NULL                       |
+---------+-------+-------+------------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
8 rows in set (0.000 sec)

MariaDB [dreamhome database]> UPDATE staff
    -> SET position = 'Manager', salary = 18000   
    -> WHERE staffNo = 'SG14';      
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dreamhome database]> select * from staff
    -> ;
+---------+-------+-------+-----------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| staffNo | fName | lName | position  | sex  | DOB                 | salary | branchNo | Telephone | Mobile       | Email                      |
+---------+-------+-------+-----------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
| SA9     | Mary  | Howe  | Assistant | F    | 1970-02-19 00:00:00 |   9270 | B007     | 1338      | 079555 12345 | MaryHowe@Dreamhome.co.uk   |
| SG14    | David | Ford  | Manager   | M    | 1958-03-24 00:00:00 |  18000 | B003     | 0223      | 079555 12344 | DavidFord@Dreamhome.co.uk  |
| SG37    | Ann   | Beech | Assistant | F    | 1960-11-10 00:00:00 |  12360 | B003     | 0224      | 079555 12346 | AnnBeech@Dreamhome.co.uk   |
| SG5     | Susan | Brand | Manager   | F    | 1940-06-03 00:00:00 |  24720 | B003     | 0225      | 079555 12347 | SusanBrand@Dreamhome.co.uk |
| SL21    | John  | White | Manager   | M    | 1945-10-01 00:00:00 |  30900 | B005     | 1512      | 090555 12345 | JohnWhite@Dreamhome.co.uk  |
| SL41    | Julie | Lee   | Assistant | F    | 1965-06-13 00:00:00 |   9270 | B005     | 1514      | 090555 12346 | JulieLee@Dreamhome.co.uk   |
| SG16    | Alan  | Brown | Assistant | M    | 1957-05-25 00:00:00 |   8549 | B003     | 0         | 0            | a                          |
| SG44    | Anne  | Jones | Assistant | NULL | NULL                |   8343 | B003     | NULL      | NULL         | NULL                       |
+---------+-------+-------+-----------+------+---------------------+--------+----------+-----------+--------------+----------------------------+
8 rows in set (0.001 sec)

MariaDB [dreamhome database]> DELETE FROM viewing
    -> WHERE propertyNo = 'PG4';
Query OK, 2 rows affected (0.004 sec)

MariaDB [dreamhome database]> seelct * from viewing
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'seelct * from viewing' at line 1
MariaDB [dreamhome database]> select * from viewing;
+------+----------+------------+---------------------+----------+--------------------+------------+
| ID   | clientID | propertyNo | viewDate            | viewHour | Comment            | WishToRent |
+------+----------+------------+---------------------+----------+--------------------+------------+
|    2 |        2 | PA14       | 2004-07-01 00:00:00 |       11 | NULL               |            |
|    3 |        7 | PG36       | 2004-07-01 00:00:00 |       12 | NULL               |            |
|    5 |       10 | PA14       | 2004-07-02 00:00:00 |       10 | NULL               |            |
|    7 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|    8 |        6 | PG21       | 2004-06-21 00:00:00 |       13 | NULL               |            |
|   11 |        6 | PA14       | 2004-06-20 00:00:00 |       12 | NULL               |            |
|   12 |        9 | PG21       | 2004-11-22 00:00:00 |        9 | Not bad at all.    |            |
|   13 |        9 | PG36       | 2004-11-23 00:00:00 |        9 | Kitchen too small. |            |
|   14 |        9 | PG16       | 2004-11-23 00:00:00 |        9 | NULL               |            |
|   15 |       24 | PG21       | 2004-11-25 00:00:00 |       11 | NULL               |            |
+------+----------+------------+---------------------+----------+--------------------+------------+
10 rows in set (0.001 sec)

MariaDB [dreamhome database]> DELETE FROM viewing;
Query OK, 10 rows affected (0.005 sec)

MariaDB [dreamhome database]> select * from viewing;
Empty set (0.001 sec)

MariaDB [dreamhome database]> 
