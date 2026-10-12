#' Função que exibe o código LaTex em uma página html com o leitor MathJax.
#' Diferente das outras funções, essa foi o gemini que fez pra mim sem usar nenhum pacote.
#' @param codigo_tex é o código LaTex
#' @return tela html com o código lido
#' @export
#' @concept latex
#' @title Tela HTML que lê LaTex
exibir_latex <- function(codigo_tex) {
  # Monta uma página HTML mínima com o leitor MathJax
  html <- paste0(
    '<html><head>',
    '<script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>',
    '</head><body style="display:flex; justify-content:center; align-items:center; height:90vh; font-size:28px;">',
    '\\[', codigo_tex, '\\]',
    '</body></html>'
  )

  # Salva num arquivo provisório e abre no Viewer
  arquivo_temp <- tempfile(fileext = ".html")
  writeLines(html, arquivo_temp)
  rstudioapi::viewer(arquivo_temp)
}
