# EXERCÍCIO - Valores Ausentes

# Aluno: Renato Lira

# QUESTÃO: Compartilhe com a gente um código criado por você 
# com uma shadow matrix e um teste de aleatoriedade de valores ausentes.

# RESPOSTA:

# Inicialmente, carregamos os pacotes necessários:

pacman::p_load(data.table, ggplot2)

# Depois, criamos um dataframe:


frutas <- c("laranja", "uva", "maçã", "banana", "abacaxi", "cereja")
qualidade <- c("boa", "ruim", NA, "ruim", "boa", NA)
quantidade <- c("muito", "pouco", "pouco", "muito", "pouco", "muito")

classificação <- data.frame(frutas, qualidade, quantidade)


# Visualizar os dados:

view(classificação)

status(classificação)

# Somente casos completos:

dim(PuroFrutas <- na.omit(classificação)) 

# Criando a matriz sombra:

W <- as.data.frame(abs(is.na(classificação)))

# Observando a matriz sombra:

head(W) 

# Apenas variáveis/colunas com NA:

R <- W[which(sapply(W, sd) > 0)]

# Por último, uma correlação:

cor(R)