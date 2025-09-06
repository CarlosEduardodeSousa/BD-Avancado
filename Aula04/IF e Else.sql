CREATE TABLE IF NOT EXISTS Clientes(
    id int not null,
    nome VARCHAR2(50) not null,
    PRIMARY KEY (id)
);

INSERT INTO CLIENTES (id, nome) VALUES ('1', 'Jessica Rodrigues');

SELECT * FROM CLIENTES;

/*Declare para atualização de dados*/
DECLARE
    v_id int := 1;
    v_novo_nome VARCHAR2(50) := 'Maria Silva';
BEGIN
    UPDATE CLIENTES set nome = v_novo_nome WHERE id = v_id;
    COMMIT;
END;


DECLARE
    v_idade int := 18;
BEGIN
    IF v_idade >= 18 THEN 
        dbms_output.put_line('Sua idade é: ' || v_idade || ' Você é maior de idade');
    ELSE
        dbms_output.put_line('Sua idade é: ' || v_idade || ' Você é menor de idade');
    END IF;
END