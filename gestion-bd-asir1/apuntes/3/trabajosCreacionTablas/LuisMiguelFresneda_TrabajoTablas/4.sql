--4.sql

--INSERTAMOS NUEVOS DATOS DEL COLOR DE COCHES
INSERT INTO COLORDEUNCOCHE (BASTIDOR, COLOR, FECHA_DESDE, FECHA_HASTA) 
VALUES ('WAUZZZ8EZ1A000000', 'ROJO', TO_DATE('01/01/2011', 'dd/MM/YYYY'), 
TO_DATE('01/06/2011', 'dd/MM/YYYY'));

INSERT INTO COLORDEUNCOCHE (BASTIDOR, COLOR, FECHA_DESDE) 
VALUES ('WAUZZZ8EZ1A000000', 'VERDE', TO_DATE('01/06/2011', 'dd/MM/YYYY'));

--INSERTAMOS NUEVOS DATOS REFERENTES A LAS REVISIONES
--SE ENTIENDE QUE LA REVISION SERA A CIERTA FECHA (HEMOS ELEGIDO 12 MESES) O A LOS KMS QUE TOQUE
--SE SABE QUE NO ES UNA REVISION SI EL COCHE TIENE 0 KMS, SINO QUE ES NUEVO Y LE TOCARA 
--PASAR LA REVISION TAMBIEN EN UNA FECHA O KMS 
--LAS ITV'S NO LLEVAN KMS, SOLO FECHAS, SI ES NUEVO LLEVA LA FECHA DE COMPRA
--PRIMERO LOS MANTENIMIENTOS
INSERT INTO REVISION_MANT (BASTIDOR,  FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WVWZZZ3BZ2E000005', 
TO_DATE('01/01/2012', 'dd/MM/YYYY'),  TO_DATE('01/01/2013', 'dd/MM/YYYY'), 0, 15000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WVWZZZ3BZ2E000005',  
TO_DATE('01/03/2012', 'dd/MM/YYYY'),  TO_DATE('01/03/2013', 'dd/MM/YYYY'), 15000, 30000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WAUZZZ4F4AN000532',  
TO_DATE('01/02/2012', 'dd/MM/YYYY'),  TO_DATE('01/02/2013', 'dd/MM/YYYY'), 0, 15000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WAUZZZ4F4AN000532',  
TO_DATE('01/04/2012', 'dd/MM/YYYY'),  TO_DATE('01/04/2013', 'dd/MM/YYYY'), 15000, 30000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WAUZZZ4F4AN000532',  
TO_DATE('01/10/2012', 'dd/MM/YYYY'),  TO_DATE('01/10/2013', 'dd/MM/YYYY'), 30000, 45000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WAUZZZ8EZ1A000000',  
TO_DATE('01/01/2011', 'dd/MM/YYYY'),  TO_DATE('01/01/2012', 'dd/MM/YYYY'), 0, 20000);

INSERT INTO REVISION_MANT (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA, 
KMS_REVISION, KMS_PROXIMA) VALUES ('WAUZZZ8EZ1A000000',  
TO_DATE('01/04/2011', 'dd/MM/YYYY'),  TO_DATE('01/04/2012', 'dd/MM/YYYY'), 20000, 40000);

--AHORA LAS ITV'S
INSERT INTO REVISION_ITV (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA) 
VALUES ('WVWZZZ3BZ2E000005', TO_DATE('01/01/2012', 'dd/MM/YYYY'),  
TO_DATE('01/01/2016', 'dd/MM/YYYY'));

INSERT INTO REVISION_ITV (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA) 
VALUES ('WAUZZZ4F4AN000532', TO_DATE('01/02/2012', 'dd/MM/YYYY'),  
TO_DATE('01/02/2016', 'dd/MM/YYYY'));

INSERT INTO REVISION_ITV (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA) 
VALUES ('WAUZZZ8EZ1A000000', TO_DATE('01/01/2011', 'dd/MM/YYYY'),  
TO_DATE('01/01/2015', 'dd/MM/YYYY'));

INSERT INTO REVISION_ITV (BASTIDOR, FECHA_REVISION, FECHA_PROXIMA) 
VALUES ('WAUZZZ3FZAN008855', TO_DATE('01/06/2010', 'dd/MM/YYYY'),  
TO_DATE('01/06/2014', 'dd/MM/YYYY'));

--INSERTAMOS LOS ASIENTOS CALEFACTADOS AL COCHE INDICADO
UPDATE ACABADODEUNCOCHE SET ASIENTOS_CALEF = 'SI' WHERE BASTIDOR = 'WVWZZZ3BZ2E000005';


