# Sistema de Vendas — Banco de Dados Relacional

Banco de dados relacional para um sistema de vendas em MySQL, usado como
**material de estudo e prática de SQL** — da modelagem (conceitual, lógico,
físico) a um conjunto de 21 consultas que cobrem desde junções e agregações
até `HAVING`, `CASE`, subconsultas, `VIEW` e transações.

## Sobre o projeto

O sistema simula um estabelecimento que registra **compras**, **clientes**,
**vendedores**, **produtos** e os **itens de cada compra**. A partir desse
domínio, foram derivados os três níveis clássicos de modelagem de dados
(conceitual, lógico, físico), o schema foi implementado no MySQL e povoado com
dados coerentes.

O projeto nasceu como trabalho acadêmico (modelagem + 10 consultas) e evoluiu
para um material de **estudo de SQL**: as consultas foram refatoradas seguindo
boas práticas (aliases de tabela e coluna, `GROUP BY` pela chave primária,
filtros de data sargáveis) e ampliadas para **21 consultas**, percorrendo os
principais tópicos cobrados em avaliação.

## Estrutura do repositório

```
.
├── docs/
│   ├── modelo-conceitual.jpg     # Diagrama ER do domínio
│   ├── modelo-logico.md          # Esquema relacional textual
│   └── modelo-fisico.png         # Diagrama físico gerado no MySQL Workbench
├── sql/
│   ├── 01-schema.sql             # DDL — CREATE TABLE
│   ├── 02-inserts.sql            # DML — INSERTs
│   └── 03-consultas.sql          # 21 consultas (DQL/DML), com aliases e pergunta no cabeçalho
└── entrega/
    └── grupo3.sql                # Versão original entregue (10 consultas)
```

## Modelagem

A modelagem percorre os três níveis padrão:

- **Conceitual** — diagrama entidade-relacionamento em [`docs/modelo-conceitual.jpg`](docs/modelo-conceitual.jpg).
  Identifica as entidades, atributos e cardinalidades do domínio.
- **Lógico** — esquema relacional em [`docs/modelo-logico.md`](docs/modelo-logico.md).
  Cinco relações (`cliente`, `vendedor`, `produto`, `compra`, `itemdecompra`),
  com chaves primárias, estrangeiras e uma PK composta em `itemdecompra`.
- **Físico** — diagrama gerado no MySQL Workbench em [`docs/modelo-fisico.png`](docs/modelo-fisico.png).
  Implementação concreta com tipos do SGBD, `NOT NULL`, `DECIMAL(10,2)` para
  valores monetários e integridade referencial via `FOREIGN KEY`.

## Consultas

As 21 consultas estão em [`sql/03-consultas.sql`](sql/03-consultas.sql),
numeradas e com a pergunta no cabeçalho de cada uma. As 10 primeiras também
constam, na forma original, em [`entrega/grupo3.sql`](entrega/grupo3.sql).

| #   | Consulta                                                      | Conceitos                                      |
| --- | ------------------------------------------------------------- | ---------------------------------------------- |
| 1   | Clientes atendidos por um vendedor específico                 | `INNER JOIN` (3 tabelas)                       |
| 2   | Produtos ordenados por preço (maior → menor)                  | `ORDER BY DESC`                                |
| 3   | Produtos vendidos por um vendedor específico                  | `INNER JOIN` (4 tabelas) + `DISTINCT`          |
| 4   | Quantidade total de compras realizadas                        | `COUNT(*)`                                     |
| 5   | Valor total vendido por vendedor                              | `GROUP BY` + `SUM`                             |
| 6   | Clientes que nunca compraram                                  | `LEFT JOIN` + `IS NULL`                        |
| 7   | Nome e código dos clientes que compraram determinado produto  | `INNER JOIN` (4 tabelas)                       |
| 8   | Produtos ordenados por quantidade vendida                     | `GROUP BY` + `SUM` + `ORDER BY`                |
| 9   | Compras realizadas em determinado ano                         | `INNER JOIN` + filtro de data (faixa sargável) |
| 10  | Vendedores que venderam mais de uma dúzia em uma única compra | `INNER JOIN` (4 tabelas) + `IN`                |
| 11  | Quantidade de vendas por vendedor                             | `GROUP BY` + `COUNT`                           |
| 12  | Vendedores com total vendido acima de um valor                | `GROUP BY` + `HAVING`                          |
| 13  | Vendedores com mais de uma venda                              | `GROUP BY` + `HAVING` + `COUNT`                |
| 14  | Maior, menor e preço médio dos produtos                       | `MAX` / `MIN` / `AVG` / `ROUND`                |
| 15  | Ticket médio das compras por vendedor                         | `AVG` + `GROUP BY`                             |
| 16  | Classificação de produtos (Caro/Médio/Barato)                 | `CASE`                                         |
| 17  | Produto(s) com o maior preço                                  | Subconsulta escalar (`= MAX`)                  |
| 18  | Produtos que nunca foram vendidos                             | Subconsulta `NOT IN`                           |
| 19  | Clientes que gastaram acima da média dos clientes             | Subconsulta no `FROM` (derivada) + `HAVING`    |
| 20  | Visão com os detalhes de cada item vendido                    | `CREATE VIEW`                                  |
| 21  | Reajuste de preço e remoção de uma compra                     | `UPDATE` / `DELETE` + transação                |

## Como executar

Em qualquer cliente MySQL (Workbench, CLI, DBeaver), executar na ordem:

```sql
SOURCE sql/01-schema.sql;
SOURCE sql/02-inserts.sql;
SOURCE sql/03-consultas.sql;
```

## Stack

- **SGBD:** MySQL 8
- **Modelagem:** MySQL Workbench (engenharia reversa para o modelo físico)
- **Versionamento:** Git
