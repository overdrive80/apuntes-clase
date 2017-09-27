-- 2.sql

--INTRODUCCION DE DATOS

-- SE INTRODUCEN LAS CATEGORIAS
INSERT INTO CATEGORIA(TIPO, PRECIO_DIA) VALUES('FUNCTIONAL', 90);
INSERT INTO CATEGORIA(TIPO, PRECIO_DIA) VALUES('ADVANCE', 120);
INSERT INTO CATEGORIA(TIPO, PRECIO_DIA) VALUES('PRESTIGE', 200);

--SE DAN DE ALTA LOS COCHES
INSERT INTO COCHE(BASTIDOR, MARCA, MODELO, MATRICULA, COLOR_ACTUAL, TIPO_CATEGORIA) 
VALUES ('WAUZZZ8EZ1A000000', 'MERCEDES', 'CLASE B', '1234ABC', 'NEGRO', 'PRESTIGE');

INSERT INTO COCHE(BASTIDOR, MARCA, MODELO, MATRICULA, COLOR_ACTUAL, TIPO_CATEGORIA) 
VALUES ('WVWZZZ3BZ2E000005', 'RENAULT', 'FLUENZE', '1111ABC', 'AZUL', 'ADVANCE');

INSERT INTO COCHE(BASTIDOR, MARCA, MODELO, MATRICULA, COLOR_ACTUAL, TIPO_CATEGORIA) 
VALUES ('WAUZZZ4F4AN000532', 'RENAULT', 'KANGOO', '4321ABC', 'BLANCO', 'ADVANCE');

INSERT INTO COCHE(BASTIDOR, MARCA, MODELO, MATRICULA, COLOR_ACTUAL, TIPO_CATEGORIA) 
VALUES ('WAUZZZ3FZAN008855', 'RENAULT', 'MODUS', '4444ABC', 'GRIS', 'ADVANCE');

--SE DAN DE ALTA LOS CLIENTES
INSERT INTO CLIENTE(DNI_NIE_PASAPORTE, NOMBRE, APELLIDOS, EDAD, GENERO) 
VALUES ('55555555C', 'PEDRO', 'MART�NEZ MART�NEZ', 32, 'H');

INSERT INTO CLIENTE(DNI_NIE_PASAPORTE, NOMBRE, APELLIDOS, EDAD) 
VALUES ('45454545D', 'JUAN', 'P�REZ P�REZ', 42);

INSERT INTO CLIENTE(DNI_NIE_PASAPORTE, NOMBRE, APELLIDOS, EDAD) 
VALUES ('11111111X', 'MANOLO', 'BOMBO BOMBO', 54);

--SE DAN DE ALTA LOS ACABADOS DE LOS COCHES
--Como por default es NO, solo se indican los SI
INSERT INTO ACABADODEUNCOCHE(BASTIDOR, CLIMATIZADOR, NAVEGADOR, CAMBIO_AUTOMATICO) 
VALUES('WAUZZZ8EZ1A000000', 'SI', 'SI', 'SI');

INSERT INTO ACABADODEUNCOCHE(BASTIDOR, NAVEGADOR, BLUETOOHT, TECHO_SOLAR) 
VALUES('WVWZZZ3BZ2E000005', 'SI', 'SI', 'SI');

INSERT INTO ACABADODEUNCOCHE(BASTIDOR, AIRE_ACONDICIONADO, BLUETOOHT, MP3) 
VALUES('WAUZZZ4F4AN000532', 'SI', 'SI', 'SI');

INSERT INTO ACABADODEUNCOCHE(BASTIDOR, AIRE_ACONDICIONADO, BLUETOOHT, MP3) 
VALUES('WAUZZZ3FZAN008855', 'SI', 'SI', 'SI');

--SE REALIZAN LOS ALQUILERES

INSERT INTO ALQUILER(ID_ALQUILER, BASTIDOR, DNI_CLIENTE, DELEGACION_RECOGER, 
DELEGACION_DEJAR, KMS_INICIALES, KMS_FINALES, FECHA_INICIO, FECHA_FIN) 
VALUES(1, 'WAUZZZ8EZ1A000000', '55555555C', 'MADRID', 'MADRID', 111000, 111200, 
TO_DATE('01/01/2012 09:00', 'dd/MM/YYYY hh24:mi'), 
TO_DATE('01/02/2013 10:00', 'dd/MM/YYYY hh24:mi'));

INSERT INTO ALQUILER(ID_ALQUILER, BASTIDOR, DNI_CLIENTE, DELEGACION_RECOGER, 
DELEGACION_DEJAR, KMS_INICIALES, KMS_FINALES, FECHA_INICIO, FECHA_FIN) 
VALUES(2, 'WVWZZZ3BZ2E000005', '55555555C', 'MADRID', 'MADRID', 60000, 60100, 
TO_DATE('01/03/2012 08:00', 'dd/MM/YYYY hh24:mi'), 
TO_DATE('01/04/2013 13:00', 'dd/MM/YYYY hh24:mi'));

INSERT INTO ALQUILER(ID_ALQUILER, BASTIDOR, DNI_CLIENTE, DELEGACION_RECOGER, 
DELEGACION_DEJAR, KMS_INICIALES, KMS_FINALES, FECHA_INICIO, FECHA_FIN, DESCUENTO) 
VALUES(3, 'WAUZZZ4F4AN000532', '45454545D', 'MADRID', 'SEVILLA', 85000, 90000, 
TO_DATE('01/03/2012 08:00', 'dd/MM/YYYY hh24:mi'), 
TO_DATE('01/04/2013 13:00', 'dd/MM/YYYY hh24:mi'), 5);

--SE ENTIENDE QUE, AUNQUE MANOLO BOMBO BOMBO AUN NO HAYA DEVUELTO EL COCHE, 
--TIENE UNA FECHA DE ENTREGA PREVISTA, ES DECIR, ES OBLIGATORIO INDICAR FECHA 
--DE ENTREGA AUNQUE LUEGO SE PUEDA AMPLIAR
INSERT INTO ALQUILER(ID_ALQUILER, BASTIDOR, DNI_CLIENTE, DELEGACION_RECOGER, 
DELEGACION_DEJAR, KMS_INICIALES, FECHA_INICIO, FECHA_FIN) 
VALUES(4, 'WAUZZZ3FZAN008855', '11111111X', 'BARCELONA', 'BARCELONA', 25000, 
TO_DATE('01/03/2013 12:00', 'dd/MM/YYYY hh24:mi'), 
TO_DATE('01/08/2013 12:00', 'dd/MM/YYYY hh24:mi'));