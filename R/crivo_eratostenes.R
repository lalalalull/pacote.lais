#' @title Crivo de Eratóstenes
#' @description
#' Função baseada no crivo de Eratóstenes, retorna todos os primos menores ou iguais a um certo número.
#' @param num Número limite para os primos
#' @return retorna array com todos os primos até esse número
#' @export
crivo_eratostenes<-function(num){
  if(num>=1000000){return("O número tem que ser menor que 7 dígitos")}
  num_l<-floor(sqrt(num))
  eh_primo_<-rep(TRUE,num)
  eh_primo_[1]<-FALSE
  números<-1:num
  for (i in 2:num_l){
    if (eh_primo_[i]){
      sequencia<-seq.int(i^2,num,by=i)
      eh_primo_[sequencia]<-FALSE
    }
  }
  return(números[eh_primo_])
}
