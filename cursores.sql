create table empregados(
    empregado_id number,
    nome varchar2(50),
    salario number,
    PRIMARY KEY (empregado_id)
);

INSERT INTO empregados (EMPREGADO_ID, NOME, SALARIO) VALUES
(EMPREGADOS_SEQ.nextval, 'Luis', 2000);

select * from empregados order by EMPREGADO_ID;

CREATE SEQUENCE empregados_seq
start with 4
increment by 1
nocache;


DECLARE
    v_nome varchar(50);
    v_salario number;
    v_id number := 3;
BEGIN
    --Selecionando um nome de um empregado
    select nome, salario into v_nome, v_salario from empregados where empregado_id = v_id; /*Cursor Implicito*/

    --Exibindo o nome
    dbms_output.put_line('Nome do empregado: ' || v_nome || ', o salario dele é: ' || v_salario);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Nenhum empregado encontrado com o ID: ' || v_id);

    WHEN others THEN
        dbms_output.put_line('Erro desconhecido: ' || SQLERRM);
END;

DECLARE
    v_nome varchar(50);
    v_salario number;
    v_id number := 4;
BEGIN
    --Selecionando um nome de um empregado
    select nome, salario into v_nome, v_salario from empregados where empregado_id = v_id; /*Cursor Implicito*/

    --Atualizando o salario
    update empregados
    set salario = salario * 1.10 
    where empregado_id = v_id;

    --Exibindo o salario
    dbms_output.put_line('Salario atualizado com sucesso, salario antigo: ' || v_salario
    || ', salario novo: ' || v_salario*1.10);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Nenhum empregado encontrado com o ID: ' || v_id);

    WHEN others THEN
        dbms_output.put_line('Erro desconhecido: ' || SQLERRM);
END;

/*Cursor Explicito*/
DECLARE
    CURSOR c_empregados IS
    select empregado_id, nome, salario from empregados where salario <= 4000; /*Cursor Explicito*/

    v_id empregados.empregado_id%type;
    v_nome empregados.nome%type;
    v_salario empregados.salario%type;
BEGIN

    OPEN c_empregados; -- Abrimos o cursor, dados alocados em memória

    LOOP
        FETCH c_empregados INTO v_id, v_nome, v_salario; -- FETCH Lê as linhas
        EXIT WHEN c_empregados%NOTFOUND; -- EXIT saí do laço quando encontra NOTFOUND

        update empregados
        set salario = salario * 1.12 
        where empregado_id = v_id;

        dbms_output.put_line('Salario de ' || v_nome || '(ID: ' || v_id || '), atualizado para: ' || v_salario * 1.12);
    END LOOP;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Nenhum empregado encontrado com o ID: ' || v_id);

    WHEN others THEN
        dbms_output.put_line('Erro desconhecido: ' || SQLERRM);
    CLOSE c_empregados;
END;

