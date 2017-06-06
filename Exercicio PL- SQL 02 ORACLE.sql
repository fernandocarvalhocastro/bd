set serveroutput on; --Habilita retorno da console do server

--1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em vari�veis.
DECLARE 
  nome VARCHAR2(100):='Fernando Castro';
  idade NUMBER(9,0):=28;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Meu nome � ' || nome || 'e idade � ' || idade );
END;

/* 
2) Desenvolver um script PL/SQL que receba em vari�veis o nome, idade e email. Para todas as entradas, validar os casos abaixo:
- Caso a idade seja menor que 18 anos, retornar somente a mensagem "Idade n�o permitida.
- O endere�o de e-mail obrigat�riamente deve ter o caractere "@".
- O nome deve ter no m�nimo 2 nomes.
Caso todas as condi��es acima estejam validadas, exibir todos os dados recebidos nas vari�veis.
*/
DECLARE
  nome VARCHAR2(100):='Lu�z';
  idade NUMBER(9,0):=19;
  email VARCHAR2(100):='castro.fernando@me.com';
BEGIN
  if(idade<18) THEN
    DBMS_OUTPUT.PUT_LINE('A IDADE DEVE SER MAIOR QUE 18 ANOS'); 
  ELSIF(INSTR(email, '@')=0) THEN
    DBMS_OUTPUT.PUT_LINE('EMAIL INCORRETO!O EMAIL DEVE CONTER @');
  ELSIF(INSTR(nome, ' ')=0 OR LENGTH(nome)<3) THEN
    DBMS_OUTPUT.PUT_LINE('NOME INCORRETO!O NOME DEVE CONTER SOBRENOME');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Nome: ' || nome);
    DBMS_OUTPUT.PUT_LINE('idade: ' || idade);
    DBMS_OUTPUT.PUT_LINE('email: ' || email);
  END IF;
END;

--3) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a m�dia dos 5 valores. Armazenar somente n�meros inteiros.
DECLARE
  num1    NUMBER:=55;
  num2    NUMBER:=12;
  num3    NUMBER:=20;
  num4    NUMBER:=10;
  num5    NUMBER:=4;
  resultado NUMBER:=0;
BEGIN
  resultado := trunc((num1 + num2 + num3 + num4 + num5) / 5);
  DBMS_OUTPUT.PUT_LINE('COM TRUNC: ' || resultado);
  DBMS_OUTPUT.PUT_LINE('SEM TRUNC: ' || (num1 + num2 + num3 + num4 + num5) / 5);
END;

--4) Desenvolver um Bloco PL/SQL que receba um n�mero em uma vari�vel e
--exiba o resto da divis�o por 2 dos pr�ximos 100 n�meros.Imprimir se � Par ou �mpar.
DECLARE 
  num1     NUMBER(9,0):=10;
  contador NUMBER(9,0):=num1;
  aux      NUMBER(9,0):=0;
BEGIN
  LOOP
    contador:=contador+1;
    IF(contador>num1+100) THEN
      EXIT;
    ELSE
      aux:=MOD(contador,2);
      IF(aux=0) THEN
        DBMS_OUTPUT.PUT_LINE(contador || ' - O NUMERO � PAR');
      ELSE
        DBMS_OUTPUT.PUT_LINE(contador || ' - O NUMERO � IMPAR');
      END IF;
    END IF;
  END LOOP;
END;

--5) Desenvolver um Bloco PL/SQL que receba um nome, 
-- caso o nome exceda 30 caracteres exiba somente o sobrenome.
DECLARE
  nome    VARCHAR2(100):='Fernando Carvalho Castro e Silva';
BEGIN
  IF(LENGTH(nome)>30) THEN
    DBMS_OUTPUT.PUT_LINE(SUBSTR(nome,INSTR(nome,' ',-1)));
  ELSE
    DBMS_OUTPUT.PUT_LINE(nome);
  END IF;
END;

--6) Desenvolver um Bloco PL/SQL que exiba a seguinte mensagem de texto:
-- 'Hoje' || <sysdate> || ', estamos no seguinte dia da semana:' || <dia da semana>
DECLARE
  dia_da_semana   VARCHAR2(20);
BEGIN
  dia_da_semana:=to_char(sysdate,'D');
  CASE to_char(sysdate,'D')
    WHEN 1 THEN dia_da_semana:='DOMINGO';
    WHEN 2 THEN dia_da_semana:='SEGUNDA';
    WHEN 3 THEN dia_da_semana:='TER�A-FEIRA';
    WHEN 4 THEN dia_da_semana:='QUARTA-FEIRA';
    WHEN 5 THEN dia_da_semana:='QUINTA-FEIRA';
    WHEN 6 THEN dia_da_semana:='SEXTA-FEIRA';
    WHEN 7 THEN dia_da_semana:='S�BADO';
    ELSE dia_da_semana:='INV�LIDO';
  END CASE;
  DBMS_OUTPUT.PUT_LINE('HOJE ' || sysdate || ', estamos no seguinte dia da semana: ' || dia_da_semana);
END;

/*7) Desenvolva um bloco an�nimo que exiba durante 365 dias (1 ano) 
apenas as datas que caem no s�bado e domingo, ap�s a entrada de uma data. 
Ap�s a solicita��o da entrada do campo data, exiba sequencialmente a data 
e o dia da semana que representa essa data. Utilize o comando loop para realizar essa tarefa.
Utilize o pacote DBMS_OUTPUT para exibir esses valores. Exiba os valores em ordem de data
*/
DECLARE
  data  DATE:=sysdate;
  contador NUMBER:=0;
BEGIN

  DBMS_OUTPUT.PUT_LINE('DATA DE ENTRADA:' || data || ' -> DIA DA SEMANA:' || TO_CHAR(data,'day'));
  WHILE contador<365
  LOOP
    IF(TO_CHAR(data,'d')=1 OR TO_CHAR(data,'d')=7) THEN
      DBMS_OUTPUT.PUT_LINE('FIM DE SEMANA' || data || ' -> DIA DA SEMANA:' || TO_CHAR(data,'day'));
    END IF;
    data:=TO_DATE(data)+1;
    contador:=contador +1;
  END LOOP;
END;

