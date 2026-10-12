#' Função que retorna TRUE ou FALSE para responder se a base é levógira ou não, a base precisa estar escalonada com as colunas/linhas em suas devidas posições, como as matrizes que a função matrizes_leibniz gera.
#' @param matriz a matriz com a base que queremos saber se tem padrão levógiro
#' @return TRUE para levógira, FALSE para destrógira
#' @concept algebra
#' @concept combinatoria
#' @export
#' @title Saber se a base é destrógira ou não
levogiro<-function(matriz){
  'browser()'
  dimensão = ncol(matriz)
  colunas<-1:dimensão
  colnames(matriz)<-as.character(colunas)
  trocas = 1
  for (i in 1:dimensão){
    pos = which(matriz[,i]!=0)
    if (length(pos)==0){
      return(TRUE) #tanto faz se é true ou false, tem uma direção nula'
    } else {
      if (pos == as.numeric(colnames(matriz)[[i]])){
        next
      } else {
        'browser()'
        trocas = trocas*(-1)
        'troca_1 = colnames(matriz)[pos]'
        troca_2 = colnames(matriz)[i]
        posição= which(colnames(matriz)==as.character(pos))
        troca_1 = pos
        colnames(matriz)[i]<-troca_1
        colnames(matriz)[posição]<-troca_2
      }
    }
  }
  if (trocas<0){return(TRUE)}
  if (trocas>0){return(FALSE)}
}
