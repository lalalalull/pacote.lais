```sql
insert into ideias (titulo, obsidian)
values ('Usando o Github','obsidian://open?vault=meu_obsidian&file=Ideias%2FUsando%20o%20Github')
```

#### Adicionar uma pasta ao meu repositório do github
```terminal
cd /caminho/para/a/sua/pasta/obsidian
git init

git remote add origin https://github.com/teu-utilizador/teu-repositorio.git

git add .
git commit -m "feat: adicionar notas do obsidian"
git branch -M main
git push -u origin main
```
Como exportar meus arquivos do obsidian atualizados pro github sabendo que eu já fiz isso antes?
#### Exportando já tendo feito isso antes
```terminal
cd /caminho/para/a/sua/pasta/obsidian
git status 
git add . 
git commit -m "mensagem sobre o que mudou na atualização"
git push origin main
```