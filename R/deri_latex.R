'Exibir derivadas extensas e limites'
'O a pode ser character("a") mesmo, se quiser. '
#' @title Derivadas e limites exibidos em LaTeX
#' @description Visualizar expressões de derivadas em suas 2 notações possíveis por extenso e visualizar limites facilmente.
#' @param a o ponto em que queremos saber qual é o limite. Dica: coloque character 'a' para limite genérico.
#'          tipo: numeric ou character.
#' @param expr_c a função em forma de character.
#' @param deri logical que indica se você quer derivada (se deri=F, então limite)
#' @param forma_h logical que indica se você quer a notação limh->0[f(x+h)/h], não precisa ser declarado se deri=F.
#' @return retorna página html exibindo em LaTex a expressão
#' @concept calculo
#' @concept algebra
#' @concept latex
#' @examples
#' deri_latex('a',"x^2+2x",deri=F)
#' deri_latex(2,"x^2+2.x")
#' deri_latex(3,"x^2+2x",forma_h=T)
#' @export
deri_latex<-function(a,expr_c,deri=T,forma_h=F){
  if (deri){
    if (!forma_h){
      codigo<-paste(r"(\lim_{x\to )",a,"}",r"(\frac{)",
                    expr_c, "-","(",gsub("x",a,expr_c),")",
                    "}",paste('{x-',a,'}',collapse="",sep=""),sep="",collapse="")
    } else {
      codigo<-paste(r"(\lim_{h\to )",0,"}",r"(\frac{)",
                    gsub('x',paste("(",a,'+','h',")",collapse="",sep=""),expr_c),
                    '-','(',gsub('x',a,expr_c),')',
                    "}","{h}",sep="",collapse="")
    }
  } else {
    codigo<-paste(r"(\lim_{x\to )",a,"}",expr_c,collapse="",sep="")
  }
  exibir_latex(codigo)
}
