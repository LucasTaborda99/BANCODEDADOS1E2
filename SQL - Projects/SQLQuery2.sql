create database Db_17022022
use Db_17022022

--EXERCÍCIO DE DECLARAÇÃO DE VARIÁVEL

-- DECLARANDO VARIÁVEIS EM BANCO DE DADOS
CREATE TABLE [Aluno]
(Matricula Int NOT NULL Identity(1,1) --Contador automático
,NomeAluno Varchar(100) NOT NULL
,CPF CHAR(11) NOT NULL
,DataNcto SMALLDATETIME NOT NULL
,Mensalidade NUMERIC(6,2) NOT NULL
,Turma char(10) NOT NULL
)
DROP TABLE Aluno

--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT ALUNO VALUES ('José da Silva','12345678900','19911121', 2000,'ADS3')
INSERT ALUNO VALUES ('Mario da Silva', '12345678911','19990324',1000, 'ADS3')
INSERT ALUNO VALUES ('Ana da Silva', '12345678922','20000317', 3000,'ADS1')
SELECT * FROM Aluno
TRUNCATE TABLE Aluno

---------------------------------------------------------------------------------------------------------------------------------

/* CRIAÇÃO DE VARIÁVEIS LOCAIS */
DECLARE @TOTAL INT --NÚMERO DE ALUNOS
DECLARE @VALOR NUMERIC(6,2) --VALOR TOTAL MENSALIDADE
DECLARE @VALOR_TURMA NUMERIC(6,2) --VALOR TOTAL MENSALIDADE POR TURMA
DECLARE @TURMA CHAR(5)
DECLARE @msg varchar(100)

/* DEFINE O VALOR DE CADA VARIÁVEL */
SET @TURMA = 'ADS3'
SET @TOTAL = (SELECT COUNT(*) FROM Aluno)
SET @VALOR = (SELECT SUM(MENSALIDADE) FROM Aluno)
SET @VALOR_TURMA = (SELECT SUM(MENSALIDADE) FROM Aluno WHERE TURMA=@TURMA)

/* IMPRIMINDO O VALOR DAS VARIÁVEIS */
PRINT(@TOTAL)
PRINT('TOTAL de Alunos ' + CONVERT(CHAR(10),@TOTAL))
PRINT('')
PRINT('MENSALIDADE TURMA ' + @TURMA)
PRINT('VALOR R$ ' + CONVERT(CHAR(10),@VALOR_TURMA))

