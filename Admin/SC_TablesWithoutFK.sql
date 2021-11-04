/*
	Script to list tables without foreign keys

	AUTHOR: Fernando Casas Osorio
*/

SELECT QUOTENAME(SC.Name) AS                                  SchemaName
	 , QUOTENAME(TA.NAME) AS                                  TableName
	 , CONCAT(QUOTENAME(SC.Name), '.', QUOTENAME(TA.NAME)) AS CompleteName
	 , 'No foreign keys' AS                                   Description
FROM sys.tables AS TA
LEFT OUTER JOIN sys.foreign_keys AS FK
	 ON TA.object_id = FK.parent_object_id
LEFT OUTER JOIN sys.schemas AS SC
	 ON TA.schema_id = SC.schema_id
WHERE FK.object_id IS NULL
ORDER BY SCHEMA_NAME(TA.schema_id)
	   , TA.name