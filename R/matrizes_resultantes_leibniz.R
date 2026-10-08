#' A função é usada acompanhada de Det_Leibniz, serve para transformar todos as possibilidades mapeadas em matrizes.
#' A função faz isso recebendo uma matriz e mapeando suas possibilidades do jogo de Leibniz.
#'
#' @param matriz Uma matriz
#' @return retorna uma lista de matrizes
#' @export
#' @examples
#' matrizes_resultantes_leibniz(matrix(c(1,1,1,1),ncol=2))
#' @title matrizes_resultantes_leibniz
matrizes_resultantes_leibniz<-function(matriz){
  n = unique(dim(matriz))
  resultados<-Det_Leibniz(n)
  lista_matrizes<-list()
  for (i in 1:length(resultados)){
    matriz_final<-matrix(rep(0,n^2),ncol=n)
    'browser()'
    for (j in 1:n){
      análise<-strsplit(resultados[[i]][[j]],split="")[[1]]
      coord <- as.integer(análise[-1])
      matriz_final[coord[1],coord[2]]<-matriz[coord[1],coord[2]]
    }
    lista_matrizes[[i]]<-matriz_final
  }
  return(lista_matrizes)
}


#' @describeIn matrizes_resultantes_leibniz Uma lista complicada e bugada que serve como base pra essa função.
#' @export
Det_Leibniz<-function(n){
  'browser()'
  total = factorial(n)
  i = 1
  linhas<-c(1:n)
  lista_final<-list()
  while (i<=total){
    'browser()'
    coluna_teste<-sample(1:n,size=n)
    if (list(coluna_teste) %in% lista_final){
      next
    } else {
      lista_final[[i]]<-coluna_teste
      i=i+1
    }
  }
  l_<-list()
  for (j in 1:total){
    'browser()'
    lista_<-list()
    for (l in 1:n){
      lista_[[l]]<-paste("a",l,lista_final[[j]][l],sep="",collapse="")
      l_[[j]]<-lista_
    }
  }
  return(l_)
}
