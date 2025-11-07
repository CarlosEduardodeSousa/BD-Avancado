/*Criando uma Package*/
CREATE OR REPLACE PACKAGE pkg_calculadora AS
    FUNCTION soma_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER;
    FUNCTION subtrair_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER;
    FUNCTION multiplica_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER;
    FUNCTION divide_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER;

    PROCEDURE calcular_e_mostrar(
        p_valor1  number,
        p_valor2  number,
        p_operacao  varchar2
    );

END pkg_calculadora; 

/*Criando o Body*/

CREATE OR REPLACE PACKAGE BODY pkg_calculadora AS
    FUNCTION soma_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER
    AS
    BEGIN
        RETURN f_valor1 + f_valor2;
    END soma_valores;

    FUNCTION subtrair_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER
    AS
    BEGIN
        RETURN f_valor1 - f_valor2;
    END subtrair_valores;

    FUNCTION multiplica_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER
    AS
    BEGIN
        RETURN f_valor1 * f_valor2;
    END multiplica_valores;

    FUNCTION divide_valores (f_valor1 NUMBER, f_valor2 NUMBER) RETURN NUMBER
      AS
    BEGIN
        RETURN f_valor1 / f_valor2;
    END divide_valores;

    PROCEDURE calcular_e_mostrar(
        p_valor1  number,
        p_valor2  number,
        p_operacao  varchar2
    )AS
        v_resultado number;
    BEGIN
        CASE UPPER(p_operacao)
            WHEN 'SOMA' THEN
                v_resultado := soma_valores(p_valor1, p_valor2);
                DBMS_OUTPUT.PUT_LINE('SOMA: ' || p_valor1 || ' + ' || p_valor2 || ' = ' || v_resultado);
            WHEN 'SUBTRAIR' THEN
                v_resultado := subtrair_valores(p_valor1, p_valor2);
                DBMS_OUTPUT.PUT_LINE('SUBTRAÇÃO: ' || p_valor1 || ' - ' || p_valor2 || ' = ' || v_resultado);
            WHEN 'MULTIPLICACAO' THEN
                v_resultado := multiplica_valores(p_valor1, p_valor2);
                DBMS_OUTPUT.PUT_LINE('MULTIPLICAÇÃO: ' || p_valor1 || ' x ' || p_valor2 || ' = ' || v_resultado);
            WHEN 'DIVISAO' THEN
                v_resultado := divide_valores(p_valor1, p_valor2);
                DBMS_OUTPUT.PUT_LINE('DIVISÃO: ' || p_valor1 || ' / ' || p_valor2 || ' = ' || v_resultado);
            ELSE 
                DBMS_OUTPUT.PUT_LINE('Operação invalida! use: SOMA, SUBTRAR, MUTIPLICAÇÃO, DIVISÃO');
        END CASE;
    END calcular_e_mostrar;

END pkg_calculadora; 

/*USANDO O PACKAGE*/

BEGIN 
    PKG_CALCULADORA.calcular_e_mostrar(5,2,'soma');
    PKG_CALCULADORA.calcular_e_mostrar(10,2,'divisao');
    PKG_CALCULADORA.calcular_e_mostrar(8,2,'subtrair');
    PKG_CALCULADORA.calcular_e_mostrar(7,5,'multiplicacao');
END;

