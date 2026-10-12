#' @description Função que recebe uma matriz aumentada de um sistema linear e retorna sua forma escalonada reduzida, podendo
#' vir acompanhada da imagem ou do domínio em forma de janela html com leitor MathJax.
#' @importFrom matlib echelon
#' @param matriz_aumentada matriz aumentada do sistema
#' @param imagem logical, se quiser a imagem da transformação linear (T)
#' @param dominio logical, se quiser o domínio (também conhecido como solução do sistema) (F)
#' @param geogebra logical para executável do geogebra para o domínio ou para a imagem (T)
#' @return retorna matriz escalonada reduzida com atributos como "graus de liberdade", "variáveis livres" e etc.
#' @export
#' @concept algebra
#' @concept latex
#' @concept geogebra
#' @examples
#' Resolver_Sistema_Linear(matrix(c(1, 2, -1, 3, 2, 5,  1, 7, 3, 7,  0, 10), nrow = 3, byrow = TRUE),F,T,T)
#' Resolver_Sistema_Linear(matrix(c( 2, -4,  6,  8, -1,  2, -3, -4,3, -6,  9, 12), nrow = 3, byrow = TRUE),T,F,T)
#' @title Resolva Sistemas Lineares
Resolver_Sistema_Linear<-function(matriz_aumentada,imagem = T,dominio = F,geogebra = T){
  letras_após_4<-letters[-sapply(c("x", "y", "z", "w"), FUN = function(item) which(letters == item))]
  x<-c("x","y","z","w",letras_após_4)
  solução<-echelon(matriz_aumentada,reduced=TRUE)
  resultado<-solução[,ncol(solução)]
  incógnitas<-solução[,-ncol(solução)]
  colnames(incógnitas)<-x[1:ncol(incógnitas)]
  variáveis_livres<-NULL
  pivôs<-NULL
  for (col in colnames(incógnitas)){
    #browser()
    parar= F
    coluna<-incógnitas[,col]
    posições_pivô<-which(coluna==1)
    if (all(unique(coluna)==0)){
      variáveis_livres<-c(variáveis_livres,col)
      next
    }
    for(pos in posições_pivô){
      if (!(which(posições_pivô==pos)==nrow(incógnitas))){
        Valores_Abaixo<-unique(coluna[-(1:pos)])
        if ((length(unique(Valores_Abaixo)==1)&&sum(unique(Valores_Abaixo)==0)) || (length(Valores_Abaixo)==0)){
          linha<-incógnitas[pos,]
          'agora tem que conferir se ele é o primeiro valor diferente de zero da linha que está'
          linha_teste<-linha[1:(which(colnames(incógnitas)==col))]
          linha_teste<-linha_teste[-length(linha_teste)]
          if ((length(unique(linha_teste))==1 && sum(linha_teste)==0) || length(linha_teste)==0){
            #browser()
            linha<-linha[-(which(colnames(incógnitas)==col))]
            linha_sem_zeros<-linha[linha!=0]
            colunas_formadoras<-names(linha_sem_zeros)
            contido<-(colunas_formadoras%in%variáveis_livres)
            variáveis_livres<-c(variáveis_livres,colunas_formadoras[!contido])
            contido<-(col%in%pivôs)
            pivôs<-c(pivôs,col[!contido])
          } else {
            parar = TRUE
            break
          }
        } else {next}
      }
    }
    if (parar){next}
  }
  if(imagem){
    for (col in colnames(incógnitas)){
      if (which(colnames(incógnitas)==col)==1){
        expressão<-paste(paste(r"(T\left()",matriz_LaTex(matrix(x[1:ncol(incógnitas)],ncol=1)),r"(\right))",sep="")
                         ,"=",col,matriz_LaTex(matrix(incógnitas[,col],ncol=1)))
      } else {expressão<-paste(expressão,"+",col,matriz_LaTex(matrix(incógnitas[,col],ncol=1)))}
    }
    exibir_latex(expressão)
    attr(solução,"graus de liberdade")<-variáveis_livres
    attr(solução,"pivôs")<-pivôs
    attr(solução,"dimensão do espaço")<-ncol(solução)-1
    attr(solução, "dimensão do domínio")<-(ncol(solução)-1)-length(pivôs)
    attr(solução, "dimensão da imagem")<-length(pivôs)
    return(solução)
  }
  if(dominio){
    #browser()
    if(geogebra){lista_vertices2<-NULL}
    texto_1<-character()
    for (nome in variáveis_livres){
      matriz<-(-1)*(matrix(incógnitas[,nome],ncol=1))
      pos_1<-which(colnames(incógnitas)==nome)
      matriz[pos_1,1]<-1
      if(geogebra){lista_vertices2[[which(variáveis_livres==nome)]]<-matriz[,1]}
      if(which(variáveis_livres==nome)==1){
        texto_1<-c(paste(nome,matriz_LaTex(matriz)))
      } else {
        texto_1<-c(texto_1,paste("+",nome,matriz_LaTex(matriz)))
      }
    }
    'o foco tem que ser nas variáveis livres'
    texto_1<-paste(texto_1,collapse="")
    if (texto_1!=""){texto_1<-paste("+",texto_1)}
    if(geogebra){
      cat("Domínio:\n")
      cat(vertices2(lista_vertices2,T,resultado)$executável_geogebra,"\n")
      }
    resultado<-paste(matriz_LaTex(matrix(resultado,ncol=1)))
    formação<-matriz_LaTex(matrix(x[1:ncol(incógnitas)],ncol=1))
    exibir_latex(paste(formação,"=",resultado,texto_1,collapse=""))
    attr(solução,"graus de liberdade")<-variáveis_livres
    attr(solução,"pivôs")<-pivôs
    attr(solução,"dimensão do espaço")<-ncol(solução)-1
    attr(solução, "dimensão do domínio")<-(ncol(solução)-1)-length(pivôs)
    attr(solução, "dimensão da imagem")<-length(pivôs)
    return(solução)
  }
}
