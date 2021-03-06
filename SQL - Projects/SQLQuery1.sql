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
DECLARE @QTDE3 INT
DECLARE @QTDE5 INT
DECLARE @SOMADOSDOIS INT

SET @NUM = 1
SET @SOMA3 = 0
SET @SOMA5 = 0
SET @SOMADOSDOIS = 0
SET @QTDE3 = 0
SET @QTDE5 = 0

WHILE @NUM <= 1000
	BEGIN
		IF @NUM % 3 = 0 
			BEGIN
				SET @SOMA3 += @NUM
				SET @QTDE3 += 1
			END
		IF @NUM % 5 = 0
			BEGIN
			SET @SOMA5 += @NUM
			SET @QTDE5 += 1
		END
		SET @NUM += 1
	END
	SELECT @SOMA3 AS 'Soma dos números multiplicados por 3'
	SELECT @SOMA5 AS 'Soma dos números multiplicados por 5'

	SELECT @QTDE3 AS 'QTDE 3'
	SELECT @QTDE5 AS 'QTDE 5'

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
SET @IDADE = DAY(GETDATE()) + MONTH(GETDATE()) + CONVERT (INT, SUBSTRING(CONVERT(CHAR(4), YEAR(GETDATE())),3,2))

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
		SET @SALARIO += (@SALARIO * 0.1)
		SELECT 'Salário com 10% => R$' + CONVERT(CHAR(10), @SALARIO) AS 'Salário'
		SELECT UPPER(@NOME) AS 'Nome do Aluno'
	END
/* ou
SELECT @SALARIO as 'Salário', UPPER(@NOME) AS 'Nome do aluno' */
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
DECLARE @NOTA1 NUMERIC (3,1)
DECLARE @NOTA2 NUMERIC (3,1)

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
DECLARE @SOMAPARES INT
DECLARE @SOMAIMPARES INT

SET @NUM = 1
SET @QUANTIDADEPARES = 0
SET @QUANTIDADEIMPARES = 0
SET @SOMAPARES = 0
SET @SOMAIMPARES = 0

WHILE @NUM <= 100
	BEGIN
		IF @NUM % 2 = 0
			BEGIN
			SET @QUANTIDADEPARES += 1
			SET @SOMAPARES += @NUM
		END
		ELSE
			BEGIN
			SET @QUANTIDADEIMPARES += 1
			SET @SOMAIMPARES += @NUM
		END
		SET @NUM += 1
	END
	SELECT @QUANTIDADEPARES AS 'Quantidade de Números Pares', @QUANTIDADEIMPARES AS 'Quantidade de Números Ímpares', @SOMAPARES AS 'Soma dos pares', @SOMAIMPARES AS 'Soma dos Ímpares'
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
---------------------------------------------------------------------------------------------
CREATE TABLE [FUNCIONARIO]
	(Matricula  Int   NOT NULL Identity(1,1) --Contador automático 
	,Nome Varchar(100) NOT NULL 
	,CPF  CHAR(11)  NOT NULL 
	,DataNcto DATETIME  NOT NULL 
	,ADMISSAO DATETIME NOT NULL DEFAULT GETDATE() 
	,SALARIO  NUMERIC(6,2) NOT NULL 
	,STATUS  char(1) NOT NULL 
	,DEPARTAMENTO VARCHAR(100) NOT NULL 
	,CONSTRAINT PK_FUNCIONARIO Primary key (Matricula)  -- Chave Primária (Não se repete e não pode ser nula) 
	,CONSTRAINT UN_FUNCIONARIO UNIQUE (CPF,ADMISSAO)  -- Unique (Valor único não pode repetir) 
) 
 
-- MANIPULAÇÃO DE DADOS 
-- Inserção de dados 
INSERT [FUNCIONARIO] (Nome, CPF, DataNcto, SALARIO, STATUS, 
DEPARTAMENTO) VALUES ('José da Silva','12345678900','19911121', 1500, 
1, 'TI') 
INSERT [FUNCIONARIO] (Nome, CPF, DataNcto, SALARIO, STATUS, 
DEPARTAMENTO) VALUES ('Maria da Silva',  '12345678911','20000317', 
2000, 1, 'TI') 
INSERT [FUNCIONARIO] (Nome, CPF, DataNcto, SALARIO, STATUS, 
DEPARTAMENTO) VALUES ('Ana da Silva', '12345678922','20000417', 3500, 
2, 'RH')
SELECT * FROM FUNCIONARIO
TRUNCATE TABLE FUNCIONARIO
------------------------------------------------------- 
--Variáveis globais 
declare @nome varchar(100),  @mes varchar(20) 

--Variáveis locais 
declare @admissao varchar(20), @salario numeric(7,2), @status 
char(1), @departamento varchar(100) 
------------------------------------------------------- 
--Variáveis globais que serão passadas como parâmetro (STORED PROCEDURE) 
set @mes='janeiro' 
set @nome='José da silva' 
------------------------------------------------------- 
--Verifica se o Funcionário existe no Banco de Dados 
If (select COUNT(*) from FUNCIONARIO where NOME=@nome) = 0 
 print 'Funcionário não cadastrado' 
Else 
Begin 
  
--Atribui valores às variáveis 
select @salario=salario,  
  @status=status,  
  @departamento=departamento  
from funcionario where nome = @nome 
 
set @admissao = (select case month(admissao)  
    when 1 then 'Janeiro' 
                when 2 then 'Fevereiro' 
                when 3 then 'Março' 
                when 4 then 'Abril' 
                when 5 then 'Maio' 
                when 6 then 'Junho' 
                when 7 then 'Julho' 
                when 8 then 'Agosto' 
                when 9 then 'Setembro' 
                when 10 then 'Outubro' 
                when 11 then 'Novembro' 
                else 'Dezembro' 
                END   
                from funcionario where nome = @nome) 
 
if @admissao = @mes 
    Begin 
        if @status = 1 
            begin 
                if @departamento = 'TI' 
                    Begin 
      print 'Esse mês tem gratificação + R$ 
