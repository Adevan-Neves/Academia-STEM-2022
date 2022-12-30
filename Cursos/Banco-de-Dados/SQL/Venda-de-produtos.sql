CREATE TABLE Cliente(
	 cod            INT NOT NULL
	,nome           VARCHAR(30) NOT NULL
	,telefone       CHAR(10)
	,status         BOOLEAN DEFAULT TRUE
	,limite_credito FLOAT
	,rua            VARCHAR(30)
	,numero         INT
	,sala           INT
	,cidade         VARCHAR(30)
	,cep            char(8)
	,uf             char(2)
	,CONSTRAINT pk_cliente PRIMARY KEY (cod)
);

CREATE TABLE Produto(
	 cod            INT NOT NULL PRIMARY KEY
	,nome           VARCHAR(30) NOT NULL
	,categoria      VARCHAR(20)
	,preco          FLOAT
);

CREATE TABLE Pedido(
	 cod         INT PRIMARY KEY
	,data_pedido DATE 
);

CREATE TABLE ClienteFazPedido(
	  cliente_cod INT NOT NULL
	 ,pedido_cod INT NOT NULL
	 ,CONSTRAINT pk_faz PRIMARY KEY (cliente_cod,pedido_cod)
	 ,CONSTRAINT fk_cliente FOREIGN KEY (cliente_cod)
	 	REFERENCES Cliente(cod)
	 ,CONSTRAINT fk_pedido FOREIGN KEY (pedido_cod)
	 	REFERENCES Pedido(cod)
);

CREATE TABLE PedidoEnvolveProduto(
	 produto_cod INT NOT NULL
	,pedido_cod INT NOT NULL
	,quantidade INT
	,CONSTRAINT pk_envolve PRIMARY KEY (produto_cod,pedido_cod)
	,FOREIGN KEY (produto_cod) REFERENCES Produto(cod)
	,FOREIGN KEY (pedido_cod) REFERENCES Pedido(cod)
);


-- Inserção de valores e casos de teste

INSERT INTO 
	cliente VALUES 
		(13,'Adevan','0123456789',TRUE,300.0,'Rua de tal'
		,10,NULL,'Manaus','12345678','AM'),
		(15,'Vanessa','9876543210',FALSE,10000.0,'Rua fulano de tal'
		,56,23,'Itapiranga','87654321','AM');
	
SELECT * FROM cliente;

INSERT INTO 
	produto(cod,nome,preco) VALUES 
		(1,'fralda',23.40);
INSERT INTO 
	produto VALUES
		(2,'Refrigerante','Bebidas',7.40),
		(5,'Macarrão','Cereais',4.30),
		(20,'Feição','Cereais',23.40);

SELECT * FROM produto;

INSERT INTO pedido VALUES 
	(3000,'2022-12-29'),
	(4000,'2003-05-01'),
	(5000,'2012-04-19');

SELECT * FROM pedido;


INSERT INTO clientefazpedido VALUES
	(13,3000),
	(13,5000),
	(15,4000);

SELECT * FROM clientefazpedido;

-- Testando a constraint de chave estrangeira, tentar inserir um cliente  ou pedido que não existe

INSERT INTO clientefazpedido VALUES
	(0,3000); -- Saída : erro

INSERT INTO clientefazpedido VALUES
	(13,1);   -- saída : erro










