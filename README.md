# Sistema de Vendas — Banco de Dados Relacional

Modelagem e implementação de um banco de dados relacional para um sistema
de vendas em MySQL, partindo de um modelo conceitual até a entrega de
consultas analíticas.

## Sobre o projeto

O sistema simula um estabelecimento que registra **compras**, **clientes**,
**vendedores**, **produtos** e os **itens de cada compra**. A partir desse
domínio, foram derivados os três níveis clássicos de modelagem de dados
(conceitual, lógico, físico), o schema foi implementado no MySQL, povoado
com dados coerentes e respondido por meio de 10 consultas SQL que cobrem
agregações, junções, ordenação e relacionamentos negativos.

As consultas foram refatoradas seguindo boas práticas (aliases de tabela e
coluna, `GROUP BY` pela chave primária e filtros de data sargáveis), e o
projeto vem sendo estendido com consultas analíticas adicionais para estudo —
`HAVING`, funções de agregação, `CASE`, subconsultas e `VIEW`.

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
│   └── 03-consultas.sql          # Consultas a–j + extensões de estudo (com aliases)
└── entrega/
    └── grupo3.sql                # Arquivo final consolidado
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

## Consultas implementadas

As 10 consultas estão em [`sql/03-consultas.sql`](sql/03-consultas.sql) (versão
de desenvolvimento) e em [`entrega/grupo3.sql`](entrega/grupo3.sql) (versão
consolidada). Cobrem:

| #   | Consulta                                                      | Conceitos                                      |
| --- | ------------------------------------------------------------- | ---------------------------------------------- |
| a   | Clientes atendidos por um vendedor específico                 | `INNER JOIN` (3 tabelas)                       |
| b   | Produtos ordenados por preço (maior → menor)                  | `ORDER BY DESC`                                |
| c   | Produtos vendidos por um vendedor específico                  | `INNER JOIN` (4 tabelas) + `DISTINCT`          |
| d   | Quantidade total de compras realizadas                        | `COUNT(*)`                                     |
| e   | Valor total vendido por vendedor                              | `GROUP BY` + `SUM`                             |
| f   | Clientes que nunca compraram                                  | `LEFT JOIN` + `IS NULL`                        |
| g   | Nome e código dos clientes que compraram determinado produto  | `INNER JOIN` (4 tabelas)                       |
| h   | Produtos ordenados por quantidade vendida                     | `GROUP BY` + `SUM` + `ORDER BY`                |
| i   | Compras realizadas em determinado ano                         | `INNER JOIN` + filtro de data (faixa sargável) |
| j   | Vendedores que venderam mais de uma dúzia em uma única compra | `INNER JOIN` (4 tabelas) + `IN`                |

### Extensões de estudo

Além das 10 consultas originais, o arquivo inclui consultas adicionais criadas
para praticar conceitos de SQL cobrados em avaliação:

| #   | Consulta                                       | Conceitos                       |
| --- | ---------------------------------------------- | ------------------------------- |
| k   | Quantidade de vendas por vendedor              | `GROUP BY` + `COUNT`            |
| l   | Vendedores com total vendido acima de um valor | `GROUP BY` + `HAVING`           |
| m   | Vendedores com mais de uma venda               | `GROUP BY` + `HAVING` + `COUNT` |

Em andamento: funções (`MAX`/`MIN`/`AVG`/`ROUND`), `CASE`, subconsultas e `VIEW`.

## Como executar

Em qualquer cliente MySQL (Workbench, CLI, DBeaver), executar na ordem:

```sql
SOURCE sql/01-schema.sql;
SOURCE sql/02-inserts.sql;
SOURCE sql/03-consultas.sql;
```

Ou, para reproduzir a entrega em um único passo:

```sql
SOURCE entrega/grupo3.sql;
```

## Stack

- **SGBD:** MySQL 8
- **Modelagem:** MySQL Workbench (engenharia reversa para o modelo físico)
- **Versionamento:** Git

## Contexto

Projeto desenvolvido para a disciplina de Engenharia de Dados
(Prof. Anderson Nascimento).
