create database Db_17022022
use Db_17022022
use db_aula

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

--MANIPULAÇÃO DE DADOS
--Inserção de dados
INSERT ALUNO VALUES ('José da Silva','12345678900','19911121', 1000,'ADS3')
INSERT ALUNO VALUES ('Maria da Silva', '12345678911','20000317',1000, 'ADS1')
INSERT ALUNO VALUES ('Ana da Silva', '12345678922','20000317', 1000,'ADS3')
select * from Aluno

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
-------------------------
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
------------------------------------
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
-----------------------------------
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
------------------------------------------------------------
declare @valor int
set @valor = 300
SELECT @valor as Valor, IIF(@valor > 200,
'Acima do valor',
'Abaixo do valor') AS Situacao
-----------------------------
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
--------------------------------
------------------------------
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
--------------------------------------------------------------------------------------------
--EXERCÍCIOS DE DECLARAÇÃO DE VARIÁVEIS

--1) Verificar se o número de alunos de uma turma é maior que 5.
/*CRIAÇÃO DE VARIÁVEIS LOCAIS*/
DECLARE @TOTAL INT -- NÚMERO DE ALUNOS
DECLARE @TURMA CHAR(5) 
DECLARE @msg VARCHAR(100)

/*DEFININDO O VALOR DE CADA VARIÁVEL*/
SET @TURMA = 'ADS3'
SET @TOTAL = (SELECT COUNT(*) FROM Aluno WHERE Turma = @TURMA)

IF @TOTAL > 5
	BEGIN
	SET @msg = 'Maior que 5 a quantidade de alunos' + CONVERT(CHAR(10), @TOTAL)
	PRINT(@msg)
END
ELSE
BEGIN
	SET @msg = 'Menor que 5 a quantidade de alunos' + CONVERT(CHAR(10), @TOTAL)
	PRINT(@msg)
END

---------------------------------------------------------------------------------
--2) Usar declaração de variáveis para mostrar um desconto de 10% para mensalidade
--maior que 1000, e para menores desconto de 5% a um determinado aluno apenas.

/*CRIAÇÃO DE VARIÁVEIS LOCAIS*/
DECLARE @MENSALIDADE NUMERIC(6,2)
DECLARE @MENSALIDADE1 NUMERIC(6,2)
DECLARE @NOME VARCHAR(50)

/*DEFININDO O VALOR DE CADA VARIÁVEL*/
SET @MENSALIDADE = (SELECT TOP 1 Mensalidade FROM Aluno)
SET @MENSALIDADE1 = @MENSALIDADE
SET @NOME = (SELECT TOP 1 NomeAluno FROM Aluno)

IF @MENSALIDADE > 1000
	BEGIN
	SET @MENSALIDADE = @MENSALIDADE - (@MENSALIDADE * 0.1)
	PRINT 'Mensalidade de ' + CONVERT(CHAR(10), @MENSALIDADE1) + ' do Aluno ' + @NOME + ' Desconto de 10% => ' + CONVERT(CHAR(10), @MENSALIDADE)
END
ELSE
	BEGIN
	SET @MENSALIDADE = @MENSALIDADE - (@MENSALIDADE * 0.05)
	PRINT 'Mensalidade de ' + CONVERT(CHAR(10), @MENSALIDADE1) + ' do Aluno ' + @NOME + ' Desconto de 5% => ' + CONVERT(CHAR(10), @MENSALIDADE)
END 
	