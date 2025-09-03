DECLARE

 v_nota NUMBER;

 v_nome VARCHAR2(20);

BEGIN

  v_nota:=7;

  v_nome:='Jordan';

  CASE v_nota

    WHEN >=6 THEN dbms_output.put_line(v_nome || 'Aprovado');

    WHEN <6 THEN dbms_output.put_line(v_nome || 'Reprovado');

    ELSE dbms_output.put_line('Nota inválida');

  END CASE;

END;