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

create table compra (
	idcompra int,
  idcliente int not null,
  idvendedor int not null,
  data date not null,
  total decimal(10,2) not null,
	primary key (idcompra),
  foreign key (idcliente) references cliente(idcliente),
  foreign key (idvendedor) references vendedor(idvendedor)
);
  