Tentando resolver um problema no quarto
```quarto
```{r, echo=FALSE, message=FALSE, warning=FALSE}
library(DiagrammeR)
library(DiagrammeRsvg)
library(rsvg)

# Cria o diagrama de entidade-relacionamento
meu_diagrama <- mermaid("
erDiagram
    EMENTAS ||--|| DISCIPLINAS : associa
")

# Salva automaticamente como PNG na sua pasta
export_svg(meu_diagrama) %>% 
  charToRaw() %>% 
  rsvg_png("diagrama_er.png")
```
Enfim, decidi que vou só tirar print do mermaid live mesmo. Como ficaria o modelo lógico da escola?


Ok, o mermaid do [[Projeto_Logico_Colega.jpg]]:
```mermaid
erDiagram 
Cidade{
 varchar(30) nome
 int codigo PK
}
Pessoa{
 varchar(30) nome
 text telefone
 int codigo PK
 int codigo_cidade FK
}
Aluno{
 int matricula_aluno
 date data_nascimento
 int codigo_pessoa PK, FK
 int codigo_turma FK
}
Professor{
 varchar(20) RG
 varchar(11) CPF
 varchar(50) titulacao
 int codigo_pessoa PK,FK
}
Escola{
 text nome
 int codigo PK
 int codigo_cidade FK
 int codigo_pessoa FK
}
Turma{
 varchar(50) nome
 int codigo PK
 int codigo_escola FK
}
Contato{
 text telefone
 varchar(50) nome
 int codigo_pessoa PK,FK
}
Disciplina{
 varchar(50) nome
 int codigo
}
Ministra{
 int codigo_pessoa PK,FK
 int codigo_disciplina Pk,FK
}
Ministra_Turma{
 int codigo_pessoa PK,FK
 int codigo_disciplina PK,FK
 int codigo_turma PK,FK
}
Pessoa o{--|| Cidade: "reside"
Pessoa ||--|| Aluno: "é aluno"
Pessoa ||--|| Professor: "é professor"
Aluno ||--o{ Contato: "possui"
Aluno |{--|| Turma: "pertence"
Professor ||--|{ Ministra: "ministra"
Disciplina ||--|{ Ministra: "ministrado"
Escola ||--o| Professor: "dirige"
Escola ||--|{ Turma: "pertence"
Ministra |{--o{ Turma: ""
```
Eu acho absolutamente incrível como esses join's funcionam! Como que isso acontece internamente?! Por que eu não tive que fazer algo tipo:
```
select 
 ... atributos ...
 from tabela_1
 left join tabela_2 on tabela_1.att = tabela_2.att
   select 
   ... atributos dessa nova tabela cruzada ...
   from tabela_cruzada
   left join tabela_3 on tabela_cruzada.att = tabela_3.att
    ...
```

Os diagramas mermaid são vetoriais, certo? em qual formato é pra salvar eles, csv?