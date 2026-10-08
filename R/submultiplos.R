#' @title Retornar divisores primos de um número
#' @description
#' Função que retorna todos os divisores/submúltiplos primos de um número, útil para estudar
#' aritmética modular e polígonos estrelados.
#' @param numero número escolhido
#' @return retorna array com os números primos que o dividem
#' @export
#' @examples
#' submultiplos(110)
#' submultiplos(12000)
submultiplos<-function(numero){
  submul<-numeric()
  if (eh_primo(numero)){
    submul<-c(numero)
    return(submul) # Sabemos que 'a' ou 'c' =1
  }
  for (i in crivo_eratostenes(numero)){
    #browser()
    if (numero%%i == 0){
      pot = 0
      while (numero%%i ==0){
        numero<-numero/i
        pot=pot+1
      }
      submul<-c(submul,rep(i,pot))
    } else {next}
  }
  return(submul)
}
