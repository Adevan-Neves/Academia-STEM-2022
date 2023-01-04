CREATE TABLE piloto(
	 breve           char(5) NOT NULL
	,matricula       char(5) NOT NULL
	,data_nascimento date NOT NULL
	,nome            varchar(30) NOT NULL
	,cep             char(8) NOT NULL
	,rua             varchar(30)
	,numero          int
	,logradouro      varchar(30)
	,CONSTRAINT pk_piloto PRIMARY KEY (breve)
);


CREATE TABLE aluno(
	 matricula       char(5) NOT NULL
	,total_horas     int
	,data_nascimento date NOT NULL
	,nome            varchar(30) NOT NULL
	,cep             char(8) NOT NULL
	,rua             varchar(30)
	,numero          int
	,logradouro      varchar(30)
	,CONSTRAINT pk_aluno PRIMARY KEY (matricula)
);

CREATE TABLE instrutor(
	 breve      char(5) NOT NULL
	,nome_curso varchar(30) NOT NULL
	,data_diploma date
	,instituicao varchar(30)
	,CONSTRAINT pk_instrutor PRIMARY KEY (breve)
	,CONSTRAINT fk_instrutor 
		FOREIGN KEY (breve) REFERENCES piloto(breve)
);

CREATE TABLE faz_saída(
	 aluno_matricula char(5) NOT NULL
	,instrutor_breve char(5) NOT NULL
	,horario_chegada time    NOT NULL 
	,horario_saida   time    NOT NULL
	,data_saida      date    NOT NULL
	,parecer         TEXT    NOT NULL
	,CONSTRAINT pk_faz 
		PRIMARY KEY (aluno_matricula,instrutor_breve)
	,CONSTRAINT fk_aluno 
		FOREIGN KEY (aluno_matricula) REFERENCES aluno(matricula)
	,CONSTRAINT fk_instrutor
		FOREIGN KEY (instrutor_breve) REFERENCES instrutor(breve)
);

-- Inserção de valores nas tabelas

INSERT INTO 
	piloto(breve,matricula,data_nascimento,nome,cep) 
		VALUES ('12345','54321','2003-03-13',
				    'Adevan Neves','12345678'),
			   ('34523','33333','2012-06-21',
				    'Paulo Cativo','87654321'),
				('44444','55555','2004-01-01','Camilly Baptista','99999999');
			
INSERT INTO piloto VALUES ('44443','11111','2004-05-21',
				    'Emilly Atem','12345678','Rua de tal',23,'La la'),
				          ('12245','54321','2003-03-13',
				    'Italo Thiago','00045678','Rua qualquer',29,'Le le');

SELECT * FROM piloto;


INSERT INTO aluno 
	VALUES ('48272',23,'2001-12-29',
				'Arthur Gustavo','73653535',
				'Rua do Java',12,'Ao lado de tal'),
		   ('12345',1,'2001-12-28',
				'Felipe Peres','73653535',
				'Rua do Kotlin',11,'Ao lado de tal');

SELECT * FROM aluno;				    
				

INSERT INTO instrutor VALUES ('44444','Licomp Navigation',
							  '2022-08-20','UEA internacional'),
							  ('12245','Agiota Times',
							  '2021-08-12','UEA internacional'),
							  ('44443','ECA 2022',
							  '2021-02-12','STEM internacional');
							 
SELECT * FROM instrutor;	
							 
CREATE TABLE faz_saída(
	 aluno_matricula char(5) NOT NULL
	,instrutor_breve char(5) NOT NULL
	,horario_chegada time    NOT NULL 
	,horario_saida   time    NOT NULL
	,data_saida      date    NOT NULL
	,parecer         TEXT    NOT NULL
	

ALTER TABLE faz_saída 
	ADD CONSTRAINT chk_horario 
		CHECK(horario_chegada>=horario_saida);
							 
INSERT INTO faz_saída VALUES 
							 ('48272','44443','16:12:23',
		'12:30:12','2022-12-01','Aluno não fez isso, nem aquilo');

SELECT * FROM faz_saída;