1000' 
     End 
                else 
                    Begin 
      print 'Esse mês tem gratificação' 
     End 
            end 
        else 
            begin 
    print 'sem gratificação - Afastado' 
   end 
    End 
Else 
    Begin 
  print 'sem gratificação' 
 End 
End

---------------------------------------------------------------------------------------------
create table ALUNO2  
(matricula int primary key,  
 nome varchar(100),  
 turma varchar(100),  
 mensalidade numeric(7,2),  
 nota1 numeric(3,1),  
 nota2 numeric(3,1), 
 municipio varchar(100))
 
 insert aluno2 values(1,'José','3a',1500, 8,9, 'Curitiba') 
 insert aluno2 values(2,'Maira','3B',500, 2,9, 'São José dos Pinhais') 
 insert aluno2 values(3,'Pedro','3a',2500, 6,5, 'Curitiba') 
 insert aluno2 values(4,'Tereza','3B',500, 9,9, 'São José dos Pinhais') 
 insert aluno2 values(5,'Marli','3a',3500, 4,2, 'Curitiba') 
 insert aluno2 values(6,'Roberto','3B',750, 8,9, 'Curitiba') 
 insert aluno2 values(7,'Carlos','3a',100, 7,5, 'São José dos Pinhais') 
 insert aluno2 values(8,'Maria','3B',2500, 10,8, 'Curitiba') 
 insert aluno2 values(9,'Francisco','3a',3500, 4,3, 'Curitiba') 
 insert aluno2 values(10,'Marialva','3B',4500, 8,9, 'São José dos Pinhais')
 SELECT * FROM ALUNO2
 TRUNCATE TABLE ALUNO2

---------------------------------------------------------------------------------------
/* 1. Crie uma stored procedure que selecione os alunos do município de Curitiba. */
CREATE PROCEDURE sp_aluno
--ALTER PROCEDURE sp_aluno
AS
SELECT * FROM ALUNO2 WHERE Municipio = 'Curitiba'

EXECUTE sp_aluno
-- ou EXEC sp_aluno

---------------------------------------------------------------------------------------
/* 2. Crie uma stored procedure que selecione o número de alunos do município 
de São José dos Pinhais com média maior ou igual a 7.  */

-- sp = stored procedure (Procedimento Armazenado)
CREATE PROCEDURE sp_nomeAluno

-- Altera a Procedure
--ALTER PROCEDURE sp_nomeAluno 
AS
SELECT COUNT(*) as 'Número' FROM ALUNO2 

WHERE Municipio = 'São José dos Pinhais' and ((nota1 + nota2) / 2) >= 7

EXECUTE sp_nomeAluno

---------------------------------------------------------------------------------------
/* 3. Crie uma stored procedure que some o valor das mensalidades por 
município passando o nome do município por parâmetro. */

CREATE PROCEDURE sp_valorMensalidades @municipio varchar(100)
--ALTER PROCEDURE sp_valorMensalidades @municipio varchar(100)
AS SELECT SUM(mensalidade) AS 'Soma das mensalidades por município' FROM ALUNO2 WHERE municipio = @municipio

EXEC sp_valorMensalidades @municipio = 'Curitiba'

---------------------------------------------------------------------------------------
/* 4. Crie uma stored procedure que calcule a média de um aluno, passando a
matricula do mesmo como parâmetro e informe se o mesmo está aprovado
para média maior igual a sete, reprovado para média menor que quatro e em
recuperação para médias maiores ou igual a quatro e menores que sete. */

CREATE PROCEDURE sp_mediaAluno @matricula int
ALTER PROCEDURE sp_mediaAluno @matricula int
AS 
	DECLARE @MEDIA NUMERIC(7,2)
	SET @MEDIA = (SELECT (nota1 + nota2 / 2) FROM ALUNO2 WHERE matricula = @matricula)

	IF (@MEDIA >= 7)
		BEGIN
			SELECT 'Aluno aprovado - Média: ' + CAST(@MEDIA AS CHAR(5)) AS 'Situação do aluno'
		END
	ELSE IF (@MEDIA < 4)
		BEGIN
			SELECT 'Aluno reprovado - Média: ' + CONVERT(CHAR(5), @MEDIA) AS 'Situação do aluno' 
		END
	ELSE
			SELECT 'Aluno em recuperação - Média: ' + CONVERT(CHAR(5), @MEDIA) AS 'Situação do aluno'

EXECUTE sp_mediaAluno @matricula = 10

---------------------------------------------------------------------------------------
/* 5. Crie uma stored procedure que mostre o nome e a média de todos alunos do
município de Curitiba. */

CREATE PROCEDURE sp_situacaoAlunos
--ALTER PROCEDURE sp_situacaoAlunos 
AS 
	SELECT nome as 'Nome do Aluno', ((nota1 + nota2) / 2) as 'Média do aluno' FROM ALUNO2 WHERE municipio = 'Curitiba' 

EXECUTE sp_situacaoAlunos

---------------------------------------------------------------------------------------
-- Exemplos

create table aluno
(matricula int primary key identity,
 nome varchar(100),
 cpf char(11),
 email varchar(100),
 turma varchar(100)) 

/* Criação de procedure de inserção de dados */
create procedure sp_alu
@nome varchar(100), @cpf char(11), @email varchar(100), @turma varchar(100)
as
insert aluno (nome, cpf, email, turma) values (@nome, @cpf, @email, @turma)
/* Na criação da procedure executar somente até aqui */
/* Comando para executar a procedure */
exec sp_alu @nome='josé', @cpf = 42345678402, @email = 'jose@uol.com.br', @turma =
'informática'

