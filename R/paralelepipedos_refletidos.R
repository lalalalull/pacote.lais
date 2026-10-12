#' @title Paralelepípedos projetados em outro espaço da base canônica.
#' @description A função retorna executáveis do paralelepípedo formado pela matriz
#' projetada em diferentes bases, em que as dimensões podem estar refletidas ou não.
#' @param matriz matriz
#' @return lista de executáveis do geogebra com atributo $Matriz_do_espaço
#' @concept algebra
#' @concept geogebra
#' @examples
#' paralelepipedos_refletidos(matrix(c(1,2,0,0,-1,-2,1,3,3),ncol=3))
#' @export
paralelepipedos_refletidos<-function(matriz){
  #browser()
  config<-matrizes_negativas(matriz)
  lista<-list()
  for (m in config){
    #executável<-vertices2(m)$executável_geogebra
    executável<-diag_hip(m)
    attr(executável,"Matriz_do_espaço")<-m
    lista[[length(lista)+1]]<-executável
  }
  return(lista)
}
#' @describeIn paralelepipedos_refletidos Função que retorna todas as matrizes
#' possíveis com colunas negativas de (n 0) até (n n).
#' @export
matrizes_negativas<-function(matriz){
  #browser()
  config<-binarios_escolhas(ncol(matriz))
  matriz_original<-matriz
  lista<-list()
  for (j in config){
    matriz<-matriz_original
    pos<-which(j==1)
    for (i in pos){
      matriz[,i]<-matriz[,i]*(-1)
    }
    lista[[length(lista)+1]]<-matriz
  }
  return(lista)
}


