#' Função que transforma o espaço usando transformação linear. Na transformação linear jogamos os vetores no espaço linha da matriz de transformação.
#' Use o pacote rgl caso não queira visualizar no geogebra.
#' @param T_ matriz de transformação linear
#' @param m matriz que será transformada
#' @param geogebra logical, se deseja visualizar no geogebra ou não
#' @return retorna a matriz transformada e imprime as coordenadas no geogebra (se geogebra=T) ou mostra gráfico com espaço/subespaço transformado
#' @export
#' @examples
#' TL(matrix(c(0,1,0,1,0,0,0,0,1),ncol=3),matrix(c(1,2,3,1,-1,1),ncol=2),T)
#' @title Visualizar transformações lineares, mudança de base e etc
TL<-function(T_,m,geogebra=T){
  transformado<-Multiplicar_Matrizes(T_,m)
  if (geogebra){
    colunasT_<-split(T_,col(T_))
    colunasm<-split(m,col(m))
    colunasTransformado<-split(transformado,col(transformado))
    cat(paste("Transformação:","\n",vertices2(colunasT_,geogebra,0),"\n",collapse=""))
    cat(paste("Antes:","\n",vertices2(colunasm,geogebra,0)),"\n",collapse="")
    cat(paste("Depois:","\n",vertices2(colunasTransformado,geogebra,0),collapse="","\n"))
    cat(paste("Vetores:","\n",geogebra_(c(colunasT_,colunasm,colunasTransformado,0),T,F),collapse=""))
  } else {
    cat(vertices2(split(T_,col(T_)),geogebra,0))
    cat(vertices2(split(m,col(m)),geogebra,0))
    cat(vertices2(split(transformado,col(transformado)),geogebra,0))
  }
  return(transformado)
}

