USE master;
GO
BEGIN


--elect*from  tbl_book,tbl_bookAuthor,tbl_Publisher, tbl_bookCopies;


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
		Publisher_address VARCHAR(50)  NULL, Publisher_phone varchar(50) NULL
	);

	

		INSERT INTO tbl_Publisher
		 (Publisher_name, Publisher_Address, Publisher_Phone)
		 VALUES
		 ('Hoggart','324 P.O Box..','244-424-4824'),
		 ('Younguni','3422 Ranier Ave...','254-456-4541'),
		 ('Kyate Corp.','434 Heavens way..','434-434-4344'),
		 ('Udnt','452 Underswan Ave','765-543-5435'),
		('Pheonix','323 Gothom St..','423-343-4323'),
		('The Azure','433 Algo Ave.','232-433-4323'),
		('Willy utd.','345 Jackson st','323-433-4344'),
		('think_GREEN','234 Equalityies Ave.','234-434-4343'),
		('WoWzer','James st.','343-434-4345'),
		('Pandfic','345 Goldfort st.','434-4343-4343'),
		('Cooldue','323 Rubymore','323-323-3232'),
		('J.R.R.T','3424 Lordflies Ave..','324-434-3243'),
		('Awmerica','111 Amerigas blvd','344-535-5355'),
		('bookWorm','1212 Gokuinsane Ave.','433-434-4344'),
		('aPPletree','893 Gilmore st.','344-434-4344'),
		('LeathPaper','384 P.O BOX..','424-434-4344'),
		('GoStop','Jigwah pl.','434-878-4563'),
		('Windsome','434 Loansome st.','323-323-3244'),
		('1Printing','555 Jackcrow blv.','233-424-4234'),
		('Lee Company','434 Baki Rd.','324-323-3232'),
		('WizardTounge','434 Empirior Ave','434-434-4345'),
		('GrounDwag Inc.','324 Silicon Vally','343-434-4345'),
		('Houndpaw','4242 Jameson Pl..','343-234-4343'),
		('Papervally','345 ABC Ave.','323-434-4334');


	
	
	

	CREATE TABLE tbl_book(
		book_id INT PRIMARY KEY NOT NULL IDENTITY(120,1),
		book_title VARCHAR(50)   NULL, 
		 --!book_PublisherName VARCHAR (50)  NOT NULL,
		book_PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_book_Publisher1 FOREIGN KEY REFERENCES tbl_Publisher(Publisher_name)
	);


		INSERT INTO tbl_book   
		(book_title, book_PublisherName)
		VALUES 
		('Hairy Potter','Hoggart'),
		('DeadlySin','Younguni'),
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
		('Nexus','GrounDwag Inc.'),
		('Bird Box','Houndpaw'),
		('Heart of Darkness','Papervally');

	
	CREATE TABLE tbl_borrower(
		borrower_cardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
		borrower_name VARCHAR(50)  NOT NULL,borrower_address VARCHAR (50)  NOT NULL, borrower_phone VARCHAR(50) NOT NULL
	);

		INSERT INTO tbl_borrower
		(borrower_name,borrower_phone,borrower_address)
		VALUES
		('Edwardo Marriotted','343-434-3433','343 smith st..'),
		('Scott Fizgerd','434-434-7676','453 highsuit pl..'),
		('Harper Leweis','432-766-7643','9000 45th ave..'),
		('Bob White','434-453-9066','850 P.O Box..'),
		('Joegl Hellir','434-879-6565','4456 mariotte st.'),
		('Jose Cond','435-464-5466','4353 potter st..'),
		('James Joy','546-656-5454','777 goose ave..'),
		('Emily Dicki','343-454-5454','546 birsing st..'),
		('Tony Morr','335-657-5665','546 smitter ave..'),
		('Jon Uphike','454-545-5454','545 goash ave..');

		
		select *from tbl_book;
		cREATE TABLE tbl_bookAuthor(
		bookAuthor_bookID INT PRIMARY KEY NOT NULL IDENTITY (1000,1), 
		bookAuthor_book INT NOT NULL CONSTRAINT fk_book_bookID1 FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
		bookAuthor_authorName VARCHAR(50) NULL);

		INSERT INTO tbl_bookAuthor
		(bookAuthor_book,bookAuthor_authorName)
		VALUES
		
		('121','F.Scott Fitzgerald'),
		('122','Harper Lee'),
		('123','Stephen King'),
		('124','Joe Heller'),
		('125','Joseph Conrad'),
		('126','James Joyce'),
		('127','Emily Dickinson'),
		('128','Toni Morrison'),
		('129','John Updike'),
		('130','Stephen King'),
		('131','Edwardo Gucci'),
		('132','F.Scott Fitzgerald'),
		('133','Harper Lee'),
		('134','E.B White'),
		('135','Joe Heller'),
		('136','Joseph Conrad'),
		('137','James Joyce'),
		('138','Emily Dickinson'),
		('139','Toni Morrison'),
		('140','John Updike'),
		('141','Stephen King'),
		('142','Fuller Dickinson'),
		('143','Emily Wattson'),
		('144','Edwardo Gucci');
	



		
		CREATE TABLE tbl_bookCopies(
		bookCopies_bookID INT PRIMARY KEY NOT NULL IDENTITY (124,1)_,
		bookCopies_book INT NOT NULL CONSTRAINT fk_book_bookID FOREIGN KEY REFERENCES  tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_library_branchID INT NOT NULL constraint fk_branch FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_Number_of_Copies INT NOT NULL);
		
	
		
		
		
		INSERT INTO tbl_bookCopies
		(bookCopies_book,bookCopies_library_branchID,bookCopies_Number_of_Copies)
		VALUES
		
		('121','1','2'),
		('122','1','3'),
		('123','1','4'),
		('124','1','5'),
		('125','1','4'),
		('126','1','3'),
		('127','1','2'),
		('128','1','7'),
		('129','1','2'),
		('130','1','5'),
		('132','2','2'),
		('133','2','3'),
		('134','2','4'),
		('135','2','5'),
		('136','2','4'),
		('137','2','3'),
		('138','2','2'),
		('139','2','7'),
		('140','2','2'),
		('141','2','5'),
		('142','3','2'),
		('143','3','3'),
		('144','3','4');
		

	CREATE TABLE tbl_bookLoan(
		bookLoan_bookID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
		bookLoan_library_branchID INT NOT NULL CONSTRAINT fk_library_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_CardNo INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_DateOut DATE  NULL, bookLoan_DateDue DATE  NULL);
	
	
	
	
	
		INSERT INTO tbl_bookLoan
		(bookLoan_library_branchID,bookLoan_CardNo,bookLoan_DateOut,bookLoan_DateDue)
		VALUES
		('1','100' ,'01/03/2015' ,'01/09/2015'),
		('1','100' ,'12/23/2014' ,'12/27/2014'),
		('1','100', '01/01/2015', '01/11/2015'),
		('1','100' ,'01/05/2015','01/12/2015'),
		('1','100','01/07/2015','01/14/2015'),
		('2','101','01/15/2015','01/24/2015'),
		('2','101','01/17/2015','01/25/2015'),
		('2','101','02/02/2014','04/05/2015'),
		('2','101','04/04/2014','04/09/2014'),
		('2','101','06/07/2014','06/18/2014'),
		('1','102' ,'01/03/2015' ,'01/09/2015'),
		('1','102' ,'12/23/2014' ,'12/27/2014'),
		('1','102', '01/01/2015', '01/11/2015'),
		('1','102' ,'01/05/2015','01/12/2015'),
		('1','103','01/07/2015','01/14/2015'),
		('2','103','01/15/2015','01/24/2015'),
		('2','103','01/17/2015','01/25/2015'),
		('2','103','02/02/2014','04/05/2015'),
		('2','103','04/04/2014','04/09/2014'),
		('2','103','06/07/2014','06/18/2014'),
		('3','104' ,'01/03/2015' ,'01/09/2015'),
		('3','104' ,'12/23/2014' ,'12/27/2014'),
		('3','104', '01/01/2015', '01/11/2015'),
		('3','104' ,'01/05/2015','01/12/2015'),
		('3','104','01/07/2015','01/14/2015'),
		('3','104','01/15/2015','01/24/2015'),
		('3','104','01/17/2015','01/25/2015'),
		('3','105','02/02/2014','04/05/2015'),
		('3','105','04/04/2014','04/09/2014'),
		('3','105','06/07/2014','06/18/2014'),
		('1','105' ,'01/03/2015' ,'01/09/2015'),
		('1','105' ,'12/23/2014' ,'12/27/2014'),
		('1','106', '01/01/2015', '01/11/2015'),
		('1','106' ,'01/05/2015','01/12/2015'),
		('1','106','01/07/2015','01/14/2015'),
		('2','106','01/15/2015','01/24/2015'),
		('2','106','01/17/2015','01/25/2015'),
		('2','106','02/02/2014','04/05/2015'),
		('2','101','04/04/2014','04/09/2014'),
		('2','101','06/07/2014','06/18/2014'),
		('1','108' ,'01/03/2015' ,'01/09/2015'),
		('1','107' ,'12/23/2014' ,'12/27/2014'),
		('1','107', '01/01/2015', '01/11/2015'),
		('1','107' ,'01/05/2015','01/12/2015'),
		('1','107','01/07/2015','01/14/2015'),
		('2','107','01/15/2015','01/24/2015'),
		('2','107','01/17/2015','01/25/2015'),
		('2','108','02/02/2014','04/05/2015'),
		('2','108','04/04/2014','04/09/2014'),
		('2','108','06/07/2014','06/18/2014');



END

		
	