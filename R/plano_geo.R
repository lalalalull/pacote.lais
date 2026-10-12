#' @title Plano no geogebra
#' @description Função para Plano(ponto,vetor,vetor) no geogebra
#' @concept algebra
#' @concept geogebra
#' @export
plano_geo<-function(vet1,vet2,ponto=c(0,0,0)){
  vet1<-paste(vet1,collapse=",")
  vet1<-paste('(','(',vet1,')',')',sep="")
  vet2<-paste(vet2,collapse=",")
  vet2<-paste('(','(',vet2,')',')',sep="")
  ponto<-paste(ponto,collapse=",")
  ponto<-paste('(',ponto,')',sep="")
  plano<-paste(ponto,vet1,vet2,sep=",")

  return(paste('Plano','(',plano,')',collapse="",sep=""))
}
