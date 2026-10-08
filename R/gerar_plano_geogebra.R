#' Função que recebe 1 ponto e 2 vetores que formam um plano e retorna a notação de plano do geogebra
#' @param p ponto que pertence ao plano, se for um espaço vetorial use (0,0,0), se o foco é apenas a inclinação do plano use (0,0,0) também. Para planos deslocados/paralelos use um ponto qualquer do plano.
#' @param vet1 vetor diretor 1
#' @param vet2 vetor diretor 2
#' @return retorna o plano gerado na notação do geogebra
#' @export
#' @examples
#' gerar_plano_geogebra(c(0,0,0),c(1,2,3),c(4,5,6))
#' @title Gerar planos com a notação do geogebra
gerar_plano_geogebra<-function(p,vet1,vet2){
  'browser()'
  coord<-lapply(list(p,vet1,vet2),function(x) paste(x,collapse=","))
  coord<-lapply(coord,function(x) paste("(",x,")",sep=""))
  coord<-paste(coord,collapse=",")
  return(paste("plano","(",coord,")",sep=""))
}
