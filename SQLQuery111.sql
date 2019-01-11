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

CREATE PROC[dbo].[LibraryInventory]
 
AS
BEGIN
	
--COUNTING 'THE LOST TRIBE' IN SHARPSTOWN	
SELECT Count (bookCopies_Number_of_Copies) AS 'Number of book called ''THE LOST TRIBE'' in Sharpstown'
FROM tbl_book,tbl_bookCopies,tbl_library_branch
WHERE book_title ='The Lost Tribe' AND branch_name='Sharpstown'

--COUNTING 'THE LOST TRIBE' IN EVERY BRANCH
SELECT bookCopies_library_branchID AS 'Branchs of Library',COUNT (bookCopies_Number_of_Copies) AS 'Quanity of book called ''The Lost Tribe''in each Branch'
FROM tbl_book,tbl_bookCopies
WHERE book_title='The Lost Tribe'
GROUP BY bookCopies_library_branchID 

--Clints with Checkout books
SELECT borrower_name AS 'Names of Current active clints'
FROM tbl_borrower a1 LEFT JOIN tbl_bookLoan a2 ON a2.bookLoan_CardNo = a1.borrower_cardNo
WHERE a2.bookLoan_bookID is NULL

--DUEDATE CLINTS info.
SELECT a1.book_title AS'Name of Book Due' ,a2.borrower_Name , a2.borrower_address
FROM tbl_borrower a2
INNER JOIN tbl_bookLoan a3 ON a3.bookLoan_CardNo=a2.borrower_cardNo
INNER JOIN tbl_book a1 ON a1.book_id=a3.bookLoan_bookID
WHERE a3.bookLoan_DateDue= CAST(GETDATE() AS DATE) AND
a3.bookLoan_library_branchID=1;

--Book checkout for every branch
SELECT a1.branch_name AS 'Branch Name', COUNT(a2.bookLoan_bookID) AS 'Number of Books Loaned'
FROM tbl_bookLoan a2
INNER JOIN tbl_library_branch a1 ON a1.branch_id=a2.bookLoan_library_branchID
GROUP BY a1.branch_name


--CLINTS with 5book or more
SELECT a1.borrower_name AS 'Name', a1.borrower_address AS 'Borrower''s Address', COUNT(a2.bookloan_CardNo) AS 'Number of Books'
FROM tbl_borrower a1
INNER JOIN tbl_bookLoan a2 ON a2.bookLoan_CardNo=a1.borrower_cardNo
GROUP BY a1.borrower_name, a1.borrower_address
HAVING COUNT(a2.bookloan_CardNo)>5 
ORDER BY a1.borrower_Name

--book by stephen King in Central
SELECT a1.book_title AS 'Title of Book by Stepeh King', COUNT(*) AS 'Quanity of book'
FROM tbl_bookAuthor a2 INNER JOIN tbl_bookAuthor a3 ON a3.bookAuthor_authorName=a2.bookAuthor_authorName
INNER JOIN tbl_bookCopies a4 ON a4.bookCopies_bookID = a2.bookAuthor_bookID
INNER JOIN tbl_book a1 ON a1.book_id = a1.book_id
INNER JOIN tbl_library_branch a5 ON a5.branch_id = a4.bookCopies_library_branchID
WHERE a2.bookAuthor_authorName='Stephen King' AND a4.bookCopies_library_branchID='2' or a5.branch_name='Central'
GROUP BY a1.book_title



END
