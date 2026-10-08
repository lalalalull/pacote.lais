#' Função que escreve um vetor na base desejada.
#' @param m matriz com a base
#' @param v vetor
#' @return vetor base [v]_B
#' @export
#' @examples
#' vetor_b(matrix(c(0,1,0,0,0,1,1,0,0),ncol=3),c(-1,2,-2))
#' vetor_b(matrix(c(1,0,0,0,0,1,0,1,0),ncol=3),c(2,1,0))
#' @title Escrever vetor na base
vetor_b<-function(m,v){Multiplicar_Matrizes(solve(m),v)}

