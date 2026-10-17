---
flashcards:
  q-j38e: { nid: 1792176748359, hash: uq9kervb, sync: am2zz23a }
  q-qciu: { hash: ut4qbbip }
  q-3hck: { nid: 1792177875227, hash: ju7mf3cm, sync: nn9m4h5z }
  q-q2kh: { nid: 1792177875283, hash: vxjq449s, sync: n3sbyyga }
  q-hq7s: { nid: 1792177875334, hash: h6e2q6nd, sync: 5p4xscdv }
---

$$


\text{Uma dúvida: }\int_{a}^{b}f(x)dx=\int_{a}^{b}f(x)\frac{dy}{dx}\frac{d^2x}{dy}\text{ ?}


$$
O que é derivada primitiva e antiderivada?


Qual é a fórmula da integração por partes? :: $\int udv=uv-\int vdu$
^q-j38e

Qual é a fórmula da integração por substituição? :: $\int f(g(x)).g'(x)dx=F(g(x))+C$
^q-btbq
Qual é a fórmula da regra da potência? (integrais) :: $\int x^ndx=\frac{x^{n+1}}{n+1}+C$
^q-qciu

Qual é a fórmula da regra da soma e da subtração? (integrais) :: $\int[f(x)\pm g(x)]= \int f(x) \pm \int g(x)$
^q-3hck

Qual é a fórmula da regra da constante multiplicativa? (integrais) :: $\int c.f(x)dx = c\int f(x)dx$
^q-q2kh

Qual é a integral da constante? (fórmula) :: $\int kdx=kx+C$
^q-hq7s
### Valor da função em x
```r
#| label: 76a50887
2*0
2*3
```

### Valor da integral em x
```r
#| label: 76a50887
integrate(function(x) 2*x,lower=0 , upper=3 )
```

> [!OUTPUT]+ {#output-76a50887}
> ```
> 9 with absolute error < 1e​-13
> ```

Por que calcular integrais é importante? O que elas tem a ver com probabilidade? Pode explicar de forma lúdica pra mim?
"Portanto, **calcular a probabilidade de um evento acontecer em um intervalo é literalmente calcular a área sob essa curva**." mas por que? O que tem a ver com área?

Ok, então os problemas da probabilidade seriam como o problema desses quadrados com a diferença que o pequeno quadrado irá variar de área em relação à alguma variável x?

Certo, estou começando a entender algo aqui. Me fala um problema de probabilidade (simples, por favor) em que isso se aplicaria.

Ok... Esse foi simples demais, me fale outro que não seja 50% mas que também não me assuste.

Imagine que você está a testar a precisão de uma máquina que corta barras de metal. Teoricamente, a barra perfeita tem 1 metro, mas devido a pequenas variações, o comprimento real delas varia entre **0 e 2 metros**.

Ok, mas o x é o que? Pode inventar se for preciso, por exemplo, pra fins didáticos. Pois sabemos que o tamanho das barras está variando em relação à x, né?

a densidade seria tipo uma função de 'frequências'? Por exemplo, nós aprendemos em estatística a criar gráficos em que y é a frequência que aparecem elementos do intervalo $a \vdash b$ e assim sucessivamente
