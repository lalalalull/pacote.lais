Primeiro irei criar um histograma com meus dados pessoais para estudar como funcionam os histogramas, um breve tutorial de como fazer histograma [[Criar gráficos R + Postgresql]]
```r
library(ggplot2)

# Criando o histograma com ggplot2
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10, fill = "steelblue", color = "white") +
  labs(title = "Histograma com ggplot2",
       x = "Milhas por Galão (MPG)",
       y = "Frequência") +
  theme_minimal()
```

```r
#| label: 3fdba35f
library(dplyr)
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

tabela<-as_tibble(dbGetQuery(con, '
 SELECT 
    data AS dia,
    -- Calcula o total de horas somando as horas e os minutos convertidos
   sum(( ((horas * 60) + minutos) / 60.0)) AS total_horas
FROM 
    estudos
GROUP BY 
    data
ORDER BY 
    dia;
 '))
 
```
Eu quero um histograma da minha tabela de horas de estudo por dia, y seria a frequência relativa né? mas quem seria y da minha tabela? o número de horas? e x seria a data? Eu não sei
```r
#| label: 71ee45a3
 ggplot(tabela, aes(x=total_horas)) + geom_histogram(binwidth=4, aes(y=after_stat(density))) + labs(title= 'histograma horas de estudo', x='horas', y='frequência')
```
```r
#| label: 98010bd9
tabela
```
Como pode ver, o intervalo entre um e outro varia bastante, sendo o maior intervalo 3.41 e o menor 0.23... Então não sei como escolher o binwidth, como os estatísticos fazem pra escolher o bindwidth ideal?
> [!OUTPUT]+ {#output-98010bd9}
> ```
> ​# A tibble: 4 × 2
>   dia        total​_horas
>   <date​>           <dbl​>
> 1 2026​-10​-14        4.58
> 2 2026​-10​-15        6   
> 3 2026​-10​-16        6.23
> 4 2026​-10​-17        1.17
> ```

> [!OUTPUT]+ {#output-71ee45a3}
> ![center|480](plots/plot_71ee45a3_1_20261017090713.jpg)
> 

```sql
select * from estudos
```

### Ideia de seleção usando GROUP BY
```sql
SELECT 
    data AS dia,
    -- Calcula o total de horas somando as horas e os minutos convertidos
   sum(( ((horas * 60) + minutos) / 60.0)) AS total_horas
FROM 
    estudos
GROUP BY 
    data
ORDER BY 
    dia;
```

Ok, eu só queria ver como que faz histograma no R mesmo por enquanto. Mas como diabos que a probabilidade transforma um histograma numa coisa contínua?
#### Histograma Normalizado para base de dados genérica

##### Sabendo que a tabela em questão tem frequência:
```r
#| label: 69f59c27
as_tibble(mtcars %>% count(cyl, sort = TRUE))
# cyl será os valores de cyl mapeados, n será a quantidade de vezes que esse valor aparece na tabela
```

> [!OUTPUT]+ {#output-69f59c27}
> ```
> ​# A tibble: 3 × 2
>     cyl     n
>   <dbl​> <int​>
> 1     8    14
> 2     4    11
> 3     6     7
> ```

```r
#| label: 8b940be7
ggplot(mtcars, aes(x=cyl)) + geom_histogram(fill='pink',aes(y=after_stat(density)), linewidth=0.8, color='purple') + theme_minimal()
```
> [!OUTPUT]+ {#output-8b940be7}
> ```
> ​`stat​_bin​(​)​` using ​`bins = 30​`. Pick better value ​`binwidth​`.
> ```
> ![center|480](plots/plot_8b940be7_1_20261017094118.jpg)
> 

#### Comparando com um histograma genérico
```r
#| label: 8c1f1046
ggplot(mtcars, aes(x=cyl)) + geom_histogram(fill='pink', linewidth=0.8, color='purple') + theme_minimal()
```

> [!OUTPUT]+ {#output-8c1f1046}
> ```
> ​`stat​_bin​(​)​` using ​`bins = 30​`. Pick better value ​`binwidth​`.
> ```
> ![center|480](plots/plot_8c1f1046_1_20261017094142.jpg)
> 

