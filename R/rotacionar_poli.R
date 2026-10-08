# Rotacionar Poliedros em relação aos eixos
# Descomplica minha vida se essa função receber logo matriz

rotacionar_poli<-function(matriz,eixo,grau){
  rad = rad(grau)
  lista_v<-vector(mode="list")
  if (eixo=="Ox"){
    Ox_<-c(1,0,0,0,cos(rad),-sin(rad),0,sin(rad),cos(rad))
    matriz_Ox<-matrix(Ox_,byrow=T,nrow=3)
    return(Multiplicar_Matrizes(matriz_Ox,matriz))
   }
  else if (eixo=="Oy"){
    Oy_<-c(cos(rad),0,-sin(rad),0,1,0,sin(rad),0,cos(rad))
    matriz_Oy<-matrix(Oy_,byrow=T,nrow=3)
    return(Multiplicar_Matrizes(matriz_Oy,matriz))
  } else {
    Oz_<-c(cos(rad),-sin(rad),0,sin(rad),cos(rad),0,0,0,1)
    matriz_Oz<-matrix(Oz_,byrow=T,nrow=3)
    return(Multiplicar_Matrizes(matriz_Oz,matriz))
  }
}

# Vértices de um Poliedro




