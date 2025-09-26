create table empregados(
    empregado_id number,
    nome varchar2(50),
    salario number,
    primary key (empregado_id)
);

insert into empregados (empregado_id, nome, salario) VALUES
('1', 'Mariana Alves', 3500),
('2', 'João Pereira', 4200),
('3', 'Fernanda Souza', 5500),
('4', 'Rafael Monteiro', 2800),
('5', 'Rosana Vieira', 4800);

select * from empregados order by empregado_id;

DECLARE
    v_id number := 7;
    v_nome varchar2(50):= 'Bruno Nogueira';
    v_salario number := 2000;
    v_limite_salario number := 6000;
BEGIN
    --1 Verificando a existencia do empregado
    select nome, salario into v_nome, v_salario
    from empregados where empregado_id = v_id;

    dbms_output.put_line('Empregado(a) encontrado: ' || v_nome);

    -- 2 Atualizar salario
    IF v_salario <= v_limite_salario THEN
        UPDATE EMPREGADOS
        SET salario = salario * 1.10
        where EMPREGADO_ID = v_id;
        dbms_output.put_line('Empregado(a) ' || v_nome || ', teve o salario atualizado para R$: ' || v_salario * 1.10);
    ELSE
    -- Deletar o empregado se ultrapassar o limite
        DELETE FROM EMPREGADOS
        where EMPREGADO_ID = v_id;
        dbms_output.put_line('Empregado(a) deletado(a) pois ultrapassou o limite de R$6000');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        --3 Inserir novo empregado
        insert into empregados (empregado_id, nome, salario) 
        VALUES
        (v_id, v_nome, v_salario);
        dbms_output.put_line('Novo empregado(a) inserido: ' || v_nome || ', salario R$: ' || v_salario);

    WHEN OTHERS THEN
        dbms_output.put_line('Erro desconhecido: ' || SQLERRM);
END;