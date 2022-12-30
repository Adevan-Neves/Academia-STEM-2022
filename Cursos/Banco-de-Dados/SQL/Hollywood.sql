CREATE TABLE estudio(
	 nome          varchar(30) NOT NULL
	,dono          varchar(30)
	,data_fundacao date
	,faturamento   float
	,CONSTRAINT pk_estudio PRIMARY KEY (nome)
);

CREATE TABLE filme(
	 nome           varchar(30) NOT NULL
	,tempo_producao int
	,ano_lancamento int
	,copyright      varchar(40)
	,custo          float
	,CONSTRAINT pk_filme PRIMARY KEY (nome)
);

CREATE TYPE sexo AS ENUM('M','F','O');

CREATE TABLE ator(
	 inss            char(10) NOT NULL 
	,nome_artistico  varchar(30)
	,nacionalidade   varchar(30)
	,genero sexo
	,data_nascimento date
	,CONSTRAINT pk_inss PRIMARY KEY (inss)
);

CREATE TABLE papel(
	 ator_inss char(10) NOT NULL 
	,papel varchar(30) NOT NULL
	,CONSTRAINT fk_ator 
		FOREIGN KEY (ator_inss) REFERENCES ator(inss)
	,CONSTRAINT pk_papel PRIMARY KEY (ator_inss,papel)
);

CREATE TABLE estudio_produz_filme(
	 estudio_nome varchar(30) NOT NULL
	,filme_nome varchar(30) NOT NULL
	,CONSTRAINT pk_produz PRIMARY KEY (estudio_nome,filme_nome)
	,CONSTRAINT fk_estudio 
		FOREIGN KEY (estudio_nome) REFERENCES estudio(nome)
	,CONSTRAINT fk_filme
		FOREIGN KEY (filme_nome) REFERENCES filme(nome)
);


CREATE TABLE atua(
	 filme_nome varchar(30) NOT NULL
	,ator_inss char(10) NOT NULL
	,cache_trabalho float
	,personagem varchar(30)
	,CONSTRAINT pk_atua PRIMARY KEY (filme_nome,ator_inss)
);

-- inserção de elementos nas tabelas

INSERT INTO estudio VALUES 
	('Dreamworks','Fulano de tal','2012-08-12',8000.34),
	('Marvel','Ciclano de tal','2002-05-22',90000.34),
	('vivi','Beltrano de tal','2003-10-7',8.34);

SELECT * FROM estudio;

INSERT INTO filme VALUES
	('Java, a vingança',23,2022,'9t82xn872dk',400000.0),
	('Tiago, o retorno',34,2021,'1t82bn872dp',400000.0);

SELECT * FROM filme;
	
INSERT INTO ator(inss,nome_artistico,genero,data_nascimento)
	VALUES ('0123456789','Patrick Estrela','M','2018-05-20'),
		   ('9876543210','Adevan Neves','M','2007-04-10');
	
INSERT INTO ator VALUES ('2222222222','Emilly Atem','Brasileira','F','2009-04-10');

SELECT * FROM ator;

INSERT INTO papel VALUES ('2222222222','Game Developer'),
						 ('2222222222','Ilustradora'),
						 ('9876543210','Javeiro');
	
INSERT INTO estudio_produz_filme VALUES ('Marvel','Java, a vingança'),
										('vivi','Tiago, o retorno');

SELECT * FROM estudio_produz_filme;


INSERT INTO atua VALUES ('Java, a vingança','2222222222',3000.0,'Ilustradora Vitoria'),
						('Tiago, o retorno','2222222222',2348.9,'Game Developer'),
						('Java, a vingança','9876543210',3590.28,'Javeiro');

SELECT * FROM atua;





