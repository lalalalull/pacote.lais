#' Função que recebe duas matrizes e as multiplica
#' @param A primeira matriz
#' @param B segunda matriz
#' @return retorna a matriz resultante
#' @concept algebra
#' @concept combinatoria
#' @export
#' @title Multiplicar_Matrizes
Multiplicar_Matrizes<-function(A,B){
  if (Pode_Multiplicar(A,B)){
    matriz_r<-NULL
    soma<-NULL
    for (lin_inc in 1:ncol(B)){
      for (lin in 1:nrow(A)){
        for (col in 1:ncol(A)){
          soma<-c(soma,A[lin,col]*B[col,lin_inc])
        }
        matriz_r<-c(matriz_r,sum(soma))
        soma<-NULL
      }
    }
    matriz<-matrix(matriz_r,byrow=F,nrow=nrow(A),ncol=ncol(B))
    return(matriz)
  }
  else {"Matrizes não válidas"}
}


#' @describeIn Multiplicar_Matrizes retorna true ou false para dizer se dá pra multiplicar as duas matrizes ou não.
#' @export
Pode_Multiplicar<-function(A,B){
  if (ncol(A)==nrow(B)){TRUE}
  else{FALSE}
}

