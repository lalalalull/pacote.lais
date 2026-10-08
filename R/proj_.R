#' Projeção ortogonal de vetores
#' A função retorna a projeção ortogonal de um vetor sob o outro
#' @param v vetor que está sendo projetado
#' @param u vetor que recebe a projeção
#' @return vetor projeção
#' @export
#' @examples
#' proj_(c(1,2,3),c(4,3,3))
#' proj_(c(7,7,8,5),c(4,3,2,1))
#' @title proj_
proj_<-function(v,u){
  dim<-length(v)
  prod<-NULL
  prod2<-NULL
  for (i in 1:dim){
    prod<-c(prod, v[i]*u[i])
    prod2<-c(prod2,u[i]*u[i])
  }
  prod = sum(prod)
  prod2 = sum(prod2)
  return((prod/prod2)*u)
}

