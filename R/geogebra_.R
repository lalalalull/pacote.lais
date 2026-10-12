#' @description
#' Função que recebe lista de vetores e retorna a notação do geogebra em character (em forma de
#' executável), podendo ser notação de ponto ou de vetor.
#' @param lista_v lista de vetores ou matriz de vetores coluna.
#' @param vetor logical que indica se a notação é de vetor (T)
#' @param ponto logical que indica se a notação é de ponto (F)
#' @return retorna lista character com a notação do geogebra
#' @export
#' @concept geogebra
#' @concept algebra
#' @examples
#' geogebra_(list(c(1, 2, 3), c(3, 4, 5)),F,T)
#' geogebra_(list(c(1, 2), c(3, 4, 5),c(7,7,1)),T,F)
#' @title Executáveis do geogebra para vetores e pontos de início na origem
geogebra_<-function(lista_v,vetor = T,ponto = F){
  if (is.matrix(lista_v)){lista_v<-lapply(1:ncol(lista_v),function(x) lista_v[,x])}
  lista<-list()
  if (vetor){
    #letra_escolhida = sample(letters,size=1)
    palavra = "Vector"
  } else if (ponto){
    #letra_escolhida = sample(LETTERS,size=1)
    palavra = ""
  }
  for (i in 1:length(lista_v)){
    'browser()'
    coord<-paste(lista_v[[i]])
    coord<-paste(coord,collapse=",")
    lista[[i]]<-paste('"',palavra,"(","(",coord,")",")",sep="",collapse="",'"')
  }
  lista<-paste("Executar","(","{",paste(unlist(lista),collapse=","),"}",")",sep="")
  return(lista)
}

