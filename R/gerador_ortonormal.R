#' Função que gera bases ortonormais aleatórias.
#' Uma base ortonormal é uma base de vetores perpendiculares entre si e com norma igual à 1,
#' bases ortonormais são usadas para transformações vetoriais como rotacionar um vetor em torno de um eixo específico.
#' @param dim dimensão do espaço vetorial
#' @param geogebra argumento logical, se você quer escrever na calculadora do geogebra com a notação pronta
#' @param arredondar argumento logical, se você quer arredondar os valores ou não
#' @return retorna base ortonormal em forma de lista numérica ou character
#' @export
#' @examples
#' gerador_ortonormal(3,T,T)
#' gerador_ortonormal(4,F,F)
#' gerador_ortonormal(2,F,T)
#' @title gerador_ortonormal
gerador_ortonormal<-function(dim,geogebra,arredondar){
  'browser()'
  base<-asplit(gerador_de_bases(dim,F),MARGIN=1)
  if (geogebra==F){
    return(ortonormal(base))
  } else {
    texto<-list()
    base<-ortonormal(base)
    'arredondar com round'
    if (arredondar){
      for (j in 1:length(base)){
        base[[j]]<-round(base[[j]],digits=4)
      }
    }
    for (i in 1:length(base)){
      coord<-paste(base[[i]])
      coord<-paste(coord,collapse=",")
      texto[[i]]<-paste("bo","_",i,"=","(",coord,")",sep="",collapse="")
    }
    return(texto)
  }
}

