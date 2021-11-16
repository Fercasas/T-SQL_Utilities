CREATE FUNCTION dbo.UDF_Num2Letras
(
	@Numero    NUMERIC(18, 0)
) 
RETURNS VARCHAR(MAX) 
AS
/*
	Función escalar que convierte un número a texto en español; funciona hasta billones.

	Parámetros	:
	@Numero		: Número a ser convertido

	Ejecución:
	SELECT dbo.UDF_Num2Letras (19865249)

	Resultado:
	diecinueve millones ochocientos sesenta y cinco mil doscientos cuarenta y nueve

	AUTHOR: Fernando Casas Osorio
*/
BEGIN
	DECLARE 
	@Billones             INT          = @Numero / 1000000000000, 
	@Millones             INT          = @Numero % 1000000000000 / 1000000, 
	@Miles                INT          = @Numero % 1000000 / 1000, 
	@Centenas             INT          = @Numero % 1000 / 100, 
	@Decenas              INT          = @Numero % 1000 % 100 / 10, 
	@Unidades             INT          = @Numero % 10, 
	@T_Billones           VARCHAR(MAX) = '', 
	@T_Millones           VARCHAR(MAX) = '', 
	@T_Miles              VARCHAR(MAX) = '', 
	@T_Centenas           VARCHAR(MAX) = '', 
	@T_Decenas            VARCHAR(MAX) = '', 
	@T_Unidades           VARCHAR(MAX) = '', 
	@SeparadorDece        VARCHAR(3)   = '', 
	@SeparadorCent        VARCHAR(1)   = '', 
	@SeparadorMiles       VARCHAR(1)   = '', 
	@SeparadorMillones    VARCHAR(1)   = '', 
	@SeparadorBillones    VARCHAR(1)   = ''

	IF @Billones > 0
	BEGIN
		SELECT @T_Billones = IIF(@Billones = 1, 'un billon', dbo.UDF_Num2Letras (@Billones) + ' billones'), @SeparadorBillones = ' '
	END

	IF @Millones > 0
	BEGIN
		SELECT @T_Millones = IIF(@Millones = 1, 'un millon', dbo.UDF_Num2Letras (@Millones) + ' millones'), @SeparadorMillones = ' '
	END

	IF @Miles > 0
	BEGIN
		SELECT @T_Miles = REPLACE(IIF(@Miles = 1, 'mil', dbo.UDF_Num2Letras (@Miles) + ' mil'),'uno mil', 'un mil'), @SeparadorMiles = ' '
	END

	IF @Centenas > 0
	BEGIN
		SELECT @T_Centenas = CASE @Centenas
								 WHEN 1
									 THEN CASE
											  WHEN @Decenas = 0
												   AND @Unidades = 0
												  THEN 'cien'
											  ELSE 'ciento'
										  END
								 WHEN 5
									 THEN 'quinientos'
								 WHEN 9
									 THEN 'novecientos'
								 ELSE dbo.UDF_Num2Letras (@Centenas) + 'cientos'
							 END
			 , @SeparadorCent = ' '
	END

	SELECT @T_Decenas = CASE @Decenas
							WHEN 1
								THEN CASE @Unidades
										 WHEN 0
											 THEN 'diez'
										 WHEN 1
											 THEN 'once'
										 WHEN 2
											 THEN 'doce'
										 WHEN 3
											 THEN 'trece'
										 WHEN 4
											 THEN 'catorce'
										 WHEN 5
											 THEN 'quince'
										 ELSE 'dieci' + dbo.UDF_Num2Letras (@Unidades)
									 END
							WHEN 2
								THEN IIF(@Unidades = 0, 'veinte', 'veinti')
							WHEN 3
								THEN 'treinta'
							WHEN 4
								THEN 'cuarenta'
							WHEN 5
								THEN 'cincuenta'
							WHEN 6
								THEN 'sesenta'
							WHEN 7
								THEN 'setenta'
							WHEN 8
								THEN 'ochenta'
							WHEN 9
								THEN 'noventa'
						END

	IF @Decenas <> 1
	BEGIN
		SELECT @T_Unidades = CASE @Unidades
								 WHEN 0
									 THEN IIF(@Numero > 0,'','cero')
								 WHEN 1
									 THEN 'uno'
								 WHEN 2
									 THEN 'dos'
								 WHEN 3
									 THEN 'tres'
								 WHEN 4
									 THEN 'cuatro'
								 WHEN 5
									 THEN 'cinco'
								 WHEN 6
									 THEN 'seis'
								 WHEN 7
									 THEN 'siete'
								 WHEN 8
									 THEN 'ocho'
								 WHEN 9
									 THEN 'nueve'
							 END
	END

	SELECT @SeparadorDece = IIF(@Decenas > 2 AND @Unidades > 0, ' y ', @SeparadorDece)

	RETURN REPLACE(CONCAT(@T_Billones, @SeparadorBillones, @T_Millones, @SeparadorMillones, @T_Miles, @SeparadorMiles, @T_Centenas, @SeparadorCent,
	@T_Decenas, @SeparadorDece, @T_Unidades),'  ',' ')
END