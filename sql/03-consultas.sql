-- 1. Quais clientes foram atendidos pelo vendedor 'José Rubem'?
select distinct
    cl.nome
from
    cliente cl
    inner join compra co on co.idcliente = cl.idcliente
    inner join vendedor ve on ve.idvendedor = co.idvendedor
where
    ve.nome = 'José Rubem';

-- 2. Quais os produtos ordenados por preço, do maior para o menor?
select nome, preco from produto order by preco desc;

-- 3. Quais produtos foram vendidos pelo vendedor 'Fábio Jr.'?
select distinct
    pr.nome
from
    produto pr
    inner join itemdecompra itco on itco.idproduto = pr.idproduto
    inner join compra co on co.idcompra = itco.idcompra
    inner join vendedor ve on ve.idvendedor = co.idvendedor
where
    ve.nome = 'Fábio Jr.';

-- 4. Quantas compras foram realizadas no total?
select count(*) from compra;

-- 5. Qual o valor total vendido por cada vendedor?
select ve.nome, sum(co.total) as total_vendido
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor;

-- 6. Quais clientes nunca compraram?
select cl.nome
from cliente cl
    left join compra co on cl.idcliente = co.idcliente
where
    co.idcompra is null;

-- 7. Quais clientes (nome e código) compraram 'Abacate'?
select distinct
    cl.nome,
    cl.idcliente
from
    cliente cl
    inner join compra co on cl.idcliente = co.idcliente
    inner join itemdecompra itco on co.idcompra = itco.idcompra
    inner join produto pr on itco.idproduto = pr.idproduto
where
    pr.nome = 'Abacate';

-- 8. Quais produtos ordenados pela quantidade total vendida?
select pr.nome, sum(itco.qtd) as total_qtd
from produto pr
    inner join itemdecompra itco on pr.idproduto = itco.idproduto
group by
    pr.idproduto,
    pr.nome
order by total_qtd desc;

-- 9. Quais compras foram realizadas em 2025?
select co.data, cl.nome, co.total
from compra co
    inner join cliente cl on co.idcliente = cl.idcliente
where
    co.data >= '2025-01-01'
    AND co.data < '2026-01-01';

-- 10. Quais vendedores venderam mais de uma dúzia de 'Laranja' ou 'Tangerina' em uma única compra?
select distinct
    ve.nome
from
    vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
    inner join itemdecompra itco on co.idcompra = itco.idcompra
    inner join produto pr on itco.idproduto = pr.idproduto
where
    pr.nome in ('Laranja', 'Tangerina')
    and itco.qtd > 12;

-- 11. Quantas vendas cada vendedor realizou?
select ve.nome, count(*) as qtd_vendas
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor;

-- 12. Quais vendedores venderam mais de R$ 60 no total?
select ve.nome, sum(co.total) as total_vendido
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.idvendedor,
    ve.nome
having
    sum(co.total) > 60;

-- 13. Quais vendedores realizaram mais de uma venda?
select ve.nome, count(co.idcompra) as vendas
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor
having
    count(co.idcompra) > 1;

-- 14. Qual o maior, o menor e o preço médio dos produtos?
select
    max(preco) as maior_preco,
    min(preco) as menor_preco,
    round(avg(preco), 2) as preco_medio
from produto;

-- 15. Qual o ticket médio das compras de cada vendedor?
select ve.nome, round(avg(co.total), 2) as preco_medio
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.idvendedor,
    ve.nome;

-- 16. Como classificar cada produto em 'Caro', 'Médio' ou 'Barato' pelo preço?
select
    nome,
    case
        when preco <= 5 then 'Barato'
        when preco >= 9 then 'Caro'
        else 'Medio'
    end as classificacao_preco
from produto;