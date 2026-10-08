#' @title retornar vetores de aceleração e derivada no geogebra
#' @param expr argumento expression da função
#' @param x ponto no qual queremos ver os vetores
#' @return retorna lista com vetores e círculo (caso queira ver pela perspectiva do
#' movimento circular)
#' @examples
#' Vetores_Vel_Ac2(expression(x^2),0.2)
#' @export
Vetores_Vel_Ac2<-function(expr,x){
  #browser()
  ponto_inicial = c(x,eval(expr))
  f1<-D(expr,"x")
  f2<-D(f1,"x")
  d1<-c(1,eval(f1))
  d2<-c(1,eval(f2))
  'vamos ver como d2 se sobrepõe em d1'
  matriz_90<-matrix(c(0,1,-1,0),ncol=2)
  acT_base<-Multiplicar_Matrizes(matriz_90,matrix(d1,ncol=1))
  base_m<-matrix(c(acT_base,d1),ncol=2)
  base_m<-cbind(base_m,d2)
  sol<-echelon(base_m)[,3]
  if (d2[[2]]>0){aN<-round(c(sol)[1]*c(acT_base),digits=4)*-1}
  else {aN<-round(c(sol)[1]*c(acT_base),digits=4)}
  aT<-round(c(sol)[2]*d1,digits=4)
  lista<-list(
    aN = list(ponto_inicial,aN+ponto_inicial),
    aT = list(ponto_inicial,aT+ponto_inicial),
    d1 = list(ponto_inicial,d1+ponto_inicial)
  )
  'geogebra_circ(aN+ponto_inicial,norma(aN))'
  lista_final<- list(
    círculo = geogebra_circ(aN+ponto_inicial,norma(aN)),
    vetores = executar_geogebra_ligar(list(lista$aN,lista$aT,lista$d1),vetor=T,segmento=F)
  )
  return(lista_final)
  #return(executar_geogebra_ligar(list(lista$aN,lista$aT,lista$d1),vetor=T,segmento=F))
}
