CREATE FUNCTION dbo.UDF_FormatString
(
	@String AS    VARCHAR(MAX), 
	@Option AS    TINYINT      = 2, 
	@Spaces AS    BIT          = 1, 
	@Accent AS    BIT          = 1
)
RETURNS VARCHAR(MAX)
/*	
	User Defined Function that formats a string according to the received parameters.

	Parameters	:
	@String		: String to format
	@Option		: 0 = Only numbers, 1 = Only letters, 2 = Numbers and letters
	@Spaces		: 0 = Without keeping spaces, 1 = keep spaces
	@Accent		: 0 = No accents, 1 = With accents (á,é,í,ó,ú,ñ)

	Execution:
	SELECT dbo.UDF_FormatString('t1H2i3S i4S a5 t6E7s8T',0,1,0)
	SELECT dbo.UDF_FormatString('t1H2i3S i4S a5 t6E7s8T',1,1,0)

	AUTHOR: Fernando Casas Osorio
*/
AS
BEGIN
	DECLARE 
	@Alphabet AS    VARCHAR(250) = NULL

	SELECT @Alphabet = CASE @Spaces
							WHEN 0
								THEN CASE @Option
										WHEN 0
											THEN '%[^0-9]%'
										WHEN 1
											THEN '%[^a-zA-Z]%'
										WHEN 2
											THEN '%[^a-zA-Z0-9]%'
									END
							ELSE CASE @Option
									WHEN 0
										THEN '%[^0-9 ]%'
									WHEN 1
										THEN '%[^a-zA-Z ]%'
									WHEN 2
										THEN '%[^a-zA-Z0-9 ]%'
								END
						END
	IF @Accent = 0
	BEGIN
		SELECT @String = @String COLLATE SQL_Latin1_General_CP1253_CI_AI
	END

	WHILE PATINDEX(@Alphabet, @String) > 0
			OR CHARINDEX('  ', @String) > 0
	BEGIN
		SET @String = LTRIM(RTRIM(REPLACE(REPLACE(@String, SUBSTRING(@String, PATINDEX(@Alphabet, @String), 1), ''), '  ', ' ')))
	END

	RETURN @String
END