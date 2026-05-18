use vendas;

-- populando cliente
insert into cliente (idcliente, nome) values
  (1,  'João Silva'),
  (2,  'Maria Souza'),
  (3,  'Pedro Santos'),
  (4,  'Ana Costa'),
  (5,  'Lucas Oliveira'),
  (6,  'Camila Ferreira'),
  (7,  'Bruno Almeida'),
  (8,  'Larissa Rocha'),
  (9,  'Gustavo Pereira'),
	(10, 'Mariana Lopes');

-- populando vendedor
insert into vendedor (idvendedor, nome) values
  (1,  'Cláudio Coelho'),
  (2,  'José Rubem'),
  (3,  'Fábio Jr.'),
  (4,  'Carlos Mendes'),
  (5,  'Ana Beatriz'),
  (6,  'Roberto Lima'),
  (7,  'Juliana Alves'),
  (8,  'Marcos Paulo'),
  (9,  'Fernanda Dias'),
  (10, 'Patrícia Gomes');

-- populando produto
insert into produto (idproduto, nome, preco) values
  (1,  'Banana',    2.50),
  (2,  'Melancia',  3.90),
  (3,  'Abacate',   6.50),
  (4,  'Laranja',   3.00),
  (5,  'Tangerina', 4.20),
  (6,  'Maçã',      5.50),
  (7,  'Uva',       9.90),
  (8,  'Manga',     4.75),
  (9,  'Abacaxi',   7.30),
  (10, 'Morango',   11.50);