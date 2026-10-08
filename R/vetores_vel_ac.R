#' @title Vetores velocidade e aceleração na função
#' @description
#' A função mostra os vetores velocidade e aceleração como executáveis do geogebra,
#' além de circunferências em torno deles para melhor compreensão.
#' O resultado é retornado em forma de lista com os seguintes elementos:
#' $Círculos e $Vetores
#' @param expr função em forma de expression (atenção, coeficientes negativos devem
#' ser escritos na forma +-a)
#' @param x valor de x que queremos ver os vetores
#' @return retorna lista com $Círculos e $Vetores, que são executáveis do geogebra.
#' @examples
#' vetores_vel_ac(expression(x^2),-0.3)
#' vetores_vel_ac(expression(x^3),-0.3)
#' @export
vetores_vel_ac<-function(expr,x){
  #browser()
  ponto = c(x,eval(expr))
  vet_v<-c(1,eval(der_poli2(expr)))
  vet_a<-c(0, eval(der_poli2(der_poli2(expr))))
  lista<-list(
    Vetor_Velocidade = list(ponto,vet_v+ponto),
    Vetor_Aceleração = list(ponto,vet_a+ponto)
  )
  'Circle((ponto),norma(vetor))'
  #browser()
  #ponto<-paste(ponto,sep="",collapse=",")
  #ponto<-paste("(",ponto,")",sep="",collapse="")
  'Por que eu criei esses pontos mesmo? Os vetores da lista já estavam certos...
  Até o da aceleração estava com o sentido correto'
  ponto_v<-vet_v+ponto
  ponto_v<-paste(ponto_v,collapse=",",sep="")
  ponto_v<-paste("(",ponto_v,")",sep="")
  circulo_v<-paste('"',"Circle","(",ponto_v,",",round(norma(vet_v),
                                                      digits=5),")",'"',sep="")
  ponto_a<-vet_a+ponto
  ponto_a<-paste(ponto_a,collapse=",",sep="")
  ponto_a<-paste("(",ponto_a,")",sep="")
  circulo_a<-paste('"',"Circle","(",ponto_a,",",round(norma(vet_a),
                                                      digits=5),")",'"',sep="")
  circulos<-paste(circulo_v,circulo_a,collapse="",sep=",")
  circulos<-paste("Executar","(","{",circulos,"}",")",sep="")
  lista_final<-list(
    Círculos = circulos,
    Vetores = executar_geogebra_ligar(lista,vetor=T,segmento=F)
  )
  return(lista_final)
}
