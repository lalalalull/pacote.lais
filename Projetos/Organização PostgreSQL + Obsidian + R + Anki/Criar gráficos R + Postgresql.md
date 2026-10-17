Automatizar gráficos no obsidian:
```r
#| label: 6b86b273
library(ggplot2)
library(DBI)
library(RPostgres)

con <- dbConnect(
  RPostgres::Postgres(),
  dbname   = "postgres",
  host     = "localhost",      
  port     = 5432,             
  user     = "postgres", 
  password = "newkitty"
)

dbReadTable(con,"disciplinas")

```
Diagrama mermaid:
```
npx -p @mermaid-js/mermaid-cli mmdc -i meu_diagrama.mmd -o meu_diagrama.svg
```


É importante pra começar:
[[Aprender ggplot2]] e [[Aprender dplyr]]
e claro, entender os pacotes DBI e RPostgres é o que eu vou fazer aqui.

```sql
insert into ideias (titulo, obsidian, projeto)
values ('Criar gráficos R + Postgresql', 'obsidian://open?vault=meu_obsidian&file=Criar%20gr%C3%A1ficos%20R%20%2B%20Postgresql',true)
```
Uma dúvida: Por que sempre que eu abro o RStudio tá cheio de arquivos R abertos sendo que eu sempre fecho tudo de novo e de novo?