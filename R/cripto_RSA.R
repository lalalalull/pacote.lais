#' @title Criptografar mensagem
#' @param mensagem mensagem character(1)
#' @param chave_publica chave pública escolhida
#' @param primo_1 número primo grande
#' @param primo_2 número primo grande
#' @concept combinatoria
#' @return retorna lista com: msg (mensagem criptografada), tamanho_relogio (primo_1*primo_2) e chave privada d.
#' @examples
#' cripto_RSA('oi',67,113,131)
#' cripto_RSA('miau miau nya',653,557,137)
#' @export
cripto_RSA<-function(mensagem,chave_publica,primo_1,primo_2){
  tamanho<-primo_1*primo_2
  coprimos<-(primo_1-1)*(primo_2-1)
  if (!(nao_coprimos(chave_publica,coprimos))){
    d<-bezout(coprimos,chave_publica)[1,1]
    d<-d%%coprimos
    cripto<-expon_modular(utf8ToInt(mensagem),chave_publica,tamanho)
    lista<-list(
      msg = intToUtf8(cripto),
      tamanho_relogio = tamanho,
      chave_privada = d
    )
    return(lista)
  } else {return(print("Escolha uma chave pública válida"))}
}

#' @describeIn cripto_RSA exponenciação modular
expon_modular<-function(base,expoente,ciclo){
  total = 1
  for (i in 1:expoente){
     total<-mod(ciclo,total*base)
  }
  return(total)
}






