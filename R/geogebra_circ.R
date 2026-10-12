



#' @title Círculos no geogebra
#' @description função que retorna círculo no geogebra 2d
#' @param centro array do centro do círculo c(x,y)
#' @param raio comprimento do raio
#' @return retorna circle(centro,raio)
#' @concept geogebra
#' @concept algebra
#' @examples
#' geogebra_circ(c(1,2),0.5)
#' @export
geogebra_circ<-function(centro,raio){
  #browser()
  centro<-paste(centro,collapse=",",sep="")
  centro<-paste("(",centro,")",sep="")
  centro_raio<-paste(centro,raio,sep=",")
  return(paste("Circle","(",centro_raio,")",sep=""))
}

