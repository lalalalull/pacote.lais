#' Ortogonalização de Gram-Schmidt
#' A função faz a ortogonalização de gram-schimdt deixando o primeiro vetor intacto,
#' o processo consiste em subtrair projeções que os vetores têm entre si para que o
#' resultado final seja o de vetores ortogonais entre si.
#' @param v lista de vetores
#' @return lista de vetores
#' @export
#' @examples
#' gram_sch<-function(list(c(1,3,1),c(1,1,1),c(1,3,4)))
#' gram_sch<-function(list(c(1,2),c(3,4)))
#' @title gram_sch
gram_sch<-function(v){
  'browser()'
  vetores<-length(v)
  for (i in 2:vetores){
    vet = as.vector(v[[i]])
    for (j in 1:(i-1)){
      vet = round(vet-proj_(vet,v[[j]]),digits=4)
    }
    v[[i]]<-vet
  }
  resultado<-list(
    vetores_lista<-v,
    geogebra<-geogebra_(v,T,F)
  )
  return(resultado)
}


