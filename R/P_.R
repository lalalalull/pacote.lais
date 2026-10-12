#' @title Permutação
#' @description \eqn{P_{n}^{k_1,...,k_j}=\frac{n!}{\prod_{s=1}^{j}k_s!}}{}
#' @concept combinatoria
#' @export
P_<-function(n,vet_r=1){factorial(n)/prod(factorial(vet_r))}
