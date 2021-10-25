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
