/*Criando uma Procedure*/
CREATE OR REPLACE PROCEDURE saudar(
    p_nome IN varchar2 /*Exemplo com IN*/
) IS
BEGIN
    dbms_output.put_line('Olá, ' || p_nome || '!');
END saudar;

/*Chamando a procedure*/

BEGIN
    saudar('Osvaldo');
END;


CREATE OR REPLACE PROCEDURE mostra_texto_fixo(
    p_texto OUT varchar2 /*Exemplo com OUT*/
)IS
BEGIN
    p_texto := 'texto vindo de dentro da PROCEDURE';
END mostra_texto_fixo;

DECLARE
    v_meu_texto varchar2(100);
BEGIN
    mostra_texto_fixo(v_meu_texto);
    dbms_output.put_line('Texto: ' || v_meu_texto);
END;

CREATE OR REPLACE PROCEDURE adicionar_dez_porcento(
    p_valor IN OUT NUMBER /*Exemplo de IN OUT*/
)IS
    v_valor_original number;
BEGIN
    v_valor_original := p_valor;

    p_valor := p_valor * 1.10;

    dbms_output.put_line('Original: ' || v_valor_original || ' -> Novo: ' || p_valor);
END adicionar_dez_porcento;

DECLARE
    v_preco number := 100;
BEGIN
    adicionar_dez_porcento(v_preco);
    adicionar_dez_porcento(v_preco);
END;

/*COMANDO PARA VER AS PROCEDURES EXISTENTES*/
select * from user_objects WHERE object_type = 'PROCEDURE';

select object_name, status, created from user_objects WHERE object_type = 'PROCEDURE' ORDER BY OBJECT_NAME;

select text from user_source WHERE NAME = 'MOSTRA_TEXTO_FIXO' ORDER BY LINE; /*O NOME DA PROCEDURE TE QUE ESTAR EM MAIUSCULO*/

/*EXCLUINDO UMA PROCEDURE*/

drop procedure mostra_texto_fixo;

/*PROCEDURE COM TRÊS PARAMETROS*/
CREATE TABLE clientes(
    id_number number,
    nome varchar2(100),
    email varchar2(100),
    PRIMARY KEY (id_number)
);

CREATE OR REPLACE PROCEDURE inserir_cliente(
    p_id IN clientes.id_number%type,
    p_nome IN clientes.nome%type,
    p_email IN clientes.email%type
)IS
BEGIN
    INSERT INTO clientes values (p_id, p_nome, p_email);
    dbms_output.put_line('Cliente inserido com sucesso!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        dbms_output.put_line('Erro: id' || p_id || ' já existe!');
    WHEN OTHERS THEN
        dbms_output.put_line('ERRO desconhecido! ' || SQLERRM);
END inserir_cliente;

BEGIN
    inserir_cliente(1, 'João da Silva', 'joao@gmail.com');
END;

EXEC inserir_cliente(1, 'João da Silva', 'joao@gmail.com');

select * from clientes;

