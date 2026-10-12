#' Recebe dois vetores de qualquer dimensão e retorna o produto vetorial. O produto vetorial é o vetor ortogonal aos outros vetores e que sua norma é igual à figura que esses vetores formam.
#' @param lista_v lista de vetores
#' @param geogebra se você quer a notação do geogebra
#' @return retorna o produto vetorial em forma de array numérico ou character para o geogebra
#' @concept algebra
#' @concept geogebra
#' @export
#' @examples
#' prod_vetorial(list(c(1,0,1),c(0,1,1)),T)
#' prod_vetorial(list(c(9,9,9),c(11,0,-11)),T)
#' prod_vetorial(list(c(10,11,-9,0),c(23,-4,-5,1),c(-8,2,0,2)),F)
#' @title Produto Vetorial
prod_vetorial<-function(lista_v,geogebra){
  'browser()'
  dim = length(lista_v[[1]])
  preenchimento<-rep(0,dim^2)
  matriz<-matrix(preenchimento,ncol=dim)
  matriz[2:dim,]<-do.call(rbind,lista_v)
  matriz[1,]<-1:dim
  lista_config<-matrizes_resultantes_leibniz(matriz)
  levógiros<-lapply(lista_config,function(x) levogiro(x))
  vetores<-NULL
  for (i in 1:length(lista_config)){
    vetor<-rep(0,dim)
    pos_ = which((lista_config[[i]][1,])!=0)
    vetor[pos_]<-1
    números<-numeric()
    matriz_análise<-lista_config[[i]][2:dim,]
    for (j in 1:nrow(matriz_análise)){
      vetor_m<-matriz_análise[j,]
      if (length(vetor_m[vetor_m!=0])==0){
          números<-c(números,0)
      } else {
        números<-c(números,vetor_m[vetor_m!=0])
      }
    }
   vetor<-prod(números)*vetor
   if (levógiros[[i]]){
    vetores<-c(vetores,list((-1)*vetor))
   } else {
    vetores<-c(vetores,list(vetor))
   }
 }
  'browser()'
  if (geogebra){
    return(geogebra_(list(c(Reduce("+",vetores))),T,F))
  } else {
    return(Reduce("+",vetores))
  }
}














