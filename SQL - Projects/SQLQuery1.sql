create database Db_aula2110
use Db_aula2110

-----------------------------------------------------------------

/* L�gico_1: */

/*
IDENTITY [ (in�cio , incremento )
In�cio: Valor a ser utilizado para o primeiro valor inserido na coluna.
Incremento: Valor a ser incrementado a cada nova inser��o.
*/

 /*A tabela pedido se relaciona com a tabela nota e o campo fk_nota_id da tabela pedido tem que ser igual
 ao id da tabela nota - exemplo - p.fk_nota_id = n.id */

 ---------------------------------------------------------------

 /* Cria��o das tabelas*/

/* Cria��o da tabela solicita��o */
CREATE TABLE solicitacao (
    id int IDENTITY(1,1) PRIMARY KEY,
    nomeproduto varchar(50),
    dataemissao date,
    codproduto int,
    valor numeric(12,2)
);
DROP TABLE solicitacao
select * from solicitacao

/* Cria��o da tabela nota */
CREATE TABLE nota (
    id int IDENTITY(1,1) PRIMARY KEY,
    valorunit numeric(12,2),
    qtde int,
    valortotal numeric(12,2),
    codproduto int
);
DROP TABLE nota
select * from nota

/* Cria��o da tabela pedido */
CREATE TABLE pedido (
    id int IDENTITY(1,1) PRIMARY KEY,
    data date,
    qtde int,
    valorunit numeric(12,2),
    valortotal numeric(12,2),
    fk_nota_id int FOREIGN KEY REFERENCES nota(id)
);
DROP TABLE pedido
select * from pedido 

/* Cria��o da tabela cota��o */
CREATE TABLE cotacao (
    id int IDENTITY(1,1) PRIMARY KEY,
    fk_pedido_id int FOREIGN KEY REFERENCES pedido (id),
    fk_solicitacao_id int FOREIGN KEY REFERENCES solicitacao (id),
    valortotal numeric(12,2),
    data date,
    qtde int,
    valorunit numeric(12,2)
);
DROP TABLE cotacao
select * from cotacao

------------------------------------------------------------------

-- Inserido valores nas tabelas

/* Inser��o dos valores na tabela solicita��o */
INSERT INTO solicitacao VALUES ('MONITOR', '20211009', 10, 1000.99)
INSERT INTO solicitacao VALUES ('TECLADO', '20211010', 20, 500.99)
INSERT INTO solicitacao VALUES ('MOUSE', '20211008', 30, 1500.99)
SELECT * FROM solicitacao
delete solicitacao

/* Inser��o dos valores na tabela nota */
INSERT INTO nota VALUES (2000, 50, 5000.90, 1)
INSERT INTO nota VALUES (3000, 100, 6000.90, 2)
INSERT INTO nota VALUES (5000, 150, 7000.90, 3)
SELECT * FROM nota
delete nota

/* Inser��o dos valores na tabela pedido */
INSERT INTO pedido VALUES ('20200228', 5, 15, 2500.90, 3)
INSERT INTO pedido VALUES ('20200228', 6, 20, 2600.90, 2)
INSERT INTO pedido VALUES ('20200228', 7, 30, 2700.90, 1)
SELECT * FROM pedido
delete pedido

/* Inser��o dos valores na tabela cota��o */
INSERT INTO cotacao VALUES (1, 3, 1500.50, '20190821', 100, 60)
INSERT INTO cotacao VALUES (2, 2, 1600.50, '20180720', 150, 70)
INSERT INTO cotacao VALUES (3, 1, 1700.50, '20190821', 220, 80.99)
SELECT * FROM cotacao
delete cotacao

------------------------------------------------------------------------

-- Selecionar todas
SELECT * FROM cotacao
SELECT * FROM nota
SELECT * FROM pedido
SELECT * FROM solicitacao

------------------------------------------------------------------------

-- inner joins

