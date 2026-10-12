#' @title Hiperplano, diagonal e vetores formadores
#' @description
#' Uma função que organiza vertices2, seu maior diferencial é que retorna a diagonal do hiperplano em forma de vetor e também seus vetores formadores.
#' podendo estar deslocados da origem ou não. Ela utiliza as matrizes de vertices2 mas não as retorna.
#' @param lista_v
#' Pode ser uma lista de vetores ou matriz
#' @param inicial
#' Ponto inicial c(), indica a origem onde o objeto começa, 0 se for na origem.(=0)
#' @concept algebra
#' @concept geogebra
#' @return
#' Retorna tudo como executáveis do geogebra
#' @export
#' @examples
#' diag_hip(list(c(0,-1,3),c(9,0,-2),c(3,4,5),c(1,2,3)),c(1,2,3))
#' diag_hip(matrix(t(matrix(c(0,-1,3,9,0,-2,3,4,5),ncol=3)),ncol=3),)
diag_hip<-function(lista_v,inicial=0){
  #browser()
  lista<-list()
  if (inicial==0){
    if (is.matrix(lista_v)){inicial<-rep(0,nrow(lista_v))}
    else {inicial<-rep(0,length(lista_v[[1]]))}
  }
  vértices2<-vertices2(lista_v,T,inicial)
  #browser()
  vértices<-vértices2$Matriz_Vértices
  paralelepipedo<-vértices2$executável_geogebra
  #attr(paralelepipedo,"Tipo")<-"Paralelepípedo"
  'lista[[length(lista)+1]]<-paralelepipedo'

  #cat("Hiperplano: \n")
  #cat(vértices2$executável_geogebra,"\n")
  if (is.matrix(lista_v)){
    lista_<-lapply(1:ncol(vértices),function(x) list(inicial,lista_v[,x]+inicial))
    vetores<-executar_geogebra_ligar(lista_,T,F)
    #cat(vetores,"\n")
  }
  else if (is.list(lista_v)){
    #browser()
    lista_<-lapply(1:length(lista_v),function(x) list(inicial,lista_v[[x]]+inicial))
    vetores<-executar_geogebra_ligar(lista_,T,F)
    #cat(vetores,"\n")
  }
  #attr(vetores,"Tipo")<-"Vetores"
  'lista[[length(lista)+1]]<-vetores'
  #cat("Diagonal: \n")
  # Mudei o return para cat()
  diagonal<-(ligardoispontos_geogebra(vértices[[1,1]] + inicial,
                                  vértices[[nrow(vértices),1]] + inicial,T,F,T))
  #attr(diagonal,"Tipo")<-"Diagonal"
  'lista[[length(lista)+1]]<-diagonal'
  lista<-list(
    Paralelepípedo = paralelepipedo,
    Vetores_Formadores = vetores,
    Diagonal = diagonal
  )
  return(lista)
}
' ao invés de usar cat pra tudo, melhor deixar guardado bonitinho numa lista'

