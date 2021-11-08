CREATE FUNCTION dbo.UDF_Rem2Spaces
(
	@String    VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
/*
	User Defined Function that remove double spaces into @String.

	Parameters	:
	@String		: String to which remove double spaces 

	Execution:
	SELECT dbo.UDF_RemovUDF_Rem2SpaceseDubleSpace('This    is   a test')

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	SELECT @String = CASE
							WHEN CHARINDEX('  ', @String) > 0
								THEN dbo.UDF_Rem2Spaces (replace(@String, '  ', ' '))
							ELSE @String
						END
	RETURN @String
END