---------------------------------------------------------------------------------------
/* Criação de procedure que controla a inserção repetida de aluno e se a turma está lotada */
create procedure sp_aluno
@nome varchar(100), @cpf char(11), @email varchar(100), @turma varchar(100)
as
declare @cont int
IF EXISTS (SELECT cpf FROM aluno WHERE cpf = @cpf)
begin
print 'CPF já cadastrado'
end
else
begin
set @cont = (select count(*) from aluno where turma = @turma)
if @cont > 10
print 'Turma lotada'
else
insert aluno (nome, cpf, email, turma) values (@nome, @cpf, @email, @turma)
end
/* Na criação da procedure executar somente até aqui */
/* Comando para executar a procedure */
exec sp_aluno @nome='josé', @cpf = 42345678402, @email = 'jose@uol.com.br', @turma =
'informática'

---------------------------------------------------------------------------------------
/* Exemplo de Stored Procedure que insere dados se o aluno não existir e altera se o mesmo
já for cadastrado */
alter procedure sp_aluno_IU
@nome varchar(100), @cpf char(11), @email varchar(100), @turma varchar(100)
as
declare @cont int
IF EXISTS (SELECT cpf FROM aluno WHERE cpf = @cpf)
begin
Print 'CPF já cadastrado'
Update aluno set nome=@nome, email=@email, turma=@turma where
cpf=@cpf
end
else
begin
set @cont = (select count(*) from aluno where turma = @turma)
if @cont > 10
print 'Turma lotada'
else
insert aluno (nome, cpf, email, turma) values (@nome, @cpf, @email, @turma)
end
/* Na criação da procedure executar somente até aqui */
/* Comando para executar a procedure */
exec sp_aluno_IU @nome='carlos de oliveira', @cpf = 42345678302, @email =
'carlos@uol.com.br', @turma = 'informática'

---------------------------------------------------------------------------------
/* Exercícios */

CREATE TABLE funcionario
(matricula int primary key,
nome varchar(100),
salario numeric(20,4),
departamento varchar(100),
cargo varchar(100))

DROP TABLE funcionario
SELECT * FROM funcionario
TRUNCATE TABLE funcionario

/* 1. Criar procedure para inserir dados na tabela FUNCIONARIO (MATRICULA, NOME,
SALARIO, DEPARTAMENTO, CARGO); */

CREATE PROCEDURE sp_inser
@matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)
--ALTER PROCEDURE sp_inser
--@matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)

AS

INSERT funcionario (matricula, nome, salario, departamento, cargo) values (@matricula, @nome, @salario, @departamento, @cargo)

EXEC sp_inser @matricula = 1, @nome='Lucas', @salario = 1000.00, @departamento = 'TI', @cargo = 'Dev Júnior'

SELECT * FROM funcionario

---------------------------------------------------------------------------------
/* 2. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o
funcionário já existir alterar os dados do mesmo. */

CREATE PROCEDURE sp_inser2
@matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)

--ALTER PROCEDURE sp_inser2
--@matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)

AS

IF EXISTS (SELECT nome FROM funcionario WHERE nome = @nome)
	BEGIN
		UPDATE funcionario set nome = @nome, salario = @salario, 
		departamento = @departamento, cargo = @cargo where nome=@nome
	END
ELSE
	INSERT funcionario (matricula, nome, salario, departamento, cargo) values (@matricula, @nome, @salario, @departamento, @cargo)

EXEC sp_inser2 @matricula = 7, @nome='Luca', @salario = 1050.00, @departamento = 'TI', @cargo = 'Dev Júnior'

SELECT * FROM funcionario

---------------------------------------------------------------------------------
/* 3. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o cargo
do funcionário for GERENTE o salário do mesmo deve ser acrescido de um bônus de
10% e se o funcionário já existir alterar os dados devem ser alterados na tabela. */

--CREATE PROCEDURE sp_inser3 @matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)

ALTER PROCEDURE sp_inser3 @matricula int, @nome varchar(100), @salario numeric(20,4), @departamento varchar(100), @cargo varchar(100)

AS

IF EXISTS (SELECT cargo FROM funcionario WHERE cargo = 'Gerente')
	BEGIN
		UPDATE funcionario set salario = (@salario + (@salario * 0.1)) where cargo = 'Gerente'
	END
ELSE IF EXISTS (SELECT matricula FROM funcionario WHERE matricula = @matricula)
	BEGIN
		UPDATE FUNCIONARIO 
		SET MATRICULA = @matricula, NOME = @nome, SALARIO = @salario, DEPARTAMENTO = @departamento, CARGO = @cargo
		WHERE MATRICULA = @matricula
	END

EXEC sp_inser3 @matricula = 123, @nome='Ana Paula', @salario = 1000.00, @departamento = 'Recursos Humanos', @cargo = 'Jovem Aprendiz'

SELECT * FROM funcionario

---------------------------------------------------------------------------------
/* 4. Considerar a tabela PRODUTO (CODIGO, NOME, QUANTIDADE, VALOR) para criar
uma procedure de inserção de dados e se o produto já existir alterar a quantidade em
estoque do mesmo. */

CREATE TABLE produto
(codigo int primary key,
nome varchar(100),
quantidade int,
valor varchar(100))

DROP TABLE produto
SELECT * FROM produto
TRUNCATE TABLE produto

CREATE PROCEDURE sp_inser4 @codigo int, @nome varchar(100), @quantidade int, @valor varchar(100)
--ALTER PROCEDURE sp_inser4 @codigo int, @nome varchar(100), @quantidade int, @valor varchar(100)

AS

IF EXISTS (SELECT codigo FROM produto WHERE codigo = @codigo)
	BEGIN
		UPDATE produto set quantidade = @quantidade
	END
ELSE 
	INSERT produto (codigo, nome, quantidade, valor) values (@codigo, @nome, @quantidade, @valor)

EXEC sp_inser4 1,'Parafuso',12, 100.00

SELECT * FROM produto

 ---------------------------------------------------------------------------------
/* 5. Considerando o DE-R acima, elaborar stored procedure para inserir dados na tabela
NF_PRODUTO (QUANTIDADE, CODIGO, NUMERO) cancelando a inserção se a
quantidade vendida for menor que a quantidade em estoque. */

