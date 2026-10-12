#' Função que retorna a norma do vetor
#' @param v vetor
#' @return vetor norma, tamanho 1
#' @export
#' @concept algebra
#' @examples
#' norma(c(-4,-5,2))
#' norma(c(-1,2))
#' @title norma
norma<-function(v){
  'browser()'
  cord<-NULL
  for (i in 1:length(v)){
    cord<-c(cord,(v[i]^2))
  }
  return(sqrt(sum(cord)))
}
