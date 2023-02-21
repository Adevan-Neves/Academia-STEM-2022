-- DML


INSERT INTO horario 
	VALUES ('110','segunda','08:00:23','19:43:22'),
		   ('111','segunda','10:30:23','21:43:22'),
		   ('112','terça','05:10:13','22:23:52'),
		   ('113','quarta','18:00:23','20:10:22'),
		   ('114','sexta','10:05:10','18:23:17');

INSERT INTO restaurante 
	VALUES ('220',20,'123456789','AM','Manaus',
			'44444444','Rua de tal',23,'Bairro de tal'),
		   ('221',30,'123456789','AM','Manaus','33333333','Rua de tal',23,'Bairro de tal'),
		   ('222',0,'223457781','RJ','Rio de Janeiro','44444444','Rua de tal',23,'Bairro de tal');
		  
INSERT INTO cliente(nome,cod,data_nasc,telefone,uf,cep)
	VALUES ('Camilly Baptista','330','2000-07-09','123456789','AM','44444444'),
		   ('Paulo Cativo','331','1990-02-19','987654321','RJ','14444446'),
		   ('Italo Thiago','332','2004-04-29','987654321','LS','24414445'),
		   ('Emilly Atem','333','2004-05-24','987654321','TY','84444443'),
		   ('Victória Cristina','334','2004-01-20','987654321','RJ','14444446');
		  
INSERT INTO cliente VALUES ('335','Yago Feitosa',
		'2013-07-09','123456789',
		FALSE,'AA','Top de Jk',
		'24414445','Rua de fulano de tal',23,'Rita lee FC');
	
INSERT INTO conta_rede_social 
	VALUES ('440','rest_la','naoteconto','naosei@email.com','220'),
		   ('441','rest_li','naoteconto2','naosei@email.com','220'),
		   ('442','rest_ad','supresa','2naosei4seila@email.com','221'),
		   ('443','rest_op','3naoteconto3','3naosei3@email3.com','222');

INSERT INTO funcionario(cod,data_admissao,
						nome,fsexo,data_nasc ,
						salario,uf,cep)
		VALUES ('550','2022-01-12','Cássia','F',
				'2001-08-20',1600.0,'AM','24414445'),
			   ('551','2019-01-22','Cynthia','F',
				'2002-11-22',2600.0,'RJ','14414475'),
			   ('552','2021-11-16','Italo Thiago','M',
				'2003-12-09',600.0,'TY','24414445');
--Gerentes
INSERT INTO funcionario (cod,data_admissao,
						nome,fsexo,data_nasc ,
						salario,uf,cep,rest_cod,data_inicio_gerencia)
		VALUES ('553','2020-01-26','Beatriz','F',
				'2002-02-19',2300.0,'AM','44414449','220','2021-01-26'),
			   ('554','2022-07-25','Hungria','M',
				'2002-02-09',2200.0,'AM','14484449','220','2023-01-18'),
			   ('555','2020-08-30','Guilherme','M',
				'2002-02-19',2300.0,'AM','44414449','221','2021-08-30'),
			   ('556','2023-01-10','Guilherme','M',
				'2002-02-19',2300.0,'AM','44414449','222','2023-01-11');

CREATE TABLE IF NOT EXISTS funcionario_trabalha_restaurante(
	 func_cod char(3) NOT NULL
	,rest_cod char(3) NOT NULL
	,CONSTRAINT pk_trabalha PRIMARY KEY (func_cod,rest_cod)
	,CONSTRAINT fk_func_trabalha 
		FOREIGN KEY (func_cod) REFERENCES funcionario(cod)
	,CONSTRAINT fk_rest_trabalha
		FOREIGN KEY (rest_cod) REFERENCES restaurante(cod)
);

INSERT INTO funcionario_trabalha_restaurante 
	VALUES ('553','220'),
		   ('554','220'),
		   ('555','221'),
		   ('556','222'),
		   ('550','220'),
		   ('551','222');

INSERT INTO motoboy
	VALUES ('550','123456789',0.8,23,false),
	       ('551','423456786',0.9,18,false),
	       ('553','444444444',0.1,10,FALSE);
-- ALTER TABLE moto ADD CONSTRAINT pk_moto PRIMARY KEY (num_placa);
-- ALTER TABLE moto ADD CONSTRAINT 
--	fk_mtboy_cod_moto FOREIGN KEY (mtboy_cod,mtboy_cnh)
--	REFERENCES motoboy(func_cod,cnh);

INSERT INTO moto
	VALUES ('1234567','KI','OP 6789',2022,'Laranja',10,'550','123456789'),
	       ('1234568','KI','OP 6789',2022,'Vermelho',10,'550','123456789'),
	       ('8888888','TUX','ZY 300',2009,'Verde',30,'551','423456786'),
	       ('5555555','EEEE','ZY 400',2020,'Azul',16,'553','444444444');
	      
INSERT INTO restaurante_tem_horario
	VALUES ('110','220'),
		   ('112','220'),
		   ('113','221'),
		   ('114','222');

INSERT INTO delivery  
	VALUES ('660',230.0,'2016-06-22 19:10:25','330'),
		   ('661',100.0,'2022-07-22 14:11:22','330'),
		   ('662',230.0,'2020-07-12 11:08:11','332');

INSERT INTO entrega 
	VALUES ('550','123456789','330','660','2022-12-22 09:11:01'),
		   ('550','123456789','330','661','2022-12-22 09:11:02'),
		   ('553','444444444','332','662','2023-01-14 09:11:02');
