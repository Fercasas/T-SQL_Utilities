/*
	Script to list index fragmentation in tables.

	AUTHOR: Fernando Casas Osorio
*/

SELECT T1.object_id
	 , OBJECT_SCHEMA_NAME(T1.object_id) AS SchemaName
	 , OBJECT_NAME(T1.object_id) AS        TableName
	 , name AS                             IndexName
	 , avg_fragmentation_in_percent AS     Fragmentation
	 , page_count AS                       pages
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL, NULL, NULL) AS T1
INNER JOIN sys.indexes AS T2
	 ON T1.object_id = T2.object_id
		AND T1.index_id = T2.index_id
WHERE T1.index_type_desc <> 'HEAP'
	  AND T2.is_disabled = 0
	  AND T1.page_count >= 8