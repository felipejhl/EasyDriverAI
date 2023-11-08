-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2023-09-30 22:44:06 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_adm (
    id_adm               INTEGER NOT NULL,
    nome                 VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    endereço             VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    num_telefone         NUMBER NOT NULL,
    cargo                VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    salario              NUMBER,
    nm_funcao            VARCHAR2(10) NOT NULL,
    t_usuario_id_cliente INTEGER NOT NULL
);

ALTER TABLE t_adm ADD CONSTRAINT tab_funcionarios_pk PRIMARY KEY ( id_adm );

CREATE TABLE t_cnh (
    id_cnh        INTEGER NOT NULL,
    cd_rg         NUMBER NOT NULL,
    cd_cpf        NUMBER NOT NULL,
    nm_sexo       VARCHAR2(10) NOT NULL,
    dt_nascimento NUMBER NOT NULL,
    nm_tipo       VARCHAR2(10) NOT NULL,
    cnh_id        NUMBER NOT NULL
);

ALTER TABLE t_cnh ADD CONSTRAINT t_cnh_pk PRIMARY KEY ( id_cnh );

ALTER TABLE t_cnh ADD CONSTRAINT cnh_pk UNIQUE ( cnh_id );

CREATE TABLE t_cnpj (
    id_cnpj              INTEGER NOT NULL,
    nm_empresa           CHAR(20) NOT NULL,
    t_empresa_id_empresa INTEGER NOT NULL
);

CREATE UNIQUE INDEX cnpj__idx ON
    t_cnpj (
        t_empresa_id_empresa
    ASC );

ALTER TABLE t_cnpj ADD CONSTRAINT cnpj_pk PRIMARY KEY ( id_cnpj );

CREATE TABLE t_empresa (
    id_empresa            INTEGER NOT NULL,
    nm_da_empresa         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    cnpj                  NUMBER NOT NULL,
    end_comercial         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    cd_contato_empresa    NUMBER NOT NULL,
    nm_de_contato_empresa NUMBER,
    "nm_e-mail"           VARCHAR2(30) NOT NULL
);

ALTER TABLE t_empresa ADD CONSTRAINT tab_empresas_pk PRIMARY KEY ( id_empresa );

CREATE TABLE t_endereco (
    id_endereco          INTEGER NOT NULL,
    nm_estado            CHAR(2) NOT NULL,
    nm_cidade            VARCHAR2(20) NOT NULL,
    nm_logradouro        VARCHAR2(30),
    cd_cep               NUMBER NOT NULL,
    t_usuario_id_cliente INTEGER NOT NULL,
    t_empresa_id_empresa INTEGER NOT NULL
);

CREATE UNIQUE INDEX tab_endereco__idx ON
    t_endereco (
        t_empresa_id_empresa
    ASC );

CREATE UNIQUE INDEX tab_endereco__idxv1 ON
    t_endereco (
        t_usuario_id_cliente
    ASC );

CREATE TABLE t_ia (
    id_ia            INTEGER NOT NULL,
    nm_name          VARCHAR2(30) NOT NULL,
    nm_tipo          CHAR(10) NOT NULL,
    nm_descricao     VARCHAR2(1000) NOT NULL,
    cd_algoritmo     INTEGER NOT NULL,
    nm_framework     VARCHAR2(10000) NOT NULL,
    nm_linguagem     VARCHAR2(10000) NOT NULL,
    nm_criacao       VARCHAR2(10000) NOT NULL,
    dt_ultimaatt     DATE NOT NULL,
    nm_desenvolvedor CHAR(10000) NOT NULL,
    nm_parametros    VARCHAR2(10000) NOT NULL,
    nm_desempenho    VARCHAR2(10000) NOT NULL,
    nm_integracoes   VARCHAR2(10000) NOT NULL,
    nm_status        CHAR(1000) NOT NULL,
    tab_ia_id        NUMBER NOT NULL
);

ALTER TABLE t_ia ADD CONSTRAINT t_ia_pk PRIMARY KEY ( id_ia );

