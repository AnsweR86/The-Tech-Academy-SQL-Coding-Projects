


CREATE PROC createLibraryInvent
AS
BEGIN

	CREATE TABLE tbl_library_branch(
		branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branch_name VARCHAR(50)  NOT NULL, branch_address VARCHAR (50)   NULL
	);


		INSERT INTO tbl_library_branch
		(branch_name, branch_address)
		VALUES
		('Sharpstown','1000 Northview Ave. So...'),
		('Central','P.O Box Central Distric'),
		('Up-town','221 Panther st'),
		('Western','1001 Abby st..');



	
	CREATE TABLE tbl_Publisher(
		Publisher_name VARCHAR(50) PRIMARY KEY NOT NULL ,
		Publisher_address VARCHAR(50)  NULL, Publisher_phone INT NULL
	);


		INSERT INTO tbl_Publisher
		 (Publisher_name, Publisher_Address, Publisher_Phone)
		 VALUES
		 ('Hoggart','324 P.O Box..','244-424-4824'),
		 ('Younguni','3422 Ranier Ave...','254-456-4541');


	
	
	
	CREATE TABLE tbl_book(
		book_id INT PRIMARY KEY NOT NULL IDENTITY(10,1),
		book_title VARCHAR(50)   NULL, 
		book_PublisherName VARCHAR (50)  NOT NULL,
		book_Publisher VARCHAR(50) NULL CONSTRAINT fk_book_Publisher1 FOREIGN KEY REFERENCES tbl_Publisher(Publisher_name)
	);


		INSERT INTO tbl_book   
		(book_title, book_Publisher)
		VALUES 
		('The Lost Tribe','Kyate Corp.'),
		('The Great Gatsby2','Udnt'),
		('To Kill a Mockingbird','Pheonix'),
		('Beloved','The Azure'),
		('Lord of Filies','Willy utd.'),
		('Color Purple','think_GREEN'),
		('Break the Dawn','WoWzer'),
		('Delta Elite','Pandfic'),
		('The Age Of Tear','Cooldue'),
		('The Lord of Ring','J.R.R.T'),
		('The Chicken Noodle Soup','Awmerica'),
		('GooseBumps','bookWorm'),
		('Room with View','aPPletree'),
		('Fatal','LeathPaper'),
		('On the Road','GoStop'),
		('Catching in the rye','Windsome'),
		('Gone','1Printing'),
		('Hole','Lee Company'),
		('Cosmos','WizardTounge'),
		('Heart of Darkness','Papervally');



	CREATE TABLE tbl_borrower(
		borrower_cardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
		borrower_name VARCHAR(50)  NOT NULL,borrower_address VARCHAR (50)  NOT NULL, borrower_phone VARCHAR(50) NOT NULL
	);

		INSERT INTO tbl_borrower
		(borrower_cardNo,borrower_name,borrower_phone,borrower_address)
		VALUES
		('100','Edwardo Marriotted','343-434-3433','343 smith st..'),
		('101','Scott Fizgerd','434-434-7676','453 highsuit pl..'),
		('102','Harper Leweis','432-766-7643','9000 45th ave..'),
		('103','Bob White','434-453-9066','850 P.O Box..'),
		('104','Joegl Hellir','434-879-6565','4456 mariotte st.'),
		('105','Jose Cond','435-464-5466','4353 potter st..'),
		('106','James Joy','546-656-5454','777 goose ave..'),
		('107','Emily Dicki','343-454-5454','546 birsing st..'),
		('108','Tony Morr','335-657-5665','546 smitter ave..'),
		('109','Jon Uphike','454-545-5454','545 goash ave..');



	CREATE TABLE tbl_bookAuthor(
		bookAuthor_bookID INT PRIMARY KEY NOT NULL IDENTITY (10,1),
		bookAuthor_authorName VARCHAR (50) NOT NULL,
		bookAuthor_book INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE);


		INSERT INTO tbl_bookAuthor
		(bookAuthor_bookID, bookAuthor_authorName)
		VALUES
		('13','Edward Marriott'),
		('11','F.Scott Fitzgerald'),
		('12','Harper Lee'),
		('9','E.B White'),
		('8','Joe Heller'),
		('7','Joseph Conrad'),
		('6','James Joyce'),
		('5','Emily Dickinson'),
		('4','Toni Morrison'),
		('3','John Updike'),
		('2','Stephen King'),
		('1','Stephen King');
		

	CREATE TABLE tbl_bookCopies(
		bookCopies_bookID INT PRIMARY KEY NOT NULL IDENTITY (101,1),
		bookCopies_book INT NOT NULL CONSTRAINT fk_bookName FOREIGN KEY  REFERENCES  tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_library_branchID INT NOT NULL CONSTRAINT fk_branchIdentification FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_Number_of_Copies INT NOT NULL);
		
			
		INSERT INTO tbl_bookCopies
		(bookCopies_bookID,bookCopies_library_branchID,bookCopies_Number_of_Copies)
		VALUES
		('10','1','2'),
		('11','1','3'),
		('12','1','4'),
		('13','1','5'),
		('14','1','4'),
		('15','1','3'),
		('16','1','2'),
		('17','1','7'),
		('18','1','2'),
		('19','1','5'),
		('20','2','2'),
		('21','2','3'),
		('22','2','4'),
		('23','2','5'),
		('24','2','4'),
		('25','2','3'),
		('26','2','2'),
		('27','2','7'),
		('28','2','2'),
		('29','2','5'),
		('10','3','2'),
		('11','3','3'),
		('12','3','4'),
		('13','3','5'),
		('14','3','4'),
		('15','3','3'),
		('16','3','2'),
		('17','3','7'),
		('18','3','2'),
		('19','3','5'),
		('20','4','2'),
		('21','4','3'),
		('22','4','4'),
		('23','4','5'),
		('24','4','4'),
		('25','4','3'),
		('26','4','2'),
		('27','4','7'),
		('28','4','2'),
		('29','4','5'),
		('1','2','2'),
		('2','2','2');

	CREATE TABLE tbl_bookLoan(
		bookLoan_bookID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
		bookLoan_library_branchID INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_CardNo INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_DateOut DATE  NULL, bookLoan_DateDue DATE  NULL);
	 
		 
		
	
		INSERT INTO tbl_bookLoan
		(bookLoan_bookID,bookLoan_library_branchID,bookLoan_DateOut,bookLoan_DateDue)
		VALUES
		('21','1','100' ,'01/03/2015' ,'01/09/2015'),
		('22 ' ,'1','100' ,'12/23/2014' ,'12/27/2014'),
		('23', '1','100', '01/01/2015', '01/11/2015'),
		('24', '1','100' ,'01/05/2015','01/12/2015'),
		('25','1','100','01/07/2015','01/14/2015'),
		('26','2','101','01/15/2015','01/24/2015'),
		('27','2','101','01/17/2015','01/25/2015'),
		('28','2','101','02/02/2014','04/05/2015'),
		('12','2','101','04/04/2014','04/09/2014'),
		('13','2','101','06/07/2014','06/18/2014'),
		('21','1','102' ,'01/03/2015' ,'01/09/2015'),
		('22 ' ,'1','102' ,'12/23/2014' ,'12/27/2014'),
		('23', '1','102', '01/01/2015', '01/11/2015'),
		('24', '1','102' ,'01/05/2015','01/12/2015'),
		('25','1','103','01/07/2015','01/14/2015'),
		('26','2','103','01/15/2015','01/24/2015'),
		('27','2','103','01/17/2015','01/25/2015'),
		('28','2','103','02/02/2014','04/05/2015'),
		('12','2','103','04/04/2014','04/09/2014'),
		('13','2','103','06/07/2014','06/18/2014'),
		('21','3','104' ,'01/03/2015' ,'01/09/2015'),
		('22 ' ,'3','104' ,'12/23/2014' ,'12/27/2014'),
		('23', '3','104', '01/01/2015', '01/11/2015'),
		('24', '3','104' ,'01/05/2015','01/12/2015'),
		('25','3','104','01/07/2015','01/14/2015'),
		('26','3','104','01/15/2015','01/24/2015'),
		('27','3','104','01/17/2015','01/25/2015'),
		('28','3','105','02/02/2014','04/05/2015'),
		('12','3','105','04/04/2014','04/09/2014'),
		('13','3','105','06/07/2014','06/18/2014'),
		('21','1','105' ,'01/03/2015' ,'01/09/2015'),
		('22 ' ,'1','105' ,'12/23/2014' ,'12/27/2014'),
		('23', '1','106', '01/01/2015', '01/11/2015'),
		('24', '1','106' ,'01/05/2015','01/12/2015'),
		('25','1','106','01/07/2015','01/14/2015'),
		('26','2','106','01/15/2015','01/24/2015'),
		('27','2','106','01/17/2015','01/25/2015'),
		('28','2','106','02/02/2014','04/05/2015'),
		('12','2','101','04/04/2014','04/09/2014'),
		('13','2','101','06/07/2014','06/18/2014'),
		('21','1','108' ,'01/03/2015' ,'01/09/2015'),
		('22 ' ,'1','107' ,'12/23/2014' ,'12/27/2014'),
		('23', '1','107', '01/01/2015', '01/11/2015'),
		('24', '1','107' ,'01/05/2015','01/12/2015'),
		('25','1','107','01/07/2015','01/14/2015'),
		('26','2','107','01/15/2015','01/24/2015'),
		('27','2','107','01/17/2015','01/25/2015'),
		('28','2','108','02/02/2014','04/05/2015'),
		('12','2','108','04/04/2014','04/09/2014'),
		('13','2','108','06/07/2014','06/18/2014');





		
	END

