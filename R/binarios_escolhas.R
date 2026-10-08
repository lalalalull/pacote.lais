#' @title Lista de binários de escolhas de (n 0) até (n n)
#' @param cardi cardinalidade do conjunto
#' @return lista de binários
#' @examples
#' binarios_escolhas(5)
#' @export
binarios_escolhas<-function(cardi){
  #browser()
  total = 2^cardi
  i = 0
  lista<-list()
  while (i<total){
    teste<-sample(c(0,1),replace=T,size=cardi)
    if (!(list(teste) %in% lista)){
      lista[[i+1]]<-teste
      i = i+1
    } else {next}
  }
  return(lista)
}
