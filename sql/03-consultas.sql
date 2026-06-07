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
    produto.nome
from
    produto
    inner join itemdecompra on itemdecompra.idproduto = produto.idproduto
    inner join compra on compra.idcompra = itemdecompra.idcompra
    inner join vendedor on vendedor.idvendedor = compra.idvendedor
where
    vendedor.nome = 'Fábio Jr.';

-- letra d.
select count(*) from compra;

-- letra e.
select vendedor.nome, sum(compra.total)
from vendedor
    inner join compra on vendedor.idvendedor = compra.idvendedor
group by
    vendedor.nome;

-- letra f.
select cliente.nome
from cliente
    left join compra on cliente.idcliente = compra.idcliente
where
    compra.idcompra is null;

-- letra g.
select distinct
    cliente.nome,
    cliente.idcliente
from
    cliente
    inner join compra on cliente.idcliente = compra.idcliente
    inner join itemdecompra on compra.idcompra = itemdecompra.idcompra
    inner join produto on itemdecompra.idproduto = produto.idproduto
where
    produto.nome = 'Abacate';

-- letra h.
select produto.nome, sum(itemdecompra.qtd)
from produto
    inner join itemdecompra on produto.idproduto = itemdecompra.idproduto
group by
    produto.nome
order by sum(itemdecompra.qtd) desc;

-- letra i.
select compra.data, cliente.nome, compra.total
from compra
    inner join cliente on compra.idcliente = cliente.idcliente
where
    year (compra.data) = 2025;

-- letra j.
select distinct
    vendedor.nome
from
    vendedor
    inner join compra on vendedor.idvendedor = compra.idvendedor
    inner join itemdecompra on compra.idcompra = itemdecompra.idcompra
    inner join produto on itemdecompra.idproduto = produto.idproduto
where
    produto.nome in ('Laranja', 'Tangerina')
    and itemdecompra.qtd > 12;
