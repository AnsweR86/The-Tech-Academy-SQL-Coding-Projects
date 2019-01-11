-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jino
-- Create date: Today
-- Description:	QuanityofBookinSharpstown
-- =============================================
CREATE PROCEDURE bookTHELOSTTRIBEinsharpstown 
	-- Add the parameters for the stored procedure here
	@Lastname nvarchar(50) = NULL, 
	@FirstName nvarchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Count (bookCopies_Number_of_Copies) AS 'NumberofCopies'
	FROM tbl_book,tbl_bookCopies,tbl_library_branch
	WHERE book_title ='The Lost Tribe' AND branch_name='Sharpstown'

	SELECT bookCopies_library_branchID,COUNT (bookCopies_Number_of_Copies) AS 'NumerofCopies The Lost Tribe'
	FROM tbl_book,tbl_bookCopies
	WHERE book_title='The Lost Tribe'
	GROUP BY bookCopies_library_branchID

	SELECT borrower_name AS 'Name'
	FROM tbl_borrower a1 LEFT JOIN tbl_bookLoan a2 ON a2.bookLoan_CardNo = a1.borrower_cardNo
	WHERE a2.bookLoan_bookID is NULL

	SELECT a1.book_title, a2.borrower_Name, a2.borrower_address
	FROM tbl_borrower a2
	INNER JOIN tbl_bookLoan a3 ON a3.bookLoan_CardNo=a2.borrower_cardNo
	INNER JOIN tbl_book a1 ON a1.book_id=a3.bookLoan_bookID
	WHERE a3.bookLoan_DateDue= CAST(GETDATE() AS DATE) AND
	a3.bookLoan_library_branchID=1;

	SELECT a1.branch_name AS 'Branch Name', COUNT(a2.bookLoan_bookID) AS 'Number of Books Loaned'
	FROM tbl_bookLoan a2
	INNER JOIN tbl_library_branch a1 ON a1.branch_id=a2.bookLoan_library_branchID
	GROUP BY a1.branch_name


	SELECT a1.borrower_name AS 'Name', a1.borrower_address AS 'Borrower''s Address', COUNT(a2.bookloan_CardNo) AS 'Number of Books'
	FROM tbl_borrower a1
	INNER JOIN tbl_bookLoan a2 ON a2.bookLoan_CardNo=a1.borrower_cardNo
	GROUP BY a1.borrower_name, a1.borrower_address
	HAVING COUNT(a2.bookloan_CardNo)>5 
	ORDER BY a1.borrower_Name

	SELECT a1.book_title AS 'Title of Book' , COUNT(*) AS 'Quanity of book'
	FROM tbl_bookAuthor a2 INNER JOIN tbl_bookAuthor a3 ON a3.bookAuthor_authorName=a2.bookAuthor_authorName
	INNER JOIN tbl_bookCopies a4 ON a4.bookCopies_bookID = a2.bookAuthor_bookID
	INNER JOIN tbl_book a1 ON a1.book_id = a1.book_id
	INNER JOIN tbl_library_branch a5 ON a5.branch_id = a4.bookCopies_library_branchID
	WHERE a2.bookAuthor_authorName='Stephen King' AND a4.bookCopies_library_branchID='2'
	GROUP BY a1.book_title
	




END