CREATE TABLE NF_PRODUTO
(quantidade int,
codigo int,
numero int)

SELECT * FROM NF_PRODUTO
DROP TABLE NF_PRODUTO
TRUNCATE TABLE NF_PRODUTO

CREATE PROCEDURE sp_inser5 @quantidade int, @codigo int, @numero int
--ALTER PROCEDURE sp_inser5 @quantidade int, @codigo int, @numero int

AS

DECLARE @quantidade_estoque INT
SET @quantidade_estoque = 1

INSERT NF_PRODUTO (quantidade, codigo, numero) VALUES (@quantidade, @codigo, @numero)

IF (SELECT (quantidade < @quantidade_estoque) FROM NF_PRODUTO WHERE quantidade = @quantidade)
	BEGIN
		TRUNCATE TABLE NF_PRODUTO
	END

EXEC sp_inser5 10, 1, 1234 

SELECT * FROM NF_PRODUTO

---------------------------------------------------------------------------------
/* 1. Criar procedure para inserir dados na tabela FUNCIONARIO (MATRICULA, NOME,
SALARIO, DEPARTAMENTO, CARGO); */
create table FUNCIONARIO
( MATRICULA int not null primary key,
 NOME varchar(30),
 SALARIO numeric(12,2),
 DEPARTAMENTO varchar(40),
 CARGO varchar(40)
)
create procedure insert_funcionario
 @matricula int, @nome varchar(30), @salario numeric(12,2),
 @departamento varchar(40), @cargo varchar(40)
AS
INSERT INTO FUNCIONARIO values(@matricula, @nome, @salario, @departamento, @cargo)
--execução
exec insert_funcionario @matricula = 19550942, @nome = 'Maria Silva', @salario =
800,
@departamento = 'TI', @cargo = 'Digitadora'
SELECT * FROM FUNCIONARIO

/* 2. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o
funcionário já existir alterar os dados do mesmo. */
create procedure insert_funcionario_2
 @matricula int, @nome varchar(30), @salario numeric(12,2), @departamento
varchar(40), @cargo
varchar(40)
AS
DECLARE @matricula_cod int
set @matricula_cod = 0
SELECT @matricula_cod = MATRICULA FROM FUNCIONARIO WHERE MATRICULA = @matricula
IF @matricula_cod = 0
BEGIN
INSERT INTO FUNCIONARIO values(@matricula, @nome, @salario, @departamento, @cargo)
END
ELSE
BEGIN
UPDATE FUNCIONARIO
SET NOME = @nome, SALARIO = @salario, DEPARTAMENTO = @departamento, CARGO = @cargo
WHERE MATRICULA = @matricula
END
exec insert_funcionario_2 @matricula = 19550943, @nome = 'Marta', @salario =
3900,
@departamento = 'RH', @cargo = 'Recrutador'
select * from funcionario

/* 3. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o cargo
do funcionário for GERENTE o salário do mesmo deve ser acrescido de um bônus de
10% e se o funcionário já existir alterar os dados devem ser alterados na tabela. */
CREATE PROCEDURE @matricula int, @nome varchar(30), @salario numeric(12,2), @departamento
varchar(40), @cargo
varchar(40)
AS
DECLARE @matricula_cod int, @bonus numeric(12,2)
set @matricula_cod = 0 
SELECT @matricula_cod = MATRICULA FROM FUNCIONARIO WHERE MATRICULA = @matricula
IF @cargo = 'GERENTE'
BEGIN
UPDATE FUNCIONARIO
SET SALARIO = SALARIO * 1.1
WHERE MATRICULA = @matricula
END
ELSE IF @cargo <> 'GERENTE'
BEGIN
IF @matricula_cod = 0
 BEGIN
 INSERT INTO FUNCIONARIO values(@matricula, @nome, @salario+@bonus,
@departamento, @cargo)
 END
ELSE
 BEGIN
 UPDATE FUNCIONARIO
 SET NOME = @nome, SALARIO = @salario, DEPARTAMENTO = @departamento,CARGO =
@cargo
 WHERE MATRICULA = @matricula
END
END
SELECT * FROM FUNCIONARIO
exec insert_bonus_gerente @matricula = 19550943, @nome = 'Ana Paula', @salario =
1900,
@departamento = 'RH', @cargo = 'GERENTE'

/* 4. Considerar a tabela PRODUTO (CODIGO, NOME, QUANTIDADE, VALOR) para criar
uma procedure de inserção de dados e se o produto já existir alterar a quantidade em
estoque do mesmo. */
create table PRODUTO
(
 CODIGO int not null primary key,
 NOME varchar(30),
 QUANTIDADE int,
 VALOR numeric(12,2)
)
create procedure sp_insert_produtos
 @codigo int, @nome varchar(30), @quantidade int, @valor numeric(12,2)
AS
DECLARE @produto_cod int
set @produto_cod = 0
SELECT @produto_cod = CODIGO FROM PRODUTO WHERE CODIGO = @codigo
IF @produto_cod = 0
BEGIN
INSERT INTO PRODUTO values(@codigo, @nome, @quantidade, @valor)
END
ELSE
BEGIN
UPDATE PRODUTO
SET QUANTIDADE = @quantidade
WHERE CODIGO = @codigo
END
--execução
exec sp_insert_produtos @codigo = 1450, @nome = 'Mamao', @quantidade = 55, @valor =
3.20 
SELECT * FROM PRODUTO

/* 5. Considerando o DE-R acima, elaborar stored procedure para inserir dados na tabela
NF_PRODUTO (QUANTIDADE, CODIGO, NUMERO) cancelando a inserção se a
quantidade vendida for menor que a quantidade em estoque. */
create table NF_PRODUTO
(
QUANTIDADE int,
NF_CODIGO int,
NF_NUMERO int,
CONSTRAINT FK_Codig FOREIGN KEY (NF_CODIGO) REFERENCES PRODUTO (CODIGO),
CONSTRAINT FK_Numero FOREIGN KEY (NF_NUMERO) REFERENCES NOTA_FISCAL (NUMERO)
)
SELECT * FROM NF_PRODUTO

