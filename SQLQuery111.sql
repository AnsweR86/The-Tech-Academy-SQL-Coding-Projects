use[LibraryInventStatus]
	SELECT Count (Number_of_Copies) AS 'NumberofCopies'
	FROM books,book_Copies,library_branch
	WHERE title ='The Lost Tribe' AND name='Sharpstown'

	SELECT library_branchID,COUNT(Number_of_Copies) AS 'NumerofCopies The Lost Tribe'
	FROM books,book_Copies
	WHERE title='The Lost Tribe'
	GROUP BY library_branchID

	SELECT name
	FROM borrower a1 LEFT JOIN book_Loans a2 ON a2.CardNo = a1.cardNo
	WHERE a2.bookID is NULL

	SELECT a1.Title ,a2.Name, a2.borrower_address
	FROM borrower a2
	INNER JOIN book_Loans a3 ON a3.CardNo=a2.cardNo
	INNER JOIN books a1 ON a1.id=a3.bookID
	WHERE a3.DateDue= CAST(GETDATE() AS DATE) AND
	a3.library_branchID=1;

	SELECT a1.name AS 'Branch Name', COUNT(a2.bookID) AS 'Number of Books Loaned'
	FROM BOOK_LOANS a2
	INNER JOIN library_branch a1 ON a1.id=a2.library_branchID
	GROUP BY a1.name


	SELECT a1.borrower_name AS 'Name', a1.borrower_address AS 'Borrower''s Address', COUNT(a2.bookloan_CardNo) AS 'Number of Books'
	FROM tbl_borrower a1
	INNER JOIN tbl_bookLoan a2 ON a2.bookLoan_CardNo=a1.borrower_cardNo
	GROUP BY a1.borrower_name, a1.borrower_address
	HAVING COUNT(a2.bookloan_CardNo)>5 
	ORDER BY a1.borrower_Name

	--SELECT a1.book_title AS 'Title of Book' , COUNT(*) AS 'Quanity of book'
	--FROM tbl_bookAuthor a2
	--INNER JOIN tbl_bookAuthor a3 ON a3.bookAuthor_authorName=a2.bookAuthor_authorName
	--INNER JOIN tbl_bookCopies a4 ON a4.bookCopies_bookID = a2.bookAuthor_bookID
	--INNER JOIN tbl_book a1 ON a1.book_id = a1.book_id
	--INNER JOIN tbl_library_branch a5 ON a5.branch_id = a4.bookCopies_library_branchID
	--WHERE a2.bookAuthor_authorName='Stephen King' AND a4.bookCopies_library_branchID='2'
	--GROUP BY a1.book_title.
	
SELECT Number_of_Copies,Title,authorName,LIBRARY_BRANCH.Name
FROM BOOKS
FULL OUTER JOIN BOOK_COPIES ON BOOKS.Id=BOOK_COPIES.book
FULL OUTER JOIN LIBRARY_BRANCH on book_copies.library_branchID = library_branchID
INNER JOIN BOOK_AUTHORS a1 ON a1.book = books.Id
AND a1.authorName = 'Stephen King'
AND LIBRARY_BRANCH.Name='central'

select * from 



END
