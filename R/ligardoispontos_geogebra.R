#' Função feita para ligar dois pontos no geogebra utilizando a sintaxe adequada
#' @param PontoInicial ponto de início
#' @param PontoFinal ponto final
#' @param vetor logical que indica se é vetor
#' @param segmento logical que indica se é segmento
#' @param executar logical que deixará no formato certo para usar a função executar_geogebra_ligar
#' @return Retorna a sintaxe do geogebra em forma de segmento ou de vetor
#' @export
#' @examples
#' ligardoispontos_geogebra(c(1,2,3),c(-1,-3,4),T,F,T)
#' ligardoispontos_geogebra(c(1,2,),c(-1,-3,),F,T,F)
#' @title Função para ligar dois pontos no geogebra
ligardoispontos_geogebra<-function(PontoInicial,PontoFinal,vetor,segmento=F,executar=F,reta=F){
  inicio<-paste(PontoInicial,collapse=",")
  fim<-paste(PontoFinal,collapse=",")
  if (vetor){
    palavra = "Vector"
  } else if (segmento){
    palavra = "Segment"
  } else if (reta){
    palavra = "Line"
  }
  return(paste(palavra,"(","(",
                 inicio,")",",","(",fim,")",")",sep=""))
}