SELECT * FROM nota n

inner join pedido p
on n.id = p.fk_nota_id

---------------------------------------------------------------------

SELECT * FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

inner join nota n
on n.id = p.fk_nota_id

/* Tabela solicitacao relaciona-se com a tabela cotacao, o campo id chave prim�ria (PK)
da tabela solicitacao relaciona-se com o campo fk_solicitacao_id (FK) da tabela cotacao.

Tabela pedido relaciona-se com a tabela cotacao, o campo id chave prim�ria (PK)
da tabela pedido relaciona-se com o campo fk_pedido_id (FK) da tabela cotacao.

Tabela nota relaciona-se com a tabela pedido, o campo id chave prim�ria (PK)
da tabela nota relaciona-se com o campo fk_nota_id (FK) da pedido.
*/

-------------------------------------------------------------------------------

SELECT day(s.dataemissao) * len(s.nomeproduto) as 'Resultado',
day(s.dataemissao) as 'Dia', 
month(s.dataemissao) as 'M�s', 
year(s.dataemissao) as 'Ano', 
len(s.nomeproduto) as 'Tamanho - Quantidade de Caracteres',
n.qtde * n.valorunit as 'Total da Nota',
lower(substring(s.nomeproduto,1,3)) as 'Nome do produto somente com as tr�s primeiras letras e min�sculas',
 * FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

inner join nota n
on n.id = p.fk_nota_id

where s.id > 1
and len(s.nomeproduto) > 3

/* Mostrar o resultado a partir do dia da dataemissao da solicitacao pelo tamanho
do campo do nomeproduto
*/

SELECT day(s.dataemissao) * len(s.nomeproduto) as 'Resultado' from solicitacao s

--------------------- 28/10/21 ------------------------

-----1-----
SELECT * FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

inner join nota n
on n.id = p.fk_nota_id

-----2-----
SELECT * FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id
and p.qtde < 4587 and p.qtde > 16
and p.valortotal != 1500

where s.valor > 245

-----3-----
SELECT p.id, p.valortotal, c.id, c.qtde * c.valorunit as 'Multiplica��o da Quantidade pelo Valor Unit�rio' FROM pedido p
inner join cotacao c
on p.id = c.fk_pedido_id

-----4-----
SELECT c.* FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and month (s.dataemissao) in (04, 05, 07, 08)
and year (s.dataemissao) <> 2018 


SELECT * FROM solicitacao 

-----Exemplo para adicionar campos na tabela-----
ALTER TABLE solicitacao ADD cidade varchar(30), estado varchar(2)

-----Exemplo para alterar valores dos campos na tabela-----
ALTER TABLE solicitacao ALTER COLUMN cidade int

-----Exemplo para excluir campos na tabela-----
ALTER TABLE solicitacao DROP COLUMN cidade, estado

-----5-----
ALTER TABLE nota ADD dataemiss�o date, cidade varchar(40), estado varchar(2)
ALTER TABLE nota DROP COLUMN cidade, estado, dataemiss�o
SELECT * FROM nota

-----6-----
ALTER TABLE pedido ADD dataemiss�o date
ALTER TABLE pedido DROP COLUMN dataemiss�o date
SELECT * FROM pedido

-----7-----
SELECT year(GETDATE()),* FROM nota
SELECT concat (year(getdate()), month(getdate()), day(getdate()))

UPDATE nota 
--set cidade = 'Curitiba', estado = 'PR', 
set dataemiss�o = concat (year(getdate()), month(getdate()),'0',day(getdate()))
SELECT * FROM nota

UPDATE pedido 
set dataemiss�o = concat (year(getdate()), month(getdate()),'0',day(getdate()))
SELECT * FROM pedido

UPDATE pedido
set valortotal = 2000
where id = 2
SELECT * FROM pedido
--------------------- 04/11/21 ------------------------

-----8-----
SELECT count(n.id) as 'Quantidade de Notas' FROM solicitacao s

