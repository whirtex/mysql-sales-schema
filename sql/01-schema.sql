create database vendas;

use vendas;

create table cliente (
  idcliente int,
  nome varchar(100) not null,
  primary key (idcliente)
);

create table vendedor (
  idvendedor int,
  nome varchar(100) not null,
  primary key (idvendedor)
);

create table produto (
	idproduto int,
  nome varchar(100) not null,
  preco decimal(10,2) not null,
  primary key (idproduto)
);