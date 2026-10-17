```sql
select * from ideias
```
Tem uma janela que se abre ao lado do meu arquivo do obsidian quando eu rodo códigos do postgresql dentro dele, as vezes ele não quer abrir de jeito nenhum, parece bugado, como resolver isso? e qual o nome desse negócio?
```sql
insert into ideias (titulo,obsidian)
values ('Aprender ggplot2','obsidian://open?vault=meu_obsidian&file=Ideias%2FAprender%20ggplot2')
```
## ggplot2 é baseado na gramática de gráficos
#### ggplot(data, aes(...))
Define os dados e a estética
#### geom_\*()
Define a geometria/tipo de gráfico
#### labs()
Personaliza rótulos e títulos
#### theme_\*()
Aplica tema visual ao gráfico

Gráfico de dispersão:
```
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
 geom_point(size = 3) +
 labs(title = "Consumo vs Peso do Carro", x = "Peso (wt)", y = "Milhas por Galão (mpg)", color = "Cilindros") +
 theme_minimal()
```
parece que estamos somando várias funções pra criar o gráfico , é assim que funciona o ggplot2? Ok, quero ver cada soma:
```r
diario_estudo<-dbGetQuery(con,"select * from diario_estudo")
ggplot(diario_estudo, aes(x = dia, y = horas, color = factor(cyl)))
```

Ok, temos um probleminha! Preciso do pacote dplyr e usar o operador pipe para manipular essas datas, ou seja, [[Aprender dplyr]]


```sql
create view dd as
SELECT 
 e.id id,
 e.data data,
 d.nome disciplina,
 e.horas + (e.minutos :: numeric/60.0) as horas
 from estudos e 
  left join estudo_disciplinas ed on ed.estudo = e.id
    left join disciplinas d on d.id = ed.disciplina
 
```
```sql
select * from dd where data!=current_date
```
```r
#| label: 0e17daca
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


dd<-dbGetQuery(con, 'select * from dd where data!=current_date')
pie(x = dd[['horas']], labels = dd[['disciplina']])
```

> [!OUTPUT]+ {#output-0e17daca}
> ![center|480](plots/plot_0e17daca_1_20261015085243.jpg)
> 

