create table clientes(
    cliente_id int not null,
    nome VARCHAR2(100) not null,
    email VARCHAR2(100) not null,
    PRIMARY KEY (cliente_id)
);

create table clientes_backup(
    cliente_id int not null,
    nome VARCHAR2(100) not null,
    email VARCHAR2(100) not null,
    PRIMARY KEY (cliente_id)
);

create index idx_clientes_nome on clientes(nome);

select * from all_indexes where index_name = 'IDX_CLIENTES_NOME';

insert into clientes values ('1', 'José de Sousa', 'jose@gmail.com');
insert into clientes values ('2', 'João da Silva', 'joao@gmail.com');
insert into clientes values ('3', 'Maria Jesus', 'maria@gmail.com');

select * from clientes;

/*insert com select*/
insert into clientes_backup(cliente_id, nome, email)
select cliente_id, nome, email from clientes 
where cliente_id = '1';

insert into clientes_backup(cliente_id, nome, email)
select cliente_id, nome, email from clientes 
where email like '%gmail%'; /*Erro*/

insert into clientes_backup(cliente_id, nome, email)
select cliente_id, nome, email from clientes 
where nome like '%Ma%';

select * from clientes_backup;
