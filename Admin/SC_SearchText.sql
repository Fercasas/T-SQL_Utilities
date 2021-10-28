/*
	Script for search text within sql statements in stored procedures, views, triggers.

	Parameters:
	@SearchedText	: Variable that contains the text to search.

	AUTHOR: Fernando Casas Osorio
*/

SET NOCOUNT ON

DECLARE 
@Message AS         VARCHAR(MAX) = NULL, 
@SearchedText AS    VARCHAR(MAX) = NULL

/*---------------Searched Text Here---------------*/
SET @SearchedText = 'html'
/*------------------------------------------------*/

IF COALESCE(@SearchedText,'') = ''
BEGIN
	SET @Message = 'No text to search was specified in @SearchedText'
	PRINT @Message
END
	ELSE
BEGIN
	SELECT @SearchedText AS           'Searched Text'
		 , DB_NAME() AS               DatabaseName
		 , SC.NAME + '.' + OB.name AS ObjectName
		 , OB.type_desc AS            ObjectType
		 , OB.modify_date AS          ModifyDate
	FROM sys.syscomments AS CO
	INNER JOIN sys.objects AS OB
		 ON CO.id = OB.object_id
	INNER JOIN sys.schemas AS SC
		 ON OB.schema_id = SC.schema_id
	WHERE text LIKE '%' + @SearchedText + '%'
	GROUP BY SC.NAME + '.' + OB.name
		   , OB.type_desc
		   , OB.modify_date
	ORDER BY SC.NAME + '.' + OB.name
END
