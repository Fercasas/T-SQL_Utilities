CREATE OR ALTER PROCEDURE [dbo].[USP_PrintR]
	@IdProc    INT = NULL
AS
/*
	Store Procedure that print rows afected "@@RowCount" in the last statement.
	This SP can be used within scripts and other SPs for debugging.

	Parameters	:
	@IdProc		: @@ProcId of the process from which it is executed.

	Execution:
	SET NOCOUNT ON 
	SELECT TOP 10 * FROM dbo.Student
	EXEC dbo.USP_PrintR @@ProcId

	SET NOCOUNT ON 
	SELECT TOP 10 * FROM dbo.Student
	EXEC dbo.USP_PrintR 

	CREATE OR ALTER PROCEDURE USP_TEST
	AS
	BEGIN
		SET NOCOUNT ON 
		SELECT TOP 10 Id, FirstName, LastName
		FROM dbo.Student

		EXEC dbo.USP_PrintR @@ProcId
	END

	EXEC dbo.USP_TEST

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	DECLARE 
	@NameProc	VARCHAR(250) = TRIM(' .' FROM CONCAT(OBJECT_SCHEMA_NAME(@IdProc), '.', OBJECT_NAME(@IdProc))),
	@Message    VARCHAR(MAX) = 'Rows affected ' + CAST(@@RowCount AS VARCHAR),
	@Result		VARCHAR(MAX)

	SET @Result = CONCAT(REPLACE('{' + CONVERT(VARCHAR(50), GETDATE(), 5) + ' ' + CONVERT(VARCHAR(50), GETDATE(), 108) + '}' + '{' + @NameProc + '}',
	'{}', ''), CHAR(9), '>>> ', @Message)

	RAISERROR(@Result, 10, 1) WITH NOWAIT
END
