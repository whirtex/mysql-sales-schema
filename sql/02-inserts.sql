use vendas;

-- populando cliente
insert into
    cliente (idcliente, nome)
values (1, 'João Silva'),
    (2, 'Maria Souza'),
    (3, 'Pedro Santos'),
    (4, 'Ana Costa'),
    (5, 'Lucas Oliveira'),
    (6, 'Camila Ferreira'),
    (7, 'Bruno Almeida'),
    (8, 'Larissa Rocha'),
    (9, 'Gustavo Pereira'), -- Nao compra nada
    (10, 'Mariana Lopes');
-- Nao compra nada

-- populando vendedor
insert into
    vendedor (idvendedor, nome)
values (1, 'Cláudio Coelho'),
    (2, 'José Rubem'),
    (3, 'Fábio Jr.'),
    (4, 'Carlos Mendes'),
    (5, 'Ana Beatriz'),
    (6, 'Roberto Lima'),
    (7, 'Juliana Alves'),
    (8, 'Marcos Paulo'),
    (9, 'Fernanda Dias'),
    (10, 'Patrícia Gomes');

-- populando produto
insert into
    produto (idproduto, nome, preco)
values (1, 'Banana', 2.50),
    (2, 'Melancia', 3.90),
    (3, 'Abacate', 6.50),
    (4, 'Laranja', 3.00),
    (5, 'Tangerina', 4.20),
    (6, 'Maçã', 5.50),
    (7, 'Uva', 9.90),
    (8, 'Manga', 4.75),
    (9, 'Abacaxi', 7.30),
    (10, 'Morango', 11.50);

-- populando compra
insert into
    compra (
        idcompra,
        idcliente,
        idvendedor,
        data,
        total
    )
values (1, 1, 2, '2025-06-07', 13.00), -- 2 Abacate
    (2, 2, 3, '2025-01-29', 60.00), -- 20 Laranja
    (3, 3, 2, '2025-03-15', 63.00), -- 15 Tangerina
    (4, 4, 3, '2025-04-20', 47.00), -- 5 Maca + 3 Abacate
    (5, 5, 1, '2025-05-08', 44.80), -- 10 Banana + 2 Uva
    (6, 1, 4, '2025-07-22', 29.20), -- 4 Abacaxi
    (7, 6, 5, '2025-08-30', 100.20), -- 6 Morango + 8 Melancia
    (8, 7, 2, '2024-11-10', 23.75), -- 5 Manga
    (9, 8, 6, '2025-09-14', 55.40), -- 7 Tangerina + 4 Abacate
    (10, 3, 3, '2024-12-05', 56.70);
-- 9 Laranja + 3 Uva

-- populando itemdecompra
insert into
    itemdecompra (
        item,
        idcompra,
        idproduto,
        qtd
    )
values (1, 1, 3, 2),
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

-- consultando as tabelas para verificar os dados inseridos
SELECT * FROM cliente;

SELECT * FROM vendedor;

SELECT * FROM produto;

SELECT * FROM compra;

SELECT * FROM itemdecompra;