create table PRODUTO
(
 CODIGO int not null primary key,
 NOME varchar(50),
 QUANTIDADE int,
 VALOR numeric(12,2)
)
create table NOTA_FISCAL
(
 NUMERO int not null primary key,
DATA date
)
create procedure SP_INSERT_NF_PRODUTO
 @quantidade int, @codigo int, @numero int
AS
DECLARE @estoque int, @vendidos int
SELECT @estoque = P.QUANTIDADE,@vendidos = NP.QUANTIDADE FROM PRODUTO P,
NF_PRODUTO NP
WHERE P.CODIGO = @codigo
AND NP.NF_NUMERO = @numero
AND P.CODIGO = NP.NF_CODIGO -- Relacionamento
IF @vendidos < @estoque
BEGIN
PRINT 'Inserção cancelada por que numero de vendas esta menor que estoque'
END
ELSE
BEGIN
INSERT INTO NF_PRODUTO VALUES(@quantidade, @codigo, @numero)
END
SELECT * FROM PRODUTO
SELECT * FROM NF_PRODUTO
SELECT * FROM NOTA_FISCAL
INSERT INTO NOTA_FISCAL VALUES(4545, '20220322')
INSERT INTO NF_PRODUTO VALUES(10, 1450, 4545)
---Execução
exec SP_INSERT_NF_PRODUTO @quantidade = 2, @codigo = 1450, @numero = 4545
---------------------------------------------------------------------------------

/* 1. Exercícios de Stored Procedures 240322
1) Desenvolva uma procedure em PL/SQL que faça a verificação na tabela aluno
se o mesmo está aprovado (maior igual a 7), recuperação (maior que 4 e menor
que 7) e reprovado (menor que 4). Crie a tabela com os seguintes campos
código, nome, nota1, nota2, coddis, mensalidade, qtdefalta) */

CREATE TABLE ALUNOS
( CODIGO int primary key,
 NOME varchar(30),
 NOTA1 numeric(12,2),
 NOTA2 numeric(12,2),
 CODDIS int,
 MENSALIDADE numeric(12,2),
 QTDEFALTA int
)

SELECT * FROM ALUNOS
DROP TABLE ALUNOS

INSERT INTO ALUNOS values(1,'José', 10.2, 5.5, 2, 550.50, 6)
INSERT INTO ALUNOS values(2,'Lucas', 6, 4, 1, 1000.50, 4) 
INSERT INTO ALUNOS values(3,'Maria', 8, 3, 7, 320.50, 0)
INSERT INTO ALUNOS values(4,'João', 2, 2, 3, 300.00, 1)
INSERT INTO ALUNOS values(5,'Josélia', 4, 4, 2, 600.00, 3)
INSERT INTO ALUNOS values(6,'Pedro', 10, 9.6, 2, 500.00, 5)
INSERT INTO ALUNOS values(7,'Larissa', 5, 2, 1, 100.90, 4) 
INSERT INTO ALUNOS values(8,'Daniela', 2, 1, 8, 1100.50, 3)
INSERT INTO ALUNOS values(9,'Júlio', 9, 8, 4, 400.00, 8)
INSERT INTO ALUNOS values(10,'César', 5, 4, 3, 900.00, 0)

SELECT * FROM ALUNOS     
TRUNCATE TABLE ALUNOS

CREATE PROCEDURE sp_verifica @codigo int

--ALTER PROCEDURE sp_verifica @codigo int

AS

DECLARE @MEDIA numeric(12,2)

SET @MEDIA = (SELECT ((NOTA1 + NOTA2) / 2) FROM ALUNOS WHERE CODIGO = @codigo)

IF @MEDIA >=  7
BEGIN
	PRINT 'Aluno Aprovado - Média: ' + CONVERT(CHAR(5), @MEDIA)
END
ELSE IF @MEDIA > 4 and @MEDIA < 7
BEGIN
	PRINT 'Aluno em Recuperação - Média: ' + CONVERT(CHAR(5), @MEDIA)
END
ELSE
BEGIN
	PRINT 'Aluno Reprovado - Média: ' + CONVERT(CHAR(5), @MEDIA)
END

EXEC sp_verifica 2

SELECT * FROM ALUNOS

------------------------------------------------------------------------------

/* 2 Crie uma procedure em PL/SQL para inserir um aluno na tabela apenas se a
quantidade de alunos for menor que 10 senão apresentar a quantidade e
mensagem turma lotada. */

CREATE PROCEDURE sp_insert_aluno @codigo int, @nome varchar(30), @nota1 numeric(12,2), @nota2 numeric(12,2), @coddis int, @mensalidade numeric(12,2), @qtdefalta int
--ALTER PROCEDURE sp_insert_aluno @codigo int, @nome varchar(30), @nota1 numeric(12,2), @nota2 numeric(12,2), @coddis int, @mensalidade numeric(12,2), @qtdefalta int
AS

DECLARE @quantidade int
SET @quantidade = (SELECT COUNT(*) FROM ALUNOS)

IF @quantidade < 10
BEGIN
	INSERT INTO ALUNOS values (@codigo, @nome, @nota1, @nota2, @coddis, @mensalidade, @qtdefalta)
END
ELSE
BEGIN
	SELECT 'Total de alunos: ' + CONVERT(CHAR(5), @quantidade) + '- Turma lotada' AS 'Situação da turma'
END

EXEC sp_insert_aluno 11, 'Gabriela', 6, 6, 2, 320.00, 7 

SELECT * FROM ALUNOS

------------------------------------------------------------------------------

/* 3) Faça uma procedure em PL/SQL que apresente a quantidade de alunos
aprovados, em recuperação e reprovados. */

CREATE PROCEDURE sp_situation 
--ALTER PROCEDURE sp_situation
AS

DECLARE @MEDIA numeric(12,2), @aprovados int, @recuperacao int, @reprovados int

