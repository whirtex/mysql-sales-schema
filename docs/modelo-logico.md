# Modelo Lógico

cliente (idcliente [PK], nome)

compra (idcompra [PK], data, total, idcliente [FK], idvendedor [FK])

vendedor (idvendedor [PK], nome)

itemdecompra (item [PK], idcompra [PK, FK], idproduto [FK], qtd)

produto (idproduto [PK], nome, preco)

## Legenda

- `[PK]` = chave primária
- `[FK]` = chave estrangeira
- `[PK, FK]` = chave primária e estrangeira ao mesmo tempo
