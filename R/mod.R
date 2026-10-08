#' @title Módulo da posição, aritmética modular
#' @param tamanho_ciclo tamanho do ciclo, ex: c("a","b","c") tem tamanho 3
#' @param pos posição
#' @return Retorna posição no ciclo usando aritmética modular
#' @examples
#' mod(45,98)
#' mod(111,-900)
#' @export
mod<-function(tamanho_ciclo,pos){pos%%tamanho_ciclo}
