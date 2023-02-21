CREATE SCHEMA IF NOT EXISTS espeto_de_cats;
CREATE TYPE dia_semana AS ENUM ('segunda','terça','quarta','quinta','sexta');
CREATE TYPE sexo AS ENUM ('M','F','O');

CREATE TABLE IF NOT EXISTS horario(
	 cod        char(3) NOT NULL
	,dia        dia_semana
	,abertura   time NOT NULL
	,fechamento time NOT NULL
	,CONSTRAINT pk_horario PRIMARY KEY (cod)
	,CONSTRAINT ck_horario CHECK (fechamento>abertura)
);

CREATE TABLE IF NOT EXISTS restaurante(
	 cod        char(3) NOT NULL
	,capacidade int 
	,telefone   char(9) NOT NULL
	,uf         char(2) NOT NULL
	,cidade     varchar(80)
	,cep        varchar(8) NOT NULL
	,rua        varchar(80)
	,numero     int
	,bairro     varchar(80)
	,CONSTRAINT pk_restaurante PRIMARY KEY (cod)
);

CREATE TABLE IF NOT EXISTS cliente(
	 cod        char(3) NOT NULL PRIMARY KEY 
	,nome       varchar(80) NOT NULL
	,data_nasc  date NOT NULL
	,telefone   char(9) NOT NULL
	,status     boolean DEFAULT TRUE
	,uf         char(2) NOT NULL
	,cidade     varchar(80)
	,cep        varchar(8) NOT NULL
	,rua        varchar(80)
	,numero     int
	,bairro     varchar(80)
);

CREATE TABLE IF NOT EXISTS conta_rede_social(
	 cod      char(3) NOT NULL
	,login    varchar(40) NOT NULL
	,senha    varchar(40) NOT NULL
	,email    varchar(80) NOT NULL
	,rest_cod char(3)
	,CONSTRAINT pk_conta PRIMARY KEY (cod)
	,CONSTRAINT fk_rest_conta
		FOREIGN KEY (rest_cod) REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS funcionario(
	 cod           char(3) NOT NULL
	,data_admissao date NOT NULL
	,nome          varchar(80) NOT NULL
	,Fsexo          char NOT NULL 
	,data_nasc     date NOT NULL
	,salario       float NOT NULL
	,uf            char(2) NOT NULL
	,cidade        varchar(80)
	,cep           varchar(8) NOT NULL
	,rua           varchar(80)
	,numero        int
	,bairro        varchar(80)
	,rest_cod      char(3)
	,data_inicio_gerencia date
	,CONSTRAINT pk_func PRIMARY KEY (cod)
	,CONSTRAINT pk_rest_func
		FOREIGN KEY (rest_cod) REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS funcionario_trabalha_restaurante(
	 func_cod char(3) NOT NULL
	,rest_cod char(3) NOT NULL
	,CONSTRAINT pk_trabalha PRIMARY KEY (func_cod,rest_cod)
	,CONSTRAINT fk_func_trabalha 
		FOREIGN KEY (func_cod) REFERENCES funcionario(cod)
	,CONSTRAINT fk_rest_trabalha
		FOREIGN KEY (rest_cod) REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS motoboy(
	 func_cod        char(3) NOT NULL
	,cnh             char(9) NOT NULL
	,taxa_entrega    float
	,avaliacao       int
	,entrega_noturna boolean NOT NULL DEFAULT TRUE
	,CONSTRAINT pk_mtboy
		PRIMARY KEY (func_cod,cnh)
	,CONSTRAINT fk_func_mtboy
		FOREIGN KEY (func_cod) REFERENCES funcionario(cod)
	,CONSTRAINT ck_tx CHECK (taxa_entrega BETWEEN 0.0 AND 1.0)
);

CREATE TABLE IF NOT EXISTS moto(
	 num_placa   char(7) NOT NULL
	,marca       varchar(80) NOT NULL
	,modelo      varchar(60) NOT NULL
	,ano         int 
	,cor         varchar(30)
	,cilindradas int
	,mtboy_cod   char(3)
	,mtboy_cnh   char(9)
	,CONSTRAINT pk_moto PRIMARY KEY (num_placa)
	,CONSTRAINT fk_mtboy_moto
		FOREIGN KEY (mtboy_cod,mtboy_cnh) REFERENCES motoboy(func_cod,cnh)
);

CREATE TABLE IF NOT EXISTS restaurante_tem_horario(
	 hr_cod   char(3) NOT NULL
	,rest_cod char(3) NOT NULL
	,CONSTRAINT pk_rest_tem_hr 
		PRIMARY KEY (hr_cod,rest_cod)
	,CONSTRAINT fk_hr_tem
		FOREIGN KEY (hr_cod)
		REFERENCES horario(cod)
	,CONSTRAINT fk_rest_tem
		FOREIGN KEY (rest_cod)
		REFERENCES restaurante(cod)
);

CREATE TABLE IF NOT EXISTS delivery(
	 cod char(3) NOT NULL
	,valor float
	,data_solic timestamp NOT NULL
	,cliente_cod char(3)
	,CONSTRAINT pk_delivery PRIMARY KEY (cod)
	,CONSTRAINT fk_cliente_delivery 
		FOREIGN KEY (cliente_cod) REFERENCES cliente(cod)
); 

CREATE TABLE entrega(
	 mtboy_cod  char(3) NOT NULL
	,mtboy_cnh char(9) NOT  NULL
	,cliente_cod char(3) NOT NULL
	,delivery_cod char(3) NOT NULL
	,data_entrega timestamp NOT NULL
	,CONSTRAINT pk_entrega 
		PRIMARY KEY (mtboy_cod,mtboy_cnh,
			         cliente_cod,data_entrega)
	,CONSTRAINT fk_motoboy_entrega
		FOREIGN KEY (mtboy_cod,mtboy_cnh) REFERENCES motoboy(func_cod,cnh)
	,CONSTRAINT fk_cliente_entrega
		FOREIGN KEY (cliente_cod) REFERENCES cliente(cod)
	,CONSTRAINT fk_delivery_cod
		FOREIGN KEY (delivery_cod) REFERENCES delivery(cod)
);




