--SET @MEDIA = (SELECT ((NOTA1 + NOTA2) / 2) FROM ALUNOS WHERE CODIGO = @codigo)
SET @aprovados = (SELECT COUNT(*) FROM ALUNOS WHERE ((NOTA1 + NOTA2) / 2) >= 7)
SET @recuperacao = (SELECT COUNT(*) FROM ALUNOS WHERE ((NOTA1 + NOTA2) / 2) >= 4 AND  ((NOTA1 + NOTA2) / 2) < 7)
SET @reprovados = (SELECT COUNT(*) FROM ALUNOS WHERE ((NOTA1 + NOTA2) / 2) < 4)

SELECT @aprovados AS 'Total de aprovados'
SELECT @recuperacao AS 'Total em recuperação'
SELECT @reprovados AS 'Total de reprovados'

EXEC sp_situation 

---------------------------------------------------------------------------------

/* 4) Crie a tabela disciplina (código, nome, cargaho) e relacione com a tabela aluno
e insira os dados na tabela disciplina e no campo da tabela aluno e elabore uma
procedure em PL/SQL que apresente os seguintes valores:
a) Para a disciplina Matemática mensalidade mais 10%
b) Para Banco de dados mensalidade menos 20 %
c) Para Programação mensalidade mais 15% */

CREATE TABLE DISCIPLINA
(
CODIGO int,
NOME varchar (50),
CARGA varchar (50),
CONSTRAINT FK_CODIGO FOREIGN KEY (CODIGO) REFERENCES ALUNOS (CODIGO),
MENSALIDADE numeric (12,2)
)

INSERT INTO DISCIPLINA values(1,'Matemática', 50, 1000.00)
INSERT INTO DISCIPLINA values(2,'Banco de dados', 60, 1000.00) 
INSERT INTO DISCIPLINA values(3,'Programação', 48, 1000.00)
INSERT INTO DISCIPLINA values(4,'Programação', 35, 1000.00)
INSERT INTO DISCIPLINA values(5,'Português', 30, 1000.00)
INSERT INTO DISCIPLINA values(6,'Ciências', 48, 1000.00)
INSERT INTO DISCIPLINA values(7,'Física', 50, 1000.00) 
INSERT INTO DISCIPLINA values(8,'Matemática', 35, 1000.00)
INSERT INTO DISCIPLINA values(9,'Banco de dados', 30, 1000.00)
INSERT INTO DISCIPLINA values(10,'Química', 15, 1000.00)

SELECT * FROM DISCIPLINA
DROP TABLE DISCIPLINA

CREATE PROCEDURE sp_valores @codigo int
--ALTER PROCEDURE sp_valores @codigo int

AS

DECLARE @disciplina varchar(100), @mensalidade numeric(12,2)

SET @disciplina = (SELECT NOME FROM DISCIPLINA WHERE CODIGO = @codigo)
SET @mensalidade = (SELECT MENSALIDADE FROM DISCIPLINA WHERE CODIGO = @codigo)

IF (@disciplina = 'Matemática')
BEGIN
	SET @mensalidade = @mensalidade + (@mensalidade * 0.1)
	SELECT 'Disciplina de ' + @disciplina + ': R$ ' + CONVERT(CHAR(10), @mensalidade) AS 'Preço mensalidade'
END
ELSE IF (@disciplina = 'Banco de dados')
BEGIN
	SET @mensalidade = @mensalidade + (@mensalidade * 0.2)
	SELECT 'Disciplina de ' + @disciplina + ': R$ ' + CONVERT(CHAR(10), @mensalidade) AS 'Preço mensalidade'
END
ELSE IF (@disciplina = 'Programação')
BEGIN
	SET @mensalidade = @mensalidade + (@mensalidade * 0.15)
	SELECT 'Disciplina de ' + @disciplina + ': R$ ' + CONVERT(CHAR(10), @mensalidade) AS 'Preço mensalidade'
END
ELSE
BEGIN
	SELECT 'Disciplina de ' + @disciplina + ': R$ ' + CONVERT(CHAR(10), @mensalidade) AS 'Preço mensalidade'
END

EXEC sp_valores 1

SELECT * FROM DISCIPLINA
TRUNCATE TABLE DISCIPLINA

---------------------------------------------------------------------------------

/* 5 Desenvolva uma procedure em PL/SQL que passe por parâmetro o código do
aluno e se não encontrar mostrar a mensagem aluno não cadastrado, se
encontrar mostrar o nome a media e a disciplina cursada. */

CREATE PROCEDURE sp_codigo_aluno @codigo int
--ALTER PROCEDURE sp_codigo_aluno @codigo int

AS

DECLARE @media numeric(12,2), @disciplina varchar (100), @nome varchar(50)

SET @media = (SELECT ((NOTA1 + NOTA2) / 2) FROM ALUNOS WHERE CODIGO = @codigo)
SET @disciplina = (SELECT NOME FROM DISCIPLINA WHERE CODIGO = @codigo)
SET @nome = (SELECT NOME FROM ALUNOS WHERE CODIGO = @codigo)

IF EXISTS (SELECT CODIGO FROM ALUNOS WHERE CODIGO = @codigo)

BEGIN
	SELECT @nome AS Nome
	SELECT @media AS Média
	SELECT @disciplina AS Disciplina
END
ELSE
	BEGIN
		SELECT 'Aluno não encontrado' AS Aluno
	END

EXEC sp_codigo_aluno 2

---------------------------------------------------------------------------------
-- REPETIDOS

create table FUNCIONARIO
( MATRICULA int not null primary key,
 NOME varchar(30),
 SALARIO numeric(12,2),
 DEPARTAMENTO varchar(40),
 CARGO varchar(40)
)
/* 2. Criar procedure para inserir dados na tabela FUNCIONARIO do exercício 1. Se o
funcionário já existir alterar os dados do mesmo. */