inner join cotacao c
on c.fk_solicitacao_id = s.id

inner join pedido p
on c.fk_pedido_id = p.id

inner join nota n
on n.id = p.fk_nota_id

WHERE day(s.dataemissao) in (04,05,08,09,22,25,26,27)

-----9-----
SELECT sum(p.valortotal) as 'Valor Total do Pedido' FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id
and c.qtde > 5
and c.qtde < 4585

inner join pedido p
on p.id = c.fk_pedido_id
where s.nomeproduto like '%a%'

-------------------------------------------------------------------------

-- DATEPART (unidade, data)

SELECT DATEPART (YEAR, '02/01/2021')
SELECT YEAR ('02/01/2021')

SELECT DATEPART (MONTH, '20210201')
SELECT MONTH ('20210201')

SELECT DATEPART (DAY, '20210201')
SELECT DAY ('20210201')

SELECT dataemissao, DATEPART (DAY, dataemissao) as 'Dia' FROM solicitacao

-----------------------------------------------------------------

-- DATEADD (unidade, numero_unid, data)

SELECT DATEADD (DAY, 1, '20211121')

SELECT DATEADD (MONTH, 6, GETDATE())

SELECT DATEADD (YEAR, 5, GETDATE())

SELECT dataemissao, DATEADD (YEAR, 4, dataemissao) FROM solicitacao

-- DATEDIFF (unidade, data1, data2)

SELECT DATEDIFF (DAY, '20211104', '20210521')
SELECT DATEDIFF (MONTH, '20210521', '20211121')
SELECT dataemissao, DATEDIFF (YEAR, '20150515', dataemissao) as 'Diferen�a em anos 'FROM solicitacao

----------------- Minha idade em DIAS, MESES, ANOS, HORAS, MINUTOS E SEGUNDOS -----------------------------

SELECT DATEDIFF (DAY, '19990910', GETDATE()) as 'Dias vividos'
SELECT DATEDIFF (MONTH, '19990910', GETDATE()) as 'Meses vividos'
SELECT DATEDIFF (YEAR, '19990910', GETDATE()) as 'Anos vividos'
SELECT DATEDIFF (HOUR, '19990910', GETDATE()) as 'Horas vividas aproximadamente'
SELECT DATEDIFF (MINUTE, '19990910', GETDATE()) as 'Minutos vividos aproximadamente'
SELECT DATEDIFF (SECOND, '19990910', GETDATE()) as 'Segundos vividos aproximadamente'

---------------------------------------------------------------------------------

SELECT s.dataemissao, c.data, DATEDIFF (DAY, s.dataemissao, c.data) as 'Dias' FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

WHERE DATEDIFF (DAY, s.dataemissao, c.data) > DAY(GETDATE())

-----------------------------------------------------------------------------------

-----10-----
SELECT p.*, DATEPART (MONTH, s.dataemissao) as 'M�s' FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

WHERE MONTH (s.dataemissao) in (5,7,8,10,11) 

-----11-----
SELECT DATEADD (DAY, 10, s.dataemissao), DATEADD (MONTH, 5, p.data) FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

and p.id not in (5, 7, 9)

-----12-----
SELECT DATEDIFF(DAY, p.data,  s.dataemissao) as 'Diferen�a em dias',
DATEDIFF(MONTH, p.data,  s.dataemissao) as 'Diferen�a em meses' 
FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

WHERE YEAR (s.dataemissao) != 2020

--------------------- 11/11/21 ------------------------

----- Atualiza��o de campos (atributos) da tabela -----

select * from solicitacao

--1000.99
--500.99
--1500.99

--set valor = 500
UPDATE solicitacao 
set valor = 500

UPDATE solicitacao 
set valor = 2348
where id = 3

UPDATE solicitacao 
set valor = 2348, nomeproduto = 'CPU'

