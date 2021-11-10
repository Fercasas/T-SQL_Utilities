CREATE OR ALTER PROCEDURE [dbo].[USP_PrintM] 
	@Message    VARCHAR(1000), 
	@IdProc     INT           = NULL, 
	@Debug      BIT           = 1
AS
/*
	Store Procedure that print the received message by parameter.
	This SP can be used within scripts and other SPs for debugging.

	Parameters	:
	@Message	: Message (text) to print.
	@IdProc		: @@ProcId of the process from which it is executed.
	@Debug		: Show message if @Debug is 1.

	Execution:
	EXEC dbo.USP_PrintM 'Hello world', @@ProcId, 1

	CREATE OR ALTER PROCEDURE USP_TEST
	AS
	BEGIN
		SET NOCOUNT ON 

		EXEC dbo.USP_PrintM 'Start of the procedure', @@ProcId

		SELECT TOP 10 Id, FirstName, LastName
		FROM dbo.Student
	END

	EXEC dbo.USP_TEST	

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	SET NOCOUNT ON
	DECLARE 
	@NameProc	VARCHAR(250) = TRIM(' .' FROM CONCAT(OBJECT_SCHEMA_NAME(@IdProc), '.', OBJECT_NAME(@IdProc))),
	@Result		VARCHAR(MAX)

	IF @Debug = 0 RETURN 0

	SET @Result = CONCAT(
		REPLACE('{' + CONVERT(VARCHAR(50), GETDATE(), 5) + ' ' + CONVERT(VARCHAR(50), GETDATE(), 108) + '}' + '{' + @NameProc + '}', '{}', ''),
		CHAR(9), 
		'>>> ', 
		@Message)

	RAISERROR(@Result, 10, 1) WITH NOWAIT
END