CREATE PROCEDURE sp_inserir @matricula int, @nome varchar(30), @salario numeric(12,2), @departamento varchar(40), @cargo varchar (40)
--ALTER PROCEDURE sp_inserir @matricula int, @nome varchar(30), @salario numeric(12,2), @departamento varchar(40), @cargo varchar (40)

AS

DECLARE @cod_funcionario int

SET @cod_funcionario = (SELECT MATRICULA FROM FUNCIONARIO WHERE MATRICULA = @matricula)

IF @matricula = @cod_funcionario
	BEGIN
		UPDATE FUNCIONARIO SET MATRICULA = @matricula, NOME = @nome, SALARIO = @salario, DEPARTAMENTO = @departamento, CARGO = @cargo
		WHERE @matricula = MATRICULA
	END
ELSE
	BEGIN
		INSERT INTO FUNCIONARIO VALUES (@matricula, @nome, @salario, @departamento, @cargo)
	END

EXEC sp_inserir 222, 'Lucas', 1500.00, 'TI', 'Estagiário'

SELECT * FROM FUNCIONARIO

---------------------------------------------------------------------------------

-- EXERCICIOS DE STORED PROCEDURE 310322

--1) Crie um stored procedure em PL/SQL que passe por parâmetro o código da
--disciplina e mostre a qtde de alunos e a soma das mensalidades.

CREATE TABLE DISCIPLINA
(
CODIGO int PRIMARY KEY,
NOME varchar (50),
CARGA varchar (50),
FK_CODIGO int FOREIGN KEY REFERENCES ALUNOS (CODDIS),
MENSALIDADE numeric (12,2)
)

INSERT INTO DISCIPLINA values(1,'Matemática', 50, 1, 1000.00)
INSERT INTO DISCIPLINA values(2,'Banco de dados', 40, 2, 1000.00) 
INSERT INTO DISCIPLINA values(3,'Programação',30, 3, 1000.00)
INSERT INTO DISCIPLINA values(4,'Português', 20, 4, 1000.00)
INSERT INTO DISCIPLINA values(5,'Ciências', 25, 5, 1000.00)
INSERT INTO DISCIPLINA values(6,'Física', 45, 6, 1000.00) 
INSERT INTO DISCIPLINA values(7,'Química', 40, 7, 1000.00)
INSERT INTO DISCIPLINA values(8,'Biologia', 50, 8, 1000.00)
INSERT INTO DISCIPLINA values(9,'Artes', 45, 9, 1000.00) 
INSERT INTO DISCIPLINA values(10,'Geografia', 40, 10, 1000.00)

SELECT * FROM DISCIPLINA
DROP TABLE DISCIPLINA
TRUNCATE TABLE DISCIPLINA

CREATE TABLE ALUNOS
( CODIGO int,
 NOME varchar(30),
 NOTA1 numeric(12,2),
 NOTA2 numeric(12,2),
 CODDIS int PRIMARY KEY,
 MENSALIDADE numeric(12,2),
 QTDEFALTA int
)

SELECT * FROM ALUNOS
DROP TABLE ALUNOS

INSERT INTO ALUNOS values(1,'José', 10.2, 5.5, 1, 550.50, 6)
INSERT INTO ALUNOS values(2,'Lucas', 6, 4, 2, 1000.50, 4) 
INSERT INTO ALUNOS values(3,'Maria', 8, 3, 3, 320.50, 0)
INSERT INTO ALUNOS values(4,'João', 2, 2, 4, 300.00, 1)
INSERT INTO ALUNOS values(5,'Josélia', 4, 4, 5, 600.00, 3)
INSERT INTO ALUNOS values(6,'Pedro', 10, 9.6, 6, 500.00, 5)
INSERT INTO ALUNOS values(7,'Larissa', 5, 2, 7, 100.90, 4) 
INSERT INTO ALUNOS values(8,'Daniela', 2, 1, 8, 1100.50, 3)
INSERT INTO ALUNOS values(9,'Júlio', 9, 8, 9, 400.00, 8)
INSERT INTO ALUNOS values(10,'César', 5, 4, 10, 900.00, 0)

TRUNCATE TABLE ALUNOS

SELECT * FROM ALUNOS     

--CREATE PROCEDURE sp_mostra_disciplina @codigo int
ALTER PROCEDURE sp_mostra_disciplina @codigo int

AS

DECLARE @total int, @soma int

SET @total = (SELECT COUNT(*) ALUNOS FROM DISCIPLINA d
INNER JOIN ALUNOS a
on a.CODDIS = d.FK_CODIGO
WHERE a.CODIGO = @codigo)

SET @soma = (SELECT SUM(d.MENSALIDADE) 'SOMA DAS MENSALIDADES' FROM DISCIPLINA d 
INNER JOIN ALUNOS a
on a.CODIGO = d.FK_CODIGO
WHERE a.CODIGO = @codigo)

SELECT @total as 'Quantidade de alunos'
SELECT @soma as 'Soma das mensalidades'

EXEC sp_mostra_disciplina 2

SELECT * FROM DISCIPLINA
SELECT * FROM ALUNOS

---------------------------------------------------------------------------------

--2) Elabore uma procedure em PL/SQL que passe por parâmetro um código de
--aluno e verifique se está aprovado, recuperação ou reprovado, também está
--reprovado se a qtde de faltas for maior 3.

--CREATE PROCEDURE sp_situacao_aluno @codigo_aluno int
ALTER PROCEDURE sp_situacao_aluno @codigo_aluno int

AS

DECLARE @MEDIA numeric(12,2), @REPRO int

SET @MEDIA = (SELECT ((NOTA1 + NOTA2) / 2) FROM ALUNOS WHERE CODIGO = @codigo_aluno)
SET @REPRO = (SELECT QTDEFALTA FROM ALUNOS WHERE CODIGO = @codigo_aluno)

IF @MEDIA >=  7 and @REPRO <= 3
BEGIN
	PRINT 'Aluno Aprovado - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END
