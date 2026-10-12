#' Função que recebe lista dos vetores que formam um paralelepípedo/paralelogramo/paralelótropo e retorna os
#' vértices e arestas usando combinatória.
#' A função se chama vertices2 em referência à função vertices.
#' A função também é boa para retornar paralelepípedos "esmagados" ou projetados em algum plano ou dimensão específica. Precisa do pacote rgl
#' @param lista_v lista de vetores ou matriz que formam o paralelepípedo
#' @param geogebra logical, caso deseje a notação do geogebra
#' @param inicial ponto de origem do hiperplano, é 0 se começa em (0,0,0)
#' @concept algebra
#' @concept combinatoria
#' @concept geogebra
#' @return retorna matriz de listas com todos os vértices e matriz de listas com todos os segmentos organizados
#' por colunas, em que o elemento da primeira linha é o vértice e os abaixo são os que se conectam à ele dois a
#' dois. Se geogebra=T, retorna lista character dos segmentos com a notação do geogebra.
#' @export
#' @examples
#' vertices2(list(c(1,2),c(-1,2)),T,0)
#' vertices2(list(c(1,2,3),c(4,5,6),c(2,2,2)),F,c(-1,0,-1))
#' vertices2(list(c(1,2,3),c(4,5,6),c(2,2,2)),T,c(11,-3,2))
#' vertices2(list(c(1,2,-4,5),c(-3,4,-5,2),c(7,8,5,9),c(-3,-3,-5,6)),F,0)
#' vertices2(list(c(1,0,0),c(0,1,0),c(0,0,1)),F,0)
#' @title Encontrar vértices e arestas do paralelepípedo formado pelos vetores usando recursão e combinatória
vertices2<-function(lista_v,geogebra=T,inicial=0){
  if (is.matrix(lista_v)){lista_v<-lapply(1:ncol(lista_v),function(x) lista_v[,x])}
  dim<-length(lista_v)
  array_pascal = Triangulo_Pascal(dim,F)[dim+2,]
  m_lista<-vector(mode="list",length=((dim+1)*max(array_pascal)))
  matriz_<-matrix(m_lista,ncol=(max(array_pascal)))
  for (pos in 1:length(array_pascal)){
    'browser()'
    total<-array_pascal[pos]
    i=1
    lista<-list()
    while (i<=total){
      vetores_teste<-sample(lista_v,size=(pos-1))
      resultante<-Reduce(`+`, vetores_teste)
      if (pos==1){
        lista<-c(lista,list(rep(0,length(lista_v[[1]]))))
        i=i+1
      } else if (list(resultante) %in% lista){
        next
      } else {
        attr(resultante,"vetores_geradores")<-vetores_teste
        attr(resultante,"nível") = pos-1
        lista[[i]]<-resultante
        i=i+1
      }
    }
    matriz_[pos,1:total]<-lista
  }
  'browser()'
  m_lista2<-vector(mode="list",length=((dim+1)*sum(array_pascal)))
  matriz_conexões<-matrix(m_lista2,ncol=(sum(array_pascal)),nrow=(dim+1))
  parar = FALSE
  for (k in nrow(matriz_):1){
    if (parar){
      break
    }
    linha<-matriz_[k,]
    nao_nulos <- !sapply(linha, is.null)
    lista_limpa <- linha[nao_nulos]
    for (vértice in lista_limpa){
      nível_atual = attr(vértice,"nível")
      vet_formador<-attr(vértice,"vetores_geradores")
      nível_inferior<-matriz_[k-1,]
      total_<-choose(length(vet_formador),nível_atual-1)
      v=1
      p=1
      combina<-list()
      if (length(total_)==0){
        matriz_conexões[[1,1]]<-rep(0,length(vértice))
        parar = TRUE
        break
      } else {
        while (p<=total_){
          while(v<=total_){
            teste<-sample(vet_formador,size=(nível_atual-1))
            if (lista_de_listas(teste,combina)){
              next
            } else {
              combina<-c(combina,list(teste))
              v = v + 1
            }
          }
          conectar_com<-NULL
          for (l in nível_inferior){
            lista1<-attr(l, "vetores_geradores")
            if (lista_de_listas(lista1, combina)){
              attributes(l)<-NULL
              conectar_com<-c(conectar_com,list(l))
            }
          }
          'browser()'
          nova_lista<-NULL
          posição<-which(vapply(matriz_[k, ],function(x) identical(vértice,x) , FUN.VALUE = logical(1)))
          pos<-sum(array_pascal[1:k])-(posição-1)
          attributes(vértice)<-NULL
          nova_lista<-c(list(vértice),conectar_com)
          matriz_conexões[1:length(nova_lista),pos]<-cbind(nova_lista)
          p = total_+1
        }
      }

    }
  }
  nao_nulos<-NULL
  lista_final2<-NULL
  for (v in ncol(matriz_conexões):1){
    coluna<-matriz_conexões[,v]
    nao_nulos<-!sapply(coluna,is.null)
    coluna_limpa<-coluna[nao_nulos]
    vértice = coluna_limpa[[1]]
    for (b in coluna_limpa[2:length(coluna_limpa)]){
      if (is.null(b)){b<-rep(0,length(vértice))}
      if (identical(vértice,b)){b<-rep(0,length(vértice))}
      if (lista_de_listas(list(vértice,b),lista_final2) || lista_de_listas(list(b,vértice),lista_final2)){
        next
      } else {
        lista_final2<-c(lista_final2,list(list(vértice,b)))
       }
    }
  }
  #browser()
  lista_final2<-lapply(lista_final2,function(x)list(x[[1]]+inicial,x[[2]]+inicial))
  if (geogebra){
     geogebra<-paste(executar_geogebra_ligar(lista_final2,F,T))
     lista_matrizes<-list(
      executável_geogebra = geogebra,
      Matriz_Vértices = matriz_,
      Matriz_Segmentos = matriz_conexões
    )
    return(lista_matrizes)
  } else {
    open3d(windowRect = c(901,56,1376,348))
    bg3d("black")
    m_provisória<-matrix(c(unlist(lista_final2[[1]][1]),unlist(lista_final2[[1]][2])),byrow=T,ncol=3)
    for (b in 2:length(lista_final2)){
      nova_aresta<-matrix(c(unlist(lista_final2[[b]][1]),unlist(lista_final2[[b]][2])),ncol=3,byrow=T)
      m_provisória<-rbind(m_provisória,nova_aresta)
    }
    segments3d(m_provisória,color="magenta")
    lista_matrizes<-list(
      Matriz_Vértices = matriz_,
      Matriz_Segmentos = matriz_conexões
     )
      return(lista_matrizes)
  }
}
