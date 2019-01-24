-- Generado por Oracle SQL Developer Data Modeler 18.2.0.179.0806
--   en:        2019-01-24 12:41:37 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE confirmaciones (
    entregado         CHAR(2),
    leido            CHAR(2),
    idmensajegrupo   INTEGER,
    usuario          VARCHAR2(15)
);

CREATE TABLE contactos (
    usuario    VARCHAR2(15) NOT NULL,
    contacto   VARCHAR2(15) NOT NULL
);

ALTER TABLE contactos ADD CONSTRAINT contactos_pk PRIMARY KEY ( usuario,
                                                                contacto );

CREATE TABLE formapartede (
    usuario   VARCHAR2(15) NOT NULL,
    idgrupo   INTEGER NOT NULL
);

ALTER TABLE formapartede ADD CONSTRAINT formapartede_pk PRIMARY KEY ( usuario,
                                                                      idgrupo );

CREATE TABLE grupo (
    idgrupo       INTEGER NOT NULL,
    usuario       VARCHAR2(15) NOT NULL,
    nombregrupo   VARCHAR2(255)
);

ALTER TABLE grupo ADD CONSTRAINT grupo_pk PRIMARY KEY ( idgrupo );

CREATE TABLE mensajedirecto (
    idmensajedirecto   INTEGER NOT NULL,
    texto              VARCHAR2(1024),
    remitente          VARCHAR2(15) NOT NULL,
    destinatario       VARCHAR2(15),
    entregado           CHAR(2),
    leido              CHAR(2)
);

ALTER TABLE mensajedirecto
    ADD CHECK ( destinatario IS NULL
                AND entregado IS NULL
                AND leido IS NULL );

ALTER TABLE mensajedirecto ADD CONSTRAINT mensajedirecto_pk PRIMARY KEY ( idmensajedirecto );

CREATE TABLE mensajegrupo (
    idmensajegrupo   INTEGER NOT NULL,
    texto            VARCHAR2(1024),
    idgrupo          INTEGER,
    remitente        VARCHAR2(15)
);

ALTER TABLE mensajegrupo ADD CONSTRAINT mensajegrupo_pk PRIMARY KEY ( idmensajegrupo );

CREATE TABLE usuario (
    telefono   VARCHAR2(15) NOT NULL,
    nick       VARCHAR2(255)
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( telefono );

ALTER TABLE confirmaciones
    ADD CONSTRAINT confirmaciones_mensajegrupo_fk FOREIGN KEY ( idmensajegrupo )
        REFERENCES mensajegrupo ( idmensajegrupo );

ALTER TABLE confirmaciones
    ADD CONSTRAINT confirmaciones_usuario_fk FOREIGN KEY ( usuario )
        REFERENCES usuario ( telefono );

ALTER TABLE contactos
    ADD CONSTRAINT contactos_usuario_fk FOREIGN KEY ( usuario )
        REFERENCES usuario ( telefono );

ALTER TABLE contactos
    ADD CONSTRAINT contactos_usuario_fkv1 FOREIGN KEY ( contacto )
        REFERENCES usuario ( telefono );

ALTER TABLE formapartede
    ADD CONSTRAINT formapartede_grupo_fk FOREIGN KEY ( idgrupo )
        REFERENCES grupo ( idgrupo );

ALTER TABLE formapartede
    ADD CONSTRAINT formapartede_usuario_fk FOREIGN KEY ( usuario )
        REFERENCES usuario ( telefono );

ALTER TABLE grupo
    ADD CONSTRAINT grupo_usuario_fk FOREIGN KEY ( usuario )
        REFERENCES usuario ( telefono );

ALTER TABLE mensajedirecto
    ADD CONSTRAINT mensajedirecto_usuario_fk FOREIGN KEY ( destinatario )
        REFERENCES usuario ( telefono );

ALTER TABLE mensajedirecto
    ADD CONSTRAINT mensajedirecto_usuario_fkv2 FOREIGN KEY ( remitente )
        REFERENCES usuario ( telefono );

ALTER TABLE mensajegrupo
    ADD CONSTRAINT mensajegrupo_grupo_fk FOREIGN KEY ( idgrupo )
        REFERENCES grupo ( idgrupo );

ALTER TABLE mensajegrupo
    ADD CONSTRAINT mensajegrupo_usuario_fk FOREIGN KEY ( remitente )
        REFERENCES usuario ( telefono );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
