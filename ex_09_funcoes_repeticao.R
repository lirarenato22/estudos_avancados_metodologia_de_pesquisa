# EXERCÍCIO - FUNÇÕES DE REPETIÇÃO

# Aluno: Renato Lira


# Exemplo de Função da Família Apply

numeros_pares <- c(2, 4, 6, 8, 10, 12, 14, 16)


numeros_impares <- c(1, 3, 5, 7, 9, 11, 13, 15)


soma <- data.frame(numeros_pares, numeros_impares)

apply(soma [4, ], 1, mean)
