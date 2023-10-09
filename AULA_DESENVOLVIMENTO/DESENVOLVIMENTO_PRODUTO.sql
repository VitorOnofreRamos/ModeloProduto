CREATE TABLE bairro (
    id               NUMBER NOT NULL,
    descricao        VARCHAR2(50),
    id_cidade        NUMBER,
    cidade_id        NUMBER(50) NOT NULL,
    cidade_descricao VARCHAR2(50) NOT NULL
);

CREATE UNIQUE INDEX bairro__idx ON
    bairro (
        cidade_id
    ASC,
        cidade_descricao
    ASC );

ALTER TABLE bairro ADD CONSTRAINT bairro_pk PRIMARY KEY ( id );

CREATE TABLE cargo (
    id        NUMBER NOT NULL,
    descricao VARCHAR2 
--  ERROR: VARCHAR2 size not specified 

);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( id );

CREATE TABLE cidade (
    id        NUMBER(50) NOT NULL,
    descricao VARCHAR2(50) NOT NULL,
    id_estado NUMBER,
    estado_id NUMBER NOT NULL
);

CREATE UNIQUE INDEX cidade__idx ON
    cidade (
        estado_id
    ASC );

ALTER TABLE cidade ADD CONSTRAINT cidade_pk PRIMARY KEY ( id,
                                                          descricao );

CREATE TABLE cliente (
    id                           NUMBER NOT NULL,
    id_sexo                      NUMBER,
    id_tipo                      NUMBER,
    "CPF/CNPJ"                   NUMBER,
    email                        VARCHAR2(50),
    id_endereco                  NUMBER,
    tipo_sexo_id                 NUMBER NOT NULL,
    id_estado_civil              NUMBER,
    tipo_cliente_id              NUMBER NOT NULL,
    endereco_cliente_id          NUMBER NOT NULL,
    estado_civil_estado_civil_id NUMBER NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        tipo_sexo_id
    ASC );

CREATE UNIQUE INDEX cliente__idxv1 ON
    cliente (
        tipo_cliente_id
    ASC );

CREATE UNIQUE INDEX cliente__idxv2 ON
    cliente (
        estado_civil_estado_civil_id
    ASC );

CREATE UNIQUE INDEX cliente__idxv3 ON
    cliente (
        endereco_cliente_id
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id );

CREATE TABLE departamento (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id );

CREATE TABLE endereco_cliente (
    id         NUMBER NOT NULL,
    id_regiao  NUMBER,
    cep        NUMBER,
    logradouro VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    numero     NUMBER,
    referencia VARCHAR2 
--  ERROR: VARCHAR2 size not specified 
    ,
    regiao_id  NUMBER NOT NULL
);

CREATE UNIQUE INDEX endereco_cliente__idx ON
    endereco_cliente (
        regiao_id
    ASC );

ALTER TABLE endereco_cliente ADD CONSTRAINT endereco_cliente_pk PRIMARY KEY ( id );

CREATE TABLE estado (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50),
    id_pais   NUMBER,
    pais_id   NUMBER NOT NULL
);

CREATE UNIQUE INDEX estado__idx ON
    estado (
        pais_id
    ASC );

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( id );

CREATE TABLE estado_civil (
    id              NUMBER,
    descricao       VARCHAR2(50),
    estado_civil_id NUMBER NOT NULL
);

ALTER TABLE estado_civil ADD CONSTRAINT estado_civil_pk PRIMARY KEY ( estado_civil_id );

CREATE TABLE funcionario (
    id                NUMBER NOT NULL,
    nome              VARCHAR2(50),
    data_nasc         DATE,
    id_departamento   NUMBER,
    id_cargo          NUMBER,
    id_departamento_2 NUMBER,
    salario           NUMBER,
    departamento_id   NUMBER NOT NULL,
    cargo_id          NUMBER NOT NULL,
    data_contrat      DATE
);

CREATE UNIQUE INDEX funcionario__idx ON
    funcionario (
        departamento_id
    ASC );

CREATE UNIQUE INDEX funcionario__idxv1 ON
    funcionario (
        cargo_id
    ASC );

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY ( id );

CREATE TABLE item_venda (
    id_produto    NUMBER,
    id_venda      NUMBER,
    id            NUMBER,
    item_venda_id NUMBER NOT NULL
);

ALTER TABLE item_venda ADD CONSTRAINT item_venda_pk PRIMARY KEY ( item_venda_id );

CREATE TABLE marca (
    id        NUMBER,
    descricao unknown 
--  ERROR: Datatype UNKNOWN is not allowed 
    ,
    marca_id  NUMBER NOT NULL
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( marca_id );

CREATE TABLE pais (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50)
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id );

CREATE TABLE produto (
    id                           NUMBER NOT NULL,
    descricao                    VARCHAR2(50),
    id_tipo                      NUMBER,
    id_marca                     NUMBER,
    tipo_produto_tipo_produto_id NUMBER NOT NULL,
    marca_marca_id               NUMBER NOT NULL
);

CREATE UNIQUE INDEX produto__idx ON
    produto (
        tipo_produto_tipo_produto_id
    ASC );

CREATE UNIQUE INDEX produto__idxv1 ON
    produto (
        marca_marca_id
    ASC );

ALTER TABLE produto ADD CONSTRAINT produto_pk PRIMARY KEY ( id );

CREATE TABLE regiao (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50),
    id_bairro NUMBER,
    bairro_id NUMBER NOT NULL
);

CREATE UNIQUE INDEX regiao__idx ON
    regiao (
        bairro_id
    ASC );

ALTER TABLE regiao ADD CONSTRAINT regiao_pk PRIMARY KEY ( id );

CREATE TABLE relation_15 (
    venda_id                 NUMBER NOT NULL,
    item_venda_item_venda_id NUMBER NOT NULL
);

ALTER TABLE relation_15 ADD CONSTRAINT relation_15_pk PRIMARY KEY ( venda_id,
                                                                    item_venda_item_venda_id );

CREATE TABLE relation_16 (
    produto_id               NUMBER NOT NULL,
    item_venda_item_venda_id NUMBER NOT NULL
);

ALTER TABLE relation_16 ADD CONSTRAINT relation_16_pk PRIMARY KEY ( produto_id,
                                                                    item_venda_item_venda_id );

CREATE TABLE tipo_cliente (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50)
);

ALTER TABLE tipo_cliente ADD CONSTRAINT tipo_cliente_pk PRIMARY KEY ( id );

CREATE TABLE tipo_produto (
    id              NUMBER,
    descricao       VARCHAR2(50),
    tipo_produto_id NUMBER NOT NULL
);

ALTER TABLE tipo_produto ADD CONSTRAINT tipo_produto_pk PRIMARY KEY ( tipo_produto_id );

CREATE TABLE tipo_sexo (
    id        NUMBER NOT NULL,
    descricao VARCHAR2(50)
);

ALTER TABLE tipo_sexo ADD CONSTRAINT tipo_sexo_pk PRIMARY KEY ( id );

CREATE TABLE venda (
    id             NUMBER NOT NULL,
    id_cliente     NUMBER,
    id_vendedor    NUMBER,
    data_venda     DATE,
    data_entrega   DATE,
    id_item_venda  NUMBER,
    cliente_id     NUMBER NOT NULL,
    funcionario_id NUMBER NOT NULL
);

CREATE UNIQUE INDEX venda__idx ON
    venda (
        cliente_id
    ASC );

CREATE UNIQUE INDEX venda__idxv1 ON
    venda (
        funcionario_id
    ASC );

ALTER TABLE venda ADD CONSTRAINT venda_pk PRIMARY KEY ( id );

ALTER TABLE bairro
    ADD CONSTRAINT bairro_cidade_fk FOREIGN KEY ( cidade_id,
                                                  cidade_descricao )
        REFERENCES cidade ( id,
                            descricao );

