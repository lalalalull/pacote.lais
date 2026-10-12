#' @title Achar derivada em forma de expression
#' @description
#' Uma atualização da função der_poli, agora usando expressions.
#' A função recebe um polinômio e retorna sua derivada.
#' @param expr expression do polinômio, deve estar no formato (a*x^n...) e use sinal de +
#' mesmo que o número seja negativo, ex: +-5.
#' @return expression da primeira derivada
#' @concept calculo
#' @concept algebra
#' @examples
#' der_poli2(expression(-2*x^2+-3*x^4))
#' der_poli2(der_poli2(expression(-2*x^2+-3*x^4)))
#' @export
der_poli2<-function(expr){
  #browser()
  expr<-unlist(strsplit(as.character(expr),split=" * "))
  expr<-expr[!(expr %in% c("*","+"))]
  coefs<-integer()
  for (elem in expr){
    if (suppressWarnings(!is.na(as.integer(elem)))){
      coefs<-c(coefs,elem)
    } else {next}
  }
  expr<-expr[!(expr %in% coefs)]
  expr<-unlist(strsplit(expr, split="^"))
  expr<-expr[!(expr %in% "^")]
  poten<-integer()
  for (elem in expr){
    if (suppressWarnings(!is.na(as.integer(elem)))){
      poten<-c(poten,elem)
    } else {next}
  }
  x<-rep("x",length(poten))
  if (length(coefs)!=0){
    coefs<-as.numeric(coefs)*as.numeric(poten)
    expr<-paste(coefs,"x",sep="*")
  }
  else {
    coefs<-rep(1,length(poten))*as.numeric(poten)
    expr<-paste(coefs,"x")
  }
  poten<-as.numeric(poten)-1
  expr<-paste(coefs,x,sep="*")
  expr<-paste(expr,poten,sep="^")
  if (length(expr)!=1){return(parse(text = paste(expr,collapse="+")))}
  else {return(parse(text = expr))}
}
