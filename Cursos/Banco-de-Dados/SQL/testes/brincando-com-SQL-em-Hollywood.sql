SELECT * FROM ator;
SELECT * FROM atua;
SELECT * FROM estudio;
SELECT * FROM estudio_produz_filme;
SELECT * FROM filme;
SELECT * FROM papel;

-- Quais os donos e nomes dos estudios ?
SELECT nome,dono FROM estudio;

--Liste o nome e o custo dos filmes na qual a Emilly Atem trabalhou
SELECT DISTINCT a.filme_nome, f.custo FROM atua AS a, filme AS f
WHERE a.ator_inss='2222222222'

-- Conte a quantidade de papeis que a Emilly Atem pode fazer
SELECT count(*) FROM papel WHERE ator_inss = '2222222222';
