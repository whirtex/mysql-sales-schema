/*
GRUPO 3
MATRÍCULA - NOME DO INTEGRANTE DO GRUPO
*/

-- 1) IMPLEMENTACAO DO BANCO DE DADOS

create database vendas;

use vendas;

-- CRIANDO A TABELA cliente
create table cliente (
    idcliente int,
    nome varchar(100) not null,
    primary key (idcliente)
);

-- CRIANDO A TABELA vendedor
create table vendedor (
    idvendedor int,
    nome varchar(100) not null,
    primary key (idvendedor)
);

-- CRIANDO A TABELA produto
create table produto (
    idproduto int,
    nome varchar(100) not null,
    preco decimal(10, 2) not null,
    primary key (idproduto)
);

-- CRIANDO A TABELA compra
create table compra (
    idcompra int,
    idcliente int not null,
    idvendedor int not null,
    data date not null,
    total decimal(10, 2) not null,
    primary key (idcompra),
    foreign key (idcliente) references cliente (idcliente),
    foreign key (idvendedor) references vendedor (idvendedor)
);

-- CRIANDO A TABELA itemdecompra
create table itemdecompra (
    item int,
    idcompra int,
    idproduto int not null,
    qtd int not null,
    primary key (item, idcompra),
    foreign key (idcompra) references compra (idcompra),
    foreign key (idproduto) references produto (idproduto)
);

-- 2) POPULANDO AS TABELAS

-- POPULANDO A TABELA cliente
insert into cliente (idcliente, nome) values
    (1, 'João Silva'),
    (2, 'Maria Souza'),
    (3, 'Pedro Santos'),
    (4, 'Ana Costa'),
    (5, 'Lucas Oliveira'),
    (6, 'Camila Ferreira'),
    (7, 'Bruno Almeida'),
    (8, 'Larissa Rocha'),
    (9, 'Gustavo Pereira'),
    (10, 'Mariana Lopes');

-- POPULANDO A TABELA vendedor
insert into vendedor (idvendedor, nome) values
    (1, 'Cláudio Coelho'),
    (2, 'José Rubem'),
    (3, 'Fábio Jr.'),
    (4, 'Carlos Mendes'),
    (5, 'Ana Beatriz'),
    (6, 'Roberto Lima'),
    (7, 'Juliana Alves'),
    (8, 'Marcos Paulo'),
    (9, 'Fernanda Dias'),
    (10, 'Patrícia Gomes');

-- POPULANDO A TABELA produto
insert into produto (idproduto, nome, preco) values
    (1, 'Banana', 2.50),
    (2, 'Melancia', 3.90),
    (3, 'Abacate', 6.50),
    (4, 'Laranja', 3.00),
    (5, 'Tangerina', 4.20),
    (6, 'Maçã', 5.50),
    (7, 'Uva', 9.90),
    (8, 'Manga', 4.75),
    (9, 'Abacaxi', 7.30),
    (10, 'Morango', 11.50);

-- POPULANDO A TABELA compra
insert into compra (idcompra, idcliente, idvendedor, data, total) values
    (1, 1, 2, '2025-06-07', 13.00),
    (2, 2, 3, '2025-01-29', 60.00),
    (3, 3, 2, '2025-03-15', 63.00),
    (4, 4, 3, '2025-04-20', 47.00),
    (5, 5, 1, '2025-05-08', 44.80),
    (6, 1, 4, '2025-07-22', 29.20),
    (7, 6, 5, '2025-08-30', 100.20),
    (8, 7, 2, '2024-11-10', 23.75),
    (9, 8, 6, '2025-09-14', 55.40),
    (10, 3, 3, '2024-12-05', 56.70);

-- POPULANDO A TABELA itemdecompra
insert into itemdecompra (item, idcompra, idproduto, qtd) values
    (1, 1, 3, 2),
    (1, 2, 4, 20),
    (1, 3, 5, 15),
    (1, 4, 6, 5),
    (2, 4, 3, 3),
    (1, 5, 1, 10),
    (2, 5, 7, 2),
    (1, 6, 9, 4),
    (1, 7, 10, 6),
    (2, 7, 2, 8),
    (1, 8, 8, 5),
    (1, 9, 5, 7),
    (2, 9, 3, 4),
    (1, 10, 4, 9),
    (2, 10, 7, 3);

-- 3) CONSULTAS

-- CONSULTA A - Nome dos clientes atendidos pelo vendedor José Rubem
select distinct cliente.nome
from
    cliente
    inner join compra on compra.idcliente = cliente.idcliente
    inner join vendedor on vendedor.idvendedor = compra.idvendedor
where
    vendedor.nome = 'José Rubem';

-- CONSULTA B - Lista de produtos por ordem de preco, do maior para o menor
select nome, preco from produto order by preco desc;

-- CONSULTA C - Nome dos produtos vendidos pelo vendedor Fábio Jr.
select distinct produto.nome
from
    produto
    inner join itemdecompra on itemdecompra.idproduto = produto.idproduto
    inner join compra on compra.idcompra = itemdecompra.idcompra
    inner join vendedor on vendedor.idvendedor = compra.idvendedor
where
    vendedor.nome = 'Fábio Jr.';

-- CONSULTA D - Quantidade total de compras realizadas
select count(*) from compra;

-- CONSULTA E - Valor total de compras realizadas por vendedor
select vendedor.nome, sum(compra.total)
from vendedor
    inner join compra on vendedor.idvendedor = compra.idvendedor
group by
    vendedor.nome;

-- CONSULTA F - Nome dos clientes que nunca compraram nenhum produto
select cliente.nome
from cliente
    left join compra on cliente.idcliente = compra.idcliente
where
    compra.idcompra is null;

-- CONSULTA G - Nome e codigo dos clientes que compraram abacate
select distinct cliente.nome, cliente.idcliente
from
    cliente
    inner join compra on cliente.idcliente = compra.idcliente
    inner join itemdecompra on compra.idcompra = itemdecompra.idcompra
    inner join produto on itemdecompra.idproduto = produto.idproduto
where
    produto.nome = 'Abacate';

-- CONSULTA H - Lista de produtos por quantidade vendida
select produto.nome, sum(itemdecompra.qtd)
from produto
    inner join itemdecompra on produto.idproduto = itemdecompra.idproduto
group by
    produto.nome
order by sum(itemdecompra.qtd) desc;

-- CONSULTA I - Data das compras, nome do cliente e valor total das compras de 2025
select compra.data, cliente.nome, compra.total
from compra
    inner join cliente on compra.idcliente = cliente.idcliente
where
    year (compra.data) = 2025;

-- CONSULTA J - Vendedores que venderam laranja ou tangerina acima de uma duzia em uma unica compra
select distinct vendedor.nome
from
    vendedor
    inner join compra on vendedor.idvendedor = compra.idvendedor
    inner join itemdecompra on compra.idcompra = itemdecompra.idcompra
    inner join produto on itemdecompra.idproduto = produto.idproduto
where
    produto.nome in ('Laranja', 'Tangerina')
    and itemdecompra.qtd > 12;