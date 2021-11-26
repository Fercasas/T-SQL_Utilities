CREATE FUNCTION dbo.UDF_IsValidDate
(
	@Date    INT
)
RETURNS BIT
AS
/*
	User Defined Function that validate a date received as an integer, returns 1 if it is a valid date or 0 if it is invalid
	Configured to validate dates from the year 1900

	Parameters	: 
	@Date		: Date (integer) received to validate

	Execution:
	SELECT dbo.UDF_IsValidDate(2020101)
	SELECT dbo.UDF_IsValidDate(20200230)
	SELECT dbo.UDF_IsValidDate(20201031)

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	DECLARE 
	@Year      INT, 
	@Month     TINYINT, 
	@Day       TINYINT, 
	@Until     TINYINT = 30, 
	@IsLeap    BIT     = 0

	IF @Date < 19000101
	BEGIN
		RETURN 0
	END

	SELECT @Year = LEFT(@Date, 4)
	SELECT @Month = SUBSTRING(CAST(@Date AS VARCHAR), 5, 2)
	SELECT @Day = SUBSTRING(CAST(@Date AS VARCHAR), 7, 2)

	--Initial validations
	IF LEN(@Date) <> 8
	   OR @Year < 1900
	   OR @Month < 1
	   OR @Month > 12
	   OR @Day < 1
	BEGIN
		RETURN 0
	END

	IF @Month NOT IN(4, 6, 9, 11)
	BEGIN
		IF @Month = 2
		BEGIN
			--Validate leap-year
			IF @Year % 4 = 0
			   AND (@Year % 100 <> 0
					OR @Year % 400 = 0)
			BEGIN
				SET @IsLeap = 1
			END
			SET @Until = IIF(@IsLeap = 0, 28, 29)
		END
			ELSE
		BEGIN
			SET @Until = 31
		END
	END

	IF @Day > @Until
	BEGIN
		RETURN 0
	END
		ELSE
	BEGIN
		RETURN 1
	END
	RETURN 0
END