ELSE IF @MEDIA > 4 and @MEDIA < 7 and @REPRO <= 3
BEGIN
	PRINT 'Aluno em Recuperação - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END
ELSE IF @MEDIA <= 4 or @REPRO > 3
BEGIN
	PRINT 'Aluno Reprovado - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END

EXEC sp_situacao_aluno 9

---------------------------------------------------------------------------------

--3) Desenvolva uma procedure em PL/SQL que passe por parâmetro um código
--de aluno e atualize a mensalidade em 20% caso esteja reprovado, 10% para
--recuperação e um desconto de 30% se aprovado.

--CREATE PROCEDURE sp_situacao_alunos @codigo_aluno int
ALTER PROCEDURE sp_situacao_alunos @codigo_aluno int

AS

DECLARE @MEDIA numeric(12,2), @REPRO int, @mensalidade_aprovado numeric(12, 2), @mensalidade_recuperacao numeric(12, 2), @mensalidade_reprovado numeric(12, 2)

SET @MEDIA = (SELECT ((NOTA1 + NOTA2) / 2) FROM ALUNOS WHERE CODIGO = @codigo_aluno)
SET @REPRO = (SELECT QTDEFALTA FROM ALUNOS WHERE CODIGO = @codigo_aluno)
SET @mensalidade_aprovado = (SELECT (MENSALIDADE  - (MENSALIDADE * 0.3)) FROM ALUNOS WHERE CODIGO = @codigo_aluno)
SET @mensalidade_recuperacao = (SELECT (MENSALIDADE  + (MENSALIDADE * 0.1)) FROM ALUNOS WHERE CODIGO = @codigo_aluno)
SET @mensalidade_reprovado = (SELECT (MENSALIDADE  + (MENSALIDADE * 0.2)) FROM ALUNOS WHERE CODIGO = @codigo_aluno)

IF @MEDIA >=  7 and @REPRO <= 3 
BEGIN
	UPDATE ALUNOS SET MENSALIDADE = @mensalidade_aprovado WHERE CODIGO = @codigo_aluno
		PRINT 'Nova mensalidade: R$ ' + CONVERT (CHAR(7), @mensalidade_aprovado) + ' / Desconto aplicado no valor de 30%'
		PRINT 'Aluno Aprovado - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END
ELSE IF @MEDIA > 4 and @MEDIA < 7 and @REPRO <= 3
BEGIN
	UPDATE ALUNOS SET MENSALIDADE = @mensalidade_recuperacao WHERE CODIGO = @codigo_aluno
		PRINT 'Nova mensalidade: R$ ' + CONVERT (CHAR(7), @mensalidade_recuperacao) + ' / Aumento aplicado no valor de 10%'
		PRINT 'Aluno em Recuperação - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END
ELSE IF @MEDIA <= 4 or @REPRO > 3
BEGIN
	UPDATE ALUNOS SET MENSALIDADE = @mensalidade_reprovado WHERE CODIGO = @codigo_aluno
		PRINT 'Nova mensalidade: R$ ' + CONVERT (CHAR(7), @mensalidade_reprovado) + ' / Aumento aplicado no valor de 20%'
		PRINT 'Aluno Reprovado - Média: ' + CONVERT(CHAR(5), @MEDIA) + ' / Quantidade de faltas: ' + CONVERT(CHAR(100),@REPRO)
END

EXEC sp_situacao_alunos 6

---------------------------------------------------------------------------------

--4) Faça uma procedure em PL/SQL que receba por parâmetro um código de
--aluno e atualize a mensalidade em percentual, conforme a quantidade de faltas,
--ou seja, se 4 faltas aumentar em 4% a mensalidade do aluno.

--CREATE PROCEDURE sp_atualiza @codigo int
ALTER PROCEDURE sp_atualiza @codigo int

AS

DECLARE @mensalidade numeric(12, 2), @mensali_nova numeric(12, 2)

SET @mensalidade = (SELECT (MENSALIDADE + (MENSALIDADE * QTDEFALTA/100)) FROM ALUNOS WHERE CODIGO = @codigo)
SET @mensali_nova = @mensalidade

UPDATE ALUNOS SET MENSALIDADE = @mensali_nova WHERE CODIGO = @codigo

SELECT 'Nova mensalidade: R$ ' + CONVERT(CHAR(7), @mensali_nova) as 'Mensalidade atualizada'

EXEC sp_atualiza 6

SELECT MENSALIDADE FROM ALUNOS WHERE CODIGO = 6

SELECT * FROM ALUNOS

---------------------------------------------------------------------------------

--5) Elabore uma procedure em PL/SQL que verifique se o aluno tem mensalidade
--maior que 500 se sim adicione um novo campo email varchar(50) na tabela aluno
--e atualizar o email com as 3 primeiras letras do nome mais @unicesumar.edu.br
--a todos os alunos.

--CREATE PROCEDURE sp_email @codigo int, @nome varchar(30), @nota1 numeric(12,2), @nota2 numeric(12,2), @coddis int, @mensalidade numeric(12,2), @qtdefalta int
ALTER PROCEDURE sp_email @codigo int, @nome varchar(30), @nota1 numeric(12,2), @nota2 numeric(12,2), @coddis int, @mensalidade numeric(12,2), @qtdefalta int

AS

DECLARE @email varchar(50), @aluno_mensalidade numeric(12, 2)
SET @email = 0
SET @aluno_mensalidade = (SELECT MENSALIDADE FROM ALUNOS WHERE CODIGO = @codigo)

IF @aluno_mensalidade > 500
	BEGIN
		INSERT INTO ALUNOS VALUES (@codigo, @nome, @nota1, @nota2, @coddis, @mensalidade, @qtdefalta, @email)
		UPDATE ALUNOS SET @email = (SUBSTRING(@nome, 1, 3) + 'unicesumar.edu.br') WHERE CODIGO = @codigo
	END

EXEC sp_email 1, Lucas, 10, 8, 1, 1000.00, 2

SELECT * FROM ALUNOS

---------------------------------------------------------------------------------
