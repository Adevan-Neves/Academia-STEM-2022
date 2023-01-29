CREATE SCHEMA IF NOT EXISTS espeto_de_cats;
CREATE TYPE Fcargo AS ENUM ('Atendente','Garçom','Motoboy','Cozinheiro');
CREATE TYPE Psexo AS ENUM ('F','M','O');
CREATE TYPE pg AS ENUM ('Cartão','Pix','Dinheiro');

-- Criando primeiramente as tabelas que não dependem de chave estrangeira

CREATE TABLE IF NOT EXISTS 	Horario(
	 cod            CHAR(5) PRIMARY KEY
	,dia_da_semana  VARCHAR(20) NOT NULL
	,abertura       TIME NOT NULL
	,fechamento     TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS Motoboy(
	 cod CHAR(5)     NOT NULL
	,cnh CHAR(9)     NOT NULL
	,taxa_entrega    float NOT NULL
	,entrega_noturna boolean NOT NULL
	,avaliacao       INT
	,CONSTRAINT check_taxa 
		CHECK (taxa_entrega BETWEEN 0.0 AND 1.0)
	,CONSTRAINT pk_motoboy PRIMARY  KEY (cod,cnh)
	,CONSTRAINT fk_func_mt FOREIGN KEY (cod)
		REFERENCES funcionario(cod)
);




CREATE TABLE IF NOT EXISTS Funcionario(
	 cod           CHAR(5) NOT NULL
	,cargo         Fcargo NOT NULL  DEFAULT 'Atendente'
	,telefone      CHAR(9)
	,data_admissao DATE NOT NULL
	,nome          VARCHAR(120) NOT NULL 
	,sexo          Psexo NOT NULL
	,salario       FLOAT NOT NULL
	,complemento   VARCHAR(120)
	,estado        VARCHAR(60)
	,cidade        VARCHAR(60)
	,cep           varchar(8)
	,rua           VARCHAR(60)
	,numero        INT
	,bairro        VARCHAR(60)
	,CONSTRAINT pk_func PRIMARY KEY (cod)
);

CREATE TABLE IF NOT EXISTS Cliente(
	  cod               CHAR(5) NOT NULL
	 ,nome              VARCHAR(120) NOT NULL
	 ,telefone          CHAR(9) NOT NULL
	 ,cartao            varchar(16) NOT NULL
	 ,status            boolean DEFAULT TRUE
	 ,pontos_fidelidade int
	 ,complemento       VARCHAR(120)
	 ,estado            VARCHAR(60)
	 ,cidade            VARCHAR(60)
	 ,cep               varchar(8)
	 ,rua               VARCHAR(60)
	 ,numero            INT
	 ,bairro            VARCHAR(60)
	 ,CONSTRAINT pk_cliente PRIMARY KEY (cod)
);

CREATE TABLE IF NOT EXISTS Pedido(
	 cod      char(5) NOT NULL
	,valor    float NOT NULL
	,forma_pg pg
	,CONSTRAINT pk_pedido PRIMARY KEY (cod)
);

--- Criando o restante das tabelas

CREATE TABLE IF NOT EXISTS Restaurante(
	 cod char(5) NOT NULL
	,nome varchar(120)
	,qtd_estrelas int
	,telefone char(9)
	,estado varchar(60)
	,cidade varchar(60)
	,cep char(8)
	,rua varchar(60)
	,numero int
	,bairro varchar(60)
	,complemento varchar(120)
	,gerente_cod char(5) -- antigo funcionario_cod
	,gerente_data_inicio date
	,CONSTRAINT pk_rest PRIMARY KEY (cod)
	,CONSTRAINT fk_func_rest FOREIGN KEY (gerente_cod)
		REFERENCES funcionario(cod)
	,CONSTRAINT ck_estrelas 
		CHECK (qtd_estrelas BETWEEN 0 AND 5)
);

CREATE TABLE IF NOT EXISTS ContaRedeSocial(
	 cod char(5) NOT NULL
	,login varchar(60) NOT NULL
	,senha varchar(20) NOT NULL
	,email VARCHAR(60) NOT NULL
	,site VARCHAR(60)
	,restaurante_cod char(5) NOT NULL
	,CONSTRAINT pk_conta PRIMARY KEY (cod)
	,CONSTRAINT fk_rest_conta
		FOREIGN KEY (restaurante_cod)
		REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS Refeicao(
	 refeicao varchar(20) NOT NULL
	,restaurante_cod char(5) NOT NULL
	,CONSTRAINT pk_ref PRIMARY KEY (refeicao,restaurante_cod)
	,CONSTRAINT fk_rest_ref FOREIGN KEY (restaurante_cod)
		REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS 	FtrabalhaR(
	 funcionario_cod char(5) NOT NULL
	,restaurante_cod char(5) NOT NULL
	,CONSTRAINT pk_trabalha PRIMARY KEY (funcionario_cod,restaurante_cod)
	,CONSTRAINT fk_func_trb 
		FOREIGN KEY (funcionario_cod)
		REFERENCES funcionario(cod)
	,CONSTRAINT fk_rest_trb
		FOREIGN KEY (restaurante_cod)
		REFERENCES restaurante(cod)
);


CREATE TABLE IF NOT EXISTS RtemH(
	 restaurante_cod char(5) NOT NULL
	,horario_cod char(5) NOT NULL
	,CONSTRAINT pk_tem PRIMARY KEY (restaurante_cod,horario_cod)
	,CONSTRAINT fk_rest_tem 
		FOREIGN KEY (restaurante_cod)
		REFERENCES restaurante(cod)
	,CONSTRAINT fk_hr_tem
		FOREIGN KEY (horario_cod)
		REFERENCES horario(cod)
);

CREATE TABLE IF NOT EXISTS Moto(
	 placa char(7) NOT NULL
	,marca varchar(60) NOT NULL
	,modelo varchar(60) NOT NULL
	,cilindradas int NOT NULL
	,cor varchar(20) NOT NULL
	,motoboy_cod char(5) NOT NULL
	,motoboy_cnh CHAR(9)     NOT NULL
	,CONSTRAINT pk_moto PRIMARY KEY (placa)
	,CONSTRAINT fk_mboy_mt FOREIGN KEY (motoboy_cod,motoboy_cnh)
		REFERENCES motoboy(cod,cnh)
);


CREATE TABLE IF NOT EXISTS Realiza(
	 restaurante_cod char(5) NOT NULL
	,pedido_cod char(5) NOT NULL
	,cliente_cod char(5) NOT NULL
	,data_oc timestamp -- entrada correta : TIMESTAMP '2004-10-19 10:23:54'
	,CONSTRAINT pk_realiza 
		PRIMARY KEY (restaurante_cod,pedido_cod,cliente_cod)
	,CONSTRAINT fk_rest_realiza
		FOREIGN KEY (restaurante_cod)
		REFERENCES restaurante(cod)
	,CONSTRAINT pk_ped_realiza
		FOREIGN KEY (pedido_cod)
		REFERENCES pedido(cod)
	,CONSTRAINT pk_clt_realiza
		FOREIGN KEY (cliente_cod)
		REFERENCES cliente(cod)
);


CREATE TABLE IF NOT EXISTS Serve(
	 cliente_cod char(5) NOT NULL
	,pedido_cod char(5) NOT NULL
	,funcionario_cod char(5) NOT NULL
	,CONSTRAINT pk_serve PRIMARY KEY (cliente_cod,pedido_cod,funcionario_cod)
	,CONSTRAINT fk_clt_serve 
	 FOREIGN KEY (cliente_cod)
	 REFERENCES cliente(cod)
	,CONSTRAINT fk_ped_serve
	 FOREIGN KEY (pedido_cod)
	 REFERENCES pedido(cod)
	,CONSTRAINT fk_func_serve
	 FOREIGN KEY (funcionario_cod)
	 REFERENCES funcionario(cod)
);

CREATE TABLE IF NOT EXISTS Entrega(
	 motoboy_cod char(5) NOT NULL
	,motoboy_cnh CHAR(9) NOT NULL
	,pedido_cod char(5) NOT NULL
	,cliente_cod char(5) NOT NULL
	,data_ent timestamp
	,CONSTRAINT pk_entrega 
		PRIMARY KEY (motoboy_cod,pedido_cod,cliente_cod)
	,CONSTRAINT fk_mboy_entrega
		FOREIGN KEY (motoboy_cod,motoboy_cnh)
		REFERENCES motoboy(cod,cnh)
	,CONSTRAINT fk_ped_entrega
		FOREIGN KEY (pedido_cod)
		REFERENCES pedido(cod)
	,CONSTRAINT fk_clt_entrega
		FOREIGN KEY (cliente_cod)
		REFERENCES cliente(cod)
);



