-- letra a.
select distinct
    cl.nome
from
    cliente cl
    inner join compra co on co.idcliente = cl.idcliente
    inner join vendedor ve on ve.idvendedor = co.idvendedor
where
    ve.nome = 'José Rubem';

-- letra b.
select nome, preco from produto order by preco desc;

-- letra c.
select distinct
    pr.nome
from
    produto pr
    inner join itemdecompra itco on itco.idproduto = pr.idproduto
    inner join compra co on co.idcompra = itco.idcompra
    inner join vendedor ve on ve.idvendedor = co.idvendedor
where
    ve.nome = 'Fábio Jr.';

-- letra d.
select count(*) from compra;

-- letra e.
select ve.nome, sum(co.total) as total_vendido
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor;

-- letra f.
select cl.nome
from cliente cl
    left join compra co on cl.idcliente = co.idcliente
where
    co.idcompra is null;

-- letra g.
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

-- letra h.
select pr.nome, sum(itco.qtd) as total_qtd
from produto pr
    inner join itemdecompra itco on pr.idproduto = itco.idproduto
group by
    pr.idproduto,
    pr.nome
order by total_qtd desc;

-- letra i.
select co.data, cl.nome, co.total
from compra co
    inner join cliente cl on co.idcliente = cl.idcliente
where
    co.data >= '2025-01-01'
    AND co.data < '2026-01-01';

-- letra j.
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

-- letra k.
select ve.nome, count(*) as qtd_vendas
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor;

-- letra l.
select ve.nome, sum(co.total) as total_vendido
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.idvendedor,
    ve.nome
having
    sum(co.total) > 60;

-- letra m.
select ve.nome, count(co.idcompra) as vendas
from vendedor ve
    inner join compra co on ve.idvendedor = co.idvendedor
group by
    ve.nome,
    ve.idvendedor
having
    count(co.idcompra) > 1;

-- letra n.
select
    max(preco) as maior_preco,
    min(preco) as menor_preco,
    round(avg(preco), 2) as preco_medio
from produto;