/*
	Script to list tables, rows and size of each one in the database.

	AUTHOR: Fernando Casas Osorio
*/

SELECT DB_NAME() AS                                                            DatabaseName
	 , QUOTENAME(SC.Name) AS                                                   SchemaName
	 , QUOTENAME(TA.NAME) AS                                                   TableName
	 , CONCAT(QUOTENAME(SC.Name), '.', QUOTENAME(TA.NAME)) AS                  CompleteName
	 , PA.rows AS                                                              Rows
	 , CAST(ROUND((SUM(a.total_pages) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS TotalMB
	 , CAST(ROUND((SUM(a.used_pages) * 8) / 1024.00, 2) AS NUMERIC(36, 2)) AS  UsedMB
FROM sys.tables AS TA
INNER JOIN sys.indexes AS ID
	 ON TA.OBJECT_ID = ID.object_id
INNER JOIN sys.partitions AS PA
	 ON ID.object_id = PA.OBJECT_ID
		AND ID.index_id = PA.index_id
INNER JOIN sys.allocation_units AS a
	 ON PA.partition_id = a.container_id
LEFT OUTER JOIN sys.schemas AS SC
	 ON TA.schema_id = SC.schema_id
WHERE TA.is_ms_shipped = 0
	  AND ID.OBJECT_ID > 255
GROUP BY TA.Name
	   , SC.Name
	   , PA.Rows
ORDER BY TotalMB DESC