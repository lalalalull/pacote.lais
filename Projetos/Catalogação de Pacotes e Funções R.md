```sql
select * from ideias;
```
```sql
insert into ideias (titulo, obsidian, disciplina, projeto)
values ('Catalogação de Pacotes e Funções R','obsidian://open?vault=meu_obsidian&file=Projetos%2FCataloga%C3%A7%C3%A3o%20de%20Pacotes%20e%20Fun%C3%A7%C3%B5es%20R',1,true);
```
A vontade que dá quando você tem projetos desorganizados é de apagar tudo e recomeçar do início... Principalmente se tratando de funções no R, conferir função uma por uma se é útil ou não é uma grande tortura medieval, mas tenho que fazer isso pra não perder todo meu progresso.
## Minhas funções R relevantes:
Arquivo: Aritmética_Modular_Posições.R
aritmetica_modular
dependencias: 

Arquivo: Base_Ortonormal.R
ortonormal
dependencias: normalizar, gram_sch

Arquivo: Calculadora_Radianos.R
rad
dependencias:

Arquivo: Derivada_Exata_Polinômios.R
der_poli2, 
vetores_vel_ac, 
reta_tangente_no_ponto,
reta_geogebra,
Vetores_Vel_Ac2,
geogebra_circ,
derivadas_1_2

... Enfim, primeira mudança: cada função vai ter seu arquivo separadamente. É melhor assim? Eu tenho arquivos que tem mais de 5 funções e isso deixa tudo bagunçado. O que sugere? que cada arquivo tenha 1 função e que o nome dele seja o mesmo do da função?
A única situação em que vale a pena ter mais de uma função no mesmo arquivo é quando você tem **funções auxiliares internas** (_helper functions_)

![[Pasted image 20261008170259.png|0]]
```
usethis::use_pkgdown()
# daí, documente assim por exemplo:
url: https://seu_usuario.github.io/MeuPacote

template:
  bootstrap: 5

reference:
  - title: "Álgebra Linear"
    desc: "Funções para cálculo vetorial, matrizes e sistemas de equações."
    contents:
      - has_concept("Algebra Linear")

  - title: "Probabilidade e Estatística"
    desc: "Funções para análise combinatória, distribuições e simulações."
    contents:
      - has_concept("Probabilidade")

  - title: "Utilitários"
    desc: "Funções auxiliares para formatação e manipulação de dados."
    contents:
      - has_concept("Utilitarios")
```

```
# 1. Atualiza os arquivos .Rd na pasta man/ via roxygen2
devtools::document()

# 2. Constrói/atualiza o site HTML localmente
pkgdown::build_site()
```
## Tem como programar em R no obsidian?
Sim!
```r
1+2
```

Entender sobre como sites funcionam talvez possa me ajudar na catalogação das minhas funções R [[Sites HTML, yml, localhost]]
```sql
select * from ideias;
```
