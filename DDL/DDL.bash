MariaDB [(none)]> SHOW DATABASES;
MariaDB [(none)]> CREATE DATABASE conference
    -> DEFAULT CHARACTER SET utf8
    -> DEFAULT COLLATE utf8_general_ci;
MariaDB [(none)]> use conference
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
MariaDB [conference]> ALTER TABLE tb_account CHANGE _id account_id int(11);
MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_paper` (
    -> `_id` int(11) NOT NULL,
    -> `account_id` int(11) NOT NULL,
    -> `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    -> `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> `category` int(11) NOT NULL,
    -> `title` text NOT NULL,
    -> `author` text NOT NULL,
    -> `present` int(11) NOT NULL,
    -> `correspond` int(11) NOT NULL,
    -> `emailcorr` text NOT NULL,
    -> `abstract` text NOT NULL,
    -> `status` int(11) NOT NULL,
    -> PRIMARY KEY (`_id`)
    -> );
MariaDB [conference]> ALTER TABLE tb_paper CHANGE _id paper_id int(11);
MariaDB [conference]> ALTER TABLE tb_paper
    -> DROP PRIMARY KEY,
    -> ADD PRIMARY KEY(paper_id, account_id);
MariaDB [conference]> SHOW COLUMNS FROM tb_account;
MariaDB [conference]> SHOW COLUMNS from tb_paper; 
MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN modified;
MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN present;
MariaDB [conference]> ALTER TABLE tb_paper DROP COLUMN correspond;
MariaDB [conference]> ALTER TABLE tb_paper MODIFY status boolean;        
MariaDB [conference]> ALTER TABLE tb_paper MODIFY status boolean NOT NULL;
MariaDB [conference]> ALTER TABLE tb_paper ADD comment VARCHAR(60) AFTER abstract;
MariaDB [conference]> CREATE TABLE IF NOT EXISTS `tb_category` (
    -> `category_id` int(11) NOT NULL AUTO_INCREMENT,
    -> `category` text NOT NULL,
    -> PRIMARY KEY (`category_id`)
    -> );
MariaDB [conference]> INSERT INTO tb_category (category) VALUES ('Chemistry'), ('Biology'), ('Physics'), ('Mathematics'), ('Computing and Information Technology');
MariaDB [conference]> SELECT * FROM tb_category;
MariaDB [conference]> ALTER TABLE tb_paper
    -> ADD FOREIGN KEY (category) REFERENCES tb_category (category_id);
MariaDB [conference]> ALTER TABLE tb_paper ADD FOREIGN KEY (account_id) REFERENCES tb_account (account_id);
MariaDB [conference]> SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE where TABLE_NAME = 'tb_paper';
MariaDB [conference]> ALTER TABLE tb_paper DROP FOREIGN KEY tb_paper_ibfk_2, ADD CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `tb_account` (`account_id`);
MariaDB [conference]> SELECT COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME FROM information_schema.KEY_COLUMN_USAGE where TABLE_NAME = 'tb_paper';
MariaDB [conference]> INSERT INTO tb_account
    -> (account_id, email, password, code, title_name, first_name, middle_name, last_name, address, city, postal_code, country)
    -> VALUES (1, 'email@email.com', 'p@assword123', 'code', 'titlename', 'John', 'Mid', 'Doe', 'abc', 'BKK', '10140', 'Thailand');
MariaDB [conference]> INSERT INTO tb_paper
    -> (paper_id, account_id, modified, category, title, author, emailcorr, abstract, status) 
    -> VALUES (1, 1, CURRENT_TIMESTAMP, 2, 'title', 'author', 'emailcorr', 'abstract', 0)
    -> ;
MariaDB [conference]> SELECT * FROM tb_account;
MariaDB [conference]> DROP DATABASE conference;
