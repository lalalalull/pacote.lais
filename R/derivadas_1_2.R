derivadas_1_2<-function(expr,x){return(c((eval(D(expr,'x'))),eval(D(D(expr,'x'),'x'))))}
