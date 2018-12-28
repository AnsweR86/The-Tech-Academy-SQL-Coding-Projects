


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
		('Sharpstown','NULL'),
		('Central','');
		('Up-town',''),
		('Western','');



	
	CREATE TABLE tbl_Publisher(
		Publisher_name VARCHAR(50) PRIMARY KEY NOT NULL ,
		Publisher_address VARCHAR(50)  NULL, Publisher_phone INT NULL
	);


		INSERT INTO tbl_Publisher
		 (PublisherName, Publisher_Address, Publisher_Phone)
		 VALUES
		 ('Hoggart','324 P.O Box..','244-424-4824'),
		 ('Younguni','null','null');


	
	
	
	CREATE TABLE tbl_book(
		book_id INT PRIMARY KEY NOT NULL IDENTITY(10,1),
		book_title VARCHAR(50)   NULL, 
		book_PublisherName VARCHAR (50)  NOT NULL,
		book_Publisher VARCHAR(50) NULL CONSTRAINT fk_book_Publisher1 FOREIGN KEY REFERENCES tbl_Publisher(Publisher_name)
	);


		INSERT INTO tbl_book   
		(book_title, book_Publisher)
		VALUES 
		('The Lost Tribe',''),
		('The Great Gatsby',''),
		('To Kill a Mockingbird',''),
		('Beloved',''),
		('Lord of Filies',''),
		('Color Purple',''),
		('Break the Dawn',''),
		('Delta Elite',''),
		('The Age Of Tear',''),
		('The Lord of Ring',''),
		('The Chicken Noodle Soup',''),
		('GooseBumps',''),
		('Room with View',''),
		('Fatal',''),
		('On the Road',''),
		('Catching in the rye',''),
		('Gone',''),
		('Hole',''),
		('Cosmos',''),
		('Heart of Darkness','');



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
		bookCopies_book INT NOT NULL CONSTRAINT fk_bookName FOREIGN KEY  REFERENCES  tbl_book(bookID)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_library_branch INT NOT NULL CONSTRAINT fk_branchIdentification FOREIGN KEY REFERENCES tbl_library_branch(branchID)ON UPDATE CASCADE ON DELETE CASCADE,
		bookCopies_Number_of_Copies INT NOT NULL
		);

			
		INSERT INTO tbl_bookCopies
		(bookCopies_book,bookCopies_library_branch)
		VALUES
		('Lord of filies','2'),
		('Happy days','2'),
		('Harper Dew','2'),
		('White Cat','2'),
		('Hitler','2'),
		('The Conrad','2'),
		('Joy Ride','3'),
		('YOLO','4'),
		('Nver too late','5'),
		('Uprising','3');

	CREATE TABLE tbl_bookLoan(
		bookLoan_bookID INT PRIMARY KEY NOT NULL IDENTITY (20,1),
		bookLoan_library_branch INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_borrower INT NOT NULL CONSTRAINT fk_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo)ON UPDATE CASCADE ON DELETE CASCADE,
		bookLoan_DateOut DATE  NULL, bookLoan_DateDue DATE  NULL);
	 
		 
		
	
		INSERT INTO tbl_bookLoan
		(bookLoan_BranchID, bookLoan_cardNo,bookLoan_DateOut,bookLoan_DateDue)
		('Harper Dew', '275' ,'' ,''),
		('White Cat' ,'257' ,'' ,''),
		('Hitler', '256', '', ''),
		('The Conrad', '256' ,'',''),
		('Joy Ride','36','',''),
		('YOLO','46','',''),
		('Nver too late','5','',''),
		('Uprising','3','');

		
	END

