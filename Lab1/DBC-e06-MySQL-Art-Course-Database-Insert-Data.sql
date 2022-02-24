/********************************************************************************/
/*																			    */
/*	Kroenke and Auer - Database Concepts (6th Edition)				  			*/
/*                              										        */
/*	Art-Course-Database Create Tables			  		                        */
/*										                                        */
/*	These are the MySQL 5.5 SQL code solutions									*/
/*																				*/
/********************************************************************************/

/*****   CUSTOMER DATA   ********************************************************/

INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Johnson', 'Ariel', '206-567-1234');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Green', 'Robin', '425-678-8765');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Jackson', 'Charles', '306-789-3456');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Pearson', 'Jeffery', '206-567-2345');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Sears', 'Miguel', '360-789-4567');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Kyle', 'Leah', '425-678-7654');
INSERT INTO CUSTOMER
	(CustomerLastName, CustomerFirstName, Phone)
VALUES('Myers', 'Lynda', '360-789-5678');

/*****   COURSE DATA   **********************************************************/

INSERT INTO COURSE
	(Course, CourseDate, Fee)
VALUES('Adv Pastels', '2013-10-01', 500.00);
INSERT INTO COURSE
	(Course, CourseDate, Fee)
VALUES('Beg Oils', '2013-09-15', 350.00);
INSERT INTO COURSE
	(Course, CourseDate, Fee)
VALUES('Int Pastels', '2013-03-15', 350.00);
INSERT INTO COURSE
	(Course, CourseDate, Fee)
VALUES('Beg Oils', '2013-10-15', 350.00);
INSERT INTO COURSE
	(Course, CourseDate, Fee)
VALUES('Adv Pastels', '2013-11-15', 500.00);

/*****   ENROLLMENT DATA   ******************************************************/

INSERT INTO ENROLLMENT
VALUES(1, 1, 250.00);
INSERT INTO ENROLLMENT
VALUES(1, 3, 350.00);
INSERT INTO ENROLLMENT
VALUES(2, 2, 350.00);
INSERT INTO ENROLLMENT
VALUES(3, 1, 500.00);
INSERT INTO ENROLLMENT
VALUES(4, 1, 500.00);
INSERT INTO ENROLLMENT
VALUES(5, 2, 350.00);
INSERT INTO ENROLLMENT
VALUES(6, 5, 250.00);
INSERT INTO ENROLLMENT
VALUES(7, 4, 0.00);

/********************************************************************************/