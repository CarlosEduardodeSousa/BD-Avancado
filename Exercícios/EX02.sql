/*Exercicío feito no SQL Workbench*/

create database exercicio2;
use exercicio2;

create table if not exists clientes(
	cliente_id int auto_increment not null,
    nome varchar(50) not null,
    email varchar(50) not null,
    data_cadastro date not null,
    primary key (cliente_id)
);

create table if not exists produtos(
	produto_id int auto_increment not null,
    nome varchar(50) not null,
    preco decimal(4,2) not null,
    categoria varchar(50) not null,
    primary key (produto_id)
);

alter table produtos
modify column preco decimal (6,2);

desc produtos;

create table if not exists vendas(
	vendas_id int auto_increment not null,
    cliente_id int not null,
    produto_id int not null,
    data_venda date not null,
    quantidade int not null,
    primary key (vendas_id),
    foreign key (cliente_id) references clientes (cliente_id),
    foreign key (produto_id) references produtos (produto_id)
);

/*Inserindo Clientes*/

insert into clientes (cliente_id, nome, email, data_cadastro) values
(default, 'João Silva', 'joao.silva@gmail.com', '2025-01-01'),
(default, 'Maria Souza', 'maria.souza@gmail.com', '2025-02-15'),
(default, 'Pedro Santos', 'pedro.silva@gmail.com', '2024-03-05'),
(default, 'Ana Oliveira', 'ana.oliveira@gmail.com', '2024-04-30'),
(default, 'Lucas Costa', 'lucas.costa@gmail.com', '2025-05-25');

/*Inserindo Produtos*/

insert into produtos (produto_id, nome, preco, categoria) values
(default, 'Notebook', '2500.00', 'Informática'),
(default, 'Smartphone', '1800.00', 'Eletrônicos'),
(default, 'Camiseta', '50.00', 'Vestuário'),
(default, 'Cadeira', '350.00', 'Móveis'),
(default, 'Livro de SQL', '80.00', 'Livros');

/*Inserindo Vendas*/

insert into vendas (vendas_id, cliente_id, produto_id, data_venda, quantidade) values
(default, '1', '1', '2025-04-23', '1'),
(default, '2', '2', '2025-07-11', '2'),
(default, '3', '3', '2024-08-02', '3'),
(default, '4', '5', '2024-05-17', '2'),
(default, '5', '3', '2025-08-15', '1');

/*Criando a view*/
create view relatorio_vendas as 
select c.nome as "Nome_Cliente", c.email as "Email_Cliente", p.nome as "Nome_produto", p.preco as "Preço", 
v.quantidade, v.data_venda as "Data da Venda", v.quantidade * p.preco as "Total_Gasto" from vendas v 
join clientes c on v.cliente_id = c.cliente_id
join produtos p on v.produto_id = p.produto_id;  

/*Testando a view*/
select * from relatorio_vendas;