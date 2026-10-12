#' @title Algoritmo de Euclides MDC
#' @description O algoritmo de Euclides para encontrar o mdc se trata de colocar em evidência o mdc em divisões inteiras consecutivas de restos que herdam o mdc como fator comum. O mdc será o resto que vem antes de 0.
#' @param n_maior maior número
#' @param n_menor menor número
#' @param acumula_quo quocientes acumulados
#' @param acumula_r restos acumulados
#' @param mdc se deseja o mdc TRUE ou FALSE
#' @concept combinatoria
#' @return
#' Se mdc=T a função retorna o mdc;
#' Se mdc=F a função retorna o caminho de quocientes e restos até o mdc.
#' @examples
#' mdc(334,124)
#' mdc(120,36,mdc=F)
#' @export
mdc<-function(n_maior,n_menor,acumula_quo=numeric(0),acumula_r=numeric(0),mdc=T){
  quocientes<-acumula_quo
  restos<-acumula_r
  quocientes[length(quocientes)+1]<-n_maior%/%n_menor
  restos[length(restos)+1]<-n_maior-(n_maior%/%n_menor)*n_menor
  if (n_maior-(n_maior%/%n_menor)*n_menor == 0){
    if (mdc){n_menor}
    else {
      caminho<-list(quocientes=quocientes,restos=restos)
      return(caminho)
    }
  }
  else{
    if (mdc){mdc(n_menor, n_maior-(n_maior%/%n_menor)*n_menor,quocientes,restos,mdc=T)}
    else {mdc(n_menor, n_maior-(n_maior%/%n_menor)*n_menor,quocientes,restos,mdc=F)}
  }
}
