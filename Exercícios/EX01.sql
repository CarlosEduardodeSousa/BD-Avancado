/*1-Criando as tabelas*/

create table if not exists alunos(

  id_aluno int not null,

  id_curso int not null,

  nome varchar(30) not null,

  PRIMARY KEY (id_aluno),

  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)

);



create table if not exists cursos(

  id_curso int not null,

  nome_curso varchar(30) not null,

  PRIMARY KEY (id_curso)

);



/*2-Inserindo dados nas tabelas*/



insert into cursos (id_curso, nome_curso)

values

('1', 'Matemática'),

('2', 'História'),

('3', 'Física'),

('4', 'Biologia'),

('5', 'Quimica');



insert into ALUNOS(ID_ALUNO, ID_CURSO, NOME)

VALUES

('1', '1', 'Ana Silva'),

('2', '1', 'João Pereira'),

('3', '2', 'Maria Oliveira'),

('4', '3', 'Pedro Souza'),

('5', '4', 'Nicolas Silva');



/*3- testando integridade*/



insert into alunos (id_aluno, id_curso, nome)

VALUES

('6', '77', 'Carlos'); /*Erro póis não existe curso com id 77*/



/*4- removendo a chave estrangeira*/

ALTER TABLE ALUNOS

DROP FOREIGN KEY (id_curso);