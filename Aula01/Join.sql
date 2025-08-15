create table cursoss(
    id int not null,
    nome VARCHAR(100) not null,
    PRIMARY KEY (id)
);

create table alunoss(
    id int not null,
    nome VARCHAR(100) not null,
    rgm varchar(50) unique not null,
    curso_id int,
    primary key (id),
    foreign key (curso_id) references cursoss (id)
);

create sequence sqALUNOSS
MINVALUE 1
MAXVALUE 100
START WITH 1
INCREMENT BY 1
NOCACHE;

create sequence sqCursoss
MINVALUE 1
MAXVALUE 100
START WITH 1
INCREMENT BY 1
NOCACHE;

INSERT INTO CURSOSS (id, nome) VALUES(sqcursoss.nextval, 'ADS');
INSERT INTO ALUNOSS (id, nome, rgm, curso_id) VALUES (SQALUNOSS.nextval, 'Roberta Almeida', '567892', 4);
INSERT INTO ALUNOSS (id, nome, rgm, curso_id) VALUES (SQALUNOSS.nextval, 'Julia Santos', '954123', null);

select alunoss.* from alunoss join cursoss on alunoss.curso_id = cursoss.id;

create view alunosregistrados as
select ALUNOSS.ID, ALUNOSS.NOME as "nome_aluno", ALUNOSS.RGM,ALUNOSS.CURSO_ID, CURSOSS.NOME as "Nome_curso" from ALUNOSS 
join CURSOSS on ALUNOSS.CURSO_ID = CURSOSS.ID;

select * from ALUNOSREGISTRADOS;