ALTER TABLE t_ia ADD CONSTRAINT tab_ia_pk UNIQUE ( tab_ia_id );

CREATE TABLE t_pagamentos (
    id_pagamentos        INTEGER NOT NULL,
    id_reserva           VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    id_cliente           INTEGER NOT NULL,
    dt_pagamento         DATE NOT NULL,
    vl_pagamento         NUMBER NOT NULL,
    nm_metodo_pagamento  CHAR 
--  WARNING: CHAR size not specified 
     NOT NULL,
    nm_status            CHAR(10) NOT NULL,
    t_usuario_id_cliente INTEGER NOT NULL,
    tab_ia_tab_ia_id     NUMBER NOT NULL,
    id_ia                INTEGER NOT NULL
);

ALTER TABLE t_pagamentos ADD CONSTRAINT tab_pagamentos_pk PRIMARY KEY ( id_pagamentos );

CREATE TABLE t_reservas (
    id_reserva       VARCHAR2(15) NOT NULL,
    id_cliente       INTEGER NOT NULL,
    dt_inicio        DATE NOT NULL,
    dt_termino       DATE NOT NULL,
    id_carro         INTEGER NOT NULL,
    vl_precototal    NUMBER NOT NULL,
    nm_statusreserva VARCHAR2(50) NOT NULL,
    tab_ia_tab_ia_id NUMBER NOT NULL,
    id_ia            INTEGER NOT NULL
);

ALTER TABLE t_reservas ADD CONSTRAINT tab_reservas_pk PRIMARY KEY ( id_reserva );

CREATE TABLE t_telefone (
    id_telefone          NUMBER NOT NULL,
    nm_tipo              CHAR(15) NOT NULL,
    cd_numero            NUMBER NOT NULL,
    t_usuario_id_cliente INTEGER NOT NULL,
    t_empresa_id_empresa INTEGER NOT NULL
);

CREATE UNIQUE INDEX nr_telefone__idx ON
    t_telefone (
        t_usuario_id_cliente
    ASC );

CREATE UNIQUE INDEX nr_telefone__idxv1 ON
    t_telefone (
        t_empresa_id_empresa
    ASC );

ALTER TABLE t_telefone ADD CONSTRAINT nr_telefone_pk PRIMARY KEY ( id_telefone );

CREATE TABLE t_usuario (
    id_cliente       INTEGER NOT NULL,
    nm_nome          VARCHAR2(1000) NOT NULL,
    endereço         VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
     NOT NULL,
    num_telefone     NUMBER NOT NULL,
    dt_nasc          NUMBER NOT NULL,
    cnh              NUMBER NOT NULL,
    "nm_e-mail"      VARCHAR2(30) NOT NULL,
    cnh_cnh_id       NUMBER NOT NULL,
    tab_ia_tab_ia_id NUMBER NOT NULL,
    id_cnh           INTEGER NOT NULL,
    id_ia            INTEGER NOT NULL
);

CREATE UNIQUE INDEX tab_usuarios__idx ON
    t_usuario (
        cnh_cnh_id
    ASC );

CREATE UNIQUE INDEX tab_usuarios__idxv1 ON
    t_usuario (
        tab_ia_tab_ia_id
    ASC );

CREATE UNIQUE INDEX tab_usuarios__idxv2 ON
    t_usuario (
        id_cnh
    ASC );

CREATE UNIQUE INDEX tab_usuarios__idxv2v1 ON
    t_usuario (
        id_ia
    ASC );

ALTER TABLE t_usuario ADD CONSTRAINT tab_pessoas_fisicas_pk PRIMARY KEY ( id_cliente );

CREATE TABLE t_veiculos (
    id_veiculo           INTEGER NOT NULL,
    nm_modelo            CHAR(30) NOT NULL,
    nm_tipo              CHAR(30) NOT NULL,
    cd_ano               DATE NOT NULL,
    nm_montadora         CHAR(30) NOT NULL,
    nm_disponibilidade   CHAR(30) NOT NULL,
    nm_detalhes          VARCHAR2(10000) NOT NULL,
    t_empresa_id_empresa INTEGER,
    tab_ia_tab_ia_id     NUMBER NOT NULL,
    id_ia                INTEGER NOT NULL,
    vl_kmrodado          NUMBER NOT NULL,
    t_wib_id_wibprevend  INTEGER NOT NULL
);

