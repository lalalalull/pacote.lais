#' @title Descriptografar mensagem
#' @param mensagem mensagem character(1)
#' @param d chave privada
#' @param n número grande resultado da multiplicação dos dois primos grandes
#' @return Retorna mensagem descriptografada character(1)
#' @examples
#' descripto_RSA("࿖ᔐ",11083,14803)
#' descripto_RSA("埥᱅㾴\U{01027d}躁\U{01027d}뾦訐埥ϴ㾴\U{01027d}ϴ᱅㾴\U{01027d}빸𒋚爓笉\U{01027d}萵㾴꾋", 10885, 76309)
#' @export
descripto_RSA<-function(mensagem,d,n){
  mensagem<-utf8ToInt(mensagem)
  mensagem<-expon_modular(mensagem,d,n)
  return(intToUtf8(mensagem))
}
