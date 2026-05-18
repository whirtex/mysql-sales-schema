-- letra d.
select count(*)
	from compra;

-- letra b.
select nome, preco
	from produto
  order by preco desc;
  
-- letra a.
select cliente.nome
from cliente
inner join compra
   on compra.idcliente = cliente.idcliente
inner join vendedor
   on vendedor.idvendedor = compra.idvendedor
where vendedor.nome = 'José Rubem';