/* VERIFICAÇÃO DO VALOR DA MENSALIDADE */
PRINT('')
PRINT('IF - DECISÃO')
IF @VALOR > 1000
BEGIN
SET @msg = 'Valor Total das Mensalidades maior que 1000' --Mostrar o valor
PRINT(@msg)
END
ELSE
BEGIN
SET @msg = 'Valor Total das Mensalidades menor que 1000' --Mostrar o valor
PRINT(@msg)
END
PRINT('')
PRINT('WHILE - REPETIÇÃO')
WHILE @VALOR > 1000
BEGIN
PRINT(@VALOR) ---Descrever/mostrar melhor
SET @VALOR=@VALOR-500
---Descrever/mostrar melhor depois de atualizado p valor
END
-------------------------------------------------------------------------------------------
DECLARE @Contador AS INT
SET @Contador = 1
WHILE @Contador <= 10
BEGIN
SELECT @Contador
IF @Contador <= 5
BEGIN
SET @Contador = @Contador + 1
CONTINUE
END
BREAK
END
--------------------------------------------------
--Case COM opções
declare @user varchar(10), @user_ver varchar(10), @status varchar(10)
set @user = 'p'
set @user_ver = 'CLAUDIA1'
set @status = 'BLOQUEADO1'
SELECT
@user_ver as Usuario,
CASE
WHEN
@user = 'NULO'
OR @user_ver = ''
THEN
'Usuario não Verificado'
WHEN
@user = 'P'
THEN
'Usuario Pendente de Validação'
WHEN
@user != '2020'
THEN
'Usuário MENOR Igual a 2020'
WHEN
(@user = 'X' AND @user_ver = '2010')
OR (SELECT @status ) = 'BLOQUEADO'
THEN
'Usuario Pioneiro BLOQUEADO'
ELSE
'Não parametrizado'
END as verificacaoxxxxx
---------------------------------------------
--Aluno nota
declare @aluno varchar(10), @nota int
set @aluno ='MANOEL'
set @nota = 6
SELECT @aluno as 'Aluno',
@nota as 'Nota',
CASE
when @nota < 5 then 'Reprovado'
when @nota > 6 then 'Aprovado'
Else 'Em Recuperação'
end as 'Situação'
---------------------------------------------
declare @estado varchar(10),@sigla varchar(02)
set @estado ='SAO PAULO'
set @sigla = 'RO'
SELECT @estado as 'Estado',
CASE WHEN @sigla IN ('PR', 'RS', 'SC') THEN 'Sul'
WHEN @sigla IN ('SP', 'RJ', 'ES', 'MG') THEN 'Sudeste'
WHEN @sigla IN ('MT', 'MS', 'GO') THEN 'Centro-Oeste'
WHEN @sigla IN ('BA', 'AL', 'SE', 'PB', 'PE', 'RN', 'CE', 'PI', 'MA') THEN
'Nordeste'
WHEN @sigla IN ('AM', 'RR', 'AP', 'PA', 'TO', 'RO', 'AC') THEN 'Norte'
ELSE '' END AS regiao
-----------------------------------------------------------------------------
DECLARE @func varchar(10),@salario numeric(10,2)
set @func = 'Marcos'
set @salario = 50000
Select @func funcionario,
CASE
WHEN @salario >=2000 AND @salario <=5000 THEN 'Analista Junior'
WHEN @salario > 5000 AND @salario <8000 THEN 'Analista Senior'
WHEN @salario > 8000 AND @salario <80000 THEN 'Gerente'
Else 'Diretor'
END AS Funcao
------------------------------------------------------------------------------
declare @valor int, @situacao varchar(30)
set @valor = 2
IF @valor > 1 AND @valor < 10
BEGIN
SET @Situacao = 'Maior que 1 e menor que 10'
END
ELSE IF @valor > 10 AND @valor < 20
BEGIN
SET @Situacao = 'Maior que 10 e menor que 20'
END
print @situacao
--------------------------------------------------------------------------------
declare @valor int
set @valor = 300
SELECT @valor as Valor, IIF(@valor > 200,
'Acima do valor',
'Abaixo do valor') AS Situacao
--------------------------------------------------------------------------------
create table aluno
(numero int)
insert into aluno values (5)
select * from aluno
declare @numero int
set @numero = 5
if exists (select @numero from aluno where numero = @numero)
begin
print 'Aluno ja Cadastrado'
end
else
begin
print 'Aluno nao Cadastrado'
end
------------------------------------------------------------------------------------------
DECLARE @Contador as INT
SET @Contador = 1
WHILE @Contador <= 10
BEGIN
SELECT @Contador,
CASE
WHEN @Contador % 2 = 0 THEN 'PAR'
ELSE 'IMPAR'
END
SET @Contador = (@Contador + 1)
END
---------------------------------------------------------------------------------------------------------------------------------------------------
--EXERCÍCIOS DE DECLARAÇÃO DE VARIÁVEIS

--1) Verificar se o número de alunos de uma turma é maior que 5.

/*CRIAÇÃO DE VARIÁVEIS LOCAIS*/
DECLARE @TOTAL INT -- NÚMERO DE ALUNOS
DECLARE @TURMA CHAR(5) 
DECLARE @msg VARCHAR(150)

/*DEFININDO O VALOR DE CADA VARIÁVEL*/
SET @TURMA = 'ADS3'
SET @TOTAL = (SELECT COUNT(*) FROM Aluno WHERE Turma = @TURMA)

IF @TOTAL > 5
	BEGIN
	SET @msg = 'A quantidade de alunos da turma de ADS3 é maior que 5, a quantidade de alunos dessa turma é igual a: ' + CONVERT(CHAR(10), @TOTAL)
	PRINT(@msg)
END
ELSE
BEGIN
	SET @msg = 'A quantidade de alunos da turma de ADS3 é menor que 5, a quantidade de alunos dessa turma é igual a: ' + CONVERT(CHAR(10), @TOTAL)
	PRINT(@msg)
END 

