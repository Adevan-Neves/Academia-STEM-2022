CREATE TABLE livro(
	 isbn         char(13) NOT NULL
	,titutlo      varchar(30) NOT NULL
	,editora      varchar(30)
	,local_edicao varchar(30)
	,CONSTRAINT pk_livro PRIMARY KEY (isbn)
);

CREATE TABLE autor(
	 livro_isbn  char(13) NOT NULL
	,nome        varchar(30) NOT NULL
	,CONSTRAINT fk_livro FOREIGN KEY (livro_isbn)
		REFERENCES livro(isbn)
	,CONSTRAINT pk_autor PRIMARY KEY (livro_isbn,nome)
);

CREATE TABLE palavra_chave(
	 livro_isbn    char(13) NOT NULL
	,palavra_chave varchar(30) NOT NULL
	,CONSTRAINT fk_livro FOREIGN KEY (livro_isbn)
		REFERENCES livro(isbn)
	,CONSTRAINT pk_palavra_chave PRIMARY KEY (livro_isbn,palavra_chave)
);

CREATE TABLE associado(
	 cod        int NOT NULL 
	,nome       varchar(30) NOT NULL
	,rua        varchar(30)
	,cep        char(8) NOT NULL
	,numero     int
	,logradouro varchar(30)
	,CONSTRAINT pk_associado PRIMARY KEY (cod)
);

CREATE TABLE associado_empresta_livro(
	 associado_cod   int NOT NULL
	,livro_isbn      char(13) NOT NULL
	,data_emprestimo date
	,CONSTRAINT fk_associado 
		FOREIGN KEY (associado_cod)
			REFERENCES associado(cod)
	,CONSTRAINT fk_livro 
		FOREIGN KEY (livro_isbn)
			REFERENCES livro(isbn)
	,CONSTRAINT pk_empresta 
		PRIMARY KEY (associado_cod,livro_isbn)
);

-- inserção de valores para aprimoramento
	
-- escrevi o nome da tabela título inaqueado, renomeando

ALTER TABLE livro
	RENAME COLUMN titutlo TO titulo;

INSERT INTO livro(isbn,titulo,editora)
	VALUES ('4444444444444','Uma breve história','STEM Editora'),
		   ('5555555555555','Cálculo com Geometria','STEM Editora'),
		   ('6666666666666','Java, como Programar','Editora Livre');
		  
INSERT INTO livro VALUES ('1111111111111','Era uma vez','Novatec'),
						 ('9999999999999','Banda Malta','Editora Livre');
						
INSERT INTO livro VALUES ('7777777777777','Banda Malta','Editora Livre','Manaus');

SELECT * FROM livro;


INSERT INTO autor VALUES ('1111111111111','Emilly Atem'),
						 ('9999999999999','Italo Thiago'),
						 ('5555555555555','Paulo Cativo');

SELECT * FROM autor;

-- tentando inserir um autor que não tem livro cadastrado;

INSERT INTO autor VALUES ('0000000000000','Camilly Baptista');

INSERT INTO palavra_chave VALUES ('6666666666666','POO'),
								 ('6666666666666','Herança'),
								 ('6666666666666','Abstração'),
								 ('9999999999999','Anjos'),
								 ('9999999999999','Esperança'),
								 ('5555555555555','Limite');

SELECT * FROM palavra_chave;

INSERT INTO associado(cep,cod,nome)
	VALUES ('12345678',23,'Adevan Neves'),
		   ('87654321',12,'Emilly Atem'),
		   ('72501928',20,'Paulo Cativo'),
		   ('11501726',45,'Yago Feitoza');
		  
INSERT INTO associado 
	VALUES (100,'Italo Thiago','Rua de tal'
			,'66666666',89,'Ao lado de tal');

SELECT * FROM associado;
		
		
INSERT INTO 
	associado_empresta_livro 
		VALUES (23,'6666666666666'),
			   (12,'5555555555555');
			  
INSERT INTO 			  
	associado_empresta_livro
		VALUES (23,'1111111111111'),
		       (100,'6666666666666');
		      
INSERT INTO 			  
	associado_empresta_livro
		VALUES (12,'1111111111111','2022-04-20'),
		       (12,'6666666666666','2022-07-12');
			  
SELECT * FROM associado_empresta_livro;
		
