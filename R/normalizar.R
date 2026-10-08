#' @description
#' Função que recebe lista de vetores e normaliza cada um deles. Normalizar vetores
#' significa fazer com que sua norma seja igual à 1.
#' @param lista_v lista de vetores ou matriz de vetores coluna
#' @param arredondar se deseja arredondar (T)
#' @param matriz se deseja retornar matriz (F)
#' @param geogebra se deseja retornar executável (F)
#' @return
#' 1. lista de vetores normalizados com coordenadas arredondadas.
#' 2. matriz com vetores normalizados
#' 3. executável do geogebra dos vetores normalizados
#' @export
#' @examples
#' normalizar(list(c(1,2,3),c(4,5,6)))
#' normalizar(list(c(1,2),c(1,4,5,6)))
#' @title normalizar
normalizar<-function(lista_v, arredondar = T, matriz = F, geogebra = F){
  #browser()
  if (is.matrix(lista_v)){lista_v<-lapply(1:ncol(lista_v),function(x) lista_v[,x])}
  tamanho<-length(lista_v)
  if (arredondar){
    for (i in 1:tamanho){
      lista_v[[i]]<-c(round(lista_v[[i]]/norma(lista_v[[i]]),digits=4))
    }
  } else {
    for (i in 1:tamanho){
      lista_v[[i]]<-c(lista_v[[i]]/norma(lista_v[[i]]))
    }
  }
  if (matriz){
    lista_v<-do.call(cbind,lista_v)
  }
  if (geogebra){
    # Sendo do tipo list()
    lista_v<-geogebra_(lista_v,T,F)
  }
  return(lista_v)
}



