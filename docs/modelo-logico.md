# Modelo Lógico

cliente (<u>idcliente</u>, nome)

compra (<u>idcompra</u>, data, total, **idcliente**, **idvendedor**)

vendedor (<u>idvendedor</u>, nome)

itemdecompra (<u>item</u>, <u>**idcompra**</u>, **idproduto**, qtd)

produto (<u>idproduto</u>, nome, preco)

## Legenda

- <u>sublinhado</u> = chave primária (PK)
- **negrito** = chave estrangeira (FK)
- <u>**ambos**</u> = chave primária e estrangeira ao mesmo tempo
