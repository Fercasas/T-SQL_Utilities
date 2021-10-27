CREATE PROCEDURE dbo.SP_SQL2HTML
(
	@QuerySQL    VARCHAR(MAX), 
	@HTML        VARCHAR(MAX) OUTPUT
)
AS
/*
	Store Procedure that generate HTML table from SQL query result.
	NOTE: With the variable @MaxRows the number of rows is controlled but I recommend that they are not too many because the result can be truncated.

	Parameters	:
	@QuerySQL	: Valid SQL query whose result will be transformed into an HTML table
	@HTML		: Output parameter with HTML code	

	Execution:
	DECLARE 
	@HTML    VARCHAR(MAX)

	EXEC dbo.SP_Sql2HTML 'SELECT Id AS CODE, Name FROM dbo.Student', 
						  @HTML = @HTML OUTPUT
	SELECT @HTML AS HTML

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	SET NOCOUNT ON

	DECLARE 
	@Message         VARCHAR(MAX)  = NULL, 
	@ErrorMessage    VARCHAR(MAX), 
	@FormatHTML      VARCHAR(MAX)  = '', 
	@ColumnsStr      VARCHAR(MAX)  = '', 
	@Columns         VARCHAR(MAX)  = NULL, 
	@AfterFrom       VARCHAR(MAX)  = '', 
	@StrSQL          NVARCHAR(MAX), 
	@FromPosition    INT, 
	@Alias           VARCHAR(MAX)  = '', 
	@StrXML          XML, 
	@Top             VARCHAR(MAX)  = NULL, 
	@Distinct        VARCHAR(MAX)  = NULL, 
	@MaxRows         INT           = 50

	BEGIN TRY
		SELECT @Message = '>>> Validations.'
		PRINT @Message

		IF COALESCE(@QuerySQL, '') = ''
		   OR CHARINDEX(' FROM ', @QuerySQL) = 0
		BEGIN
			SELECT @ErrorMessage = 'SQL statement error.'
			RAISERROR(@ErrorMessage, 16, 1)
		END

		SELECT @Message = '>>> Create Temp Table with sys.dm_exec_describe_first_result_set.'
		PRINT @Message

		DROP TABLE IF EXISTS #TempFirst_result_set
		SELECT *
		INTO #TempFirst_result_set
		FROM sys.dm_exec_describe_first_result_set (@QuerySQL, NULL, 0)

		IF EXISTS ( SELECT 1
					FROM #TempFirst_result_set
					WHERE error_message IS NOT NULL
						  AND error_number IS NOT NULL
						  AND error_severity IS NOT NULL
						  AND error_state IS NOT NULL
						  AND error_type IS NOT NULL
						  AND error_type_desc IS NOT NULL ) 
		BEGIN
			SELECT @ErrorMessage = error_message
			FROM #TempFirst_result_set
			WHERE column_ordinal = 0

			SELECT @ErrorMessage = 'SQL statement error.'
			RAISERROR(@ErrorMessage, 16, 1)
		END

		SELECT @Message = '>>> Set format for the HTML table'
		PRINT @Message

		SELECT @FormatHTML =
		'<!DOCTYPE html>
		<html> 
		<head> 
		<style type="text/css"> 
		table {
			border-collapse: collapse;
			width: 70%;
			} 
		th {
			text-align: center;
			padding: 6px; 
			border: 0.5px solid black;
			background-color: #D5D8DC
			} 
		td {
			text-align: left;
			padding: 4px; 
			border: 0.5px solid black;
			} 
		tr:nth-child(even) {
			background-color: #f2f2f2;
			} 
		</style> 
		</head> 
		<body>'

		SELECT @Message = '>>> Clean Tab, line feed, carriage return and double space.'
		PRINT @Message

		SELECT @QuerySQL = REPLACE(replace(replace(@QuerySQL, CHAR(9), ' '), CHAR(10), ' '), CHAR(13), ' ')

		WHILE CHARINDEX('  ', @QuerySQL) > 0
		BEGIN
			SELECT @QuerySQL = replace(@QuerySQL, '  ', ' ')
		END

		SELECT @ColumnsStr = @QuerySQL

		SELECT @Message = '>>> Validate if TOP exists in the statement.'
		PRINT @Message

		IF CHARINDEX(' TOP ', @QuerySQL) > 0
		BEGIN
			SELECT @Top = TRIM(SUBSTRING(@QuerySQL, CHARINDEX(' TOP ', @QuerySQL), CHARINDEX(' ', @QuerySQL, CHARINDEX(' TOP ', @QuerySQL) + 5) -
			CHARINDEX(' TOP ', @QuerySQL)))

			IF CAST(REPLACE(@Top, 'TOP', '') AS INT) > @MaxRows
			BEGIN
				SELECT @Top = CONCAT('TOP ', CAST(@MaxRows AS VARCHAR))
			END

			SELECT @ColumnsStr = STUFF(@ColumnsStr, CHARINDEX(' TOP ', @ColumnsStr), CHARINDEX(' ', @ColumnsStr, CHARINDEX(' TOP ', @ColumnsStr) + 5)
			- CHARINDEX(' TOP ', @ColumnsStr), ' ')
		END

		SELECT @Message = '>>> Validate if DISTINCT exists in the statement.'
		PRINT @Message

		IF CHARINDEX(' DISTINCT ', @ColumnsStr) > 0
		BEGIN
			SELECT @Distinct = TRIM(SUBSTRING(@ColumnsStr, CHARINDEX(' DISTINCT ', @ColumnsStr), CHARINDEX(' ', @ColumnsStr, CHARINDEX(' DISTINCT ',
			@ColumnsStr) + 10) - CHARINDEX(' DISTINCT ', @ColumnsStr)))

			SELECT @ColumnsStr = STUFF(@ColumnsStr, CHARINDEX(' DISTINCT ', @ColumnsStr), CHARINDEX(' ', @ColumnsStr, CHARINDEX(' DISTINCT ',
			@ColumnsStr) + 10) - CHARINDEX(' DISTINCT ', @ColumnsStr), ' ')
		END

		SELECT @Message = '>>> Extract columns from statement SELECT.'
		PRINT @Message

		SELECT @Columns = COALESCE(@Columns + ', ', '') + 'COALESCE(' + Field + ',' + CHAR(39) + CHAR(39) + ')'
		FROM ( SELECT CASE
						  WHEN CHARINDEX(' ', TRIM(value)) > 0
							  THEN LEFT(TRIM(value), CHARINDEX(' ', TRIM(value)))
						  ELSE TRIM(value)
					  END AS Field
			   FROM STRING_SPLIT(REPLACE(LEFT(@ColumnsStr, CHARINDEX(' FROM ', @ColumnsStr)), 'SELECT', ''), ',') ) AS T1

		SET @Columns = Replace(@Columns, '),', ') as TD,') + ' as TD'

		SELECT @Message = '>>> Extract alias from statement SELECT.'
		PRINT @Message

		SELECT @Alias+=CHAR(39) + NAME + CHAR(39) + ' AS TH,'
		FROM #TempFirst_result_set

		SET @Alias = '(SELECT ' + LEFT(@Alias, LEN(@Alias) - 1) + ' FOR XML RAW(' + CHAR(39) + 'tr' + +CHAR(39) + '), ELEMENTS, TYPE) AS ' + CHAR(39)
		+ 'thead' + CHAR(39) + ','

		SELECT @Message = '>>> Extract @FromPosition.'
		PRINT @Message

		SET @FromPosition = CHARINDEX('FROM', @QuerySQL, 1)
		SET @AfterFrom = SUBSTRING(@QuerySQL, @FromPosition, LEN(@QuerySQL) - @FromPosition + 1)

		IF @Top IS NOT NULL
		BEGIN
			SELECT @Columns = concat(@Top, ' ', @Columns)
		END

		IF @Distinct IS NOT NULL
		BEGIN
			SELECT @Distinct = concat(@Distinct, ' ', @Columns)
		END

		SELECT @Message = '>>> Final @StrSQL.'
		PRINT @Message

		SET @StrSQL = CONCAT('SELECT ', @Alias, '(SELECT ', @Columns, ' ', @AfterFrom, ' FOR XML RAW (''TR''), ELEMENTS, TYPE) AS ''TBODY''',
		' FOR XML PATH (''''), ROOT (''TABLE'')')

		SET @StrSQL = 'SELECT @StrXML = (' + @StrSQL + ')'

		SELECT @Message = '>>> Execute @StrSQL.'
		PRINT @Message

		EXECUTE sp_executesql @StrSQL, 
							  N'@StrXML xml OUTPUT', 
							  @StrXML = @StrXML OUTPUT

		SELECT @Message = '>>> Complete @HTML.'
		PRINT @Message
		SELECT @HTML = CONCAT(@FormatHTML, REPLACE(CAST(@StrXML AS VARCHAR(MAX)), '<TABLE>', '<TABLE align="center">'), '</body> </html>')
	END TRY
	BEGIN CATCH
		SET @ErrorMessage = '-> ERROR dbo.SP_SQL2HTML [' + @Message + ']: ' + COALESCE(ERROR_MESSAGE(), '')
		RAISERROR(@ErrorMessage, 16, 1)
	END CATCH
END
