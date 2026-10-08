#' @title Teorema de Bezóut resolução algorítimica
#' @description O algoritmo estendido de euclides para achar x e y tal que ax+by=mdc(a,b)
#' @param n_maior número maior
#' @param n_menor número menor
#' @return retorna matriz coluna com os valores de x e y, sendo o primeiro elemento da coluna correspondente ao menor número
#' @examples
#' bezout(333,45)
#' bezout(334,124)
#' @export
bezout<-function(n_maior,n_menor){
  mdc<-mdc(n_maior,n_menor,mdc=F)
  if (length(mdc$restos)!=1){
    quo<-(-1)*rev(mdc$quocientes[1:(length(mdc$quocientes)-1)])
    matriz_base<-matrix(c(1,1,1,0),ncol=2)
    m<-matrix(c(quo[1],1))
    for (i in 1:(length(quo)-1)){
      matriz_base[1,1]<-quo[i+1]
      m<-Multiplicar_Matrizes(matriz_base,m)
    }
    return(m)
  } else {return(matrix(c((-1)*mdc$quocientes,1),ncol=1))}
}