ALTER TABLE t_veiculos ADD CONSTRAINT tab_veiculos_pk PRIMARY KEY ( id_veiculo );

CREATE TABLE t_wib (
    id_wibprevend INTEGER NOT NULL,
    "nm_wib(ia)"  VARCHAR2(10000) NOT NULL,
    nm_scan       VARCHAR2(50) NOT NULL,
    nm_historico  VARCHAR2(1000) NOT NULL,
    nm_basedados  VARCHAR2(1000) NOT NULL,
    nm_relatorio  VARCHAR2(10000) NOT NULL
);

ALTER TABLE t_wib ADD CONSTRAINT t_wib_pk PRIMARY KEY ( id_wibprevend );

ALTER TABLE t_adm
    ADD CONSTRAINT t_adm_t_usuario_fk FOREIGN KEY ( t_usuario_id_cliente )
        REFERENCES t_usuario ( id_cliente );

ALTER TABLE t_cnpj
    ADD CONSTRAINT t_cnpj_t_empresa_fk FOREIGN KEY ( t_empresa_id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_empresa_fk FOREIGN KEY ( t_empresa_id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_endereco_t_usuario_fk FOREIGN KEY ( t_usuario_id_cliente )
        REFERENCES t_usuario ( id_cliente );

ALTER TABLE t_pagamentos
    ADD CONSTRAINT t_pagamentos_t_ia_fk FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( tab_ia_id );

ALTER TABLE t_pagamentos
    ADD CONSTRAINT t_pagamentos_t_usuario_fk FOREIGN KEY ( t_usuario_id_cliente )
        REFERENCES t_usuario ( id_cliente );

ALTER TABLE t_reservas
    ADD CONSTRAINT t_reservas_t_ia_fk FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( tab_ia_id );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_empresa_fk FOREIGN KEY ( t_empresa_id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_telefone
    ADD CONSTRAINT t_telefone_t_usuario_fk FOREIGN KEY ( t_usuario_id_cliente )
        REFERENCES t_usuario ( id_cliente );

ALTER TABLE t_usuario
    ADD CONSTRAINT t_usuario_t_cnh_fk FOREIGN KEY ( id_cnh )
        REFERENCES t_cnh ( cnh_id );

ALTER TABLE t_usuario
    ADD CONSTRAINT t_usuario_t_ia_fk FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( tab_ia_id );

ALTER TABLE t_veiculos
    ADD CONSTRAINT t_veiculos_t_empresa_fk FOREIGN KEY ( t_empresa_id_empresa )
        REFERENCES t_empresa ( id_empresa );

ALTER TABLE t_veiculos
    ADD CONSTRAINT t_veiculos_t_ia_fk FOREIGN KEY ( id_ia )
        REFERENCES t_ia ( tab_ia_id );

ALTER TABLE t_veiculos
    ADD CONSTRAINT t_veiculos_t_wib_fk FOREIGN KEY ( t_wib_id_wibprevend )
        REFERENCES t_wib ( id_wibprevend );

CREATE SEQUENCE t_cnh_cnh_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_cnh_cnh_id_trg BEFORE
    INSERT ON t_cnh
    FOR EACH ROW
    WHEN ( new.cnh_id IS NULL )
BEGIN
    :new.cnh_id := t_cnh_cnh_id_seq.nextval;
END;
/

CREATE SEQUENCE t_ia_tab_ia_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER t_ia_tab_ia_id_trg BEFORE
    INSERT ON t_ia
    FOR EACH ROW
    WHEN ( new.tab_ia_id IS NULL )
BEGIN
    :new.tab_ia_id := t_ia_tab_ia_id_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             9
-- ALTER TABLE                             27
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
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
-- CREATE SEQUENCE                          2
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
-- ERRORS                                   7
-- WARNINGS                                 1
