#' @concept calculo
#' @param expr função na forma expression
#' @param x valor de x que queremos saber a primeira e segunda derivada da função
#' @return retorna a primeira e a segunda derivada
#' @export
derivadas_1_2<-function(expr,x){return(c((eval(D(expr,'x'))),eval(D(D(expr,'x'),'x'))))}
