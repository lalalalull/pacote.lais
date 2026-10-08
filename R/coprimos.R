
#' @title Coprimos de um número
#' @description Função que retorna coprimos de um número
#' @param numero numero int
#' @examples
#' coprimos(48)
#' @export
coprimos<-function(numero){
  sub<-unique(submultiplos(numero))
  inter<-rep(TRUE,numero)
  final<-1:numero
  for (i in sub){
    retirar<-seq.int(i,numero,by=i)
    inter[retirar]<-FALSE
  }
  return(final[inter])
}
