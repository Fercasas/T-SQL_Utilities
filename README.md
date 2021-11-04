# T-SQL Utilities :toolbox:

:scroll: Collection of different scripts with utilities for Transact-SQL (T-SQL)

# Table of contents :memo:
  - [- UDF_InitCap.sql](#--udf_initcapsql)
  - [- UDF_FormatString.sql](#--udf_formatstringsql)
  - [- USP_SQL2HTML.sql](#--usp_sql2htmlsql)
  - [- SC_SearchText.sql](#--sc_searchtextsql)
  - [- NewSP.sql](#--newspsql)
  - [- USP_PrintMessage.sql](#--usp_printmessagesql)
  - [- SC_TableList.sql](#--sc_TableList)
  - [- SC_IndexFragmentation.sql](#--sc_IndexFragmentation)
  - [- SC_TablesWithoutPK.sql](#--sc_TablesWithoutPK)
  - [- SC_TablesWithoutFK.sql](#--sc_TablesWithoutFK)

## - UDF_InitCap.sql

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

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - UDF_FormatString.sql

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

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - USP_SQL2HTML.sql

> dbo.USP_SQL2HTML: Store Procedure that generate HTML table from SQL query result.<br>
> :pushpin:**Parameters:**
> * @QuerySQL		: Valid SQL query whose result will be transformed into an HTML table
> * @HTML: Output parameter with HTML code
> ### :test_tube:Execution:
> ```sql
> DECLARE 
>	@HTML    VARCHAR(MAX)
>
>	EXEC dbo.USP_SQL2HTML 'SELECT Id AS CODE, Name FROM dbo.Student', 
>						  @HTML = @HTML OUTPUT
>	SELECT @HTML AS HTML
> ```
> ### :white_check_mark:Result:
><!DOCTYPE html><html><head></head><body><TABLE align="center"><thead><tr><TH>CODE</TH><TH>Name</TH></tr></thead><TBODY><TR><TD>1</TD><TD>Fernando Casas</TD></TR><TR><TD>2</TD><TD>Pepito Perez</TD></TR></TBODY></TABLE></body> </html>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - SC_SearchText.sql

> SC_SearchText: Script for search text within sql statements in stored procedures, views, triggers.<br>
> :pushpin:**Parameters:**
> * @SearchedText	: Variable that contains the text to search.

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - NewSP.sql

> NewSP: Template for new Store Procedure (Template folder).<br>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - USP_PrintMessage.sql

> USP_PrintMessage: Store Procedure that print the received message by parameter.<br>
> :pushpin:**Parameters:**
> *	@Message    : Message (text) to print.
> *	@IdProc		: @@IdProc of the process from which it is executed.
> *	@Debug		: Show message if @Debug is 1.
> ### :test_tube:Execution:
> ```sql
> EXEC USP_PrintMessage 'Hello world', @@ProcId, 1
> ```
> ### :white_check_mark:Result:
> ```sql
>{29-10-21 22:07:28}	>>> Hello world
> ```

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - SC_TableList.sql

> SC_TableList: Script to list tables, rows and size of each one in the database.<br>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - SC_IndexFragmentation.sql

> SC_IndexFragmentation: Script to list index fragmentation in tables.<br>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - SC_TablesWithoutPK.sql

> SC_TablesWithoutPK: Script to list tables without primary key.<br>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**

## - SC_TablesWithoutFK.sql

> SC_TablesWithoutFK: Script to list tables without foreign keys.<br>

**[:toolbox: TOP](#t-sql-utilities-toolbox)**