/*
-- Ou pode-se utilizar também o operador ternário
SELECT IIF (@TOTAL > 5, 
'A quantidade de alunos da turma de ADS3 é maior que 5, a quantidade de alunos dessa turma é igual a: ' + CONVERT(CHAR(10), @TOTAL),
'A quantidade de alunos da turma de ADS3 é menor que 5, a quantidade de alunos dessa turma é igual a: ' + CONVERT(CHAR(10), @TOTAL)) as 'Quantidade de alunos'
*/

---------------------------------------------------------------------------------------------------------------------------------------------------
/* 2) Usar declaração de variáveis para mostrar um desconto de 10% para mensalidade
maior que 1000, e para menores desconto de 5% a um determinado aluno apenas.*/

/*CRIAÇÃO DE VARIÁVEIS LOCAIS*/
DECLARE @MENSALIDADE NUMERIC(6,2)
DECLARE @MENSALIDADE1 NUMERIC(6,2)
DECLARE @NOME VARCHAR(50)

/*DEFININDO O VALOR DE CADA VARIÁVEL*/
SET @MENSALIDADE = (SELECT Mensalidade FROM Aluno WHERE Matricula = 2 and Turma = 'ADS3')
SET @MENSALIDADE1 = @MENSALIDADE
SET @NOME = (SELECT NomeAluno FROM Aluno WHERE Matricula = 2  and Turma = 'ADS3')

IF @MENSALIDADE > 1000
	BEGIN
	SET @MENSALIDADE = @MENSALIDADE - (@MENSALIDADE * 0.1)
	PRINT 'Mensalidade de ' + CONVERT(CHAR(7), @MENSALIDADE1) + 'R$ ' + 'do aluno(a) ' + @NOME + ' com aplicação de desconto de 10% => ' + 'Mensalidade atual no valor de ' + CONVERT(CHAR(7), @MENSALIDADE) + 'R$'
END
ELSE
	BEGIN
	SET @MENSALIDADE = @MENSALIDADE - (@MENSALIDADE * 0.05)
	PRINT 'Mensalidade de ' + CONVERT(CHAR(7), @MENSALIDADE1) + 'R$ ' + 'do Aluno(a) ' + @NOME + ' com aplicação de desconto de 5% => ' + 'Mensalidade atual no valor de ' + CONVERT(CHAR(7), @MENSALIDADE) + 'R$'
END 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* 1) Desenvolva um script em SQL que mostre um contador até 100 e pare no número 62
mostrando o número como resultado. */

DECLARE @NUM INT 

SET @NUM = 1

WHILE @NUM <= 100
	BEGIN
		SELECT @NUM as Número
		IF @NUM < 62
			BEGIN
				SET @NUM = @NUM + 1
				CONTINUE
			END
			SELECT @NUM as Resultado
		BREAK
	END
-------------------------------------------------------------------------
/* 2) Crie um script em P/SQL que mostre os número de 1 até 100 e mostre se o número é
par ou impar. */

DECLARE @NUM INT 

SET @NUM = 1

WHILE @NUM <= 100
	BEGIN
		SELECT @NUM as Números,
		CASE 
			WHEN @NUM % 2 = 0 THEN 'Par' ELSE 'Ímpar'
		END 'Par ou Ímpar'
		SET @NUM += 1
	END
---------------------------------------------------------------------------------
/* 3) Desenvolve um script em PL/SQL que apresente o resultado da variável idade se:
Condição Resultado
Menor que 10 Criança
De 10 até 17 Jovem
De 18 até 60 Adulto
Acima de 61 Idoso */

DECLARE @IDADE INT
SET @IDADE = 65

SELECT @IDADE as Idade,
	CASE 
		WHEN @IDADE < 10 THEN 'Criança'
		WHEN @IDADE BETWEEN 10 AND 17 THEN 'Jovem'
		WHEN @IDADE BETWEEN 18 AND 60 THEN 'Adulto'
		ELSE 'Idoso'
	END as 'Categoria'
-------------------------------------------------------------------------
/* 4) Mostrar se o aluno mario da silva está cadastrado na tabela e calcular aumento na
mensalidade de 10% e apresentar como jovem se idade menor que 60 senão idoso */

