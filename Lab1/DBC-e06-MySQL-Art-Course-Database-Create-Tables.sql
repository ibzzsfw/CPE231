/********************************************************************************/
/*																				*/
/*	Kroenke and Auer - Database Concepts (6th Edition)				            */
/*																				*/
/*	Art-Course-Database Create Tables											*/
/*																				*/
/*	These are the MySQL 5.5 SQL code solutions	                        		*/
/*																				*/
/*	NOTE: ALTER TABLE statements can been used to set the 			            */
/*	MySQL AUTO_INCREMENT to a starting value other than 1. I.e.:		        */
/*												                                */
/*	ALTER TABLE PROJECT AUTO_INCREMENT=1000;                            	    */
/*												                                */
/*	However, the increment is always one (1), so PROJECT ProjectID		        */
/* 	values must be manually inserted							                */
/*												                                */
/********************************************************************************/

CREATE TABLE CUSTOMER
(
	CustomerNumber Int NOT NULL
	AUTO_INCREMENT,
	CustomerLastName	  Char
	(25)		   NOT NULL,
	CustomerFirstName	  Char
	(25)	     NOT NULL,
	Phone			          Char
	(12)		   NOT NULL,
	CONSTRAINT 		      CUSTOMER_PK 	 PRIMARY KEY
	(CustomerNumber)
	);

	CREATE TABLE COURSE
	(
		CourseNumber Int NOT NULL
		AUTO_INCREMENT,
	Course			        Char
		(50) 		   NOT NULL,
	CourseDate          DateTime 		   NOT NULL,
	Fee				          Numeric
		(8,2)	 NOT NULL,
	CONSTRAINT 		      COURSE_PK 		 PRIMARY KEY
		(CourseNumber)
	);

		CREATE TABLE ENROLLMENT
		(
			CustomerNumber Int NOT NULL,
			CourseNumber Int NOT NULL,
			AmountPaid Numeric(8,2) NULL,
			CONSTRAINT 		      ENROLLMENT_PK  PRIMARY KEY(CustomerNumber, CourseNumber),
			CONSTRAINT 		      ENROLL_CUST_FK FOREIGN KEY (CustomerNumber)
	            					    REFERENCES CUSTOMER(CustomerNumber)
                                  ON UPDATE NO ACTION
                							    ON DELETE NO ACTION,
			CONSTRAINT 		      ENROLL_COURSE_FK  FOREIGN KEY (CourseNumber)
                            REFERENCES COURSE(CourseNumber)
						                	    ON UPDATE CASCADE
                							    ON DELETE CASCADE
		);
  
/********************************************************************************/