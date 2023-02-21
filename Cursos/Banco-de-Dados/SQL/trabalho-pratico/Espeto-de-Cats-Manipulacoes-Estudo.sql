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

-- Na tabela funcionários tem dois funcionários 
-- Quero alterar isso com o mesmo nome 

-- UPDATE nome_tabela
-- SET CAMPO = "novo_valor"
-- WHERE CONDIÇÃO

UPDATE funcionario
SET nome = 'Francisco Bernades'
WHERE cod = '22222';


-- Mostre o nome e o cargo de funcionário

SELECT nome || ' é  um ' || cargo  AS Nome_Cargo FROM funcionario;
SELECT concat(nome,' é um ',cargo) AS nome_cargo FROM funcionario; 

-- Mostre todos os dados de todos os clientes cujo
-- nome começa com C

-- Like compara diferenciando o 
-- maiusculo de minusculo
SELECT * FROM cliente
WHERE upper(nome) LIKE upper('C%');

-- ILIKE realiza a comparação ignorando se ela está
-- em maiúscula ou minúscula
SELECT * FROM cliente
WHERE nome ILIKE 'c%';

-- Mostre os funcionários que são garçom e atendente

SELECT * FROM funcionario
WHERE cargo IN ('Garçom','Atendente') 
ORDER BY cod DESC;

-- Mostre todos os clientes cuja segunda 
-- letra do nome é a letra a

SELECT * FROM cliente
WHERE nome LIKE '_a%';

-- Some mais 10 ao número do endereço de funcionário 

SELECT nome, numero , numero + 10 AS num_10
FROM funcionario;

-- Mostra o nome e o cód do cliente que não 
-- possui pontos de fidelidade nula
SELECT cod,nome,pontos_fidelidade 
FROM cliente 
WHERE pontos_fidelidade IS NOT NULL;

-- mostre o cod e a senha das contas de 
-- rede social com ordenação pelo e-mail

SELECT cod,email, login 
FROM contaredesocial ORDER BY email DESC;

-- Mostre o modelo, a marca e a placa das motos,
-- assim como o nome dos seus respectivos donos

SELECT m.modelo, m.marca , f.nome nome_dono
FROM   moto m , motoboy mt, funcionario f 
WHERE  m.motoboy_cod = mt.cod AND m.motoboy_cod = f.cod;

-- Para fazer a junção externa irei propositalmente colocar 
-- um valor de chave estrangeira que seja nulo
-- (Adicionar moto sem dono)


INSERT INTO 
	moto(cilindradas,placa,marca,modelo,cor) 
VALUES (37,'7878784','Suzuki','APF-2023','Vermelho');

-- Agrupe pela quantidade de estrelas do restaurante
-- """""Todas as colunas na lista SELECT que não estejam 
-- em funções de grupo devem estar na cláusula GROUP BY"""""
SELECT qtd_estrelas ,count(*) qtd_restaurantes
FROM restaurante 
GROUP BY qtd_estrelas;

-- Use a clásula HAVING depois do GROUP BY para restrigir grupos
SELECT qtd_estrelas ,count(*) qtd_restaurantes
FROM restaurante 
GROUP BY qtd_estrelas, cod
HAVING cod > '15152';

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

