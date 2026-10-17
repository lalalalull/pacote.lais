---
flashcards:
  q-sj2b: { nid: 1791897156728, hash: zdbh9c4j, sync: 32ej5eud }
---

Passo 1. Ver se obedecem a desigualdade triangular
Passo 2. Calcular produto interno entre os vetores pra saber qual vértice é o ângulo reto
é basicamente isso?
Na verdade, a questão já garante que formam um triângulo (ou seja, não são 3 pontos colineares) basta calcular o produto interno eu acho.

Se:
```r
#| label: 4b227777
t(c(1,2))
```

> [!OUTPUT]+ {#output-4b227777}
> ```
> ​[,1​] ​[,2​]
> ​[1,​]    1    2
> ```

Então significa que todo vetor é na verdade uma matriz coluna?
Todo vetor é uma matriz coluna por convenção!
$\langle v,u \rangle = \|v\| \|u\| \cos{\theta}$
```r
#| label: f5ca38f7
library(pacote.lais)
prod_interno(c(3,0,2),c(4,3,0))
prod_interno(c(3,0,2),c(8,1,-1))
prod_interno(c(4,3,0),c(8,1,-1))
```

```
> prod_interno(c(3,0,2),c(4,3,0))
[1] 12
> prod_interno(c(3,0,2),c(8,1,-1))
[1] 22
> prod_interno(c(4,3,0),c(8,1,-1))
[1] 35
# Ué... Não tem ângulo reto?
```

ah, aliás, como tem muita matriz transposta nesse conteúdo eu penso em [[Matrizes Transpostas ortogonais, Rotação e outros]]

```
Mostrando como funciona o plugin do anki:
---
cards-deck: teste
---

Aqui está o resumo da aula de banco de dados, explicações longas e textos que eu escrevi para entender o assunto. (Tudo isso **será ignorado** pelo plugin porque não tem o marcador de flashcard).

O que é uma chave primária? :: Um identificador único para cada registro em uma tabela. (Este trecho **será enviado** como card para o Anki).
^q-rw49

Mais anotações de texto livre da aula que o plugin vai pular...

O CPF deve ser salvo como INT? :: Não, pois perde zeros à esquerda e estoura limites. (Este trecho **também virará card**).
```
$$\text{Qual é a fórmula de }\|u\|? $$ :: $$\sqrt{ \langle u,u \rangle }$$ 
^q-sj2b
$\langle u,v \rangle + \langle v,w \rangle = \langle u+v,v+w \rangle ?$


^q-p3fk
Quero aprofundar depois em [[Projeção sobre subespaço imagem.png]]
A única propriedade que me deixou bem confusa foi a linearidade da primeira componente, pode prová-la pra mim?

$$\text{Mostre que }\langle u,w \rangle + \langle v,w \rangle= \langle u+v,w \rangle$$ :: $$\begin{aligned}
&\langle u,w \rangle + \langle v,w \rangle \implies{\sum u_{i}w_{i} + \sum v_{i}w_{i}}\\
& \text{Colocamos }\sum w_{i}\text{ em evidência: }\sum w_{i}\left( \sum u_{i}+\sum v_{i} \right)=\sum w_{i}(u_{i}+v_{i}) \\
& \text{Portanto }\sum u_{i}w_{i} + \sum v_{i}w_{i}=\sum w_{i}(u_{i}+v_{i}) \iff{\langle u,w \rangle + \langle v,w \rangle = \langle u+v,w \rangle }.
\end{aligned}   $$
E quais são as propriedades da norma?

$$\text{Sabendo que \langle u,v\rangle=2 , }\|u\|=1\text{ e }\|v\|=2\text{ descubra }\|u+v\|.$$ :: 
$$
\begin{aligned}
 \|u+v\|^2 \\
&= \langle u+v,u+v \rangle \\
&= \langle u+v,u \rangle + \langle u+v,v \rangle \\
&= \langle u,u \rangle + \langle v,u \rangle + \langle u,v \rangle + \langle v,v \rangle \\
&= 9 \implies{\|u+v\|=3}

\end{aligned}
$$

$$\begin{aligned}
&\text{A multiplicação de matrizes é uma máquina aritmética de calcular produtos internos rapidamente}\\
&\begin{bmatrix}
 \xleftarrow{\quad} v \xrightarrow{\quad} \\ 
 \xleftarrow{\quad} u \xrightarrow{\quad} \\ 
 \xleftarrow{\quad} w \xrightarrow{\quad} 
\end{bmatrix}
\begin{bmatrix} 
 \uparrow & \uparrow \\ s & g \\ \downarrow & \downarrow
 \end{bmatrix} 
 =
 \begin{bmatrix}
\langle s,v \rangle & \langle g,v \rangle \\ 
\langle s,u \rangle & \langle g,u \rangle  \\
\langle s,w \rangle & \langle g,w \rangle
\end{bmatrix}
\end{aligned}
$$

$$
\begin{aligned}
& \text{O que a questão 3 pede é que encontremos }
\begin{bmatrix}
2 & 1 & -4 & 0  \\
-1 & -1 & 2 & 2 \\
3 & 2 & 5 & 4
\end{bmatrix}
\begin{bmatrix} 
 \uparrow & \uparrow \\ v_{1} & v_{2} \\ \downarrow & \downarrow
 \end{bmatrix} 
= 
\begin{bmatrix}
0 & 0 \\
0 & 0 \\
0 & 0
\end{bmatrix} 
\end{aligned} \\
\text{em que } \|v_{1}\|=\|v_{2}\|=1

$$
Eu cheguei no sistema:
$$ 
\begin{aligned}
& \begin{cases} x+14w=0 \\ y-4w=0 \\ z+6w=0 \end{cases} \text{parece que é tudo em função de uma única variável, a solução seria:} \\

& \begin{cases} x=-14w \\ y=4w \\ z=-6w \end{cases} \iff{w(-14,4,-6,1)\text{ seu unitário é }\hat{w}=\frac{w}{\|w\|}=\frac{w}{\sqrt{ \langle w,w \rangle }}}

\end{aligned}

$$
Mas primeiro conferir se meu escalonamento tava certo:
```r
#| label: 8d27ba37
library(matlib)
echelon(matrix(c(2,-1,3,1,-1,2,-4,2,5,0,2,4),nrow=3))
```
> [!OUTPUT]+ {#output-8d27ba37}
> ```
> ​[,1​] ​[,2​] ​[,3​]       ​[,4​]
> ​[1,​]    1    0    0  3.0909091
> ​[2,​]    0    1    0 ​-4.0000000
> ​[3,​]    0    0    1  0.5454545
> ```

```r
#| label: 043066da
library(pacote.lais)
u_1<-c(4/5,0,-3/5)
u_2<-c(0,1,0)
w<-c(1,2,3)
(1/14)*u_1+(1/7)*u_2
w-proj_(w,u_1)-proj_(w,u_2)
```

> [!OUTPUT]+ {#output-043066da}
> ```
> ​[1​]  0.05714286  0.14285714 ​-0.04285714
> 
> ​[1​] 1.8 0.0 2.4
> ```

$$w_{1}=\operatorname{proj}_{u_{1}}(w)+\operatorname{proj}_{u_{2}}(w)\text{ e temos }w_{2}=w-(\operatorname{proj}_{u_{1}}(w)+\operatorname{proj}_{u_{2}}(w))$$
