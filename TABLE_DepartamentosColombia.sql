/**********************************************************************************************
* TABLE: [DBO].[Departamentos]
* CREATION DATE: April/01/2020
* MODIFICATION DATE: 
* AUTHOR: FERNANDO CASAS OSORIO
* DESCRIPTION: Tabla con departamentos de Colombia (codificacion DANE)
* VERSION 1.0 
* FIXED: 
*/

IF OBJECT_ID('dbo.Departamentos', 'U') IS NULL
BEGIN
	CREATE TABLE Departamentos
	(
		 Id        INT IDENTITY(1, 1) PRIMARY KEY
	   , Codigo    TINYINT NOT NULL
	   , Nombre    VARCHAR(100) NOT NULL
	)

	INSERT INTO              Departamentos(
	Codigo
  , Nombre)
	SELECT     
	Codigo
  , Nombre
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
END



