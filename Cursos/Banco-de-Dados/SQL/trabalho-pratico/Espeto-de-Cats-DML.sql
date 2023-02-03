-- 1 Inserindo informações de horários

INSERT INTO horario 
	VALUES ('11111','Segunda','10:00:30','21:45:00')
		  ,('77777','Terça','09:30:00','22:00:00')
		  ,('22222','Quarta','07:00:00','22:00:01')
		  ,('33333','Quinta','08:00:35','20:00:00')
		  ,('44444','Sexta','07:00:00','21:45:00')
 		  ,('55555','Segunda','08:00:00','18:00:00')
		  ,('66666','Terça','10:00:00','23:56:34')
		  ,('88888','Quarta','08:12:12','22:00:35')
		  ,('99999','Quinta','08:34:35','21:10:28')
		  ,('88889','Sexta','07:00:00','21:45:00');
SELECT *  FROM horario;

-- 1 Inserindo informações de horários

-- 2 Inserindo informações de funcionários

INSERT INTO funcionario
	VALUES ('11111','Garçom',
			'456327871','2022-09-24',
			'Mateus Neves','M',1300.0)
		    ,('22222','Atendente',
			'763535252','2012-02-13',
			'Mateus Neves','M',2500.0);
INSERT  INTO 
	funcionario
	(cod,telefone,nome,cargo,data_admissao,sexo,salario,cidade,cep)
VALUES ('44444','191736353',
		'Cássia',
		'Motoboy','2023-01-24',
		'F',2400.0,'Manaus','12345678'),
		('33333','790726352',
		'Italo',
		'Garçom','2022-08-30',
		'O',600.0,'Ilha do Chat GPT','76346672'),
		('55555','690026854',
		'Emilly',
		'Atendente','2023-01-10',
		'F',1200.0,'Manaus','52305677');

INSERT INTO funcionario
	VALUES ('88888','Motoboy',
			'456327871','2021-07-20',
			'Paulo Cativo','M',4600.0,
			'Apartamento N','Amazonas',
			'Manaus','46464646','Rua de tal',
			23,'Riacho do Java');
		
SELECT * FROM funcionario;
-- 2 Inserindo informações de funcionários
	
-- 3 Inserindo informações de motoboy

INSERT INTO motoboy 
	VALUES ('88888','123456789',0.8,TRUE,20),
	       ('44444','987654321',0.2,FALSE,10);
SELECT * FROM motoboy;
	     
-- 3 Inserindo informações de motoboy

-- 4 Inserindo informações de clientes

INSERT INTO Cliente(cod,nome,telefone,cartao)
	VALUES ('12345','Yago','191736353','6799-0');

INSERT INTO cliente 
	VALUES ('54321','Letícia',
			'191736353','178799-3',
			TRUE,120,
			'Ao lado de Mercadinho tal','Amazonas',
			'Manaus','55555555',
			'Rua de fulano de tal',20,
			'Bairro 10');

		
INSERT INTO cliente
(cod, nome, telefone, cartao, status, pontos_fidelidade)
VALUES('12321', 'Camilly', '565656566', '37474074212', true, 12);
	
SELECT * FROM cliente;
-- 4 Inserindo informações de clientes


-- 5 Inserindo informações de pedidos
INSERT INTO pedido
(cod, valor, forma_pg)
VALUES ('11111', 230.0, 'Pix')
		,('22222',10.3,'Cartão')
		,('33333',100.35,'Dinheiro')
		,('44444',50.35,'Pix');

SELECT * FROM pedido;
-- 5 Inserindo informações de pedidos
		

-- 6 Inserindo informações de restaurantes

INSERT INTO restaurante
(cod, nome, qtd_estrelas, telefone, estado, cidade, cep, rua, numero, bairro, complemento, gerente_cod, gerente_data_inicio)
VALUES('15151', 'Espeto de Cats - Filial SP', 4, '777777777', 
'São Paulo', 'São Paulo', '59813456', 'Rua de tal', 
15, 'Bairro de tal', 'Ao lado de fulano de tal', '11111', '2023-09-12'),
('15152', 'Espeto de Cats - Filial AM', 5, '44444444', 
'Amazonas', 'Manaus', '27873458', 'Rua de tal 2', 
19, 'Bairro de tal 2', 'Ao lado de fulano de tal 2', '55555', '2020-09-12');
-- Verificando se a constraint check em estrelas está ativa (deve dar erro)
INSERT INTO restaurante(cod,nome,qtd_estrelas,telefone,estado,gerente_cod,gerente_data_inicio)
	VALUES ('15153','Espeto de Cats - Filial RJ',7,'665473452','Amazonas','33333','2022-03-12');

