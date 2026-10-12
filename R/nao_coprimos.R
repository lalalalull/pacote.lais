
#' @title Conferir se dois números não são coprimos
#' @param n1 numero 1
#' @param n2 numero 2
#' @return logical(1)
#' @concept combinatoria
#' @examples
#' nao_coprimos(127,34)
#' nao_coprimos(281,77)
#' @export
nao_coprimos<-function(n1,n2){
  any(sort(unique(submultiplos(n1))) == sort(unique(submultiplos(n2))))}