DECLARE @ALUNO VARCHAR (100)
DECLARE @MENSALI NUMERIC (6,2)
DECLARE @IDADE INT

SET @ALUNO = (SELECT NomeAluno FROM Aluno WHERE NomeAluno = 'Mario da Silva')
SET @MENSALI = (SELECT Mensalidade FROM Aluno WHERE NomeAluno = @ALUNO)
SET @IDADE = (SELECT  --DATEDIFF(YEAR, DataNcto, GETDATE()) FROM Aluno WHERE NomeAluno = @ALUNO) ou YEAR(GETDATE()) - YEAR(DataNcto) ...
CASE 
	WHEN
		DATEPART(MONTH,	DataNcto) <= DATEPART(MONTH, GETDATE()) AND DATEPART(DAY, DataNcto) <= DATEPART(DAY, GETDATE())
			THEN (DATEDIFF(YEAR, DataNcto, GETDATE())) 
				ELSE (DATEDIFF(YEAR, DataNcto, GETDATE())) - 1 
END 
FROM Aluno WHERE NomeAluno = @ALUNO )

SELECT @ALUNO as Aluno

SET @MENSALI = @MENSALI + (@MENSALI * 0.1)
SELECT @MENSALI as Mensalidade

SELECT @IDADE AS Idade,
CASE 
	WHEN @IDADE < 60 THEN 'Jovem' ELSE 'Idoso'
END as Categoria
-------------------------------------------------------------------------
/* 1) Desenvolva um script em SQL que mostre um contador até 100 e pare no número 62
mostrando o número como resultado. */
DECLARE @NUM INT
SET @NUM = 1

WHILE @NUM <= 100
	BEGIN
		IF @NUM <= 62
			BEGIN
				SELECT @NUM AS 'Número'
				SET @NUM += 1
				CONTINUE
			END
		BREAK
	END

/* Ou
DECLARE @NUM INT 

SET @NUM = 1

WHILE @NUM <= 100
	BEGIN
		SELECT @NUM as Número
		IF @NUM < 62
			BEGIN
				SET @NUM = @NUM + 1
				CONTINUE
			END
			SELECT @NUM as Resultado
		BREAK
	END
*/
---------------------------------------------------------------------------------------------
/*	2) Elabore um script em SQL que apresente um contador até 1000 e mostre a soma dos
números multiplicados por 3 e multiplicados por 5 e no final mostrar a soma de cada um deles */

DECLARE @NUM INT
DECLARE @SOMA3 INT
DECLARE @SOMA5 INT
DECLARE @SOMADOSDOIS INT

SET @NUM = 1
SET @SOMA3 = 0
SET @SOMA5 = 0
SET @SOMADOSDOIS = 0

WHILE @NUM <= 100
	BEGIN
		IF @NUM % 3 = 0 
			BEGIN
				SET @SOMA3 = @NUM + @NUM
			END
		ELSE IF @NUM % 5 = 0
			BEGIN
			SET @SOMA5 = @NUM + @NUM
		END
		SET @NUM += 1
	END
	SELECT @SOMA3 AS 'Soma dos números multiplicados por 3'
	SELECT @SOMA5 AS 'Soma dos números multiplicados por 5'

	SET @SOMADOSDOIS = (@SOMA3 + @SOMA5)
	SELECT @SOMADOSDOIS AS 'Soma dos dois'
---------------------------------------------------------------------------------------------
/* 3) Crie um script em PL/SQL que mostre os números de 1 até 100 e mostre se o número é par
ou impar. */

DECLARE @NUM INT
SET @NUM = 1

WHILE @NUM <= 100
	BEGIN
		SELECT @NUM as 'Número',
			CASE
				WHEN @NUM % 2 = 0 THEN 'PAR' 
				ELSE 'ÍMPAR'
			END AS 'Par ou Ímpar'
		SET @NUM += 1
	END
---------------------------------------------------------------------------------------------
/* 4) Desenvolva um script em PL/SQL que apresente o resultado da variável idade será formada
pela data atual, ou seja, dia + mês + 21 do ano igual a 4 + 3 + 21 e mostrar como resultado:

Se Menor que 10 igual a Criança
De 10 até 17 igual a Jovem
De 18 até 60 igual a Adulto
Acima de 61 Idoso  */

