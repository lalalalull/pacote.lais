# Rotacionar em torno de eixo específico
# A função precisa receber uma base ortonormal (em matriz) no qual o vetor coluna 1 seja o eixo de rotação
# (matriz,matriz,grau)

eixo_es<-function(base_,v,grau){
  #browser()
  v_customizado<-vetor_b(base_,v) # Aqui funciona pra duas matrizes
  Multiplicar_Matrizes(base_,rotacionar_poli(v_customizado,"Ox",grau))
}

