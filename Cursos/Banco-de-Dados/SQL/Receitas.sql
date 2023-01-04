CREATE TABLE ingrediente(
	 nome      varchar(30) NOT NULL
	,descricao varchar(30) NOT NULL
	,CONSTRAINT pk_ingrediente PRIMARY KEY (nome)
);

CREATE TABLE livro(
	 titulo      varchar(30)
	,isbn        char(13)
	,nome_editor varchar(30)
	,CONSTRAINT pk_livro PRIMARY KEY (titulo)
);

CREATE TABLE empregado(
	 RG          char(7)
	,nome        varchar(30)
	,data_inicio date
	,salario     float
	,CONSTRAINT pk_empregado PRIMARY KEY (RG)
);

CREATE TABLE cozinheiro(
	 RG                  char(7) NOT NULL 
	,nome_fantasia       varchar(30) NOT NULL
	,qtd_receitas_mensal int
	,CONSTRAINT pk_cozinheiro PRIMARY KEY (RG)
);

CREATE TABLE degustador(
	 RG           char(7) NOT NULL 
	,desempenho   float 
	,CONSTRAINT pk_degustador PRIMARY KEY (RG)
	,CONSTRAINT chk_exp CHECK (desempenho>0.0 AND desempenho<1.0)
);

CREATE TABLE receita(
	 cod            serial
	,nome           varchar(30) NOT NULL 
	,data_criacao   date        NOT NULL
	,categoria      varchar(30)
	,preparo        varchar(30)
	,porcoes        int
	,data_avaliacao date NOT NULL 
	,nota           int NOT NULL 
	,degustador_RG  char(7) NOT NULL
	,cozinheiro_RG  char(7) NOT NULL
	,CONSTRAINT pk_receita PRIMARY KEY (cod)
	,CONSTRAINT chk_nota CHECK (nota>=0 AND nota<=10)
	,CONSTRAINT fk_degustador 
		FOREIGN KEY (degustador_RG) 
			REFERENCES degustador(RG)
	,CONSTRAINT fk_cozinheiro
		FOREIGN KEY (cozinheiro_RG)
			REFERENCES cozinheiro(RG)
);

CREATE TABLE restaurante(
	 cozinheiro_RG   char(7) NOT NULL
	,nome            varchar(30) NOT NULL
	,CONSTRAINT pk_restaurante 
		PRIMARY KEY (cozinheiro_RG,nome)
	,CONSTRAINT fk_cozinheiro 
		FOREIGN KEY (cozinheiro_RG)
			REFERENCES cozinheiro(RG)
);

CREATE TABLE utiliza(
	 ingrediente_nome varchar(30) NOT NULL
	,receita_cod      int         NOT NULL
	,quantidade       int         NOT NULL
	,medida           float       NOT NULL
	,CONSTRAINT pk_utiliza 
		PRIMARY KEY (ingrediente_nome,receita_cod)
	,CONSTRAINT fk_receita 
		FOREIGN KEY (receita_cod)
			REFERENCES receita(cod)
	,CONSTRAINT fk_ingrediente
		FOREIGN KEY (ingrediente_nome)
			REFERENCES ingrediente(nome)
);


CREATE TABLE possui(
	 livro_titulo varchar(30)
	,receita_cod  int
	,CONSTRAINT pk_possui 
		PRIMARY KEY (livro_titulo,receita_cod)
	,CONSTRAINT fk_livro
		FOREIGN KEY (livro_titulo)
			REFERENCES livro(titulo)
	,CONSTRAINT fk_receita
		FOREIGN KEY (receita_cod)
			REFERENCES receita(cod)
);









