-- Ordenando por data
SELECT * FROM entrega
ORDER BY data_ent;

-- Ordenando por motoboy_cod e data
SELECT * FROM entrega
ORDER BY motoboy_cod,data_ent;

-- Ordenando por motoboy_cod, pedido_cod e cliente_cod
SELECT * FROM entrega
ORDER BY motoboy_cod ,pedido_cod ,cliente_cod;

-- Mostre todos  os  valores de todos pedidos que foram entregues
-- pelo Motoboy Cássia (cod 44444 cnh 123456789), assim como a sua
-- data de entrega

SELECT DISTINCT p.valor , e.data_ent  FROM 
	entrega e,motoboy m , pedido p
WHERE (e.motoboy_cod='88888' AND e.pedido_cod = p.cod );

-- Mostre  o cargo, nome e salario funcionários que trabalham
-- no restaurante Espeto de Cats - Filial AM (cod 15152). Ordene
-- o resultado pelo nome

SELECT f.nome, f.cargo, f.salario FROM 
	   ftrabalhar AS ft, funcionario f
WHERE  ft.restaurante_cod = '15152' AND f.cod = ft.funcionario_cod
ORDER BY f.nome;

-- Mostre as refeições que o restaurante 
-- Espeto de Cats - Filial RJ (cod 15153)

SELECT rf.refeicao FROM refeicao rf
WHERE rf.restaurante_cod = '15153';

-- Inserindo um restaurante sem motoboy (o da base antiga todos têm motoboy)

INSERT INTO restaurante(cod,nome,
						qtd_estrelas,gerente_cod,
						gerente_data_inicio) 
VALUES ('15154','Espeto de Cats - Filial SC',3,'11111','2021-05-10');

-- Na tabela funcionários tem dois funcionários com o mesmo nome
-- Quero alterar isso

-- UPDATE nome_tabela
-- SET CAMPO = "novo_valor"
-- WHERE CONDIÇÃO

UPDATE funcionario
SET nome = 'Francisco Bernades'
WHERE cod = '22222';

SELECT * FROM cliente;
SELECT * FROM contaredesocial;
SELECT * FROM entrega;
SELECT * FROM ftrabalhar;
SELECT * FROM funcionario;
SELECT * FROM horario;
SELECT * FROM moto;
SELECT * FROM motoboy;
SELECT * FROM pedido;
SELECT * FROM realiza;
SELECT * FROM refeicao;
SELECT * FROM restaurante;
SELECT * FROM rtemh;
SELECT * FROM serve;