DELETE FROM restaurante WHERE cod = '15153';

ALTER TABLE restaurante DROP CONSTRAINT ck_estrelas;
ALTER TABLE restaurante ADD CONSTRAINT ck_estrelas CHECK (qtd_estrelas>0 AND qtd_estrelas<=5);

SELECT * FROM restaurante;

INSERT INTO restaurante(cod,nome,qtd_estrelas,telefone,estado,gerente_cod,gerente_data_inicio)
	VALUES ('15153','Espeto de Cats - Filial RJ',1,'665473452','Amazonas','33333','2022-03-12');

SELECT * FROM restaurante;

-- 7 Inserindo informações de restaurantes


-- 8 inserindo informações de Conta Rede Social

INSERT INTO ContaRedeSocial 
	VALUES ('77771','espeto_de_cats_1',
			'naoteconto','qualquercoisa@seuemail.com',
			'nadaaver.com','15153'),
			('77772','espeto_de_cats_2',
			'senha','AAAqualquercoisa@seuemail.com',
			'nadaaver.com','15151'),
			('77773','espeto_de_cats_3',
			'lalasenha','coisa@seuemail.com',
			'nadaaver.com','15152');

SELECT * FROM contaredesocial;

-- 8 inserindo informações de Conta Rede Social


--  9 inserindo informações de refeição

INSERT INTO refeicao VALUES ('Frango','15151'),
							('Sopa','15151'),
							('Churrasco','15151'),
							('Tambaqui','15151'),
							('Sopa','15153'),
							('Salada','15153'),
							('Churrasco','15153');

SELECT * FROM refeicao;

-- 9 Inserindo informações de refeição

--  10 Inserindo informações de Funcionário trabalha em restaurante

INSERT INTO ftrabalhar VALUES ('55555','15151'),
							  ('88888','15151'),--Motoboy
							  ('44444','15153'),--Motoboy
							  ('33333','15152'),
							  ('22222','15153'),
							  ('88888','15152');--Motoboy
SELECT * FROM ftrabalhar;

-- 11 Inserindo informações de Funcionário trabalha em restaurante


-- 12 Inserindo informações de Restaurante tem horário

INSERT INTO rtemh (restaurante_cod,horario_cod) 
	VALUES ('15151','55555'),
		   ('15151','77777'),
		   ('15151','22222'),
		   ('15151','33333'),
		   ('15151','44444'),
		   ('15152','11111'),
		   ('15152','66666'),
		   ('15152','22222'),
		   ('15152','99999'),
		   ('15152','88889');

INSERT INTO rtemh VALUES ('15153','55555'),
						 ('15153','22222'),
						 ('15153','88889');

SELECT * FROM rtemh;
		  
-- 12 Inserindo informações de Restaurante tem horário

-- 13 Inserindo informações de Moto

INSERT  INTO moto VALUES ('7878787','Yamaha',
						  'RTY-2022',23,
						  'Azul','88888',
						  '123456789'),
						 ('7878788','Suzuki',
						  'CTA-2022',13,
						  'Verde','44444',
						  '987654321'),
						 ('7878789','Honda',
						  'CTA-2022',11,
						  'Verde','44444',
						  '987654321');

SELECT * FROM moto;

-- 13 Inserindo informações de Moto

--- Inserindo informação de realiza

INSERT INTO realiza VALUES ('15152','11111','12321','2022-09-19 09:34:12'),
						   ('15152','22222','12321','2022-09-19 10:24:10'),
						   ('15153','33333','12345','2020-12-27 23:12:45'),
						   ('15153','44444','54321','2023-01-14 16:20:56');

SELECT  * FROM realiza;
						   
--- Inserindo informação de realiza

--- Inserindo informações de serve

INSERT INTO serve  VALUES ('12321','22222','33333'),
						  ('54321','11111','33333'),
						  ('12321','33333','11111');

SELECT  * FROM serve;

--- Inserindo informações de serve

--- Inserindo informações de entrega

-- Colocando pedidos só para serem entregues pelos motoboys

INSERT INTO pedido VALUES ('77777',34.1,'Cartão'),
						  ('99999',234.5,'Pix'),
						  ('66666',278.16,'Dinheiro');

INSERT  INTO entrega VALUES ('88888','123456789','77777','12321','2023-01-20 14:35:23'),
							('44444','987654321','99999','12321','1998-07-15 23:59:59'),
							('88888','123456789','66666','12345','2023-01-20 14:35:23');

SELECT * FROM entrega;

--- Inserindo informações de entrega

