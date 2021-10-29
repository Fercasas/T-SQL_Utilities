--SCRIPT START

GO

PRINT '>>>	CREATE OR ALTER PROCEDURE dbo.USP_XXXXXX'

GO

CREATE OR ALTER PROCEDURE dbo.USP_XXXXXX 
	--Parameters
	@Debug    BIT = 0
AS
/*
	Store Procedure that .....

	Parameters	:
	@Debug		: Print or not messages.


	Execution:


	AUTHOR: 
*/
BEGIN
	SET NOCOUNT ON
	DECLARE 
	@Message         VARCHAR(MAX) = NULL, 
	@ErrorMessage    VARCHAR(MAX)

	BEGIN TRY
		SET @Message = '--> Begin dbo.USP_XXXXXX'
		IF @Debug = 1 PRINT @Message

	END TRY
	BEGIN CATCH
		SET @ErrorMessage = 'ERROR dbo.USP_XXXXXX [' + COALESCE(@Message,'') + ']:' + COALESCE(ERROR_MESSAGE(), '')
		RAISERROR(@ErrorMessage, 16, 1)
	END CATCH
END

GO
--END OF SCRIPT