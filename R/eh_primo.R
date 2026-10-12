
#' @title Função que retorna se é primo
#' @param numero número que queremos saber se é primo
#' @return logical(1)
#' @concept combinatoria
#' @export
eh_primo<-function(numero){
  if (any(crivo_eratostenes(numero)==numero)){return(TRUE)}
  else (return(FALSE))
}

