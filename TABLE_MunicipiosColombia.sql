GO

/**********************************************************************************************
* TABLE: [DBO].[Municipio]
* CREATION DATE: April/01/2020
* MODIFICATION DATE: 
* AUTHOR: FERNANDO CASAS OSORIO
* DESCRIPTION: Tabla con municipios de Colombia (codificacion DANE)
* VERSION 1.0 
* FIXED: 
*/

SET NOCOUNT ON

BEGIN TRY

	IF OBJECT_ID('dbo.Municipio', 'U') IS NULL
	BEGIN
		CREATE TABLE Municipio
		(
			Id                INT IDENTITY(1, 1) PRIMARY KEY, 
			Codigo            VARCHAR(5) NOT NULL, 
			Nombre            VARCHAR(100) NOT NULL, 
			CONSTRAINT UC_MunicipioCodigo UNIQUE(Codigo), 
			IdDepartamento    INT REFERENCES Departamentos(Id)
		)
		PRINT '|->	Se ha creado la tabla dbo.Municipio.'
	END
END TRY
BEGIN CATCH
	PRINT '|->	Error creando tabla dbo.Municipio: ' + ERROR_MESSAGE()
END CATCH

BEGIN TRY
	IF OBJECT_ID('dbo.Municipio', 'U') IS NULL
	BEGIN
		PRINT '|->	No existe la tabla dbo.Municipio y no se pueden insertar los registros.'
	END
		ELSE
	BEGIN
		INSERT INTO dbo.Municipio
		(IdDepartamento, 
		 Codigo, 
		 Nombre
		)
		SELECT X.IdDepartamento, 
			   X.Codigo, 
			   X.Nombre
		FROM(VALUES (
					'05', '05001', 'MEDELL�N'), (
					'05', '05002', 'ABEJORRAL'), (
					'05', '05004', 'ABRIAQU�'), (
					'05', '05021', 'ALEJANDR�A'), (
					'05', '05030', 'AMAG�'), (
					'05', '05031', 'AMALFI'), (
					'05', '05034', 'ANDES'), (
					'05', '05036', 'ANGEL�POLIS'), (
					'05', '05038', 'ANGOSTURA'), (
					'05', '05040', 'ANOR�'), (
					'05', '05042', 'SANTA F� DE ANTIOQUIA'), (
					'05', '05044', 'ANZ�'), (
					'05', '05045', 'APARTAD�'), (
					'05', '05051', 'ARBOLETES'), (
					'05', '05055', 'ARGELIA'), (
					'05', '05059', 'ARMENIA'), (
					'05', '05079', 'BARBOSA'), (
					'05', '05086', 'BELMIRA'), (
					'05', '05088', 'BELLO'), (
					'05', '05091', 'BETANIA'), (
					'05', '05093', 'BETULIA'), (
					'05', '05101', 'CIUDAD BOL�VAR'), (
					'05', '05107', 'BRICE�O'), (
					'05', '05113', 'BURITIC�'), (
					'05', '05120', 'C�CERES'), (
					'05', '05125', 'CAICEDO'), (
					'05', '05129', 'CALDAS'), (
					'05', '05134', 'CAMPAMENTO'), (
					'05', '05138', 'CA�ASGORDAS'), (
					'05', '05142', 'CARACOL�'), (
					'05', '05145', 'CARAMANTA'), (
					'05', '05147', 'CAREPA'), (
					'05', '05148', 'EL CARMEN DE VIBORAL'), (
					'05', '05150', 'CAROLINA'), (
					'05', '05154', 'CAUCASIA'), (
					'05', '05172', 'CHIGOROD�'), (
					'05', '05190', 'CISNEROS'), (
					'05', '05197', 'COCORN�'), (
					'05', '05206', 'CONCEPCI�N'), (
					'05', '05209', 'CONCORDIA'), (
					'05', '05212', 'COPACABANA'), (
					'05', '05234', 'DABEIBA'), (
					'05', '05237', 'DONMAT�AS'), (
					'05', '05240', 'EB�JICO'), (
					'05', '05250', 'EL BAGRE'), (
					'05', '05264', 'ENTRERR�OS'), (
					'05', '05266', 'ENVIGADO'), (
					'05', '05282', 'FREDONIA'), (
					'05', '05284', 'FRONTINO'), (
					'05', '05306', 'GIRALDO'), (
					'05', '05308', 'GIRARDOTA'), (
					'05', '05310', 'G�MEZ PLATA'), (
					'05', '05313', 'GRANADA'), (
					'05', '05315', 'GUADALUPE'), (
					'05', '05318', 'GUARNE'), (
					'05', '05321', 'GUATAP�'), (
					'05', '05347', 'HELICONIA'), (
					'05', '05353', 'HISPANIA'), (
					'05', '05360', 'ITAG��'), (
					'05', '05361', 'ITUANGO'), (
					'05', '05364', 'JARD�N'), (
					'05', '05368', 'JERIC�'), (
					'05', '05376', 'LA CEJA'), (
					'05', '05380', 'LA ESTRELLA'), (
					'05', '05390', 'LA PINTADA'), (
					'05', '05400', 'LA UNI�N'), (
					'05', '05411', 'LIBORINA'), (
					'05', '05425', 'MACEO'), (
					'05', '05440', 'MARINILLA'), (
					'05', '05467', 'MONTEBELLO'), (
					'05', '05475', 'MURIND�'), (
					'05', '05480', 'MUTAT�'), (
					'05', '05483', 'NARI�O'), (
					'05', '05490', 'NECOCL�'), (
					'05', '05495', 'NECH�'), (
					'05', '05501', 'OLAYA'), (
					'05', '05541', 'PE�OL'), (
					'05', '05543', 'PEQUE'), (
					'05', '05576', 'PUEBLORRICO'), (
					'05', '05579', 'PUERTO BERR�O'), (
					'05', '05585', 'PUERTO NARE'), (
					'05', '05591', 'PUERTO TRIUNFO'), (
					'05', '05604', 'REMEDIOS'), (
					'05', '05607', 'RETIRO'), (
					'05', '05615', 'RIONEGRO'), (
					'05', '05628', 'SABANALARGA'), (
					'05', '05631', 'SABANETA'), (
					'05', '05642', 'SALGAR'), (
					'05', '05647', 'SAN ANDR�S DE CUERQU�A'), (
					'05', '05649', 'SAN CARLOS'), (
					'05', '05652', 'SAN FRANCISCO'), (
					'05', '05656', 'SAN JER�NIMO'), (
					'05', '05658', 'SAN JOS� DE LA MONTA�A'), (
					'05', '05659', 'SAN JUAN DE URAB�'), (
					'05', '05660', 'SAN LUIS'), (
					'05', '05664', 'SAN PEDRO DE LOS MILAGROS'), (
					'05', '05665', 'SAN PEDRO DE URAB�'), (
					'05', '05667', 'SAN RAFAEL'), (
					'05', '05670', 'SAN ROQUE'), (
					'05', '05674', 'SAN VICENTE FERRER'), (
					'05', '05679', 'SANTA B�RBARA'), (
					'05', '05686', 'SANTA ROSA DE OSOS'), (
					'05', '05690', 'SANTO DOMINGO'), (
					'05', '05697', 'EL SANTUARIO'), (
					'05', '05736', 'SEGOVIA'), (
					'05', '05756', 'SONS�N'), (
					'05', '05761', 'SOPETR�N'), (
					'05', '05789', 'T�MESIS'), (
					'05', '05790', 'TARAZ�'), (
					'05', '05792', 'TARSO'), (
					'05', '05809', 'TITIRIB�'), (
					'05', '05819', 'TOLEDO'), (
					'05', '05837', 'TURBO'), (
					'05', '05842', 'URAMITA'), (
					'05', '05847', 'URRAO'), (
					'05', '05854', 'VALDIVIA'), (
					'05', '05856', 'VALPARA�SO'), (
					'05', '05858', 'VEGACH�'), (
					'05', '05861', 'VENECIA'), (
					'05', '05873', 'VIG�A DEL FUERTE'), (
					'05', '05885', 'YAL�'), (
					'05', '05887', 'YARUMAL'), (
					'05', '05890', 'YOLOMB�'), (
					'05', '05893', 'YOND�'), (
					'05', '05895', 'ZARAGOZA'), (
					'08', '08001', 'BARRANQUILLA'), (
					'08', '08078', 'BARANOA'), (
					'08', '08137', 'CAMPO DE LA CRUZ'), (
					'08', '08141', 'CANDELARIA'), (
					'08', '08296', 'GALAPA'), (
					'08', '08372', 'JUAN DE ACOSTA'), (
					'08', '08421', 'LURUACO'), (
					'08', '08433', 'MALAMBO'), (
					'08', '08436', 'MANAT�'), (
					'08', '08520', 'PALMAR DE VARELA'), (
					'08', '08549', 'PIOJ�'), (
					'08', '08558', 'POLONUEVO'), (
					'08', '08560', 'PONEDERA'), (
					'08', '08573', 'PUERTO COLOMBIA'), (
					'08', '08606', 'REPEL�N'), (
					'08', '08634', 'SABANAGRANDE'), (
					'08', '08638', 'SABANALARGA'), (
					'08', '08675', 'SANTA LUC�A'), (
					'08', '08685', 'SANTO TOM�S'), (
					'08', '08758', 'SOLEDAD'), (
					'08', '08770', 'SUAN'), (
					'08', '08832', 'TUBAR�'), (
					'08', '08849', 'USIACUR�'), (
					'11', '11001', 'BOGOT�, D.C.'), (
					'13', '13001', 'CARTAGENA DE INDIAS'), (
					'13', '13006', 'ACH�'), (
					'13', '13030', 'ALTOS DEL ROSARIO'), (
					'13', '13042', 'ARENAL'), (
					'13', '13052', 'ARJONA'), (
					'13', '13062', 'ARROYOHONDO'), (
					'13', '13074', 'BARRANCO DE LOBA'), (
					'13', '13140', 'CALAMAR'), (
					'13', '13160', 'CANTAGALLO'), (
					'13', '13188', 'CICUCO'), (
					'13', '13212', 'C�RDOBA'), (
					'13', '13222', 'CLEMENCIA'), (
					'13', '13244', 'EL CARMEN DE BOL�VAR'), (
					'13', '13248', 'EL GUAMO'), (
					'13', '13268', 'EL PE��N'), (
					'13', '13300', 'HATILLO DE LOBA'), (
					'13', '13430', 'MAGANGU�'), (
					'13', '13433', 'MAHATES'), (
					'13', '13440', 'MARGARITA'), (
					'13', '13442', 'MAR�A LA BAJA'), (
					'13', '13458', 'MONTECRISTO'), (
					'13', '13468', 'SANTA CRUZ DE MOMPOX'), (
					'13', '13473', 'MORALES'), (
					'13', '13490', 'NOROS�'), (
					'13', '13549', 'PINILLOS'), (
					'13', '13580', 'REGIDOR'), (
					'13', '13600', 'R�O VIEJO'), (
					'13', '13620', 'SAN CRIST�BAL'), (
					'13', '13647', 'SAN ESTANISLAO'), (
					'13', '13650', 'SAN FERNANDO'), (
					'13', '13654', 'SAN JACINTO'), (
					'13', '13655', 'SAN JACINTO DEL CAUCA'), (
					'13', '13657', 'SAN JUAN NEPOMUCENO'), (
					'13', '13667', 'SAN MART�N DE LOBA'), (
					'13', '13670', 'SAN PABLO'), (
					'13', '13673', 'SANTA CATALINA'), (
					'13', '13683', 'SANTA ROSA'), (
					'13', '13688', 'SANTA ROSA DEL SUR'), (
					'13', '13744', 'SIMIT�'), (
					'13', '13760', 'SOPLAVIENTO'), (
					'13', '13780', 'TALAIGUA NUEVO'), (
					'13', '13810', 'TIQUISIO'), (
					'13', '13836', 'TURBACO'), (
					'13', '13838', 'TURBAN�'), (
					'13', '13873', 'VILLANUEVA'), (
					'13', '13894', 'ZAMBRANO'), (
					'15', '15001', 'TUNJA'), (
					'15', '15022', 'ALMEIDA'), (
					'15', '15047', 'AQUITANIA'), (
					'15', '15051', 'ARCABUCO'), (
					'15', '15087', 'BEL�N'), (
					'15', '15090', 'BERBEO'), (
					'15', '15092', 'BET�ITIVA'), (
					'15', '15097', 'BOAVITA'), (
					'15', '15104', 'BOYAC�'), (
					'15', '15106', 'BRICE�O'), (
					'15', '15109', 'BUENAVISTA'), (
					'15', '15114', 'BUSBANZ�'), (
					'15', '15131', 'CALDAS'), (
					'15', '15135', 'CAMPOHERMOSO'), (
					'15', '15162', 'CERINZA'), (
					'15', '15172', 'CHINAVITA'), (
					'15', '15176', 'CHIQUINQUIR�'), (
					'15', '15180', 'CHISCAS'), (
					'15', '15183', 'CHITA'), (
					'15', '15185', 'CHITARAQUE'), (
					'15', '15187', 'CHIVAT�'), (
					'15', '15189', 'CI�NEGA'), (
					'15', '15204', 'C�MBITA'), (
					'15', '15212', 'COPER'), (
					'15', '15215', 'CORRALES'), (
					'15', '15218', 'COVARACH�A'), (
					'15', '15223', 'CUBAR�'), (
					'15', '15224', 'CUCAITA'), (
					'15', '15226', 'CU�TIVA'), (
					'15', '15232', 'CH�QUIZA'), (
					'15', '15236', 'CHIVOR'), (
					'15', '15238', 'DUITAMA'), (
					'15', '15244', 'EL COCUY'), (
					'15', '15248', 'EL ESPINO'), (
					'15', '15272', 'FIRAVITOBA'), (
					'15', '15276', 'FLORESTA'), (
					'15', '15293', 'GACHANTIV�'), (
					'15', '15296', 'G�MEZA'), (
					'15', '15299', 'GARAGOA'), (
					'15', '15317', 'GUACAMAYAS'), (
					'15', '15322', 'GUATEQUE'), (
					'15', '15325', 'GUAYAT�'), (
					'15', '15332', 'G�IC�N DE LA SIERRA'), (
					'15', '15362', 'IZA'), (
					'15', '15367', 'JENESANO'), (
					'15', '15368', 'JERIC�'), (
					'15', '15377', 'LABRANZAGRANDE'), (
					'15', '15380', 'LA CAPILLA'), (
					'15', '15401', 'LA VICTORIA'), (
					'15', '15403', 'LA UVITA'), (
					'15', '15407', 'VILLA DE LEYVA'), (
					'15', '15425', 'MACANAL'), (
					'15', '15442', 'MARIP�'), (
					'15', '15455', 'MIRAFLORES'), (
					'15', '15464', 'MONGUA'), (
					'15', '15466', 'MONGU�'), (
					'15', '15469', 'MONIQUIR�'), (
					'15', '15476', 'MOTAVITA'), (
					'15', '15480', 'MUZO'), (
					'15', '15491', 'NOBSA'), (
					'15', '15494', 'NUEVO COL�N'), (
					'15', '15500', 'OICAT�'), (
					'15', '15507', 'OTANCHE'), (
					'15', '15511', 'PACHAVITA'), (
					'15', '15514', 'P�EZ'), (
					'15', '15516', 'PAIPA'), (
					'15', '15518', 'PAJARITO'), (
					'15', '15522', 'PANQUEBA'), (
					'15', '15531', 'PAUNA'), (
					'15', '15533', 'PAYA'), (
					'15', '15537', 'PAZ DE R�O'), (
					'15', '15542', 'PESCA'), (
					'15', '15550', 'PISBA'), (
					'15', '15572', 'PUERTO BOYAC�'), (
					'15', '15580', 'QU�PAMA'), (
					'15', '15599', 'RAMIRIQU�'), (
					'15', '15600', 'R�QUIRA'), (
					'15', '15621', 'ROND�N'), (
					'15', '15632', 'SABOY�'), (
					'15', '15638', 'S�CHICA'), (
					'15', '15646', 'SAMAC�'), (
					'15', '15660', 'SAN EDUARDO'), (
					'15', '15664', 'SAN JOS� DE PARE'), (
					'15', '15667', 'SAN LUIS DE GACENO'), (
					'15', '15673', 'SAN MATEO'), (
					'15', '15676', 'SAN MIGUEL DE SEMA'), (
					'15', '15681', 'SAN PABLO DE BORBUR'), (
					'15', '15686', 'SANTANA'), (
					'15', '15690', 'SANTA MAR�A'), (
					'15', '15693', 'SANTA ROSA DE VITERBO'), (
					'15', '15696', 'SANTA SOF�A'), (
					'15', '15720', 'SATIVANORTE'), (
					'15', '15723', 'SATIVASUR'), (
					'15', '15740', 'SIACHOQUE'), (
					'15', '15753', 'SOAT�'), (
					'15', '15755', 'SOCOT�'), (
					'15', '15757', 'SOCHA'), (
					'15', '15759', 'SOGAMOSO'), (
					'15', '15761', 'SOMONDOCO'), (
					'15', '15762', 'SORA'), (
					'15', '15763', 'SOTAQUIR�'), (
					'15', '15764', 'SORAC�'), (
					'15', '15774', 'SUSAC�N'), (
					'15', '15776', 'SUTAMARCH�N'), (
					'15', '15778', 'SUTATENZA'), (
					'15', '15790', 'TASCO'), (
					'15', '15798', 'TENZA'), (
					'15', '15804', 'TIBAN�'), (
					'15', '15806', 'TIBASOSA'), (
					'15', '15808', 'TINJAC�'), (
					'15', '15810', 'TIPACOQUE'), (
					'15', '15814', 'TOCA'), (
					'15', '15816', 'TOG��'), (
					'15', '15820', 'T�PAGA'), (
					'15', '15822', 'TOTA'), (
					'15', '15832', 'TUNUNGU�'), (
					'15', '15835', 'TURMEQU�'), (
					'15', '15837', 'TUTA'), (
					'15', '15839', 'TUTAZ�'), (
					'15', '15842', '�MBITA'), (
					'15', '15861', 'VENTAQUEMADA'), (
					'15', '15879', 'VIRACACH�'), (
					'15', '15897', 'ZETAQUIRA'), (
					'17', '17001', 'MANIZALES'), (
					'17', '17013', 'AGUADAS'), (
					'17', '17042', 'ANSERMA'), (
					'17', '17050', 'ARANZAZU'), (
					'17', '17088', 'BELALC�ZAR'), (
					'17', '17174', 'CHINCHIN�'), (
					'17', '17272', 'FILADELFIA'), (
					'17', '17380', 'LA DORADA'), (
					'17', '17388', 'LA MERCED'), (
					'17', '17433', 'MANZANARES'), (
					'17', '17442', 'MARMATO'), (
					'17', '17444', 'MARQUETALIA'), (
					'17', '17446', 'MARULANDA'), (
					'17', '17486', 'NEIRA'), (
					'17', '17495', 'NORCASIA'), (
					'17', '17513', 'P�CORA'), (
					'17', '17524', 'PALESTINA'), (
					'17', '17541', 'PENSILVANIA'), (
					'17', '17614', 'RIOSUCIO'), (
					'17', '17616', 'RISARALDA'), (
					'17', '17653', 'SALAMINA'), (
					'17', '17662', 'SAMAN�'), (
					'17', '17665', 'SAN JOS�'), (
					'17', '17777', 'SUP�A'), (
					'17', '17867', 'VICTORIA'), (
					'17', '17873', 'VILLAMAR�A'), (
					'17', '17877', 'VITERBO'), (
					'18', '18001', 'FLORENCIA'), (
					'18', '18029', 'ALBANIA'), (
					'18', '18094', 'BEL�N DE LOS ANDAQU�ES'), (
					'18', '18150', 'CARTAGENA DEL CHAIR�'), (
					'18', '18205', 'CURILLO'), (
					'18', '18247', 'EL DONCELLO'), (
					'18', '18256', 'EL PAUJ�L'), (
					'18', '18410', 'LA MONTA�ITA'), (
					'18', '18460', 'MIL�N'), (
					'18', '18479', 'MORELIA'), (
					'18', '18592', 'PUERTO RICO'), (
					'18', '18610', 'SAN JOS� DEL FRAGUA'), (
					'18', '18753', 'SAN VICENTE DEL CAGU�N'), (
					'18', '18756', 'SOLANO'), (
					'18', '18785', 'SOLITA'), (
					'18', '18860', 'VALPARA�SO'), (
					'19', '19001', 'POPAY�N'), (
					'19', '19022', 'ALMAGUER'), (
					'19', '19050', 'ARGELIA'), (
					'19', '19075', 'BALBOA'), (
					'19', '19100', 'BOL�VAR'), (
					'19', '19110', 'BUENOS AIRES'), (
					'19', '19130', 'CAJIB�O'), (
					'19', '19137', 'CALDONO'), (
					'19', '19142', 'CALOTO'), (
					'19', '19212', 'CORINTO'), (
					'19', '19256', 'EL TAMBO'), (
					'19', '19290', 'FLORENCIA'), (
					'19', '19300', 'GUACHEN�'), (
					'19', '19318', 'GUAPI'), (
					'19', '19355', 'INZ�'), (
					'19', '19364', 'JAMBAL�'), (
					'19', '19392', 'LA SIERRA'), (
					'19', '19397', 'LA VEGA'), (
					'19', '19418', 'L�PEZ DE MICAY'), (
					'19', '19450', 'MERCADERES'), (
					'19', '19455', 'MIRANDA'), (
					'19', '19473', 'MORALES'), (
					'19', '19513', 'PADILLA'), (
					'19', '19517', 'P�EZ'), (
					'19', '19532', 'PAT�A'), (
					'19', '19533', 'PIAMONTE'), (
					'19', '19548', 'PIENDAM� - TUN�A'), (
					'19', '19573', 'PUERTO TEJADA'), (
					'19', '19585', 'PURAC�'), (
					'19', '19622', 'ROSAS'), (
					'19', '19693', 'SAN SEBASTI�N'), (
					'19', '19698', 'SANTANDER DE QUILICHAO'), (
					'19', '19701', 'SANTA ROSA'), (
					'19', '19743', 'SILVIA'), (
					'19', '19760', 'SOTAR� PAISPAMBA'), (
					'19', '19780', 'SU�REZ'), (
					'19', '19785', 'SUCRE'), (
					'19', '19807', 'TIMB�O'), (
					'19', '19809', 'TIMBIQU�'), (
					'19', '19821', 'TORIB�O'), (
					'19', '19824', 'TOTOR�'), (
					'19', '19845', 'VILLA RICA'), (
					'20', '20001', 'VALLEDUPAR'), (
					'20', '20011', 'AGUACHICA'), (
					'20', '20013', 'AGUST�N CODAZZI'), (
					'20', '20032', 'ASTREA'), (
					'20', '20045', 'BECERRIL'), (
					'20', '20060', 'BOSCONIA'), (
					'20', '20175', 'CHIMICHAGUA'), (
					'20', '20178', 'CHIRIGUAN�'), (
					'20', '20228', 'CURUMAN�'), (
					'20', '20238', 'EL COPEY'), (
					'20', '20250', 'EL PASO'), (
					'20', '20295', 'GAMARRA'), (
					'20', '20310', 'GONZ�LEZ'), (
					'20', '20383', 'LA GLORIA'), (
					'20', '20400', 'LA JAGUA DE IBIRICO'), (
					'20', '20443', 'MANAURE BALC�N DEL CESAR'), (
					'20', '20517', 'PAILITAS'), (
					'20', '20550', 'PELAYA'), (
					'20', '20570', 'PUEBLO BELLO'), (
					'20', '20614', 'R�O DE ORO'), (
					'20', '20621', 'LA PAZ'), (
					'20', '20710', 'SAN ALBERTO'), (
					'20', '20750', 'SAN DIEGO'), (
					'20', '20770', 'SAN MART�N'), (
					'20', '20787', 'TAMALAMEQUE'), (
					'23', '23001', 'MONTER�A'), (
					'23', '23068', 'AYAPEL'), (
					'23', '23079', 'BUENAVISTA'), (
					'23', '23090', 'CANALETE'), (
					'23', '23162', 'CERET�'), (
					'23', '23168', 'CHIM�'), (
					'23', '23182', 'CHIN�'), (
					'23', '23189', 'CI�NAGA DE ORO'), (
					'23', '23300', 'COTORRA'), (
					'23', '23350', 'LA APARTADA'), (
					'23', '23417', 'LORICA'), (
					'23', '23419', 'LOS C�RDOBAS'), (
					'23', '23464', 'MOMIL'), (
					'23', '23466', 'MONTEL�BANO'), (
					'23', '23500', 'MO�ITOS'), (
					'23', '23555', 'PLANETA RICA'), (
					'23', '23570', 'PUEBLO NUEVO'), (
					'23', '23574', 'PUERTO ESCONDIDO'), (
					'23', '23580', 'PUERTO LIBERTADOR'), (
					'23', '23586', 'PUR�SIMA DE LA CONCEPCI�N'), (
					'23', '23660', 'SAHAG�N'), (
					'23', '23670', 'SAN ANDR�S DE SOTAVENTO'), (
					'23', '23672', 'SAN ANTERO'), (
					'23', '23675', 'SAN BERNARDO DEL VIENTO'), (
					'23', '23678', 'SAN CARLOS'), (
					'23', '23682', 'SAN JOS� DE UR�'), (
					'23', '23686', 'SAN PELAYO'), (
					'23', '23807', 'TIERRALTA'), (
					'23', '23815', 'TUCH�N'), (
					'23', '23855', 'VALENCIA'), (
					'25', '25001', 'AGUA DE DIOS'), (
					'25', '25019', 'ALB�N'), (
					'25', '25035', 'ANAPOIMA'), (
					'25', '25040', 'ANOLAIMA'), (
					'25', '25053', 'ARBEL�EZ'), (
					'25', '25086', 'BELTR�N'), (
					'25', '25095', 'BITUIMA'), (
					'25', '25099', 'BOJAC�'), (
					'25', '25120', 'CABRERA'), (
					'25', '25123', 'CACHIPAY'), (
					'25', '25126', 'CAJIC�'), (
					'25', '25148', 'CAPARRAP�'), (
					'25', '25151', 'C�QUEZA'), (
					'25', '25154', 'CARMEN DE CARUPA'), (
					'25', '25168', 'CHAGUAN�'), (
					'25', '25175', 'CH�A'), (
					'25', '25178', 'CHIPAQUE'), (
					'25', '25181', 'CHOACH�'), (
					'25', '25183', 'CHOCONT�'), (
					'25', '25200', 'COGUA'), (
					'25', '25214', 'COTA'), (
					'25', '25224', 'CUCUNUB�'), (
					'25', '25245', 'EL COLEGIO'), (
					'25', '25258', 'EL PE��N'), (
					'25', '25260', 'EL ROSAL'), (
					'25', '25269', 'FACATATIV�'), (
					'25', '25279', 'F�MEQUE'), (
					'25', '25281', 'FOSCA'), (
					'25', '25286', 'FUNZA'), (
					'25', '25288', 'F�QUENE'), (
					'25', '25290', 'FUSAGASUG�'), (
					'25', '25293', 'GACHAL�'), (
					'25', '25295', 'GACHANCIP�'), (
					'25', '25297', 'GACHET�'), (
					'25', '25299', 'GAMA'), (
					'25', '25307', 'GIRARDOT'), (
					'25', '25312', 'GRANADA'), (
					'25', '25317', 'GUACHET�'), (
					'25', '25320', 'GUADUAS'), (
					'25', '25322', 'GUASCA'), (
					'25', '25324', 'GUATAQU�'), (
					'25', '25326', 'GUATAVITA'), (
					'25', '25328', 'GUAYABAL DE S�QUIMA'), (
					'25', '25335', 'GUAYABETAL'), (
					'25', '25339', 'GUTI�RREZ'), (
					'25', '25368', 'JERUSAL�N'), (
					'25', '25372', 'JUN�N'), (
					'25', '25377', 'LA CALERA'), (
					'25', '25386', 'LA MESA'), (
					'25', '25394', 'LA PALMA'), (
					'25', '25398', 'LA PE�A'), (
					'25', '25402', 'LA VEGA'), (
					'25', '25407', 'LENGUAZAQUE'), (
					'25', '25426', 'MACHET�'), (
					'25', '25430', 'MADRID'), (
					'25', '25436', 'MANTA'), (
					'25', '25438', 'MEDINA'), (
					'25', '25473', 'MOSQUERA'), (
					'25', '25483', 'NARI�O'), (
					'25', '25486', 'NEMOC�N'), (
					'25', '25488', 'NILO'), (
					'25', '25489', 'NIMAIMA'), (
					'25', '25491', 'NOCAIMA'), (
					'25', '25506', 'VENECIA'), (
					'25', '25513', 'PACHO'), (
					'25', '25518', 'PAIME'), (
					'25', '25524', 'PANDI'), (
					'25', '25530', 'PARATEBUENO'), (
					'25', '25535', 'PASCA'), (
					'25', '25572', 'PUERTO SALGAR'), (
					'25', '25580', 'PUL�'), (
					'25', '25592', 'QUEBRADANEGRA'), (
					'25', '25594', 'QUETAME'), (
					'25', '25596', 'QUIPILE'), (
					'25', '25599', 'APULO'), (
					'25', '25612', 'RICAURTE'), (
					'25', '25645', 'SAN ANTONIO DEL TEQUENDAMA'), (
					'25', '25649', 'SAN BERNARDO'), (
					'25', '25653', 'SAN CAYETANO'), (
					'25', '25658', 'SAN FRANCISCO'), (
					'25', '25662', 'SAN JUAN DE RIOSECO'), (
					'25', '25718', 'SASAIMA'), (
					'25', '25736', 'SESQUIL�'), (
					'25', '25740', 'SIBAT�'), (
					'25', '25743', 'SILVANIA'), (
					'25', '25745', 'SIMIJACA'), (
					'25', '25754', 'SOACHA'), (
					'25', '25758', 'SOP�'), (
					'25', '25769', 'SUBACHOQUE'), (
					'25', '25772', 'SUESCA'), (
					'25', '25777', 'SUPAT�'), (
					'25', '25779', 'SUSA'), (
					'25', '25781', 'SUTATAUSA'), (
					'25', '25785', 'TABIO'), (
					'25', '25793', 'TAUSA'), (
					'25', '25797', 'TENA'), (
					'25', '25799', 'TENJO'), (
					'25', '25805', 'TIBACUY'), (
					'25', '25807', 'TIBIRITA'), (
					'25', '25815', 'TOCAIMA'), (
					'25', '25817', 'TOCANCIP�'), (
					'25', '25823', 'TOPAIP�'), (
					'25', '25839', 'UBAL�'), (
					'25', '25841', 'UBAQUE'), (
					'25', '25843', 'VILLA DE SAN DIEGO DE UBAT�'), (
					'25', '25845', 'UNE'), (
					'25', '25851', '�TICA'), (
					'25', '25862', 'VERGARA'), (
					'25', '25867', 'VIAN�'), (
					'25', '25871', 'VILLAG�MEZ'), (
					'25', '25873', 'VILLAPINZ�N'), (
					'25', '25875', 'VILLETA'), (
					'25', '25878', 'VIOT�'), (
					'25', '25885', 'YACOP�'), (
					'25', '25898', 'ZIPAC�N'), (
					'25', '25899', 'ZIPAQUIR�'), (
					'27', '27001', 'QUIBD�'), (
					'27', '27006', 'ACAND�'), (
					'27', '27025', 'ALTO BAUD�'), (
					'27', '27050', 'ATRATO'), (
					'27', '27073', 'BAGAD�'), (
					'27', '27075', 'BAH�A SOLANO'), (
					'27', '27077', 'BAJO BAUD�'), (
					'27', '27099', 'BOJAY�'), (
					'27', '27135', 'EL CANT�N DEL SAN PABLO'), (
					'27', '27150', 'CARMEN DEL DARI�N'), (
					'27', '27160', 'C�RTEGUI'), (
					'27', '27205', 'CONDOTO'), (
					'27', '27245', 'EL CARMEN DE ATRATO'), (
					'27', '27250', 'EL LITORAL DEL SAN JUAN'), (
					'27', '27361', 'ISTMINA'), (
					'27', '27372', 'JURAD�'), (
					'27', '27413', 'LLOR�'), (
					'27', '27425', 'MEDIO ATRATO'), (
					'27', '27430', 'MEDIO BAUD�'), (
					'27', '27450', 'MEDIO SAN JUAN'), (
					'27', '27491', 'N�VITA'), (
					'27', '27495', 'NUQU�'), (
					'27', '27580', 'R�O IR�'), (
					'27', '27600', 'R�O QUITO'), (
					'27', '27615', 'RIOSUCIO'), (
					'27', '27660', 'SAN JOS� DEL PALMAR'), (
					'27', '27745', 'SIP�'), (
					'27', '27787', 'TAD�'), (
					'27', '27800', 'UNGU�A'), (
					'27', '27810', 'UNI�N PANAMERICANA'), (
					'41', '41001', 'NEIVA'), (
					'41', '41006', 'ACEVEDO'), (
					'41', '41013', 'AGRADO'), (
					'41', '41016', 'AIPE'), (
					'41', '41020', 'ALGECIRAS'), (
					'41', '41026', 'ALTAMIRA'), (
					'41', '41078', 'BARAYA'), (
					'41', '41132', 'CAMPOALEGRE'), (
					'41', '41206', 'COLOMBIA'), (
					'41', '41244', 'EL�AS'), (
					'41', '41298', 'GARZ�N'), (
					'41', '41306', 'GIGANTE'), (
					'41', '41319', 'GUADALUPE'), (
					'41', '41349', 'HOBO'), (
					'41', '41357', '�QUIRA'), (
					'41', '41359', 'ISNOS'), (
					'41', '41378', 'LA ARGENTINA'), (
					'41', '41396', 'LA PLATA'), (
					'41', '41483', 'N�TAGA'), (
					'41', '41503', 'OPORAPA'), (
					'41', '41518', 'PAICOL'), (
					'41', '41524', 'PALERMO'), (
					'41', '41530', 'PALESTINA'), (
					'41', '41548', 'PITAL'), (
					'41', '41551', 'PITALITO'), (
					'41', '41615', 'RIVERA'), (
					'41', '41660', 'SALADOBLANCO'), (
					'41', '41668', 'SAN AGUST�N'), (
					'41', '41676', 'SANTA MAR�A'), (
					'41', '41770', 'SUAZA'), (
					'41', '41791', 'TARQUI'), (
					'41', '41797', 'TESALIA'), (
					'41', '41799', 'TELLO'), (
					'41', '41801', 'TERUEL'), (
					'41', '41807', 'TIMAN�'), (
					'41', '41872', 'VILLAVIEJA'), (
					'41', '41885', 'YAGUAR�'), (
					'44', '44001', 'RIOHACHA'), (
					'44', '44035', 'ALBANIA'), (
					'44', '44078', 'BARRANCAS'), (
					'44', '44090', 'DIBULLA'), (
					'44', '44098', 'DISTRACCI�N'), (
					'44', '44110', 'EL MOLINO'), (
					'44', '44279', 'FONSECA'), (
					'44', '44378', 'HATONUEVO'), (
					'44', '44420', 'LA JAGUA DEL PILAR'), (
					'44', '44430', 'MAICAO'), (
					'44', '44560', 'MANAURE'), (
					'44', '44650', 'SAN JUAN DEL CESAR'), (
					'44', '44847', 'URIBIA'), (
					'44', '44855', 'URUMITA'), (
					'44', '44874', 'VILLANUEVA'), (
					'47', '47001', 'SANTA MARTA'), (
					'47', '47030', 'ALGARROBO'), (
					'47', '47053', 'ARACATACA'), (
					'47', '47058', 'ARIGUAN�'), (
					'47', '47161', 'CERRO DE SAN ANTONIO'), (
					'47', '47170', 'CHIVOLO'), (
					'47', '47189', 'CI�NAGA'), (
					'47', '47205', 'CONCORDIA'), (
					'47', '47245', 'EL BANCO'), (
					'47', '47258', 'EL PI��N'), (
					'47', '47268', 'EL RET�N'), (
					'47', '47288', 'FUNDACI�N'), (
					'47', '47318', 'GUAMAL'), (
					'47', '47460', 'NUEVA GRANADA'), (
					'47', '47541', 'PEDRAZA'), (
					'47', '47545', 'PIJI�O DEL CARMEN'), (
					'47', '47551', 'PIVIJAY'), (
					'47', '47555', 'PLATO'), (
					'47', '47570', 'PUEBLOVIEJO'), (
					'47', '47605', 'REMOLINO'), (
					'47', '47660', 'SABANAS DE SAN �NGEL'), (
					'47', '47675', 'SALAMINA'), (
					'47', '47692', 'SAN SEBASTI�N DE BUENAVISTA'), (
					'47', '47703', 'SAN ZEN�N'), (
					'47', '47707', 'SANTA ANA'), (
					'47', '47720', 'SANTA B�RBARA DE PINTO'), (
					'47', '47745', 'SITIONUEVO'), (
					'47', '47798', 'TENERIFE'), (
					'47', '47960', 'ZAPAY�N'), (
					'47', '47980', 'ZONA BANANERA'), (
					'50', '50001', 'VILLAVICENCIO'), (
					'50', '50006', 'ACAC�AS'), (
					'50', '50110', 'BARRANCA DE UP�A'), (
					'50', '50124', 'CABUYARO'), (
					'50', '50150', 'CASTILLA LA NUEVA'), (
					'50', '50223', 'CUBARRAL'), (
					'50', '50226', 'CUMARAL'), (
					'50', '50245', 'EL CALVARIO'), (
					'50', '50251', 'EL CASTILLO'), (
					'50', '50270', 'EL DORADO'), (
					'50', '50287', 'FUENTE DE ORO'), (
					'50', '50313', 'GRANADA'), (
					'50', '50318', 'GUAMAL'), (
					'50', '50325', 'MAPIRIP�N'), (
					'50', '50330', 'MESETAS'), (
					'50', '50350', 'LA MACARENA'), (
					'50', '50370', 'URIBE'), (
					'50', '50400', 'LEJAN�AS'), (
					'50', '50450', 'PUERTO CONCORDIA'), (
					'50', '50568', 'PUERTO GAIT�N'), (
					'50', '50573', 'PUERTO L�PEZ'), (
					'50', '50577', 'PUERTO LLERAS'), (
					'50', '50590', 'PUERTO RICO'), (
					'50', '50606', 'RESTREPO'), (
					'50', '50680', 'SAN CARLOS DE GUAROA'), (
					'50', '50683', 'SAN JUAN DE ARAMA'), (
					'50', '50686', 'SAN JUANITO'), (
					'50', '50689', 'SAN MART�N'), (
					'50', '50711', 'VISTAHERMOSA'), (
					'52', '52001', 'PASTO'), (
					'52', '52019', 'ALB�N'), (
					'52', '52022', 'ALDANA'), (
					'52', '52036', 'ANCUYA'), (
					'52', '52051', 'ARBOLEDA'), (
					'52', '52079', 'BARBACOAS'), (
					'52', '52083', 'BEL�N'), (
					'52', '52110', 'BUESACO'), (
					'52', '52203', 'COL�N'), (
					'52', '52207', 'CONSAC�'), (
					'52', '52210', 'CONTADERO'), (
					'52', '52215', 'C�RDOBA'), (
					'52', '52224', 'CUASPUD CARLOSAMA'), (
					'52', '52227', 'CUMBAL'), (
					'52', '52233', 'CUMBITARA'), (
					'52', '52240', 'CHACHAG��'), (
					'52', '52250', 'EL CHARCO'), (
					'52', '52254', 'EL PE�OL'), (
					'52', '52256', 'EL ROSARIO'), (
					'52', '52258', 'EL TABL�N DE G�MEZ'), (
					'52', '52260', 'EL TAMBO'), (
					'52', '52287', 'FUNES'), (
					'52', '52317', 'GUACHUCAL'), (
					'52', '52320', 'GUAITARILLA'), (
					'52', '52323', 'GUALMAT�N'), (
					'52', '52352', 'ILES'), (
					'52', '52354', 'IMU�S'), (
					'52', '52356', 'IPIALES'), (
					'52', '52378', 'LA CRUZ'), (
					'52', '52381', 'LA FLORIDA'), (
					'52', '52385', 'LA LLANADA'), (
					'52', '52390', 'LA TOLA'), (
					'52', '52399', 'LA UNI�N'), (
					'52', '52405', 'LEIVA'), (
					'52', '52411', 'LINARES'), (
					'52', '52418', 'LOS ANDES'), (
					'52', '52427', 'MAG��'), (
					'52', '52435', 'MALLAMA'), (
					'52', '52473', 'MOSQUERA'), (
					'52', '52480', 'NARI�O'), (
					'52', '52490', 'OLAYA HERRERA'), (
					'52', '52506', 'OSPINA'), (
					'52', '52520', 'FRANCISCO PIZARRO'), (
					'52', '52540', 'POLICARPA'), (
					'52', '52560', 'POTOS�'), (
					'52', '52565', 'PROVIDENCIA'), (
					'52', '52573', 'PUERRES'), (
					'52', '52585', 'PUPIALES'), (
					'52', '52612', 'RICAURTE'), (
					'52', '52621', 'ROBERTO PAY�N'), (
					'52', '52678', 'SAMANIEGO'), (
					'52', '52683', 'SANDON�'), (
					'52', '52685', 'SAN BERNARDO'), (
					'52', '52687', 'SAN LORENZO'), (
					'52', '52693', 'SAN PABLO'), (
					'52', '52694', 'SAN PEDRO DE CARTAGO'), (
					'52', '52696', 'SANTA B�RBARA'), (
					'52', '52699', 'SANTACRUZ'), (
					'52', '52720', 'SAPUYES'), (
					'52', '52786', 'TAMINANGO'), (
					'52', '52788', 'TANGUA'), (
					'52', '52835', 'SAN ANDR�S DE TUMACO'), (
					'52', '52838', 'T�QUERRES'), (
					'52', '52885', 'YACUANQUER'), (
					'54', '54001', 'SAN JOS� DE C�CUTA'), (
					'54', '54003', '�BREGO'), (
					'54', '54051', 'ARBOLEDAS'), (
					'54', '54099', 'BOCHALEMA'), (
					'54', '54109', 'BUCARASICA'), (
					'54', '54125', 'C�COTA'), (
					'54', '54128', 'C�CHIRA'), (
					'54', '54172', 'CHIN�COTA'), (
					'54', '54174', 'CHITAG�'), (
					'54', '54206', 'CONVENCI�N'), (
					'54', '54223', 'CUCUTILLA'), (
					'54', '54239', 'DURANIA'), (
					'54', '54245', 'EL CARMEN'), (
					'54', '54250', 'EL TARRA'), (
					'54', '54261', 'EL ZULIA'), (
					'54', '54313', 'GRAMALOTE'), (
					'54', '54344', 'HACAR�'), (
					'54', '54347', 'HERR�N'), (
					'54', '54377', 'LABATECA'), (
					'54', '54385', 'LA ESPERANZA'), (
					'54', '54398', 'LA PLAYA'), (
					'54', '54405', 'LOS PATIOS'), (
					'54', '54418', 'LOURDES'), (
					'54', '54480', 'MUTISCUA'), (
					'54', '54498', 'OCA�A'), (
					'54', '54518', 'PAMPLONA'), (
					'54', '54520', 'PAMPLONITA'), (
					'54', '54553', 'PUERTO SANTANDER'), (
					'54', '54599', 'RAGONVALIA'), (
					'54', '54660', 'SALAZAR'), (
					'54', '54670', 'SAN CALIXTO'), (
					'54', '54673', 'SAN CAYETANO'), (
					'54', '54680', 'SANTIAGO'), (
					'54', '54720', 'SARDINATA'), (
					'54', '54743', 'SILOS'), (
					'54', '54800', 'TEORAMA'), (
					'54', '54810', 'TIB�'), (
					'54', '54820', 'TOLEDO'), (
					'54', '54871', 'VILLA CARO'), (
					'54', '54874', 'VILLA DEL ROSARIO'), (
					'63', '63001', 'ARMENIA'), (
					'63', '63111', 'BUENAVISTA'), (
					'63', '63130', 'CALARC�'), (
					'63', '63190', 'CIRCASIA'), (
					'63', '63212', 'C�RDOBA'), (
					'63', '63272', 'FILANDIA'), (
					'63', '63302', 'G�NOVA'), (
					'63', '63401', 'LA TEBAIDA'), (
					'63', '63470', 'MONTENEGRO'), (
					'63', '63548', 'PIJAO'), (
					'63', '63594', 'QUIMBAYA'), (
					'63', '63690', 'SALENTO'), (
					'66', '66001', 'PEREIRA'), (
					'66', '66045', 'AP�A'), (
					'66', '66075', 'BALBOA'), (
					'66', '66088', 'BEL�N DE UMBR�A'), (
					'66', '66170', 'DOSQUEBRADAS'), (
					'66', '66318', 'GU�TICA'), (
					'66', '66383', 'LA CELIA'), (
					'66', '66400', 'LA VIRGINIA'), (
					'66', '66440', 'MARSELLA'), (
					'66', '66456', 'MISTRAT�'), (
					'66', '66572', 'PUEBLO RICO'), (
					'66', '66594', 'QUINCH�A'), (
					'66', '66682', 'SANTA ROSA DE CABAL'), (
					'66', '66687', 'SANTUARIO'), (
					'68', '68001', 'BUCARAMANGA'), (
					'68', '68013', 'AGUADA'), (
					'68', '68020', 'ALBANIA'), (
					'68', '68051', 'ARATOCA'), (
					'68', '68077', 'BARBOSA'), (
					'68', '68079', 'BARICHARA'), (
					'68', '68081', 'BARRANCABERMEJA'), (
					'68', '68092', 'BETULIA'), (
					'68', '68101', 'BOL�VAR'), (
					'68', '68121', 'CABRERA'), (
					'68', '68132', 'CALIFORNIA'), (
					'68', '68147', 'CAPITANEJO'), (
					'68', '68152', 'CARCAS�'), (
					'68', '68160', 'CEPIT�'), (
					'68', '68162', 'CERRITO'), (
					'68', '68167', 'CHARAL�'), (
					'68', '68169', 'CHARTA'), (
					'68', '68176', 'CHIMA'), (
					'68', '68179', 'CHIPAT�'), (
					'68', '68190', 'CIMITARRA'), (
					'68', '68207', 'CONCEPCI�N'), (
					'68', '68209', 'CONFINES'), (
					'68', '68211', 'CONTRATACI�N'), (
					'68', '68217', 'COROMORO'), (
					'68', '68229', 'CURIT�'), (
					'68', '68235', 'EL CARMEN DE CHUCURI'), (
					'68', '68245', 'EL GUACAMAYO'), (
					'68', '68250', 'EL PE��N'), (
					'68', '68255', 'EL PLAY�N'), (
					'68', '68264', 'ENCINO'), (
					'68', '68266', 'ENCISO'), (
					'68', '68271', 'FLORI�N'), (
					'68', '68276', 'FLORIDABLANCA'), (
					'68', '68296', 'GAL�N'), (
					'68', '68298', 'G�MBITA'), (
					'68', '68307', 'GIR�N'), (
					'68', '68318', 'GUACA'), (
					'68', '68320', 'GUADALUPE'), (
					'68', '68322', 'GUAPOT�'), (
					'68', '68324', 'GUAVAT�'), (
					'68', '68327', 'G�EPSA'), (
					'68', '68344', 'HATO'), (
					'68', '68368', 'JES�S MAR�A'), (
					'68', '68370', 'JORD�N'), (
					'68', '68377', 'LA BELLEZA'), (
					'68', '68385', 'LAND�ZURI'), (
					'68', '68397', 'LA PAZ'), (
					'68', '68406', 'LEBRIJA'), (
					'68', '68418', 'LOS SANTOS'), (
					'68', '68425', 'MACARAVITA'), (
					'68', '68432', 'M�LAGA'), (
					'68', '68444', 'MATANZA'), (
					'68', '68464', 'MOGOTES'), (
					'68', '68468', 'MOLAGAVITA'), (
					'68', '68498', 'OCAMONTE'), (
					'68', '68500', 'OIBA'), (
					'68', '68502', 'ONZAGA'), (
					'68', '68522', 'PALMAR'), (
					'68', '68524', 'PALMAS DEL SOCORRO'), (
					'68', '68533', 'P�RAMO'), (
					'68', '68547', 'PIEDECUESTA'), (
					'68', '68549', 'PINCHOTE'), (
					'68', '68572', 'PUENTE NACIONAL'), (
					'68', '68573', 'PUERTO PARRA'), (
					'68', '68575', 'PUERTO WILCHES'), (
					'68', '68615', 'RIONEGRO'), (
					'68', '68655', 'SABANA DE TORRES'), (
					'68', '68669', 'SAN ANDR�S'), (
					'68', '68673', 'SAN BENITO'), (
					'68', '68679', 'SAN GIL'), (
					'68', '68682', 'SAN JOAQU�N'), (
					'68', '68684', 'SAN JOS� DE MIRANDA'), (
					'68', '68686', 'SAN MIGUEL'), (
					'68', '68689', 'SAN VICENTE DE CHUCUR�'), (
					'68', '68705', 'SANTA B�RBARA'), (
					'68', '68720', 'SANTA HELENA DEL OP�N'), (
					'68', '68745', 'SIMACOTA'), (
					'68', '68755', 'SOCORRO'), (
					'68', '68770', 'SUAITA'), (
					'68', '68773', 'SUCRE'), (
					'68', '68780', 'SURAT�'), (
					'68', '68820', 'TONA'), (
					'68', '68855', 'VALLE DE SAN JOS�'), (
					'68', '68861', 'V�LEZ'), (
					'68', '68867', 'VETAS'), (
					'68', '68872', 'VILLANUEVA'), (
					'68', '68895', 'ZAPATOCA'), (
					'70', '70001', 'SINCELEJO'), (
					'70', '70110', 'BUENAVISTA'), (
					'70', '70124', 'CAIMITO'), (
					'70', '70204', 'COLOS�'), (
					'70', '70215', 'COROZAL'), (
					'70', '70221', 'COVE�AS'), (
					'70', '70230', 'CHAL�N'), (
					'70', '70233', 'EL ROBLE'), (
					'70', '70235', 'GALERAS'), (
					'70', '70265', 'GUARANDA'), (
					'70', '70400', 'LA UNI�N'), (
					'70', '70418', 'LOS PALMITOS'), (
					'70', '70429', 'MAJAGUAL'), (
					'70', '70473', 'MORROA'), (
					'70', '70508', 'OVEJAS'), (
					'70', '70523', 'PALMITO'), (
					'70', '70670', 'SAMPU�S'), (
					'70', '70678', 'SAN BENITO ABAD'), (
					'70', '70702', 'SAN JUAN DE BETULIA'), (
					'70', '70708', 'SAN MARCOS'), (
					'70', '70713', 'SAN ONOFRE'), (
					'70', '70717', 'SAN PEDRO'), (
					'70', '70742', 'SAN LUIS DE SINC�'), (
					'70', '70771', 'SUCRE'), (
					'70', '70820', 'SANTIAGO DE TOL�'), (
					'70', '70823', 'SAN JOS� DE TOLUVIEJO'), (
					'73', '73001', 'IBAGU�'), (
					'73', '73024', 'ALPUJARRA'), (
					'73', '73026', 'ALVARADO'), (
					'73', '73030', 'AMBALEMA'), (
					'73', '73043', 'ANZO�TEGUI'), (
					'73', '73055', 'ARMERO'), (
					'73', '73067', 'ATACO'), (
					'73', '73124', 'CAJAMARCA'), (
					'73', '73148', 'CARMEN DE APICAL�'), (
					'73', '73152', 'CASABIANCA'), (
					'73', '73168', 'CHAPARRAL'), (
					'73', '73200', 'COELLO'), (
					'73', '73217', 'COYAIMA'), (
					'73', '73226', 'CUNDAY'), (
					'73', '73236', 'DOLORES'), (
					'73', '73268', 'ESPINAL'), (
					'73', '73270', 'FALAN'), (
					'73', '73275', 'FLANDES'), (
					'73', '73283', 'FRESNO'), (
					'73', '73319', 'GUAMO'), (
					'73', '73347', 'HERVEO'), (
					'73', '73349', 'HONDA'), (
					'73', '73352', 'ICONONZO'), (
					'73', '73408', 'L�RIDA'), (
					'73', '73411', 'L�BANO'), (
					'73', '73443', 'SAN SEBASTI�N DE MARIQUITA'), (
					'73', '73449', 'MELGAR'), (
					'73', '73461', 'MURILLO'), (
					'73', '73483', 'NATAGAIMA'), (
					'73', '73504', 'ORTEGA'), (
					'73', '73520', 'PALOCABILDO'), (
					'73', '73547', 'PIEDRAS'), (
					'73', '73555', 'PLANADAS'), (
					'73', '73563', 'PRADO'), (
					'73', '73585', 'PURIFICACI�N'), (
					'73', '73616', 'RIOBLANCO'), (
					'73', '73622', 'RONCESVALLES'), (
					'73', '73624', 'ROVIRA'), (
					'73', '73671', 'SALDA�A'), (
					'73', '73675', 'SAN ANTONIO'), (
					'73', '73678', 'SAN LUIS'), (
					'73', '73686', 'SANTA ISABEL'), (
					'73', '73770', 'SU�REZ'), (
					'73', '73854', 'VALLE DE SAN JUAN'), (
					'73', '73861', 'VENADILLO'), (
					'73', '73870', 'VILLAHERMOSA'), (
					'73', '73873', 'VILLARRICA'), (
					'76', '76001', 'CALI'), (
					'76', '76020', 'ALCAL�'), (
					'76', '76036', 'ANDALUC�A'), (
					'76', '76041', 'ANSERMANUEVO'), (
					'76', '76054', 'ARGELIA'), (
					'76', '76100', 'BOL�VAR'), (
					'76', '76109', 'BUENAVENTURA'), (
					'76', '76111', 'GUADALAJARA DE BUGA'), (
					'76', '76113', 'BUGALAGRANDE'), (
					'76', '76122', 'CAICEDONIA'), (
					'76', '76126', 'CALIMA'), (
					'76', '76130', 'CANDELARIA'), (
					'76', '76147', 'CARTAGO'), (
					'76', '76233', 'DAGUA'), (
					'76', '76243', 'EL �GUILA'), (
					'76', '76246', 'EL CAIRO'), (
					'76', '76248', 'EL CERRITO'), (
					'76', '76250', 'EL DOVIO'), (
					'76', '76275', 'FLORIDA'), (
					'76', '76306', 'GINEBRA'), (
					'76', '76318', 'GUACAR�'), (
					'76', '76364', 'JAMUND�'), (
					'76', '76377', 'LA CUMBRE'), (
					'76', '76400', 'LA UNI�N'), (
					'76', '76403', 'LA VICTORIA'), (
					'76', '76497', 'OBANDO'), (
					'76', '76520', 'PALMIRA'), (
					'76', '76563', 'PRADERA'), (
					'76', '76606', 'RESTREPO'), (
					'76', '76616', 'RIOFR�O'), (
					'76', '76622', 'ROLDANILLO'), (
					'76', '76670', 'SAN PEDRO'), (
					'76', '76736', 'SEVILLA'), (
					'76', '76823', 'TORO'), (
					'76', '76828', 'TRUJILLO'), (
					'76', '76834', 'TULU�'), (
					'76', '76845', 'ULLOA'), (
					'76', '76863', 'VERSALLES'), (
					'76', '76869', 'VIJES'), (
					'76', '76890', 'YOTOCO'), (
					'76', '76892', 'YUMBO'), (
					'76', '76895', 'ZARZAL'), (
					'81', '81001', 'ARAUCA'), (
					'81', '81065', 'ARAUQUITA'), (
					'81', '81220', 'CRAVO NORTE'), (
					'81', '81300', 'FORTUL'), (
					'81', '81591', 'PUERTO ROND�N'), (
					'81', '81736', 'SARAVENA'), (
					'81', '81794', 'TAME'), (
					'85', '85001', 'YOPAL'), (
					'85', '85010', 'AGUAZUL'), (
					'85', '85015', 'CH�MEZA'), (
					'85', '85125', 'HATO COROZAL'), (
					'85', '85136', 'LA SALINA'), (
					'85', '85139', 'MAN�'), (
					'85', '85162', 'MONTERREY'), (
					'85', '85225', 'NUNCH�A'), (
					'85', '85230', 'OROCU�'), (
					'85', '85250', 'PAZ DE ARIPORO'), (
					'85', '85263', 'PORE'), (
					'85', '85279', 'RECETOR'), (
					'85', '85300', 'SABANALARGA'), (
					'85', '85315', 'S�CAMA'), (
					'85', '85325', 'SAN LUIS DE PALENQUE'), (
					'85', '85400', 'T�MARA'), (
					'85', '85410', 'TAURAMENA'), (
					'85', '85430', 'TRINIDAD'), (
					'85', '85440', 'VILLANUEVA'), (
					'86', '86001', 'MOCOA'), (
					'86', '86219', 'COL�N'), (
					'86', '86320', 'ORITO'), (
					'86', '86568', 'PUERTO AS�S'), (
					'86', '86569', 'PUERTO CAICEDO'), (
					'86', '86571', 'PUERTO GUZM�N'), (
					'86', '86573', 'PUERTO LEGU�ZAMO'), (
					'86', '86749', 'SIBUNDOY'), (
					'86', '86755', 'SAN FRANCISCO'), (
					'86', '86757', 'SAN MIGUEL'), (
					'86', '86760', 'SANTIAGO'), (
					'86', '86865', 'VALLE DEL GUAMUEZ'), (
					'86', '86885', 'VILLAGARZ�N'), (
					'88', '88001', 'SAN ANDR�S'), (
					'88', '88564', 'PROVIDENCIA'), (
					'91', '91001', 'LETICIA'), (
					'91', '91263', 'EL ENCANTO'), (
					'91', '91405', 'LA CHORRERA'), (
					'91', '91407', 'LA PEDRERA'), (
					'91', '91430', 'LA VICTORIA'), (
					'91', '91460', 'MIRIT� - PARAN�'), (
					'91', '91530', 'PUERTO ALEGR�A'), (
					'91', '91536', 'PUERTO ARICA'), (
					'91', '91540', 'PUERTO NARI�O'), (
					'91', '91669', 'PUERTO SANTANDER'), (
					'91', '91798', 'TARAPAC�'), (
					'94', '94001', 'IN�RIDA') ) AS X(IdDepartamento, Codigo, Nombre)
		LEFT OUTER JOIN dbo.Municipio AS MU
			ON X.IdDepartamento = MU.IdDepartamento
			   AND X.Codigo = MU.Codigo
		WHERE MU.Id IS NULL

		PRINT '|->	Registros insertados en la tabla dbo.Municipio: ' + CAST(@@ROWCOUNT AS VARCHAR)
	END
END TRY
BEGIN CATCH
	PRINT '|->	Error insertando en tabla dbo.Municipio: ' + ERROR_MESSAGE()
END CATCH

GO