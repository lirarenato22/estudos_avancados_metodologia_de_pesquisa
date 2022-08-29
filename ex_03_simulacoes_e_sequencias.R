# EXERCÍCIO - SIMULAÇÕES E SEQUÊNCIAS

# Aluno: Renato Lira

# Exemplo de Distribuição Normal

dist_norm <- rnorm(100000000)

View(dist_norm)


# Exemplo de Distribuição Binomial

dist_binom <- rbinom(666, 200, 0.9)

View(dist_binom)


# Exemplo de Index

index_binom <- seq(1, length(dist_binom))

View(index_binom)