GO

/**********************************************************************************************
* TABLE: [DBO].[Departamentos]
* CREATION DATE: April/01/2020
* MODIFICATION DATE: 
* AUTHOR: FERNANDO CASAS OSORIO
* DESCRIPTION: Tabla con departamentos de Colombia (codificacion DANE)
* VERSION 1.0 
* FIXED: 
*/

SET NOCOUNT ON

BEGIN TRY

	IF OBJECT_ID('dbo.Departamento', 'U') IS NULL
	BEGIN
		CREATE TABLE Departamento
		(
			Id        INT IDENTITY(1, 1) PRIMARY KEY, 
			Codigo    VARCHAR(2), 
			Nombre    VARCHAR(100) NOT NULL, 
			CONSTRAINT UC_DepartamentosCodigo UNIQUE(Codigo)
		)
		PRINT '|->	Se ha creado la tabla dbo.Departamento.'
	END
END TRY
BEGIN CATCH
	PRINT '|->	Error creando tabla dbo.Departamento: ' + ERROR_MESSAGE()
END CATCH

BEGIN TRY
	IF OBJECT_ID('dbo.Departamento', 'U') IS NULL
	BEGIN
		PRINT '|->	No existe la tabla dbo.Departamento y no se pueden insertar los registros.'
	END
		ELSE
	BEGIN

		INSERT INTO Departamento
		(Codigo, 
		 Nombre
		)
		SELECT X.Codigo, 
			   X.Nombre
		FROM(VALUES (
					'05', 'ANTIOQUIA'), (
					'08', 'ATLÁNTICO'), (
					'11', 'BOGOTÁ, D.C.'), (
					'13', 'BOLÍVAR'), (
					'15', 'BOYACÁ'), (
					'17', 'CALDAS'), (
					'18', 'CAQUETÁ'), (
					'19', 'CAUCA'), (
					'20', 'CESAR'), (
					'23', 'CÓRDOBA'), (
					'25', 'CUNDINAMARCA'), (
					'27', 'CHOCÓ'), (
					'41', 'HUILA'), (
					'44', 'LA GUAJIRA'), (
					'47', 'MAGDALENA'), (
					'50', 'META'), (
					'52', 'NARIÑO'), (
					'54', 'NORTE DE SANTANDER'), (
					'63', 'QUINDÍO'), (
					'66', 'RISARALDA'), (
					'68', 'SANTANDER'), (
					'70', 'SUCRE'), (
					'73', 'TOLIMA'), (
					'76', 'VALLE DEL CAUCA'), (
					'81', 'ARAUCA'), (
					'85', 'CASANARE'), (
					'86', 'PUTUMAYO'), (
					'88', 'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA'), (
					'91', 'AMAZONAS'), (
					'94', 'GUAINÍA'), (
					'95', 'GUAVIARE'), (
					'97', 'VAUPÉS'), (
					'99', 'VICHADA') ) AS X(Codigo, Nombre)
		LEFT OUTER JOIN dbo.Departamento AS DE
			ON X.Codigo = DE.Codigo
		WHERE DE.Id IS NULL

		PRINT '|->	Registros insertados en la tabla dbo.Departamento: ' + CAST(@@ROWCOUNT AS VARCHAR)
	END
END TRY
BEGIN CATCH
	PRINT '|->	Error insertando en tabla dbo.Departamento: ' + ERROR_MESSAGE()
END CATCH

GO