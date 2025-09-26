DECLARE
  nota1 int := 2;
  nota2 int := 1;
  maior_nota int;
  v_af int := 2;
  nota_final int;
BEGIN

  IF nota1 > nota2 THEN
    maior_nota := nota1;
  ELSE
    maior_nota := nota2;
  END IF;



  IF nota1 + nota2 >= 6 THEN
    nota_final := nota1 + nota2;
    dbms_output.put_line('Sua nota é: ' || nota_final || ' Parabéns você foi Aprovado!');
  ELSIF maior_nota + v_af >= 6 THEN
    nota_final := maior_nota + v_af;
    dbms_output.put_line('Você ficou de AF ' || ' Sua nota final foi: ' || nota_final || ' Parabéns você foi Aprovado');
  ELSE
    nota_final := maior_nota + v_af;
    dbms_output.put_line('Sua nota é: ' || nota_final || ' Você foi Reprovado');
  END IF;

END;