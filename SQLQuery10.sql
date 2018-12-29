


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
		('The Great Gatsby','Udnt'),
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
		('756','Edwardo Marriotted','343-434-3433','343 smith st..'),
		('433','Scott Fizgerd','434-434-7676','453 highsuit pl..'),
		('434','Harper Leweis','432-766-7643','9000 45th ave..'),
		('345','Bob White','434-453-9066','850 P.O Box..'),
		('434','Joegl Hellir','434-879-6565','4456 mariotte st.'),
		('543','Jose Cond','435-464-5466','4353 potter st..'),
		('806','James Joy','546-656-5454','777 goose ave..'),
		('545','Emily Dicki','343-454-5454','546 birsing st..'),
		('656','Tony Morr','335-657-5665','546 smitter ave..'),
		('546','Jon Uphike','454-545-5454','545 goash ave..');



	CREATE TABLE tbl_bookAuthor(
		bookAuthor_bookID INT PRIMARY KEY NOT NULL IDENTITY (101,1),
		bookAuthor_authorName VARCHAR (50) NOT NULL,
		bookAuthor_book INT NOT NULL CONSTRAINT fk_bookID FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE);


		INSERT INTO tbl_bookAuthor
		(bookAuthor_authorName)
		VALUES
		('Edward Marriott'),
		('F.Scott Fitzgerald'),
		('Harper Lee'),
		('E.B White'),
		('Joe Heller'),
		('Joseph Conrad'),
		('James Joyce'),
		('Emily Dickinson'),
		('Toni Morrison'),
		('John Updike'),
		('Stephen King'),
		('Stephen King');

	CREATE TABLE tbl_bookCopies(
		bookCopies_bookID INT PRIMARY KEY NOT NULL IDENTITY (101,1),
		bookCopies_book INT NOT NULL CONSTRAINT fk_bookName FOREIGN KEY  REFERENCES  tbl_book(book_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_library_branch INT NOT NULL CONSTRAINT fk_branchIdentification FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_Number_of_Copies INT NOT NULL
		);

			
		INSERT INTO tbl_bookCopies
		(bookCopies_bookID,bookCopies_library_branch,bookCopies_Number_of_Copies)
		VALUES
		('10','2','2'),
		('9','1','3'),
		('8','1','4'),
		('7','2','5'),
		('6','2','4'),
		('5','2','3'),
		('4','3','2'),
		('3','4','7'),
		('2','3','2'),
		('1','3','5');

	CREATE TABLE tbl_bookLoan(
		bookLoan_bookID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
		bookLoan_library_branch INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_borrower INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_DateOut DATE  NULL, bookLoan_DateDue DATE  NULL);
	 
		 
		
	
		INSERT INTO tbl_bookLoan
		(bookLoan_borrower, bookLoan_library_branch,bookLoan_DateOut,bookLoan_DateDue)
		VALUES
		('Harper Dew', '1' ,'01/03/2015' ,'01/09/2015'),
		('Juinor White ' ,'2' ,'12/23/2014' ,'12/27/2014'),
		('Hitler Weet', '3', '01/01/2015', '01/11/2015'),
		('Jhon Conrad', '4' ,'01/05/2015','01/12/2015'),
		('Joy Ride','5','01/07/2015','01/14/2015'),
		('Yoloo Park','6','01/15/2015','01/24/2015'),
		('Nink Impossible','7','01/17/2015','01/25/2015'),
		('Sunset Uprising','8','02/02/2014','04/05/2015');

		
	END

