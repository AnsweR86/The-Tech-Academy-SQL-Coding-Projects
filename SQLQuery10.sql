USE master;
GO
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
		Publisher_address VARCHAR(50)  NULL, Publisher_phone varchar(50) NULL
	);

	
	
		INSERT INTO tbl_Publisher
		 (Publisher_name, Publisher_Address, Publisher_Phone)
		 VALUES
		 ('Hoggart','324 P.O Box..','244-424-4824'),
		 ('Younguni','3422 Ranier Ave...','254-456-4541');


	
	
	
	CREATE TABLE tbl_book(
		book_id INT PRIMARY KEY NOT NULL IDENTITY(10,1),
		book_title VARCHAR(50)   NULL, 
		 --!book_PublisherName VARCHAR (50)  NOT NULL,--
		book_PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_book_Publisher1 FOREIGN KEY REFERENCES tbl_Publisher(Publisher_name)
	);


		INSERT INTO tbl_book   
		(book_title, book_PublisherName)
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
		('Nexus','GrounDwag Inc.'),
		('Bird Box','Houndpaw'),
		('Heart of Darkness','Papervally');

		SELECT *FROM tbl_library_branch;	


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



	CREATE TABLE tbl_bookAuthor(
		bookAuthor_bookID INT PRIMARY KEY NOT NULL IDENTITY (10,1), 
		bookAuthor_authorName VARCHAR (50) NOT NULL, 
		bookAuthor_book INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE);


		INSERT INTO tbl_bookAuthor
		(bookAuthor_book,bookAuthor_authorName)
		VALUES
		('1','Edwardo Gucci'),
		('2','F.Scott Fitzgerald'),
		('3','Harper Lee'),
		('4','E.B White'),
		('5','Joe Heller'),
		('6','Joseph Conrad'),
		('6','James Joyce'),
		('7','Emily Dickinson'),
		('8','Toni Morrison'),
		('9','John Updike'),
		('10','Stephen King');
		
		CREATE TABLE tbl_bookCopies(
		bookCopies_bookID INT PRIMARY KEY NOT NULL IDENTITY (101,1),
		bookCopies_book INT NOT NULL CONSTRAINT fk_book_bookID FOREIGN KEY REFERENCES  tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_library_branchID INT NOT NULL constraint fk_branch FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_Number_of_Copies INT NOT NULL);
		
	
		
		
		
		
		INSERT INTO tbl_bookCopies
		(bookCopies_book,bookCopies_library_branchID,bookCopies_Number_of_Copies)
		VALUES
		
		('11','1','2'),
		('12','1','3'),
		('13','1','4'),
		('14','1','5'),
		('15','1','4'),
		('16','1','3'),
		('17','1','2'),
		('18','1','7'),
		('19','1','2'),
		('20','1','5'),
		('21','2','2'),
		('22','2','3'),
		('23','2','4'),
		('24','2','5'),
		('25','2','4'),
		('26','2','3'),
		('27','2','2'),
		('28','2','7'),
		('29','2','2'),
		('30','2','5'),
		('31','3','2'),
		('32','3','3'),
		('33','3','4'),
		('34','3','5'),
		('35','3','4'),
		('36','3','3'),
		('37','3','2'),
		('38','3','7'),
		('39','3','2'),
		('40','3','5'),
		('41','4','2'),
		('42','4','3'),
		('43','4','4'),
		('44','4','5'),
		('45','4','4'),
		('46','4','3'),
		('47','4','2'),
		('48','4','7'),
		('49','4','2'),
		('50','4','5'),
		('51','2','2'),
		('52','2','2'),
		('53','1','2'),
		('54','1','2'),
		('55','1','3'),
		('56','1','4'),
		('57','1','5'),
		('58','1','4'),
		('59','1','3'),
		('60','1','2'),
		('61','1','7'),
		('62','1','2'),
		('63','1','5'),
		('64','2','2'),
		('65','2','3'),
		('66','2','4'),
		('67','2','5'),
		('68','2','4'),
		('69','2','3'),
		('70','2','2'),
		('71','2','7'),
		('72','2','2');
		

	CREATE TABLE tbl_bookLoan(
		bookLoan_bookID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
		bookLoan_library_branchID INT NOT NULL CONSTRAINT fk_library_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_CardNo INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_DateOut DATE  NULL, bookLoan_DateDue DATE  NULL);
	
	
	
	
	select * from tbl_bookcopies;
	
	
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

		
	