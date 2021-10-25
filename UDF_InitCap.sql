CREATE FUNCTION dbo.UDF_InitCap
(
	@String    VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS

/*
	User Defined Function that modifies the first letter of each word to uppercase.

	Parameters	:
	@String		: String to which the first letter of each word is modified to uppercase

	Execution:
	SELECT dbo.UDF_InitCap('tHiS iS a tEsT')

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	DECLARE 
	@I         INT, 
	@Space     CHAR(1)      = ' '

	/*
	If you want to remove double space in the string, uncomment the following statement
	*/
	--	SELECT @String = TRIM(REPLACE(REPLACE(REPLACE(@String, '  ', ' '), '  ', ''), '  ', ' '))

	IF COALESCE(@String, '') = ''
		OR @String = ' '
	BEGIN
		SELECT @String = ''
	END
		ELSE
	BEGIN
		SELECT @String = STUFF(LOWER(@String), 1, 1, UPPER(LEFT(@String, 1)))
		SELECT @I = CHARINDEX(@Space, @String, 1)

		WHILE @I > 0
		BEGIN
			SELECT @I = @I + 1
			SELECT @String = STUFF(@String, @I, 1, UPPER(SUBSTRING(@String, @I, 1)))
			SELECT @I = CHARINDEX(@Space, @String, @I)
		END
	END
	RETURN @String
END