
/****** Object:  StoredProcedure [dbo].[getNoneCkeckedoutBorrowers]    Script Date: 12/24/2018 8:55:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[getNoneCkeckedoutBorrowers]
 

AS
BEGIN


SELECT
	name From  tbl_borrower b
	WHERE  borrower_cardNo NOT IN (SELECT borrower_cardNo FROM bookLoan);

END
 


/****** Object:  StoredProcedure [dbo].[getDueDateBookInfo]    Script Date: 12/24/2018 8:54:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER PROCEDURE [dbo].[getDueDateBookInfo]

AS
BEGIN


SELECT  B.Title, R.Name,R.Address

	 
FROM BOOK B, BORROWER R, BOOK_LOANS BL, LIBRARY_BRANCH LB
WHERE lb.BranchName='Sharpstown' AND LB.BranchId=BL.BranchId AND BL.DueDate='
today
' AND BL.CardNo=R.CardNo AND BL.BookId=B.BookId;
END
 





/****** Object:  StoredProcedure [dbo].[getNumberCopies]    Script Date: 12/24/2018 8:56:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[getNumberCopies] 
 
@bookName VARCHAR(50)  
AS
BEGIN


SELECT
a1.book_title, a2.branch_name, a3.bookCopies_bookID
FROM tbl_book  a1
	INNER JOIN tbl_library_branch a2 ON a2. branch_name=a1. book_title
	INNER JOIN tbl_bookCopies a3 ON a3.bookID= a1.book_title 
	WHERE a1.book_title= @bookName
	;

END

/****** Object:  StoredProcedure [dbo].[getNumberCopiesbybranch]    Script Date: 12/24/2018 8:57:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[getNumberCopiesbybranch]
 
@branchName VARCHAR(50)  
AS
BEGIN


SELECT
a1.branch_name, a2.book_id, a3.bookCopies
FROM tbl_library_branch  a1
	INNER JOIN tbl_book a2 ON a2. book_title=a1.branch_name
	INNER JOIN tbl_bookCopies a3 ON a3.bookID= a1.branch_name
	WHERE a1.branch_name= @branchName
	;

END
 
/****** Object:  StoredProcedure [dbo].[Loanoutbook5ormoreINFO]    Script Date: 12/24/2018 8:58:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ALTER PROCEDURE [dbo].[Loanoutbook5ormoreINFO]

AS
BEGIN


SELECT B.Name, B.Address, COUNT(*)
FROM	tbl_borrower B, bookLoan L
WHERE B.cardNo=L.CardNo
GROUP BY B.borrower_cardNo,B.borrower_address,B.borrower_name
HAVING COUNT(*)>5;

END



/****** Object:  StoredProcedure [dbo].[LoanoutBookeachBranch]    Script Date: 12/24/2018 8:58:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LoanoutBookeachBranch]

AS
BEGIN


SELECT L.branch_name, COUNT(*)
FROM tbl_library_branch L, bookLoan BL
WHERE BL.branchID=L.branch_id
GROUP BY L.branch_name;
END
 
 /****** Object:  StoredProcedure [dbo].[uspTryCatchTests]    Script Date: 12/24/2018 8:59:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspTryCatchTests]
AS
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    SELECT ERROR_NUMBER() AS ErrorNumber
     ,ERROR_SEVERITY() AS ErrorSeverity
     ,ERROR_STATE() AS ErrorState
     ,ERROR_PROCEDURE() AS ErrorProcedure
     ,ERROR_LINE() AS ErrorLine
     ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH
