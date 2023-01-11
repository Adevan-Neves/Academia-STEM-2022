CREATE TYPE tipo_filme AS ENUM ('Aventura','Drama','Ficção','Terror');

CREATE TABLE fita(
	 id            int NOT NULL
	,armazenamento float
	,CONSTRAINT    pk_fita
		PRIMARY KEY (id)
);

CREATE TABLE filme(
	 id        int NOT NULL
	,titulo    varchar(50) NOT NULL
	,categoria tipo_filme NOT NULL 
	,fita_id   int 
	,CONSTRAINT fk_fita_filme
		FOREIGN KEY (fita_id) REFERENCES fita(id)
);

ALTER TABLE filme ADD CONSTRAINT pk_filme PRIMARY KEY (id);

CREATE TABLE ator(
	 id              int NOT NULL
	,nome            varchar(50)
	,data_nascimento date
	,CONSTRAINT pk_ator PRIMARY KEY (id)
);

CREATE TABLE cliente(
	 id        int NOT NULL
	,prenome   varchar(30) NOT NULL
	,sobrenome varchar(30) NOT NULL
	,telefone  char(9) NOT NULL 
	,rua varchar(50)
	,cep char(8) NOT NULL
	,numero int NOT NULL
	,logradouro varchar(50)
	,CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE cliente_aluga_fita(
	 fita_id int NOT NULL
	,cliente_id int NOT NULL
	,data_aluga date
	,CONSTRAINT pk_aluga PRIMARY KEY (fita_id,cliente_id)
	,CONSTRAINT fk_cliente_aluga 
		FOREIGN KEY (cliente_id) REFERENCES cliente(id)
	,CONSTRAINT fk_fita_aluga 
		FOREIGN KEY (fita_id) REFERENCES fita(id)
);

CREATE TABLE ator_estrela_filme(
	 filme_id int NOT NULL
	,ator_id int NOT  NULL
	,CONSTRAINT  pk_estrela PRIMARY KEY (filme_id, ator_id)
	,CONSTRAINT  fk_ator_estrela 
		FOREIGN KEY (ator_id) REFERENCES ator(id)
	,CONSTRAINT fk_filme_estrela
		FOREIGN KEY (filme_id) REFERENCES filme(id)
);









