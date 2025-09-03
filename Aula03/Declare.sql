DECLARE
    v_message VARCHAR2(100);
BEGIN
    v_message := 'Olá Mundo';
    DBMS_OUTPUT.PUT_LINE(v_message);
END;

DECLARE
    v_salary number;
BEGIN
    v_salary := 5000;
    DBMS_OUTPUT.PUT_LINE('Salário:' || v_salary);
END;

DECLARE
    grade CHAR(1);
BEGIN
    grade := 'A';
    CASE grade
        WHEN 'A' THEN DBMS_OUTPUT.PUT_LINE('Excelente');
        WHEN 'B' THEN DBMS_OUTPUT.PUT_LINE('Muito bom');
        WHEN 'C' THEN DBMS_OUTPUT.PUT_LINE('Bom');
        WHEN 'D' THEN DBMS_OUTPUT.PUT_LINE('Justo');
        ELSE DBMS_OUTPUT.PUT_LINE('Sem valor');
    END CASE;
END;

/*EXEMPLOS COM EXCEÇÕES*/

DECLARE
    v_number number := 50;
    v_result number;
BEGIN
    v_result := v_number / 2;
    DBMS_OUTPUT.PUT_LINE('RESULTADO:' || v_result);
EXCEPTION
    WHEN zero_divide THEN
        DBMS_OUTPUT.PUT_LINE('ERRO: divisão por zero');

    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('Erro desconhecido!');
END;