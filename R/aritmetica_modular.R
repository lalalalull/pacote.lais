#' Aritmética modular se refere à sequências cíclicas do tipo 1-2-3-1-2-3-1... A função retorna o elemento que está na posição pos.
#' @param seq_circ sequência em array
#' @param pos posição que você quer
#' @return retorna o elemento da posição dada
#' @export
#' @title Posições na Aritmética Modular'
aritmetica_modular<-function(seq_circ,pos){
  conclusão<-NULL
  for (i in 1:length(pos)){
    if (pos[i]%%length(seq_circ)!=0){
      conclusão<-c(conclusão,seq_circ[pos[i]%%length(seq_circ)])
    }
    else {
      conclusão<-c(conclusão,seq_circ[length(seq_circ)])
    }
  }
  return(conclusão)
}



