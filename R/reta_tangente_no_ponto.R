#' @title Reta tangente ao ponto x da função
#' @description
#' Recebe a função e os pontos que queremos ver as retas tangentes no geogebra.
#' @param expr função na forma expression (atenção, quando o coeficiente for
#' negativo escreva na forma +-a)
#' @param x_ valores de x que queremos ver a reta tangente
#' @return executável do geogebra
#' @concept calculo
#' @concept geogebra
#' @examples
#' reta_tangente_no_ponto(expression(x^2+3),c(0.3,-2))
#' @export
reta_tangente_no_ponto<-function(expr,x_){
  lista_retas<-list()
  for (i in 1:length(x_)){
    x<-x_[i]
    derivada<-eval(der_poli2(expr))
    lista_retas[[i]]<-c(list(c(x,eval(expr))),derivada)
  }
  return(reta_geogebra(lista_retas))
}

#' @describeIn reta_tangente_no_ponto Função que torna possível receber vários
#' argumentos x_.
#' @export
reta_geogebra<-function(ponto_decli){
  pontos<-lapply(1:length(ponto_decli),function(x) ponto_decli[[x]][[1]])
  declividades<-lapply(1:length(ponto_decli),function(x) ponto_decli[[x]][[2]])
  declividades<-unlist(declividades)
  retas_<-character()
  for (i in 1:length(declividades)){
    ponto<-paste(pontos[[i]],sep="",collapse=",")
    ponto<-paste("(",ponto,")",collapse="",sep="")
    vetor_diretor<-paste(1,declividades[i],collapse="",sep=",")
    vetor_diretor<-paste("Vector","(","(",vetor_diretor,")",")",collapse="",sep="")
    reta<-paste(ponto,vetor_diretor,sep=",",collapse="")
    reta<-paste(r"(")","Line","(",reta,")",r"(")",collapse="",sep="")
    retas_[i]<-reta
  }
  retas_<-paste(retas_,sep="",collapse=",")
  return(paste("Executar","(","{",retas_,"}",")",collapse="",sep=""))
}
