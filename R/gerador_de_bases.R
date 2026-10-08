#' Função que gera bases aleatórias de um espaço vetorial.
#' @importFrom matlib echelon
#' @param dim dimensão do espaço vetorial, ex:3 é R³, 2 é R²
#' @param geogebra argumento logical, T= notação do geogebra (F)
#' @param lista caso queira que retorna base em forma de lista (F)
#' @return se geogebra==F, retorna matriz, se geogebra==T retorna lista de characters
#' @export
#' @examples
#' gerador_de_bases(3,T)
#' gerador_de_bases(4,F)
#' @title gerador_de_bases
gerador_de_bases<-function(dim,geogebra=F,lista=F){
  'browser()'
  repeat{
    teste<-matrix(sample(size=dim^2,0:5,replace=TRUE),ncol=dim)
    escalonar<-echelon(teste)
    parar = FALSE
    identidade<-diag(dim)
    for (i in 1:dim){
      'browser()'
      if (all(escalonar[i,]==identidade[i,])){
        next
      } else {
        parar = TRUE
        break
      }
    }
    browser()
    if (parar){
      next
    } else if (geogebra){
      lista<-list()
      coords<-split(teste,col(teste))
      executável<-geogebra_(coords,T,F)
      return(executável)
    } else if (!(geogebra)) {
      if (!lista){return(teste)}
      else {return(split(teste, col(teste)))}
    }
  }
}