DECLARE @IDADE INT
SET @IDADE = DATEDIFF(YEAR,'19991009',GETDATE())
SELECT @IDADE as 'Idade',
CASE
	WHEN @IDADE < 10 THEN 'Criança'
	WHEN @IDADE between 10 and 17 THEN 'Jovem'
	WHEN @IDADE between 18 and 60 THEN 'Adulto'
	ELSE 'Idoso'
END as 'Categoria'
---------------------------------------------------------------------------------------------
/* 5) Mostrar em PL/SQL se o aluno Mário da silva está contido em uma variável, bem como seu
salário e calcular aumento de 10% para ele e mostre o nome em letras maiúsculas.  */
DECLARE @NOME VARCHAR (100)
DECLARE @SALARIO NUMERIC(6,2)

SET @NOME = (SELECT NomeAluno FROM Aluno WHERE NomeAluno = 'Mario da Silva')
SET @SALARIO = 1000.00

IF @NOME = 'Mario da Silva'
	BEGIN
		SET @SALARIO = @SALARIO + (@SALARIO * 0.1)
	END

SELECT @SALARIO as 'Salário', UPPER(@NOME) AS 'Nome do aluno'
---------------------------------------------------------------------------------------------
/* 6) Elabore um laço de repetição usando PL/SQL que use While e quando o valor for 8 pare e
finalize o programa. */
DECLARE @NUM INT

SET @NUM = 1

WHILE @NUM <= 8
	BEGIN
		SELECT @NUM AS 'Número'
		SET @NUM += 1
		CONTINUE
	END
---------------------------------------------------------------------------------------------
/* 7) Desenvolva um script em PL/SQL que use duas variáveis e verifique se a media for acima de
6 o aluno está aprovado senão reprovado. */
DECLARE @NOTA1 NUMERIC (6,2)
DECLARE @NOTA2 NUMERIC (6,2)

SET @NOTA1 = 8.0
SET @NOTA2 = 6.0

SELECT (@NOTA1 + @NOTA2) / 2 AS 'Média',
CASE
	WHEN (@NOTA1 + @NOTA2) / 2 > 6.0 THEN 'Aluno aprovado' ELSE 'Aluno reprovado'
END AS 'Situação do aluno'
---------------------------------------------------------------------------------------------
/* 8) Elabore um script em PL/SQL que verifique os números de 1 até 100 e mostre a quantidade
de pares e impares no final, bem como a soma de todos os pares e também a soma dos
impares. */

DECLARE @NUM INT
DECLARE @QUANTIDADEPARES INT
DECLARE @QUANTIDADEIMPARES INT
DECLARE @SOMAPARESEIMPARES INT

SET @NUM = 1
SET @QUANTIDADEPARES = 0
SET @QUANTIDADEIMPARES = 0
SET @SOMAPARESEIMPARES = 0

WHILE @NUM <= 100
	BEGIN
		IF @NUM % 2 = 0
			BEGIN
			SET @QUANTIDADEPARES += 1
		END
		ELSE
			BEGIN
			SET @QUANTIDADEIMPARES += 1
		END
		SET @NUM += 1
	END
	SET @SOMAPARESEIMPARES = @QUANTIDADEPARES + @QUANTIDADEIMPARES
	SELECT @QUANTIDADEPARES AS 'Quantidade de Números Pares', @QUANTIDADEIMPARES AS 'Quantidade de Números Ímpares', @SOMAPARESEIMPARES AS 'Soma dos pares e ímpares'
---------------------------------------------------------------------------------------------
/* 9) Crie um script em PL/SQL usando CASE que mostre um laço de repetição de 1 até 5000 e
apresente a seguinte mensagem:
Se número entre 1000 e 2000 analista júnior
Se número entre 2500 e 4000 analista pleno
Senão analista sênior */

DECLARE @NUM INT

SET @NUM = 1

WHILE @NUM <= 5000
	BEGIN
		SELECT @NUM as 'Número',
		CASE
			WHEN @NUM BETWEEN 1000 AND 2000 THEN 'Analista Júnior'
			WHEN @NUM BETWEEN 2500 AND 4000 THEN 'Analista Pleno'
			ELSE 'Analista Sênior'
		END as 'Categoria'
		SET @NUM +=1
	END
