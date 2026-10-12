#' Conferir se lista está dentro da lista de listas
#' @param lista lista que iremos conferir se está dentro da lista de listas, ela vem no formato list()
#' @param lista_p lista de listas, vem no formato list(list(),list()...list())
#' @return retorna TRUE ou FALSE
#' @export
#' @concept R_utilitario
#' @examples
#' lista_de_listas(list(c(1,2,3),c(4,5,6)), list(list(c(1,2,3)),list(c(5,6,7),c(4,4,4),c(1,1))))
#' @title %in% para lista de listas que só retorna 1 logical
lista_de_listas<-function(lista,lista_p){
  'browser()'
  for (j in lista_p){
    logic<-NULL
    for (i in lista){
      if (list(i) %in% j){
        logic<-c(logic,T)
      } else {
        next
      }
      if (length(logic)==length(lista)){
        return(TRUE)
      } else {
        next
      }
    }
  }
  return(FALSE)
}