--select LEN(nomeproduto) as 'Tamanho',* from solicitacao

where id = 1
and codproduto = 10
and YEAR(dataemissao) = 2021
and nomeproduto like ('%U%')
--and nomeproduto like ('%o')
and LEN(nomeproduto) > 2

select * from solicitacao

--------------- UPDATE com relacionamento entre tabelas ----------------------

select * 

--UPDATE solicitacao
--set valor = 1000

from solicitacao s
inner join cotacao c
on s.id =  c.fk_solicitacao_id

where c.id > 1
--and MONTH(s.dataemissao) >=  1
--and MONTH(s.dataemissao) in (1, 2)
and MONTH(s.dataemissao) between 1 and 2

select * from solicitacao
select * from cotacao

--------------- UPDATE com valores vari�veis ----------------------

select len(s.nomeproduto) * day(s.dataemissao),*

--UPDATE solicitacao
--set valor = len(s.nomeproduto) * day(s.dataemissao)

from solicitacao s
inner join cotacao c
on s.id =  c.fk_solicitacao_id

where c.id > 1
and MONTH(s.dataemissao) >=  1

------------------------------------------------------

select s.valor * c.qtde,*

--UPDATE solicitacao
--set valor = s.valor * c.qtde

from solicitacao s
inner join cotacao c
on s.id =  c.fk_solicitacao_id

where c.id > 1
and MONTH(s.dataemissao) >=  1

---------------------- 1 -------------------------
SELECT * 

--UPDATE pedido
--set valortotal = (c.qtde * c.valorunit)

FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

where year(s.dataemissao) = 2021

---------------------- 2 -------------------------
SELECT c.valortotal, c.qtde, c.valorunit
--UPDATE cotacao
--set valortotal = qtde * valorunit
FROM cotacao c

---------------------- 3 -------------------------
SELECT s.valor, p.valorunit

--UPDATE solicitacao
--set valor = s.valor + (p.valorunit * 0.2)

FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and c.id >= 1

inner join pedido p
on p.id = c.fk_pedido_id

---------------------- 4 -------------------------
SELECT c.valorunit, p.valorunit, n.valorunit

--UPDATE cotacao
--set valorunit = c.valorunit * 0.9

--UPDATE pedido
--set valorunit = p.valorunit - (p.valorunit * 0.10)

--UPDATE nota
--set valorunit = n.valorunit - (n.valorunit * 0.10)

FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and s.id != 3

inner join pedido p
on p.id = c.fk_pedido_id

inner join nota n
on n.id = p.fk_nota_id

---------------------- 5 -------------------------
SELECT p.valortotal

--UPDATE pedido
--set valortotal = (month(getdate()) * c.id) - day(getdate()) + year(getdate()) 

FROM solicitacao s

inner join cotacao c
on s.id = c.fk_solicitacao_id

inner join pedido p
on p.id = c.fk_pedido_id

WHERE year(s.dataemissao) > 2019

---------------------- 6 -------------------------
SELECT c.qtde, c.valorunit, c.valortotal, n.qtde, n.valorunit, n.valortotal

--UPDATE cotacao
--set qtde =  n.qtde,
--valorunit = n.valorunit, 
--valortotal= n.valortotal

FROM cotacao c

inner join pedido p
on c.fk_pedido_id = p.id

inner join nota n
on n.id = p.fk_nota_id
and n.id in (1,3)

------------------------- 18/11/21 ----------------------------------

---- Sintaxe para uso do DELETE / DROP no SQL 

-- DELETE - exclui registros da tabela
-- DROP - exclui estrutura, ou seja, todo conte�do da tabela


1)DELETE cotacao
2)DELETE solicitacao
3)DELETE pedido
4)DELETE nota

SELECT * FROM cotacao
SELECT * FROM solicitacao
SELECT * FROM pedido
SELECT * FROM nota

TRUNCATE TABLE cotacao

