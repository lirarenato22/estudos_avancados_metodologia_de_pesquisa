# EXERCÍCIO - FUNÇÕES

# Aluno: Renato Lira


# Exemplo de Função

funcao_ex <- function(nro) {
  if(nro < 1) {
    for(i in 2:nro) {
      cat("Quase 1")
    }
  } else {
    cat("Mais que 1")
  }
}

funcao_ex(0.6)

funcao_ex(1.7)

