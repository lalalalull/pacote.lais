Qual é a diferença entre yml e html?

```html
<!DOCTYPE html>
<html>
 <head>
   <title> </title>
 </head>
</html>
```
### Para inserir links, imagens pdf
```html
<a href= "https://www.google.com" target="_blank">Texto visível do link"</a>

<img src="caminho/para/imagem.png" alt="Descrição da imagem" width="500px">

<embed src="documento.pdf" type="application/pdf" width="100%" height="600px" />

<pre>
<code>
# Exemplo de código em R
media <- function(x) {
  sum(x) / length(x)
}
media(c(10, 20, 30))
</code>
</pre>
```
Parece que o html se assemelha ao markdowm, já que dá pra usar outras linguagens de programação dentro dele

Como testar criar uma página web usando html?
O que significa 

```html
<!DOCTYPE html>
<html>
<head><title> Catálogo de funções </title>
<style> 
body{
  font-family: pix32;
  background-color: #f7d1ff;
  padding-top: 32px
}
h1{
 color: #fc3dd6;
}
</style>
</head>

<body>
<h1> Catálogo de funções </h1>
</body>
</html>
```
Estou entendendo, mas assim o título fica no canto da página e é numa fonte que eu não gosto. Tem como mudar isso?
#### Usando CSS
```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de funções</title>
    <style>
        /* Estilizando a página inteira */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Muda a fonte de tudo na página */
            background-color: #f9f9f9; /* Cor de fundo suave */
            padding-top: 50px; /* Dá um espaço no topo */
        }

        /* Estilizando especificamente o título (h1) */
        h1 {
            color: #2c3e50; /* Cor do texto do título */
            text-align: center; /* Centraliza o título na página */
            font-size: 36px; /* Aumenta ou diminui o tamanho da letra */
            font-weight: 600; /* Deixa mais grosso ou mais fino */
        }
    </style>
</head>
<body>

    <h1>Catálogo de Funções</h1>
    <p style="text-align: center; color: #666;">Este subtítulo também está centralizado.</p>

</body>
</html>
```
### Como juntar gifs ao lado do título
```html
<header style="display: flex; align-items: center; justify-content: center; gap: 15px;">
    <img src="estrela.gif" alt="Ícone de estrela" style="height: 30px;">
    <h1>Catálogo de Funções</h1>
    <img src="foguete.gif" alt="Ícone de foguete" style="height: 30px;">
</header>
```
### Referenciar arquivo .css para manter boa prática

```html
<head>

<link rel="stylesheet" href="style.css">

</head>
```

### &ltheader&gt e &ltdiv&gt são tipo umas caixas



### Uso de classes e id
```html
<h1 id="titulo-destaque" class="cabecalho-principal">Catálogo de Funções</h1>
```
renderização do meu site [[index.html]]

```sql
select * from estudos
```