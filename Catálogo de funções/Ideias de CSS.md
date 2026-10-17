
### Estrutura de árvore para mostrar pastas e arquivos
```html 
<div class="file-tree">
  <ul>
    <li class="folder"><span>meu_pacote/</span>
      <ul>
        <li class="folder"><span>R/</span>
          <ul>
            <li class="file"><a href="https://github.com/seu-usuario/meu-pacote/blob/main/R/funcoes.R" target="_blank">funcoes.R</a></li>
            <li class="file"><a href="https://github.com/seu-usuario/meu-pacote/blob/main/R/matrizes.R" target="_blank">matrizes.R</a></li>
          </ul>
        </li>
        <li class="folder"><span>man/</span>
          <ul>
            <li class="file"><span>det.Rd</span></li>
          </ul>
        </li>
        <li class="file"><span>DESCRIPTION</span></li>
        <li class="file"><span>NAMESPACE</span></li>
      </ul>
    </li>
  </ul>
</div>
```
```css
.file-tree {
  font-family: monospace;
  font-size: 14px;
  background-color: #f6f8fa;
  padding: 16px;
  border-radius: 6px;
  border: 1px solid #d1d5db;
  width: fit-content;
}

.file-tree ul {
  list-style: none;
  padding-left: 20px;
  margin: 0;
  position: relative;
}

.file-tree li {
  margin: 4px 0;
  position: relative;
}

/* Adiciona as linhas conectoras sutis */
.file-tree ul::before {
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  border-left: 1px solid #d1d5db;
}

.file-tree li::before {
  content: "";
  position: absolute;
  top: 10px;
  left: -20px;
  width: 15px;
  border-top: 1px solid #d1d5db;
}

.folder > span {
  font-weight: bold;
  color: #0969da;
}

.file a {
  color: #24292f;
  text-decoration: none;
}

.file a:hover {
  text-decoration: underline;
}
```
##### Ou tente uma coisa tipo:
```html
<pre><code>.
├── DESCRIPTION
├── NAMESPACE
├── R
│   ├── funcoes.R
│   └── matrizes.R
└── man
    └── minha_funcao.Rd
</code></pre>
```
### Referenciar documentação de funções do roxygen2
```html
<a href="https://github.com/seu-usuario/seu-pacote/blob/main/man/minha_funcao.Rd" target="_blank">
  📄 Ver documentação Roxygen (minha_funcao.Rd)
</a>
```