#' Fazer a base ser ortonormal
#' Função que usa as funções gram_sch e normalizar para transformar uma base em
#' ortonormal.
#' @param base_ lista de vetores que formam uma base
#' @return base ortonormal numa lista de vetores
#' @concept algebra
#' @export
#' @examples
#' ortonormal(list(c(1,2,0),c(0,1,1),c(4,4,2)))
#' ortonormal(list(c(1,2),c(0,3)))
#' @title ortonormal
ortonormal<-function(base_){normalizar(gram_sch(base_))}
