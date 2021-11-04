/*
	Script to list tables without primary key

	AUTHOR: Fernando Casas Osorio
*/

SELECT QUOTENAME(SC.Name) AS                                  SchemaName
	 , QUOTENAME(TA.NAME) AS                                  TableName
	 , CONCAT(QUOTENAME(SC.Name), '.', QUOTENAME(TA.NAME)) AS CompleteName
	 , 'No primary key' AS                                    Description
FROM sys.tables AS TA
LEFT OUTER JOIN sys.indexes AS ID
	 ON TA.object_id = ID.object_id
		AND ID.is_primary_key = 1
LEFT OUTER JOIN sys.schemas AS SC
	 ON TA.schema_id = SC.schema_id
WHERE ID.object_id IS NULL
ORDER BY SC.Name
	   , TA.name