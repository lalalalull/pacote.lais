# Rotacionar em torno de eixo específico
# A função precisa receber uma base ortonormal (em matriz) no qual o vetor coluna 1 seja o eixo de rotação
# (matriz,matriz,grau)
#' @title rotacionar em torno de eixo customizado
#' @description
#' Função que rotaciona o vetor em torno de um eixo específico
#' @param base_ base ortonormal em matriz na qual o vetor coluna 1 é o eixo de rotação
#' @param v vetor que desejamos rotacionar
#' @param grau grau que desejamos rotacionar
#' @concept algebra
#' @return retorna vetor após a rotação
#' @export
eixo_es<-function(base_,v,grau){
  #browser()
  v_customizado<-vetor_b(base_,v) # Aqui funciona pra duas matrizes
  Multiplicar_Matrizes(base_,rotacionar_poli(v_customizado,"Ox",grau))
}

