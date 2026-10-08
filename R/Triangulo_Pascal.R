#' Função que retorna triângulo de Pascal
#' @param cardi até qual valor o triângulo de Pascal vai crescer, numeric
#' @param print logical se você quer printar o triângulo para visualização ou não
#' @return retorna matriz com triângulo de Pascal até o valor cardi
#' @export
#' @examples
#' Triangulo_Pascal(5,T)
#' Triangulo_Pascal(6,F)
#' @title Triângulo de Pascal, gere o triângulo e seus valores numa matriz
Triangulo_Pascal<-function(cardi, print){
  'browser()'
  resultado <- rep(0, cardi+1)
  resultado[1]<-1
  matriz<-matrix(resultado,ncol=(cardi+1))
  for (i in (0:cardi)){
    vetor<-numeric()
    if (print && i==0){
        print(1)
    } else {
      for (m in (0:i)){
        elem<-factorial(i)/(factorial(m)*factorial(i-m))
        vetor<-c(vetor,elem)
      }
      resultado[1:length(vetor)]<-vetor
      matriz<-rbind(matriz,resultado)
      if (print){print(vetor)}
    }
  }
  return(matriz)
}


