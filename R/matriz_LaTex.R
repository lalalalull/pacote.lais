#' Função que recebe uma matriz e retorna sua notação em formato LaTex
#' @param matriz matriz
#' @concept latex
#' @concept algebra
#' @return retorna sua notação em LaTex, faltando as cifras $ $
#' @export
#' @title Matriz em LaTex
matriz_LaTex<-function(matriz){
  #browser()
  Quantidade_E  = ncol(matriz)-1
  linhas<-list()
  for (i in 1:nrow(matriz)){
    E = 0
    for (j in 1:ncol(matriz)){
      if (E == Quantidade_E){
        if (E != 0){linhas[i]<-paste(linhas[i],matriz[i,j])}
        else{linhas[i]<-paste(matriz[i,j])}
      } else {
        if (j!=1){linhas[i]<-paste(linhas[i],matriz[i,j],"&")}
        else {linhas[i]<-paste(matriz[i,j],"&")}
        E = E + 1
      }
    }
  }
  #browser()
  linhas<-paste(linhas,collapse=r"( \\ )")
  return(paste(r"(\begin{bmatrix})",linhas,r"(\end{bmatrix})"))
}