DROP TABLE cotacao
DROP TABLE solicitacao
DROP TABLE pedido
DROP TABLE nota

SELECT * FROM solicitacao
SELECT * FROM cotacao

SELECT * FROM cotacao
DELETE cotacao
WHERE id = 3

SELECT * FROM solicitacao
DELETE solicitacao
WHERE valor > 1000
and day(dataemissao) > 8
and year(dataemissao) = 2021

SELECT * FROM solicitacao
SELECT * FROM cotacao

DELETE cotacao
FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and len(s.nomeproduto) = 5 

---------------------- 1 -------------------------
1)DELETE cotacao
2)DELETE pedido
3)DELETE solicitacao
4)DELETE nota
/*
Pois cota��o possue chaves estrangeiras (FK), ent�o deve-se excluir ela primeiro, 
depois tem que ser exclu�da a tabela pedido pois ela tamb�m possui chave estrangeira (FK), 
depois exclui-se a tabela solicita��o ou a nota que n�o possuem FK.
Exclui-se primeiro as tabelas de movimenta��o (tabelas que possuem FK),
depois exclui-se as outras tabelas que n�o possuem FK.
*/

---------------------- 2 -------------------------
--SELECT * 
DELETE cotacao
FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and month(s.dataemissao) > 2 
and month(s.dataemissao) < 11

inner join pedido p
on p.id = c.fk_pedido_id
and p.id not in (1,3)

inner join nota n
on n.id = p.fk_nota_id
and n.qtde between 15 and 1684


---------------------- 3 -------------------------
--SELECT *
DELETE nota 
FROM pedido p
inner join nota n
on n.id = p.fk_nota_id
and p.valortotal > 200

/* � apresentado erro e n�o exclui, devido ao fato de que nessa situa��o para podermos
excluir os registros da tabela nota, devemos primeiramente excluir os registros da tabela pedido (possue chave estrangeira FK),
para ent�o deletarmos os registros da tabela nota. */

---------------------- 4 -------------------------
--SELECT *

DELETE cotacao

FROM solicitacao s
inner join cotacao c
on s.id = c.fk_solicitacao_id
and s.dataemissao > '20210201'

inner join pedido p
on p.id = c.fk_pedido_id

inner join nota n
on n.id = p.fk_nota_id
and n.valorunit < 7850
and n.valortotal > 150 

WHERE c.id in (10,12)

------------------------- 25/11/21 ----------------------------------

----- Revis�o para a prova -----

-- Conhecer os diagramas conceitual, l�gico e f�sico;
-- Conhecer a sintaxe, CREATE TABLE (PK e FK), INSERT;
-- SELECT, UPDATE, DELETE;
-- Relacionamento da chave prim�ria (PK) com a chave estrangeira (FK);
-- Sintaxe inner join;
-- Incluir ou excluir campo ALTER TABLE (ALTER COLUMN, ADD, DROP COLUMN);
-- Fun��es utilizadas:
-- TOP, delimita o n�mero de registros para mostrar na tabela;
-- SUBSTRING -> Traz uma parte da string;
-- DAY(), MONTH(), YEAR() and GETDATE();
-- DATEPART, DATEDIFF and DATEADD;
-- lower and upper utilizadas com string ou substring;
-- len, l� o tamanho da string;
-- count, conta a quantidade de registros;
-- sum, soma;

---- Exerc�cios de revis�o ----

-- Exerc�cio de Porcentagem --

SELECT * FROM nota

-- Aumentar 10% no valor unit�rio da tabela nota com UPDATE
UPDATE nota
set valorunit = valorunit * 1.1

-- Ou

UPDATE nota
set valorunit = valorunit + (valorunit * 0.1)

-- Aplicar desconto de 20% no valor total da tabela nota com UPDATE
UPDATE nota
set valortotal = valortotal * 0.8

-- Ou

UPDATE nota
set valortotal = valortotal - (valortotal * 0.2 )
