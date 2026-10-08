#' Função para retornar executável do geogebra para pontos que se interligam formando vetores ou segmentos. Ela usar a função ligardoispontos_geogebra
#' @param lista_p uma lista no formato list(list(c(),c()),list(c(),c())...), cada lista são os dois pontos que se ligam
#' @param vetor logical que indica se são vetores (F)
#' @param segmento logical que indica se são segmentos (T)
#' @return retorna character de executável, que pode ser "limpado" usando a função cat()
#' @export
#' @title Criar executáveis de dois pontos que se ligam no geogebra
executar_geogebra_ligar<-function(lista_p,vetor = F,segmento = T,reta=F){
  vetores<-lapply(lista_p,function(x) ligardoispontos_geogebra(unlist(x[1]),unlist(x[2]),vetor,segmento,T,reta))
  vetores<-paste('"',vetores,'"',collapse=",",sep="")
  return(paste("Executar","(","{",vetores,"}",")",sep=""))
}
