create table if not exists funcionarios(
    id number,
    nome varchar2(100),
    salario number(10,2),
    desempenho varchar2(20),
    PRIMARY KEY (id)
);

INSERT INTO FUNCIONARIOS VALUES
(1, 'João da Silva', 5000, 'Excelente'),
(2, 'Maria dos Santos', 4200, 'Bom'),
(3, 'Pedro Oliveira', 3000, 'Regular'),
(4, 'Ana Costa', 3500, 'Ruim'),
(5, 'Carlos Lima', 4800, 'Excelente');

/*Criando a Função*/

CREATE OR REPLACE FUNCTION calcular_bonus(
    f_salario in number,
    f_desempenho in varchar2
)RETURN NUMBER
AS
    v_bonus number;
BEGIN
    CASE f_desempenho
        WHEN 'Excelente' THEN v_bonus := f_salario * 0.15;
        WHEN 'Bom' THEN v_bonus := f_salario * 0.10;
        WHEN 'Regular' THEN v_bonus := f_salario * 0.05;
        ELSE v_bonus := 0;
    END CASE;

    RETURN ROUND(v_bonus, 2);

END calcular_bonus;

/*Rodando a Função dentro de um select*/
SELECT nome, salario, desempenho, CALCULAR_BONUS(salario, desempenho) AS Bônus FROM FUNCIONARIOS;


CREATE OR REPLACE PROCEDURE mostrar_bonus( /*Usando uma Função dentro da Procedure*/
    p_salario in number,
    p_desempenho in varchar2
)
AS
    v_bonus number;
BEGIN
    v_bonus := CALCULAR_BONUS (p_salario, p_desempenho);
    dbms_output.put_line('Salario: ' || p_salario);
    dbms_output.put_line('Desempenho: ' || p_desempenho);
    dbms_output.put_line('Bônus: ' ||v_bonus);
END mostrar_bonus;

BEGIN
    mostrar_bonus(5000, 'Excelente');
END;

/*Exercício*/
CREATE TABLE IF NOT EXISTS alunos(
    id number,
    nome VARCHAR2(100),
    nota1 number,
    nota2 number,
    PRIMARY KEY (id)
);

INSERT INTO ALUNOS VALUES
(1, 'Nicole', 5, 7),
(2, 'Paulo', 2, 5),
(3, 'Morales', 6, 3);

CREATE OR REPLACE FUNCTION calcular_media(
    f_nota1 in number,
    f_nota2 in number
)RETURN NUMBER
AS
    f_media number;
BEGIN
    f_media := (f_nota1 + f_nota2)/2;
    RETURN f_media;
END calcular_media;

select nome, nota1, nota2, CALCULAR_MEDIA(nota1, nota2) as media from ALUNOS;
