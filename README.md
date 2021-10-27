# T-SQL Utilities :toolbox:

:scroll: Collection of different scripts with utilities for Transact-SQL (T-SQL)

## - UDF_InitCap

> dbo.UDF_InitCap: User Defined Function that modifies the first letter of each word to uppercase.<br>
> :pushpin:**If you want to remove double space in the string, uncomment the following statement:**
> ```sql
> --	SELECT @String = TRIM(REPLACE(REPLACE(REPLACE(@String, '  ', ' '), '  ', ''), '  ', ' '))
> ```
> ### :test_tube:Execution:
> ```sql
> SELECT dbo.UDF_InitCap('tHiS iS a tEsT') AS String
> ```
> ### :white_check_mark:Result:
> ```sql
> String
> This Is A Test
> ```

## - UDF_FormatString

> dbo.UDF_FormatString: User Defined Function that formats a string according to the received parameters.<br>
> :pushpin:**Parameters:**
> * @String		: String to format
> * @Option		: 0 = Only numbers, 1 = Only letters, 2 = Numbers and letters
> * @Spaces		: 0 = Without keeping spaces, 1 = keep spaces
> * @Accent		: 0 = No accents, 1 = With accents (á,é,í,ó,ú,ñ)
> ### :test_tube:Execution:
> ```sql
> SELECT dbo.UDF_FormatString('t1H2i3S i4S a5 t6E7s8T',0,1,0) AS String
> ```
> ### :white_check_mark:Result:
> ```sql
> String
> 123 4 5 678
> ```
> ```sql
> SELECT dbo.UDF_FormatString('t1H2i3S i4S a5 t6E7s8T',1,1,0) AS String
> ```
> ### :white_check_mark:Result:
> ```sql
> String
> tHiS iS a tEsT
> ```

## - SP_SQL2HTML

> dbo.SP_SQL2HTML: Store Procedure that generate HTML table from SQL query result.<br>
> :pushpin:**Parameters:**
> * @QuerySQL		: Valid SQL query whose result will be transformed into an HTML table
> * @HTML: Output parameter with HTML code
> ### :test_tube:Execution:
> ```sql
> DECLARE 
>	@HTML    VARCHAR(MAX)
>
>	EXEC dbo.SP_Sql2HTML 'SELECT Id AS CODE, Name FROM dbo.Student', 
>						  @HTML = @HTML OUTPUT
>	SELECT @HTML AS HTML
> ```
> ### :white_check_mark:Result:
><!DOCTYPE html><html><head></head><body><TABLE align="center"><thead><tr><TH>CODE</TH><TH>Name</TH></tr></thead><TBODY><TR><TD>1</TD><TD>Fernando Casas</TD></TR><TR><TD>2</TD><TD>Pepito Perez</TD></TR></TBODY></TABLE></body> </html>
