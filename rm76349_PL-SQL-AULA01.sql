/* Habilita visualização de output no cliente. Caso esteja off, somente mostrará 
    "Procedimento PL/SQL concluído com sucesso."
*/
set serveroutput on

-- bloco pl/sql simples
begin 
  null;
end;

-- exemplo 01
  DECLARE 
    mensagem VARCHAR(100) := 'Hello World';
  BEGIN
    DBMS_OUTPUT.PUT_LINE(mensagem);
  END;
  
/* Desenvolver um bloco anônimo em PL/SQL, que receba 2 valores e 
 exiba a soma, multiplicação e divisão destes números.
*/
  DECLARE
    num1 NUMBER(10) :=5;
    num2 NUMBER(10) :=4;
  BEGIN
    DBMS_OUTPUT.put_line('Multiplicacao :' || (num1*num2));
    DBMS_OUTPUT.put_line('Soma :' || (num1+num2));
    DBMS_OUTPUT.put_line('Subtracao :' || (num1-num2));
  END;
/* Desenvolver um bloco anônimo em PL/SQL, que receba um nome completo
em uma variavel e exiba somente o primeiro nome  
*/
  DECLARE 
    nome VARCHAR2(100):= 'Fernando Castro';
  BEGIN
    DBMS_OUTPUT.PUT_LINE(SUBSTR(nome, 0, INSTR(nome, ' ')));
  END;

/* Desenvolver um bloco anônimo em PL/SQL, 
que receba uma data no formato DD/MM/YYYY e exiba somente o mês por exemplo.
*/
  DECLARE 
    data_mes DATE:='12/NOV/2017';
  BEGIN
    DBMS_OUTPUT.PUT_LINE(EXTRACT(MONTH FROM data_mes));
  END;