ALTER TABLE cidade
    ADD CONSTRAINT cidade_estado_fk FOREIGN KEY ( estado_id )
        REFERENCES estado ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_endereco_cliente_fk FOREIGN KEY ( endereco_cliente_id )
        REFERENCES endereco_cliente ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_estado_civil_fk FOREIGN KEY ( estado_civil_estado_civil_id )
        REFERENCES estado_civil ( estado_civil_id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_tipo_cliente_fk FOREIGN KEY ( tipo_cliente_id )
        REFERENCES tipo_cliente ( id );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_tipo_sexo_fk FOREIGN KEY ( tipo_sexo_id )
        REFERENCES tipo_sexo ( id );

ALTER TABLE endereco_cliente
    ADD CONSTRAINT endereco_cliente_regiao_fk FOREIGN KEY ( regiao_id )
        REFERENCES regiao ( id );

ALTER TABLE estado
    ADD CONSTRAINT estado_pais_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_cargo_fk FOREIGN KEY ( cargo_id )
        REFERENCES cargo ( id );

ALTER TABLE funcionario
    ADD CONSTRAINT funcionario_departamento_fk FOREIGN KEY ( departamento_id )
        REFERENCES departamento ( id );

ALTER TABLE produto
    ADD CONSTRAINT produto_marca_fk FOREIGN KEY ( marca_marca_id )
        REFERENCES marca ( marca_id );

ALTER TABLE produto
    ADD CONSTRAINT produto_tipo_produto_fk FOREIGN KEY ( tipo_produto_tipo_produto_id )
        REFERENCES tipo_produto ( tipo_produto_id );

ALTER TABLE regiao
    ADD CONSTRAINT regiao_bairro_fk FOREIGN KEY ( bairro_id )
        REFERENCES bairro ( id );

ALTER TABLE relation_15
    ADD CONSTRAINT relation_15_item_venda_fk FOREIGN KEY ( item_venda_item_venda_id )
        REFERENCES item_venda ( item_venda_id );

ALTER TABLE relation_15
    ADD CONSTRAINT relation_15_venda_fk FOREIGN KEY ( venda_id )
        REFERENCES venda ( id );

ALTER TABLE relation_16
    ADD CONSTRAINT relation_16_item_venda_fk FOREIGN KEY ( item_venda_item_venda_id )
        REFERENCES item_venda ( item_venda_id );

ALTER TABLE relation_16
    ADD CONSTRAINT relation_16_produto_fk FOREIGN KEY ( produto_id )
        REFERENCES produto ( id );

ALTER TABLE venda
    ADD CONSTRAINT venda_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( id );

ALTER TABLE venda
    ADD CONSTRAINT venda_funcionario_fk FOREIGN KEY ( funcionario_id )
        REFERENCES funcionario ( id );

CREATE SEQUENCE estado_civil_estado_civil_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER estado_civil_estado_civil_id BEFORE
    INSERT ON estado_civil
    FOR EACH ROW
    WHEN ( new.estado_civil_id IS NULL )
BEGIN
    :new.estado_civil_id := estado_civil_estado_civil_id.nextval;
END;
/

CREATE SEQUENCE item_venda_item_venda_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER item_venda_item_venda_id_trg BEFORE
    INSERT ON item_venda
    FOR EACH ROW
    WHEN ( new.item_venda_id IS NULL )
BEGIN
    :new.item_venda_id := item_venda_item_venda_id_seq.nextval;
END;
/

CREATE SEQUENCE marca_marca_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER marca_marca_id_trg BEFORE
    INSERT ON marca
    FOR EACH ROW
    WHEN ( new.marca_id IS NULL )
BEGIN
    :new.marca_id := marca_marca_id_seq.nextval;
END;
/

CREATE SEQUENCE tipo_produto_tipo_produto_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipo_produto_tipo_produto_id BEFORE
    INSERT ON tipo_produto
    FOR EACH ROW
    WHEN ( new.tipo_produto_id IS NULL )
BEGIN
    :new.tipo_produto_id := tipo_produto_tipo_produto_id.nextval;
END;
/