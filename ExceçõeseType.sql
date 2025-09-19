CREATE TABLE clientes(
    id int,
    nome VARCHAR2(100) not null,
    PRIMARY KEY (id)
);

/*Inserindo dados na tabela com Type(herda o tipo da variavel na tabela criada 
sem a necessidade de declarar o tipo dela)*/

DECLARE
    v_id clientes.id%TYPE;
    v_nome clientes.nome%TYPE;
BEGIN
    v_id := 2;
    v_nome := 'João';
    INSERT INTO CLIENTES VALUES (v_id, v_nome);
END;

select * from clientes;

/*TRABALHANDO COM EXCEÇÕES*/

/*Excecão Pré-Definida do ORACLE*/
DECLARE
    v_n1 number :=10;
    v_n2 number :=2;
    v_result number;
BEGIN
    v_result := v_n1 / v_n2;
    dbms_output.put_line('Resultado: ' || v_result);
    dbms_output.put_line('Cálculo concluído com sucesso!');
EXCEPTION
    WHEN zero_divide THEN
        dbms_output.put_line('Operação: ' || v_n1 || ' / ' || v_n2);
        dbms_output.put_line('Mensagem: Não é possivel dividir por zero!');

    WHEN OTHERS THEN
        dbms_output.put_line('Erro inesperado!' || SQLERRM);
END;
        
/*Exceção Personalizadas com Mensagens*/
DECLARE
    v_numero number := -5;
    excecao_numero_negativo EXCEPTION;
BEGIN
    IF v_numero < 0 THEN
        RAISE excecao_numero_negativo;
    END IF;

    dbms_output.put_line('Número positivo: ' || v_numero);

EXCEPTION
    WHEN excecao_numero_negativo THEN
        dbms_output.put_line('Erro: o número não pode ser negativo. -- número digitado: ' || v_numero);
END;

/*Exceção Personalizada com Código*/

DECLARE
    v_idade number := 15;
    erro_idade EXCEPTION;
    PRAGMA EXCEPTION_INIT(erro_idade, -20001); /*EXCEÇÕES PODEM IR DE -20000 ATÉ 20999*/
BEGIN
    IF v_idade < 18 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Idade mínima: 18anos');
    END IF;

EXCEPTION
    WHEN erro_idade THEN
        dbms_output.put_line('Erro: ' || SQLERRM);
END;

DECLARE
    v_a1 number := 3;
    v_a2 number := 2;
    v_af number := 1;
    v_maior_nota number;
    v_soma_nota number;
    v_nota_final number;

    erro_nota EXCEPTION;
    PRAGMA EXCEPTION_INIT(erro_nota, -20002);

    erro_af EXCEPTION;
    PRAGMA EXCEPTION_INIT(erro_af, -20004);
BEGIN
    IF v_a1 < 0 OR v_a1 > 5 OR v_a2 < 0 OR v_a2 > 5 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Notas A1 ou A2 inválidas.' || 'A1=' || v_a1 || ', A2=' || v_a2);
    END IF;

    IF v_af < 0 OR v_af > 5 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Nota AF inválidas.' || ' AF=' || v_af);
    END IF;

    /*Pegar Maior Nota*/
    IF v_a1 > v_a2 THEN
        v_maior_nota := v_a1;
    ELSE
        v_maior_nota := v_a2;
    END IF;

    v_soma_nota := v_a1 + v_a2;

    IF v_soma_nota >= 6 THEN
        dbms_output.put_line('STATUS: APROVADO DIRETO');
        dbms_output.put_line('Parabéns! Nota Final: ' || v_soma_nota);
    ELSE
        dbms_output.put_line('STATUS: RECUPERAÇÃO AF');
        v_nota_final := v_af + v_maior_nota;

        IF v_nota_final >= 6 THEN
            dbms_output.put_line('STATUS: APROVADO NA AF');
            dbms_output.put_line('Parabéns! Nota Final: ' || v_nota_final);
        ELSE
            dbms_output.put_line('STATUS: REPROVADO NA AF');
            dbms_output.put_line('Parabéns! Nota Final: ' || v_nota_final);
        END IF;
    END IF;
EXCEPTION
    WHEN erro_nota THEN
        dbms_output.put_line('Erro: notas A1 ou A2 inválidas');
        dbms_output.put_line('Detalhes:' || SQLERRM);
    WHEN erro_af THEN
        dbms_output.put_line('Erro: nota AF inválida');
        dbms_output.put_line('Detalhes:' || SQLERRM);
    WHEN others THEN
        dbms_output.put_line('Erro desconhecido: ' || SQLERRM);
END;
