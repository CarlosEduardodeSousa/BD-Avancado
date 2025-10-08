CREATE OR REPLACE PROCEDURE calcula_nota_aluno(
    a1 IN NUMBER,
    a2 IN NUMBER,
    af IN NUMBER
)IS
    maior_nota number;
    nota_final number;
BEGIN
     IF a1 > a2 THEN
        maior_nota := a1;
    ELSE
        maior_nota := a2;
    END IF;

    IF a1 + a2 >= 6 THEN
        nota_final := a1 + a2;
        dbms_output.put_line('Sua nota é: ' || nota_final || '. Parabéns, você foi aprovado!');
    ELSIF maior_nota + af >= 6 THEN
        nota_final := maior_nota + af;
        dbms_output.put_line('Você ficou de AF! Sua nota final foi: ' || nota_final || '. Parabéns, você foi aprovado!');
    ELSE
        nota_final := maior_nota + af;
        dbms_output.put_line('Você ficou de AF! Sua nota final foi: ' || nota_final || '. Você foi reprovado.');
    END IF;
END calcula_nota_aluno;

BEGIN
    calcula_nota_aluno(2,3,2);
END;


