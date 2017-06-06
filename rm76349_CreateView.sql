-- Utilizando o script SCRIPT VIEWS.txt disponível no portal, resolva os exercícios abaixo :

-- Criar uma view chamada VW USUARIO_ATIVO, que retorne o código, nome e documento de todos os usuários ativos.
CREATE VIEW VW_USUARIO_ATIVO
AS
  SELECT  IDN, 
          NOME,
          DOC_IDENTIFICACAO
  FROM TAB_FUNCIONARIO
  WHERE DT_DEMISSAO IS NULL;
-- Teste da view
SELECT * FROM  VW_USUARIO_ATIVO;

-- Criar uma view chamada VW_TOTAL_SALARIO, que retorne o total gasto com salários.
CREATE OR REPLACE VIEW VW_TOTAL_SALARIO
  AS
    SELECT SUM(VL_SALARIO_ATUAL) "SOMA DOS SALARIOS" 
    FROM TAB_FUNCIONARIO
    WHERE DT_DEMISSAO IS NULL;
-- Teste
SELECT * FROM VW_TOTAL_SALARIO;
    
-- Criar uma view chamada VW_QTD_FUNC, que retorne a quantidade de funcionários ativos.
CREATE OR REPLACE VIEW VW_QTD_FUNC
  AS
    SELECT COUNT(*) "QTD FUNC ATIVOS" FROM TAB_FUNCIONARIO
    WHERE DT_DEMISSAO IS NULL;
  -- teste
  SELECT * FROM VW_QTD_FUNC;
  
-- Criar uma view chamada VW_NOME_FUNC, que retorne somente o primeiro nome dos funcionários ativos.
CREATE OR REPLACE VIEW VW_NOME_FUNC
  AS
    SELECT SUBSTR(NOME,0,INSTR(NOME, ' ')-1)) "PRIMEIRO NOME" 
    FROM TAB_FUNCIONARIO 
    WHERE DT_DEMISSAO IS NULL;
-- teste
SELECT * FROM VW_NOME_FUNC;

-- NVL(' ', 'SEM NOME') --> Procura o caracter ' ' , caso não encontre, retorna a expressao da direita 'SEM NOME'
    
